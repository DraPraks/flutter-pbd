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