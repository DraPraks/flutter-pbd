# flutter pbd - Adra - 2406453530
## Assignment 7:

- **Widget tree**: Hierarchical structure of widgets in Flutter, parent-child relationships define how widgets are rendered.

Short example:
```dart
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
        );
    }
}
```
The above snippet has a widget tree starting from MyApp, which contains MaterialApp, which in turn contains MyHomePage as its home widget.

- **Widgets Used in App**:
  - `MaterialApp`: Root widget that provides material design structure.
  - `Scaffold`: Provides a framework for implementing the basic visual layout structure of the app.
  - `AppBar`: A material design app bar that can hold titles and actions.
  - `ListView`: A scrollable list of widgets arranged linearly.
  - `Card`: A material design card that holds related information.
  - `Image`: Widget to display images.
  - `Text`: Widget to display text.
  - `ElevatedButton`: A material design elevated button.

- **StatelessWidget vs StatefulWidget**:
  - `StatelessWidget`: A widget that does not require mutable state. It is immutable. (e.g., MyApp, MyHomePage, essentially any widget that only depends on the configuration information in the constructor)
  - `StatefulWidget`: A widget that has mutable state. It can change over time based on user interactions or other factors. (e.g., any widget that needs to manage state, such as a counter or form input)

- **BuildContext**: A reference to the widget's location in the tree. Used to access theme, media queries, and navigation. In the `build` method, it's passed to know the widget's position in the tree.

- **Hot Reload vs Hot Restart**:
  - `Hot Reload`: Quickly updates the UI without losing the current state of the app. It injects updated source code files into the running Dart VM.
  - `Hot Restart`: Restarts the entire app, losing the current state. Runs main() again.

## Assignment 8:
- Navigator push vs pushReplacement:
  - `Navigator.push`: Adds a new route on top of the current stack, allowing users to navigate back to the previous screen
  - `Navigator.pushReplacement`: Replaces the current route with a new one, preventing users from navigating back to the previous screen
  In the context of our app, we use `Navigator.push` to navigate to the Add Product page so that users can return to the product list after adding a product

- Hierarchy widget is used in our app to structure the UI components. For example, the `Scaffold` widget is the parent of `AppBar` and `ListView`.

- In the context of UI design, the advantages of using layout widget like `padding`, etc is to provide spacing and alignment to the UI components, enhancing the visual appeal and usability of the app

- We set up the color theme in our app so that it provides a consistent look and feel across the app.

Assignment 9:
- Question 1: 
  - Q: Explain why we need to create a Dart model when fetching/sending JSON data. What are the consequences of directly mapping Map<String, dynamic> without using a model (in terms of type validation, null safety, and maintainability)? 
  - A: Creating a Dart model when fetching/sending JSON data provides benefits:
    - Type Validation: Models enforce type safety, ensuring that the data are expected types. Directly using Map<String, dynamic> can lead to runtime errors if the data types do not match.
    - Null Safety: Models can define which fields are required and which are optional which prevent null ref. Using Map<String, dynamic> may lead to unexpected null values that are harder to track.
    - Maintainability: Models provide a clear structure for the data, making it easier to understand and maintain the code. Changes to the data structure can be managed in one place (the model) rather than throughout the codebase.

- Question 2:
  - Q: What is the purpose of the http and CookieRequest packages in this assignment? Explain the difference between their roles.
  - A: The `http` package is used for making HTTP requests to REST APIs, allowing us to fetch and send data. The `CookieRequest` package is used to manage cookies in HTTP requests, which is essential for maintaining session state and handling authentication in web applications. While `http` focuses on the communication aspect, `CookieRequest` adds functionality for managing cookies during these communications.

- Question 3: 
  - Q: Explain why the CookieRequest instance needs to be shared across all components in the Flutter application.
  - A: To maintain a consistent session state and auth across different parts of the app (so users don't have to log in every time they navigate)

- Question 4:
  - Q: Explain the connectivity configuration required for Flutter to communicate with Django. Why do we need to add 10.0.2.2 to ALLOWED_HOSTS, enable CORS and SameSite/cookie settings, and add internet access permission in Android? What would happen if these configurations were not set correctly?
  - A: Because the Flutter app runs on an emulator, it cannot directly access localhost of the host machine. The IP address, 10.0.2.2, is used to allow the emulator to access the host machine's localhost. 
  
  Adding this IP to ALLOWED_HOSTS in Django ensures that requests from the emulator are accepted. Enabling CORS (Cross-Origin Resource Sharing) allows the Flutter app to make requests to the Django backend from a different origin. Configuring SameSite and cookie settings ensures that cookies are sent correctly with requests, maintaining session state. Adding internet access permission in AndroidManifest.xml allows the Flutter app to access the internet. If these configurations were not set correctly, the Flutter app would fail to communicate with the Django backend, leading to issues like failed API requests, authentication problems, and inability to fetch or send data.

- Question 5:
  - Q: Explain the connectivity configuration required for Flutter to communicate with Django. Why do we need to add 10.0.2.2 to ALLOWED_HOSTS, enable CORS and SameSite/cookie settings, and add internet access permission in Android? What would happen if these configurations were not set correctly?
  - A: Because the Flutter app runs on an emulator, it cannot directly access localhost of the host machine.

- Question 6:
  - Q: Explain the authentication mechanism for login, registration, and logout—from entering account data in Flutter to Django’s authentication process and displaying the menu in Flutter.
  - A: In our app, the authentication mechanism works as follows:
    - Login: The user enters their credentials in the Flutter app, which sends a POST request to the Django backend's login endpoint. Django verifies the credentials and, if valid, creates a session and sends back a cookie to the Flutter app. The CookieRequest instance stores this cookie for subsequent requests.
    - Registration: Similar to login, the user fills out a registration form in Flutter, which sends a POST request to the Django registration endpoint. Django creates a new user account and may log the user in automatically, sending back a session cookie.
    - Logout: When the user chooses to log out, the Flutter app sends a POST request to the Django logout endpoint. Django invalidates the session and removes the session cookie. The CookieRequest instance clears the stored cookie
    - Menu Display: After successful login or registration, the Flutter app displays the menu screen, allowing access to authenticated features

- Question 7:
  - Q:  Explain the authentication mechanism for login, registration, and logout—from entering account data in Flutter to Django's authentication process and displaying the menu in Flutter.
  - A: 
    1. **Login Implementation**: User enters username/password in LoginPage → CookieRequest.login(url, {username, password}) sends POST to /auth/login/ → Django authenticates via authenticate() and auth_login() → Returns session cookie → CookieRequest stores cookie automatically → User navigated to FootballShopHomePage (menu screen).
    2. **Registration Implementation**: User fills RegisterPage form with username, email, first_name, last_name, password → CookieRequest.postJson(url, body) sends JSON POST to /auth/register/ → Django creates User with create_user() → Validates password match and unique username → Returns success response → User redirected to LoginPage to login.
    3. **Menu Display & Session Management**: After successful auth, Provider<CookieRequest> makes session available to all widgets via context.watch<CookieRequest>() → Drawer displays logout button → CookieRequest automatically includes session cookie in all subsequent GET/POST requests via request.get(url) and request.postJson(url, body).
    4. **Logout Implementation**: User clicks logout in drawer → FootballShopHomePage calls CookieRequest.logout(url) → POST to /auth/logout/ → Django's auth_logout() invalidates session → CookieRequest clears stored cookie → User navigated back to LoginPage.
    5. **Data Filtering**: After login, product list fetches via request.get('/json/') → Django checks request.user.is_authenticated → Returns only authenticated user's products when ?user_only=true parameter included → ProductEntry.fromJson() parses response and displays in ListView via FutureBuilder.