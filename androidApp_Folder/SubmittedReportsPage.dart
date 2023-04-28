import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'democases.dart';
import 'TextClasses.dart';
import 'ListClasses.dart';

// Create a page for the list of all submitted reports made by the user
class SubmittedReportsPage extends StatelessWidget {

  // Build page for submitted reports page
  @override
  Widget build(BuildContext context) {

    var appState = context.watch<MyAppState>();

    final headerStyle = Theme.of(context).textTheme.titleLarge;

    // Main body content of the Reports Submitted list
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(
            words: 'Reports Submitted by User',
            card_color: Colors.red,
            text_color: Colors.white,
            ),
          Expanded(
            flex: 25,  // expands range of list
            child: ReportsListView(),              // List of all Reports Submitted
          ),
          
          Spacer(flex: 2),
        ],
      ),
    );
  }
}