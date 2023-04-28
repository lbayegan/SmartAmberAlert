import 'package:flutter/material.dart';

import 'TextClasses.dart';

// Create a Homepage for the main page of the App
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Build the main body for Homepage 
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 195, 179),
      body: ListView(
        
        children: [
          BigCard(
            words: 'Smart Amber Alert',
            card_color: Colors.red,
            text_color: Colors.white,
            ),
          SizedBox(height: 5),
          
          Subheader(words: 'About'),

          Textbox(words: '  The purpose of this amber alert app is to provide users' +
           ' with a picture of the vehicle and missing person, as well as pictures of the perpetrator,' +
           ' a location heat map, and other relevant information. It should allow users to submit' +
           ' sighting reports with pictures and run image processing to determine if the sighting' +
            ' is credible or not.', text_size: 16),

          Subheader(words: 'How to Use'),

          Textbox(words: 'Active Cases', text_size: 22),

          Textbox(words: '  The Cases tab in the navigation bar will lead you to a list of all ' +
          'active amber alert case files. By clicking on a file, all the relevant information will ' +
          'be displayed. If you believe you witnessed something relevent, click on the report button ' +
          'at either the bottom of the case file or on the navigation bar. If you are able, please' +
          ' submit a photo to go along with the report.', text_size: 16),

          Textbox(words: 'Case Updates', text_size: 22),

          Textbox(words: '  The Updates tab in the navigation bar will lead you to a list of all ' +
          'active amber alert case updates, with the name of the victim, the date of the report, and ' +
          'a short message about recent updates on the case. By clicking on an update, all the relevant case ' +
          'information will be displayed. If you believe you witnessed something relevent, click on the report ' +
          'button at either the bottom of the case file or on the navigation bar. If you are able, please ' +
          'submit a photo to go along with the report.', text_size: 16),

          Textbox(words: 'Submit a Report', text_size: 22),

          Textbox(words: '  To submit a report, click on either the report button at the bottom of a case file ' +
          'or on the Report tab in the navigation bar. There, you will be able to choose a case to report on ' + 
          'from the dropdown menu. You will also be able to describe what you have seen reguarding the case in the ' +
          'case description textbox. You can either upload an image from your phone gallery or take a picture with ' +
          'the camera. Please use the checkboxes bellow that to select what was present in the image. Please hit ' +
          'the submit button at the top right of the form when you are done.', text_size: 16),

          Textbox(words: 'View Submittied Reports', text_size: 22),

          Textbox(words: '  To view reports submitted by the user, click on the Report tab in the navigation bar. ' +
          'A list of all reports made by the user will be present there. Click on a report to view it.', text_size: 16),
          
          Spacer(flex: 2),
        ],
      ),
    );
  }
}