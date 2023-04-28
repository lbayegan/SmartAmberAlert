import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'democases.dart';
import 'ReportCasePage.dart';
import 'ActiveCasesPage.dart';
import 'CaseUpdatesPage.dart';
import 'HomePage.dart';
import 'SubmittedReportsPage.dart';

// Main app code, use this code to run the app
void main() {
  runApp(MyApp());
}

// Creates the class for the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Builds main body of code
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(      // Will update app as changes are made 
      create: (context) => MyAppState(),
      child: MaterialApp(               // App body
        title: 'Amber Alert App',
        theme: ThemeData(               // App color scheme
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),             // sets home page of app
      ),
    );
  }
}


// Creates the homepage for the app
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Initialize all variables used 
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;
  int _caseIndex = 0;

  // Create a navigation link to all main pages in the home page
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;                // page will switch based on which case is picked
    switch (_selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = ActiveCasesPage();
        break;
      case 2:
        page = CaseUpdatesPage();
        break;
      case 3:
        page = ReportCasePage();
        break;
      case 4:
        page = SubmittedReportsPage();
        break;
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }

    // The container for the current_case page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );


    // Create the main body of the Homepage app
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              groupAlignment: groupAligment,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: labelType,
              leading: showLeading
                  ? FloatingActionButton(
                      elevation: 0,
                      onPressed: () {
                      },
                      child: const Icon(Icons.add),
                    )
                  : const SizedBox(),
              trailing: showTrailing
                  ? IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(Icons.more_horiz_rounded),
                    )
                  : const SizedBox(), 

              // Create the links to the various pages on the navigation rail
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  selectedIcon: Icon(Icons.home_filled),        // Home Pgae
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.switch_account),
                  selectedIcon: Icon(Icons.switch_account_outlined),  // Active Cases Page
                  label: Text('Cases'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.update),
                  selectedIcon: Icon(Icons.update_outlined),    // Case Updates Page
                  label: Text('Updates'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.drive_folder_upload_outlined),
                  selectedIcon: Icon(Icons.drive_folder_upload),  // Report Case Page
                  label: Text('Report'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.folder_copy_outlined),
                  selectedIcon: Icon(Icons.folder_copy),         // Submitted Reports Page
                  label: Text('Submitted\n Reports'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),

            // This is the main content.
            Expanded(
              child: mainArea,   // The selected page goes here
            ),
          ],
        ),
      ),
    );
  }
}



// List of possible Icons to add
// add_a_photo
// add_photo_alternate
// announcement
// aod  - phone
// archive
// article 
// assignment
// cached   - reload
// call
// camera
// cancel
// car_crash
// chat
// check_box
// circle_notifications
// cloud_download
// cloud_upload
// dehaze  - menu icon
// delete
// directions_car
// download
// download_done
// drive_folder_upload  - submit report
// explore  - map
// face  - victim
// face_5  - suspect
// face_retouching_off  -suspect
// feed_outlined  - document
// feedback  - notice
// folder
// folder_copy
// help
// insert_photo
// library_add
// library_books  - case list
// location_on
// map
// notification_important
// perm_identity
// person
// priority_high
// report_rounded
// switch_account  - cases list
// update
// wc  - suspect


// admin Icons
// assignment_add
// calendar_month
// create_new_folder
// difference  - new report
// notification_add
// save
// update


