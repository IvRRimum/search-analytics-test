channel_name = Math.round(Math.random()*1000)
search_channel = {}

search_channel = App.cable.subscriptions.create { channel: "SearchChannel", room: "search_#{channel_name}" },
  connected: ->
    console.log("Websocket's connection established.")

  register_search_term: (search_term) ->
    @perform 'register_search_term', search_term: search_term

  save_analytics: ->
    @perform 'save_analytics_for_search_term'

$ ->
  typingTimer = undefined
  doneTypingInterval = 500
  $input = $('#search_term')

  $input.on 'keyup', ->
    clearTimeout typingTimer
    typingTimer = setTimeout(doneTyping, doneTypingInterval)
  $input.on 'keydown', ->
    clearTimeout typingTimer

  doneTyping = ->
    search_channel.register_search_term $input.val()
    show_search_results()

  show_search_results = ->
    $(".search-results").html("Search results for: #{$input.val()} <br /> <br /> Dummy search result 1 <br /> Another dummy search result 2")

  $(".search-button").click ->
    search_channel.save_analytics()
    show_search_results()

$(window).unload ->
  # TODO: If you click on search analytics link, you may need to refresh the page. 
  # Because page reloads faster then search analytics is saved
  search_channel.save_analytics()
