import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'democases.dart';
import 'TextClasses.dart';


// Create a page for each individual Report submitted by the user
class IndividualReportsPage extends StatelessWidget {

  // Individual Reports page must be called with variable selectedReport_number
  const IndividualReportsPage({
    Key? key,
    required this.selectedReport_number,
  }) : super(key: key);

  final int selectedReport_number;


  // Build Individual Reports Page
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();    // Information updates as Case Information Updates

    // Case Information
    final case_tag = appState.CaseReportsList[selectedReport_number];
    final case_date = appState.CaseReportsList[selectedReport_number].case_date;

    // Time Location Information
    final report_address = '125 Spence St, College Station, TX 77840';
    //final report_address = appState.CaseReportsList[selectedReport_number].report_address;
    final report_position = appState.CaseReportsList[selectedReport_number].report_position;
    final date_of_report = appState.CaseReportsList[selectedReport_number].report_date;

    // Victim information
    final victim_name = appState.CaseReportsList[selectedReport_number].victim_name;

    // Case Report Information and Photo Taken
    final report_description = appState.CaseReportsList[selectedReport_number].report_description;
    final report_image = appState.CaseReportsList[selectedReport_number].report_image;
    final vehicle_included = appState.CaseReportsList[selectedReport_number].vehicle_included;
    final victim_included = appState.CaseReportsList[selectedReport_number].victim_included;
    final suspect_included = appState.CaseReportsList[selectedReport_number].suspect_included;
    final no_image_included = appState.CaseReportsList[selectedReport_number].no_image;

    // Initialize bool to string variables
    final vehicle_string;
    final victim_string;
    final suspect_string;
    final no_image_string;


    // change bool? variable to Yes and No strings
    if (vehicle_included == true) {
      vehicle_string = 'Yes';
    } else {
      vehicle_string = 'No';
    }

    if (victim_included == true) {
      victim_string = 'Yes';
    } else {
      victim_string = 'No';
    }

    if (suspect_included == true) {
      suspect_string = 'Yes';
    } else {
      suspect_string = 'No';
    }

    if (no_image_included == true) {
      no_image_string = 'Yes';
    } else {
      no_image_string = 'No';
    }


    // Create Main body of Individual Reports Page
    return Scaffold(
      backgroundColor: Colors.tealAccent,

      // Create App bar with title and return button
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Subheader(words: 'Case Reports'),
      ),

      // Create List of all Report Data
      body: ListView(
          children: [
            BigCard(
              words: victim_name,
              card_color: Color.fromARGB(255, 32, 97, 34),
              text_color: Colors.black,
            ),
            SizedBox(height: 5),

            // Report Information
            Subheader(words: 'Case Reports Submitted'),
            Textbox(words: 'Case Date: ' + case_date, text_size: 18),
            Textbox(words: 'Report on Case: ' + report_description, text_size: 18),
            SizedBox(height: 5),
            //Text('ADDRESS: ${report_address ?? ""}'),
            Textbox(words: 'ADDRESS: ' + report_address, text_size: 18),
            Textbox(words: 'Date of Report: ' + date_of_report, text_size: 18),
            SizedBox(height: 5),
          
            // Image
            Subheader(words: 'Image Submited'),
            report_image,
            SizedBox(height: 5),

            // Image info
            Subheader(words: 'Image Information'),
            Textbox(words: 'Includes Vehicle: ' + vehicle_string, text_size: 18),
            Textbox(words: 'Includes Victim: ' + victim_string, text_size: 18),
            Textbox(words: 'Includes Suspect: ' + suspect_string, text_size: 18),
            Textbox(words: 'No Image Included: ' + no_image_string, text_size: 18),
            SizedBox(height: 5),

            Spacer(flex: 2),
          ],
      ), 
    );
  }
}

