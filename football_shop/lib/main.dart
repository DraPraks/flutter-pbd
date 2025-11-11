import 'package:flutter/material.dart';
import 'add_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const FootballShopHomePage(title: 'Football Shop Home Page'),
    );
  }
}

// create a new stateful widget 'FootballShopHomePage' which should be a stateful widget. This widget should build a scaffold
// an AppBar titled 'Football Shop' and a body with a centered text 'Welcome to the Football Shop!'
// A body containing a column (centered) with three ElevatedButton(s)
/* - 'All Products': Blue background
  - 'My Products': Green background
  - 'Create Product': Red background
Each button's onPressed should call ScaffoldMessenger.of(context).showSnackBar(
  title: SnackBar(content: Text('Button <button name> pressed'))
)
*/
// Replace below with the new widget implementation
class FootballShopHomePage extends StatefulWidget {
  const FootballShopHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<FootballShopHomePage> createState() => _FootballShopHomePageState();
}

class _FootballShopHomePageState extends State<FootballShopHomePage> {
  @override
  // Override = indicates that this method is overriding a method in the superclass
  // Builds the UI for the home page
  Widget build(BuildContext context) {
    // Returns a Scaffold with an AppBar and a centered body containing three buttons
    return Scaffold(
      // AppBar with the title 'Football Shop'
      appBar: AppBar(
        title: Text('Football Shop'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Football Shop Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);  // Close drawer
                // Already on home, so no navigation needed
              },
            ),
            ListTile(
              title: const Text('Add Product'),
              onTap: () {
                Navigator.pop(context);  // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddProductPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Welcome to the Football Shop!'),
            const SizedBox(height: 20),
            // Blue button for 'All Product'; shows a SnackBar when pressed
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide any existing SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('You have pressed the All Product button')),
                );
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_bag), // Shopping bag icon
                  SizedBox(width: 8),
                  Text('All Product'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Green button for 'My Products'; shows a SnackBar when pressed
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('You have pressed the My Products button')),
                );
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 8),
                  Text('My Products'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Red button for 'Create Product'; shows a SnackBar when pressed
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddProductPage()),
                );
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 8),
                  Text('Add Product'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
