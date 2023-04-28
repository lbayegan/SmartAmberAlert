import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'democases.dart';
import 'TextClasses.dart';
import 'ListClasses.dart';

// Create a page for the list of all case updates available to the user
class CaseUpdatesPage extends StatelessWidget {

  // Build page for case updates page
  @override
  Widget build(BuildContext context) {

    var appState = context.watch<MyAppState>();

    final headerStyle = Theme.of(context).textTheme.titleLarge;

    // Main body content of the case updates list
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(
            words: 'Case Updates',
            card_color: Colors.red,
            text_color: Colors.white,
            ),
          Expanded(
            flex: 25,  // expands range of list
            child: UpdatesListView(),              // List of all Case Updates
          ),
          
          Spacer(flex: 2),
        ],
      ),
    );
  }
}