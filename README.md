# README

Rails 5. & sqlite(for a test, should do)

I implemented the analytics in Search channel(using action cable).

In this way, we don't have to pressure database each time user does a "search". Instead we save the analytics(with counts) only when:
1) User reloads the page( assumed that user click on the article or just refreshes, etc..)
2) User click Search button

As we would scale this, we could extend the calculative analytics part of "analytics save" to background jobs(sidekiq).

There are some stuff i would have done better in a real case scenario, but choose to monkey patch for this test(like the asset includes in layouts.
