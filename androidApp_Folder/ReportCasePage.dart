import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'democases.dart';
import 'DataClasses.dart';
import 'TextClasses.dart';


// Create a page the Report Form
class ReportCasePage extends StatefulWidget {
  const ReportCasePage({super.key});

  @override
  State<ReportCasePage> createState() => _ReportCasePageState();
}



class _ReportCasePageState extends State<ReportCasePage> {
  final _formKey = GlobalKey<FormState>();


  // Initialize all report form variables
  String report_case_date = '';
  String? _currentAddress;
  Position? _currentPosition;
  //String report_case_latitude = '';
  //String report_case_longitude = '';
  //String report_case_address = '';
  String date_of_report = '';
  String description = '';
  String dropdownValue = 'No Case Selected';
  bool? Suspect = false;
  bool? Victim = false;
  bool? Vehicle = false;
  bool? No_Photo = true;
  File? image;
  Image no_image_image = Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png');


  // Image grabber code from phone Photo Gallery
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  // Image grabber code from phone camera
  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }



  // Getting permission to use the geographic location information
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  // Location Coordinates Grabber code
  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  // Report Location Longitude, Latitude, and Address code
  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }




  // Code to Build the Report Form
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    // Initialize lists of the case victim names and dates
    List<String> case_date_list = <String>[];
    List<String> case_name_list = <String>[];
    for (var i = 0; i < appState.caseList.length; i++) {
      case_name_list.insert(i, appState.caseList[i].victim_name);
      case_date_list.insert(i, appState.caseList[i].case_date);
    }
    case_name_list.insert(appState.caseList.length, 'No Case Selected');
    case_date_list.insert(appState.caseList.length, 'No Date Selected');

    // Initialize ReportCase data and image
    CaseReports new_report;
    Image reported_image;


    return Scaffold(
      backgroundColor: Colors.tealAccent,

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Subheader(words: 'Report Case'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              child: const Textbox(words: 'Submit', text_size: 20),
              onPressed: () {


                // get geographic location information
                _getCurrentPosition();

                // Retrieve Case date based on selected case victim name
                for (var i = 0; i < appState.caseList.length; i++) {
                  if (dropdownValue == case_name_list[i]) {
                    report_case_date = case_date_list[i];
                  }
                }

                // get date of report from current time data
                date_of_report = DateFormat("MMMM dd, yyyy,   HH:mm:ss").format(DateTime.now());

                //report_case_latitude = 'LAT: ${_currentPosition?.latitude ?? ""}';
                //report_case_longitude = 'LNG: ${_currentPosition?.longitude ?? ""}';
                //report_case_address = 'ADDRESS: ${_currentAddress ?? ""}';

                // initialize image used based on if image was uploaded
                if (image == null) {
                  reported_image = no_image_image;
                } else {
                  reported_image = Image.file(image!);
                }

                // Place all data put in the form into a CaseReport Data Class
                new_report = CaseReports(
                  report_case_date,       //case_date,

                  _currentAddress,        //report_address,
                  _currentPosition,       //report_position information,
                  date_of_report,         //report_date,

                  description,            //report_description,
                  reported_image,         //report_image,
                  Vehicle,                //vehicle_included,
                  Victim,                 //victim_included,
                  Suspect,                //suspect_included,
                  No_Photo,               //no_image,

                  dropdownValue,          //victim_name,
                );

                // add new report to Case Reports List
                appState.CaseReportsList.insert(0, new_report);


                // Reset all form Data
                _formKey.currentState?.reset();
                dropdownValue = 'No Case Selected';
                Vehicle = false;
                Victim = false;
                Suspect = false;
                No_Photo = true;
                setState(() {});


                // Once Submitted, make a popup window to show form was accepted
                showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Report Submitted'),
                    actions: [
                      TextButton(
                        child: const Textbox(words: 'Done', text_size: 16),
                        onPressed: () {
                          Navigator.of(context)
                            .pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Create the main body of the form 
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Textbox(words:'Choose Case', text_size: 14,
                                ),
                                //DropdownButton of all case victim names
                                DropdownButton<String>(
                                  value: dropdownValue,
                                  items: case_name_list.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Textbox(words: value, text_size: 14),
                                    );
                                  }).toList(),
                                  
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                    dropdownValue = value!;
                                    });
                                  },
                                ),
                              ],
                            ),

                        // Create the textbox for the report description
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: 'Enter a description...',
                            labelText: 'Please describe what you saw',
                          ),
                          onChanged: (value) {
                            description = value;
                          },
                          maxLines: 5,
                        ),

                        // Upload Images from Gallery and Camera Buttons
                        Column(
                          children: [
                            MaterialButton(
                              color: Colors.blue,
                              child: const Text(
                                "Upload Image from Gallery",
                                style: TextStyle(
                                  color: Colors.white70, fontWeight: FontWeight.bold
                                )
                              ),
                              onPressed: () {
                                pickImage();
                              }
                          ),
                          MaterialButton(
                              color: Colors.blue,
                              child: const Text(
                                  "Take Image from Camera",
                                  style: TextStyle(
                                      color: Colors.white70, fontWeight: FontWeight.bold
                                  )
                              ),
                              onPressed: () {
                                pickImageCamera();
                              },
                            ),
                            SizedBox(height: 20),
                            //image != null ? Image.file(image!): Text('No Image Selected')
                            image != null ? Text('Image Uploaded'): Text('No Image Selected')
                          ],
                        ),
                        
                        // Checkboxes for what was included in the photo
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'What was included in the photo?',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Checkbox for the Vehicle
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: Vehicle,
                              onChanged: (checked) {
                                setState(() {
                                  Vehicle = checked;
                                  if (Vehicle == true) {
                                    No_Photo = false;
                                  }
                                });
                              },
                            ),
                            Text('Vehicle',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),

                        // Checkbox for the Victim
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: Victim,
                              onChanged: (checked) {
                                setState(() {
                                  Victim = checked;
                                  if (Victim == true) {
                                    No_Photo = false;
                                  }
                                });
                              },
                            ),
                            Text('Victim',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),

                        // Checkbox for the Suspect
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: Suspect,
                              onChanged: (checked) {
                                setState(() {
                                  Suspect = checked;
                                  if (Suspect == true) {
                                    No_Photo = false;
                                  }
                                });
                              },
                            ),
                            Text('Suspect',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),

                        // Checkbox for no photo submitted
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: No_Photo,
                              onChanged: (checked) {
                                setState(() {
                                  No_Photo = checked;
                                  if (No_Photo == true) {
                                    Vehicle = false;
                                    Victim = false;
                                    Suspect = false;
                                  }
                                });
                              },
                            ),
                            Text('No Photo Submitted',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                    
                      ].expand(
                        (widget) => [
                          widget,
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}