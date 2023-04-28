import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'democases.dart';
import 'TextClasses.dart';
import 'ListClasses.dart';


// Create a page for the list of all active cases available to the user
class ActiveCasesPage extends StatelessWidget {

  // Build page for active cases page
  @override
  Widget build(BuildContext context) {

    var appState = context.watch<MyAppState>();

    final headerStyle = Theme.of(context).textTheme.titleLarge;

    // Main body content of the active cases list
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(
            words: 'Active Cases',
            card_color: Colors.red,
            text_color: Colors.white,
            ),
          Expanded(
            flex: 25,  // expands range of list
            child: HistoryListView(),           // List of all Active Cases
          ),
          
          Spacer(flex: 2),
        ],
      ),
    );
  }
}