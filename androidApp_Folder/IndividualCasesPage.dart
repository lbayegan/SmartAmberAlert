import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'democases.dart';
import 'ReportCasePage.dart';
import 'TextClasses.dart';

// Create a page for each individual Case 
class IndividualCasePage extends StatelessWidget {

  // Individual Cases page must be called with variables selectedCase_number and updateCase_number
  const IndividualCasePage({
    Key? key,
    required this.selectedCase_number,
    required this.updateCase_number,
  }) : super(key: key);

  final int selectedCase_number;
  final int updateCase_number;

  // Build Individual Case Page
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();    // Information updates as Case Information Updates

    // Case Information
    final case_tag = appState.caseList[selectedCase_number];
    final case_date = appState.caseList[selectedCase_number].case_date;

    // Time Location Information and heat map
    final last_known_location = appState.caseList[selectedCase_number].last_known_location;
    final time_of_dissapearance = appState.caseList[selectedCase_number].time_of_dissapearance;
    final heat_map_image = appState.caseList[selectedCase_number].heat_map_image;

    // Suspects vehicle description and photo
    final liscense_plate_number = appState.caseList[selectedCase_number].liscense_plate_number;
    final vehicle_model = appState.caseList[selectedCase_number].vehicle_model;
    final vehicle_color = appState.caseList[selectedCase_number].vehicle_color;
    final vehicle_image = appState.caseList[selectedCase_number].vehicle_image;

    // Victim information and photo
    final victim_name = appState.caseList[selectedCase_number].victim_name;
    final victim_age = appState.caseList[selectedCase_number].victim_age;
    final victim_description = appState.caseList[selectedCase_number].victim_description;
    final victim_image = appState.caseList[selectedCase_number].victim_image;

    // Suspects description and photo
    final suspect_name = appState.caseList[selectedCase_number].suspect_name;
    final suspect_description = appState.caseList[selectedCase_number].suspect_description;
    final suspect_image = appState.caseList[selectedCase_number].suspect_image;

    // Case Update Information
    final update_message = appState.UpdatesList[updateCase_number].update_message;
    final update_date = appState.UpdatesList[updateCase_number].update_date;


    // Create Main body of Individual Cases Page
    return Scaffold(
      backgroundColor: Colors.tealAccent,

      // Create App bar with title and return button
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Subheader(words: case_date),
      ),

      // Create List of all Case Data
      body: ListView(
          children: [
            BigCard(
              words: victim_name,
              card_color: Color.fromARGB(255, 32, 97, 34),
              text_color: Colors.black,
            ),
            SizedBox(height: 5),

            // Update Information
            Subheader(words: 'Case Updates'),
            Textbox(words: 'Latest Update Date: ' + update_date, text_size: 17),
            Textbox(words: 'Update on Case: ' + update_message, text_size: 17),
            SizedBox(height: 5),
          
            // Location Time info
            Subheader(words: 'Location Heat Map'),
            heat_map_image,
            Textbox(words: 'Last Known Location: ' + last_known_location, text_size: 18),
            Textbox(words: 'Time of Dissapearance: ' + time_of_dissapearance, text_size: 18),
            SizedBox(height: 5),

            // Vehicle info
            Subheader(words: 'Vehicle of Suspect'),
            vehicle_image,
            Textbox(words: 'License Plate Number: ' + liscense_plate_number, text_size: 18),
            Textbox(words: 'Vehicle Model: ' + vehicle_model, text_size: 18),
            Textbox(words: 'Vehicle Color: ' + vehicle_color, text_size: 18),
            SizedBox(height: 5),

            // Victim info
            Subheader(words: 'Victim Information'),
            victim_image,
            Textbox(words: 'Victim Name: ' + victim_name, text_size: 18),
            Textbox(words: 'Victim Age: ' + victim_age, text_size: 18),
            Textbox(words: 'Victim Description: ' + victim_description, text_size: 18),
            SizedBox(height: 5),

            // Suspect info
            Subheader(words: 'Suspect Information'),
            suspect_image,
            Textbox(words: 'Suspect Name: ' + suspect_name, text_size: 18),
            Textbox(words: 'Suspect Description: ' + suspect_description, text_size: 18),
            SizedBox(height: 15),


            // Create button to go to report case page
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push<void>(_ReportCaseRoute());
                },
                style: ButtonStyle(
                  elevation:MaterialStateProperty.all(1),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  ),
                icon: 
                    Icon(Icons.drive_folder_upload, size: 40),
              
                label: Textbox(words: 'Report Case', text_size: 30),
              
              ),
            Spacer(flex: 2),
          ],
      ),
    );
  }
}

// Create a route to go to report case page
Route _ReportCaseRoute() {

  //final int index;
  return PageRouteBuilder<SlideTransition>(
    pageBuilder: (context, animation, secondaryAnimation) => ReportCasePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween =
          Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero);
      var curveTween = CurveTween(curve: Curves.ease);

      return SlideTransition(
        position: animation.drive(curveTween).drive(tween),
        child: child,
      );
    },
  );
}