Jack Higgins
Wipfli Digital 
TECHNOLOGY ASSESSMENT

- Utilize a searchcontroller to populate a table or collection view with movies related to the users search string
    - Completed

- Create a movie detail page showing a movies title, rating, and poster image
    - Built inital view and functions, wrote detail instructions on how to continue writing the feature

- Build a networking layer to consume data from the omdbapi.
    - Completed

- Think about how the next developer would implement a new endpoint for the next feature - Avoid use of unnecessary 3rd party librabriries.
    - Used Alamofire networking, and Realm to lay the groundwork for a caching system

- Display a non UI blocking loading indicator when the user is waiting for search results.
    - Not implemented, but noted where it should be implemented

- Design a caching system to reduce redownloading the search results multiple times.
    - MovieModel is a subclass of a Realm object allowing it to be stored in a local database. Currently saving all movies when performing fetchByID

- Write test cases for your application.
    - Wrote test cases to test the two core API functions, left instructions on additional tests that may be useful

- Show an empty state when no movies are returned for a given search term.
    - Not implemented, but noted where it should be implemented