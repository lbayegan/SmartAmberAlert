import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


// Create a data class for all Cases
class Cases {
  final String case_date;

  // Time Location Information and heat map
  final String last_known_location;
  final String time_of_dissapearance;
  final Image heat_map_image;

  // Suspects vehicle description and photo
  final String liscense_plate_number;
  final String vehicle_model;
  final String vehicle_color;
  final Image vehicle_image;

  // Victim information and photo
  final String victim_name;
  final String victim_age;
  final String victim_description;
  final Image victim_image;

  // Suspects description and photo
  final String suspect_name;
  final String suspect_description;
  final Image suspect_image;
  
  // required data for each case
  Cases(
    this.case_date,

    // required time and location data
    this.last_known_location,
    this.time_of_dissapearance,
    this.heat_map_image,

    // required Suspects vehicle description and photo
    this.liscense_plate_number,
    this.vehicle_model,
    this.vehicle_color,
    this.vehicle_image,

    // requiredVictim information and photo
    this.victim_name,
    this.victim_age,
    this.victim_description,
    this.victim_image,

    // required Suspects description and photo
    this.suspect_name,
    this.suspect_description,
    this.suspect_image,

  );

}


// Create a data class for all Updates
class Updates {
  final String case_date;

  // Time Location Information and heat map
  final String case_location;
  final String update_date;
  final String update_message;

  // Victim information and photo
  final String victim_name;
  final String victim_age;
  
  // required data for each case
  Updates(
    this.case_date,

    // required time and location data
    this.case_location,
    this.update_date,
    this.update_message,

    // requiredVictim information and photo
    this.victim_name,
    this.victim_age,
  );

}


// Create a data class for all CaseReports
class CaseReports {
  final String case_date;

  // Time Location Information and heat map
  final String? report_address;
  final Position? report_position;

  final String report_date;

  // Report information
  final String report_description;
  final Image report_image;
  final bool? vehicle_included;
  final bool? victim_included;
  final bool? suspect_included;
  final bool? no_image;

  // Victim information and photo
  final String victim_name;

  
  // required data for each case
  CaseReports(
    this.case_date,

    // required time and location data
    this.report_address,
    this.report_position,
    this.report_date,

    // Report Information
    this.report_description,
    this.report_image,
    this.vehicle_included,
    this.victim_included,
    this.suspect_included,
    this.no_image,


    // required Victim information and photo
    this.victim_name,
  );

}