import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TextClasses.dart';
import 'democases.dart';
import 'IndividualCasesPage.dart';
import 'IndividualReportsPage.dart';


// Create an actively updateable scroll list of all Active cases
class HistoryListView extends StatefulWidget {
  const HistoryListView({Key? key}) : super(key: key);

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  /// Needed so that [MyAppState] can tell [AnimatedList] below to animate
  /// new items.
  final _key = GlobalKey();

  /// Used to "fade out" the caseList items at the top, to suggest continuation.
  static const Gradient _maskingGradient = LinearGradient(
    // This gradient goes from fully transparent to fully opaque black...
    colors: [Colors.transparent, Colors.black],
    // ... from the top (transparent) to half (0.5) of the way to the bottom.
    stops: [0.0, 0.10],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    appState.historyListKey = _key;

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      // This blend mode takes the opacity of the shader (i.e. our gradient)
      // and applies it to the destination (i.e. our animated list).
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: false,
        padding: EdgeInsets.only(top: 25),
        initialItemCount: appState.caseList.length,
        itemBuilder: (context, index, animation) {
          // Variables used in listview for active cases
          final case_tag = appState.caseList[index];
          final case_date_tag = appState.caseList[index].case_date;
          final victim_name_tag = appState.caseList[index].victim_name;
          final case_location_tag = appState.caseList[index].last_known_location;
          final victim_age_tag = appState.caseList[index].victim_age;
          var update_index = 0;

          // find updates index given the cases victim name
          for (var i = 1; i < (appState.UpdatesList.length); i++) {
            if (victim_name_tag == appState.UpdatesList[i].victim_name) {
              update_index = i;
            }
          }

          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  // Navigate to individual cases page
                  Navigator.of(context).push<void>(_createRoute(index, update_index));
                },
                // Active case button properties
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size.fromWidth(320)),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 129, 199, 157)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  ),
                // Active case Icon used
                icon: appState.caseList.contains(case_tag)
                    ? Icon(Icons.person, size: 40)
                    : SizedBox(),
                // Active Case text used
                label: ListCase_Text(
                  victim_nametag: 'Name: ' + victim_name_tag,
                  case_datetag: 'Dissapearance: ' + case_date_tag,
                  victim_agetag: 'Age: ' + victim_age_tag,
                  case_locationtag: 'Location: ' + case_location_tag,
                  )
              
              ),
            ),
          );
        },
      ),
    );
  }
}


// Create an actively updateable scroll list of all Case Updates
class UpdatesListView extends StatefulWidget {
  const UpdatesListView({Key? key}) : super(key: key);

  @override
  State<UpdatesListView> createState() => _UpdatesListViewState();
}

class _UpdatesListViewState extends State<UpdatesListView> {
  /// Needed so that [MyAppState] can tell [AnimatedList] below to animate
  /// new items.
  final _key = GlobalKey();

  /// Used to "fade out" the caseList items at the top, to suggest continuation.
  static const Gradient _maskingGradient = LinearGradient(
    // This gradient goes from fully transparent to fully opaque black...
    colors: [Colors.transparent, Colors.black],
    // ... from the top (transparent) to half (0.5) of the way to the bottom.
    stops: [0.0, 0.10],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    appState.UpdatesListKey = _key;

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      // This blend mode takes the opacity of the shader (i.e. our gradient)
      // and applies it to the destination (i.e. our animated list).
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: false,
        padding: EdgeInsets.only(top: 25),
        initialItemCount: appState.UpdatesList.length - 1,
        itemBuilder: (context, index, animation) {
          // Variables used in listview for case updates
          final case_tag = appState.UpdatesList[index + 1];
          final case_date_tag = appState.UpdatesList[index + 1].case_date;
          final update_date_tag = appState.UpdatesList[index + 1].update_date;
          final update_message_tag = appState.UpdatesList[index + 1].update_message;
          final victim_name_tag = appState.UpdatesList[index+ 1].victim_name;
          var case_index;

          // find case index given the updates victim name
          for (var i = 0; i <appState.caseList.length; i++) {
            if (victim_name_tag == appState.caseList[i].victim_name) {
              case_index = i;
            }
          }

          

          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  // Navigate to individual cases page
                  Navigator.of(context).push<void>(_createRoute(case_index, index + 1));
                },
                // Case Updates button properties
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size.fromWidth(320)),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 246, 132, 132)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  ),
                // Case Updates Icon Used
                icon: appState.UpdatesList.contains(case_tag)
                    ? Icon(Icons.notification_important, size: 40)
                    : SizedBox(),
                // Case Updates Text Used
                label: UpdateCase_Text(
                  victim_nametag: 'Name: ' + victim_name_tag,
                  update_datetag: 'Date Updated: ' + update_date_tag,
                  update_messagetag: 'Update: ' + update_message_tag,
                  )
              
              ),
            ),
          );
        },
      ),
    );
  }
}


// Create an actively updateable scroll list of all Case Reports Submitted
class ReportsListView extends StatefulWidget {
  const ReportsListView({Key? key}) : super(key: key);

  @override
  State<ReportsListView> createState() => _ReportsListViewState();
}

class _ReportsListViewState extends State<ReportsListView> {
  /// Needed so that [MyAppState] can tell [AnimatedList] below to animate
  /// new items.
  final _key = GlobalKey();

  /// Used to "fade out" the caseList items at the top, to suggest continuation.
  static const Gradient _maskingGradient = LinearGradient(
    // This gradient goes from fully transparent to fully opaque black...
    colors: [Colors.transparent, Colors.black],
    // ... from the top (transparent) to half (0.5) of the way to the bottom.
    stops: [0.0, 0.10],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    appState.ReportsListKey = _key;

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      // This blend mode takes the opacity of the shader (i.e. our gradient)
      // and applies it to the destination (i.e. our animated list).
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: false,
        padding: EdgeInsets.only(top: 25),
        initialItemCount: appState.CaseReportsList.length,
        itemBuilder: (context, index, animation) {
          // Variables used in listview for case reports
          final case_tag = appState.CaseReportsList[index];
          final case_date_tag = appState.CaseReportsList[index].case_date;
          final report_date_tag = appState.CaseReportsList[index].report_date;
          final report_description_tag = appState.CaseReportsList[index].report_description;
          final victim_name_tag = appState.CaseReportsList[index].victim_name;
          

          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  // Navigate to individual reports page
                  Navigator.of(context).push<void>(_ReportsRoute(index));
                },
                // Case Reports button properties
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size.fromWidth(320)),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 124, 225, 243)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  ),
                // Case Reports Icon Used
                icon: appState.UpdatesList.contains(case_tag)
                    ? Icon(Icons.notification_important, size: 40)
                    : SizedBox(),
                // Case Reports Text Used
                label: UpdateCase_Text(
                  victim_nametag: 'Name: ' + victim_name_tag,
                  update_datetag: 'Date Reported: ' + report_date_tag,
                  update_messagetag: 'Report: ' + report_description_tag,
                  )
              
              ),
            ),
          );
        },
      ),
    );
  }
}

// Create a route directed to the individual cases page
Route _createRoute(case_index, update_index) {

  //final int index;
  return PageRouteBuilder<SlideTransition>(
    pageBuilder: (context, animation, secondaryAnimation) => IndividualCasePage(selectedCase_number: case_index, updateCase_number: update_index),
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


// Create a route directed to the individual reports page
Route _ReportsRoute(report_index) {

  //final int index;
  return PageRouteBuilder<SlideTransition>(
    pageBuilder: (context, animation, secondaryAnimation) => IndividualReportsPage(selectedReport_number: report_index),
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