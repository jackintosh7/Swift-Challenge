Jack Higgins

# TECHNOLOGY ASSESSMENT
This assessment may be done in your own time, using the tools and editors you are comfortable and familiar with and should only take a few hours to complete - do not spend longer than 4 hours on this project. The requirements and limitations for this project are outlined as follows. Please reach out to your contact if you have any questions before starting the project.
THE CHALLENGE
Your ​objective​ is to lay the groundwork for a new iPhone application written in Swift that helps users search for movies by utilizing the omdbapi API (​http://www.omdbapi.com​). We do not expect you to complete the entire application in under 4 hours. Imagine passing off your 4 hours of work to the next developer to complete the project (think the telephone game, but for development). If a feature is incomplete leave some notes so the next developer knows where and how to complete said feature.
### REQUIREMENTS
- Your application should be written in Swift using Apple best practices.
- Your implementation should work across a variety of screen sizes and resolutions.
- Use the latest version of XCode (non beta).
- Utilize a searchcontroller to populate a table or collection view with movies related to the users
search string
- Create a movie detail page showing a movies title, rating, and poster image
- Build a networking layer to consume data from the omdbapi.
- Think about how the next developer would implement a new endpoint for the next feature - Avoid use of unnecessary 3rd party librabriries.
- However, feel free to use reusable code/frameworks that you wrote yourself.
- Display a non UI blocking loading indicator when the user is waiting for search results.
- Design a caching system to reduce redownloading the search results multiple times.
- Write test cases for your application.
- Show an empty state when no movies are returned for a given search term.
HELPFUL TIPS
- Remember, another developer will have to pick up where you left off. Anything that is not completed should have detailed notes written explaining where you left off.
- Don’t feel like you have to spend your entire time on the view layer.
- If your project does not include a single screen, that is perfectly fine. Leave that for the other
developer to finish.
- Feel free to spend your time on any aspect of the application, such as the networking layer, or the
caching layer
 
### EVALUATION CRITERIA
Your assessment will be evaluated on the following criteria:
- Technical aspects​: Your code should solve the problem at a technical level, follow best practices, and be modular. We are looking for good architecture.
- Maintainability​: Code challenges will be evaluated on overall architecture and design. Implementations should be done from the perspective of a new project that another developer may work on in the future, and should be structured in such a way that is maintainable long-term.
- Time to completion: ​It should take you no longer than 4 hours to complete this task. We are interested in seeing how much you can accomplish in a finite period of time.
- Presentation, UI and UX​: The UX should follow best practices.

## NOTES
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
