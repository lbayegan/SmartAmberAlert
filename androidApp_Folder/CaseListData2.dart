import 'package:flutter/material.dart';

import 'DataClasses.dart';

// Demo Case Data set number 2

class MyAppState extends ChangeNotifier {
  
  var caseList = [
  // Test Case 1
    Cases('December 25, 2022', // case date

    // required time and location data
    'San Antonio, TX',               //last_known_location,
    'December 25, 2022, 13:53',   //time_of_dissapearance,
    Image.network('https://2.bp.blogspot.com/_ZSuJiQ9ztA8/SmpFLcuIwbI/AAAAAAAABl8/2m_J9tqXbHo/w1200-h630-p-k-no-nu/san+antonio+heat+map+j.jpg'),   //heat_map_image,

    // required Suspects vehicle description and photo
    'S3N P41',                 //liscense_plate_number,
    '2015 Toyota RAV4',         //vehicle_model,
    'Red',                    //vehicle_color,
    Image.network('https://i.gaw.to/content/photos/16/94/169419_2015_Toyota_RAV4.jpg?1024x640'),                      //vehicle_image,

    // requiredVictim information and photo
    'Mary Kristmis',            //victim_name,
    '15',                        //victim_age,
    'Caucasian female with blond hair and blue eyes, 5 foot 1 inch tall',        //victim_description,
    Image.network('https://hairstylecamp.com/wp-content/uploads/hair-color-for-13-years-old-girls.jpg'),                      //victim_image,

    // required Suspects description and photo
    'Grinch Munster',                      //suspect_name,
    'Green male, mid forties, green fur, green eyes, 6 foot tall',                      //suspect_description,
    Image.network('https://cdn.vox-cdn.com/thumbor/AzBgl9G-2lAt4AmbQnEq-jiKxus=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/13415907/grinch1.jpg'),                      //suspect_image,
    ),




    // Test Case 2
    Cases('May 4, 2022', // case date

    // required time and location data
    'Dallas, TX',               //last_known_location,
    'May 4, 2022, 09:11',   //time_of_dissapearance,
    Image.network('https://s3.amazonaws.com/census2020mapboxmaps/dallas-tx-crime-map.jpg'),   //heat_map_image,

    // required Suspects vehicle description and photo
    'ST4R W4R',                 //liscense_plate_number,
    '2012 X-Wing',         //vehicle_model,
    'Gray',                    //vehicle_color,
    Image.network('https://wallpaperaccess.com/full/1662232.jpg'),                      //vehicle_image,

    // requiredVictim information and photo
    'Luke Skywalker',            //victim_name,
    '16',                        //victim_age,
    'Caucasian male with brown hair and green eyes, 5 foot 8 inch tall',        //victim_description,
    Image.network('https://www.slashfilm.com/img/gallery/george-lucas-had-a-good-reason-for-scrapping-luke-skywalkers-original-last-name/l-intro-1676066290.jpg'),                      //victim_image,

    // required Suspects description and photo
    'Darth Vader',                      //suspect_name,
    'Caucasian male, mid forties, bald, dead eyes, 5 foot 11 inches tall, black suit and large black helmet',                      //suspect_description,
    Image.network('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/9f3f9bd9-0673-4276-bb34-71ece2a5820e/dfmgvtx-8b73761b-0527-4d12-b86c-92a04631a8c9.png/v1/fill/w_1920,h_1920,q_80,strp/darth_vader__ai_art__by_3d1viner_dfmgvtx-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTkyMCIsInBhdGgiOiJcL2ZcLzlmM2Y5YmQ5LTA2NzMtNDI3Ni1iYjM0LTcxZWNlMmE1ODIwZVwvZGZtZ3Z0eC04YjczNzYxYi0wNTI3LTRkMTItYjg2Yy05MmEwNDYzMWE4YzkucG5nIiwid2lkdGgiOiI8PTE5MjAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.HpHZ9AQtqpRbJO3cAL-BUBWNaN4OhElCGiaH7QKJo8M'),                      //suspect_image,
    ),



    // Test Case 3
    Cases('March 23, 2022', // case date

    // required time and location data
    'College Station, TX',               //last_known_location,
    'March 23, 2022, 09:11',   //time_of_dissapearance,
    Image.network('https://watchers.news/wp-content/uploads/texas-fireball-april-11-2019-ams-heatmap.jpg'),   //heat_map_image,

    // required Suspects vehicle description and photo
    'BD4Y B0Y',                 //liscense_plate_number,
    '2007 Toyota RAV4',         //vehicle_model,
    'White',                    //vehicle_color,
    Image.network('https://images.customwheeloffset.com/web-compressed/1599649-1-2007-rav4-toyota-stock-air-suspension-avid1-av06-white.jpg'),                      //vehicle_image,

    // requiredVictim information and photo
    'Sigmund Freud',            //victim_name,
    '12',                        //victim_age,
    'Caucasian male with dirty blonde hair and hazel eyes, 4 foot 11 inch tall',        //victim_description,
    Image.network('https://i.pinimg.com/originals/15/15/9b/15159b0225c8606d403ee89476f46e54.jpg'),                      //victim_image,

    // required Suspects description and photo
    'Party Crasher',                      //suspect_name,
    'Caucasian female, mid twenties, brown hair, hazel eyes, 5 foot 4 inches tall',                      //suspect_description,
    Image.network('https://thumbs.dreamstime.com/b/photo-closeup-beautiful-single-woman-s-brown-hair-look-photo-closeup-beautiful-single-woman-s-brown-hair-looking-117458826.jpg'),                      //suspect_image,
    ),


    // Test Case 4
    Cases('February 29, 2022', // case date

    // required time and location data
    'Bryan, TX',               //last_known_location,
    'February 29, 2022, 09:11',   //time_of_dissapearance,
    Image.network('https://news.climate.columbia.edu/wp-content/uploads/2022/02/water-rescue-calls-houston-harvey.png'),   //heat_map_image,

    // required Suspects vehicle description and photo
    'N0 WH3R3',                 //liscense_plate_number,
    '2020 Honda Civic',         //vehicle_model,
    'Black',                    //vehicle_color,
    Image.network('https://content.homenetiol.com/2000292/2143540/0x0/0946c46709c145f2a40c514d39d646db.jpg'),                      //vehicle_image,

    // requiredVictim information and photo
    'Maddy Kleid',            //victim_name,
    '13',                        //victim_age,
    'Caucasian female with dirty blonde hair and green eyes, 4 foot 9 inch tall',        //victim_description,
    Image.network('https://st2.depositphotos.com/6299324/11909/i/950/depositphotos_119093430-stock-photo-a-beautiful-blond-haired-13.jpg'),                      //victim_image,

    // required Suspects description and photo
    'Wilfried Ehrenfest',                      //suspect_name,
    'Caucasian male, mid thirties, blonde hair, blue eyes, 6 foot 2 inches tall',                      //suspect_description,
    Image.network('https://media.istockphoto.com/id/1132054003/photo/close-up-portrait-of-man-wearing-wetsuit-at-beach.jpg?s=612x612&w=0&k=20&c=D_c9c2DOCX7STxESj9_ML6AeyKXMfTXppccTyAA8JgM='),                      //suspect_image,
    ),


    // Test Case 5
    Cases('January 1, 2021', // case date

    // required time and location data
    'Houston, TX',               //last_known_location,
    'January 1, 2021, 09:11',   //time_of_dissapearance,
    Image.network('https://spotcrime.files.wordpress.com/2009/07/houstonheatmap.jpg'),   //heat_map_image,

    // required Suspects vehicle description and photo
    'N3W Y34R',                 //liscense_plate_number,
    '2021 Jeep Cherokee',         //vehicle_model,
    'Blue',                    //vehicle_color,
    Image.network('https://cdn.jdpower.com/JDPA_2021%20Jeep%20Cherokee%20Trailhawk%20Blue%20Rear%20Quarter%20View.jpg'),                      //vehicle_image,

    // requiredVictim information and photo
    'Destiny McFate',            //victim_name,
    '11',                        //victim_age,
    'Caucasian female with brown hair and green eyes, 4 foot 6 inch tall',        //victim_description,
    Image.network('https://media.istockphoto.com/id/1408237515/photo/cute-child-over-white-background-on-studio.jpg?s=612x612&w=0&k=20&c=aajriBZPcWv2F-NhsuZqUIrYBxVsFB7jaEX-4gTjZXE='),                      //victim_image,

    // required Suspects description and photo
    'Resolution McFate',                      //suspect_name,
    'Caucasian female, mid thirties, brown hair, hazel eyes, 5 foot 4 inches tall',                      //suspect_description,
    Image.network('https://t4.ftcdn.net/jpg/02/46/60/71/360_F_246607169_e6gMvYGrbfJ3OGgJyj0c7KxWzujUWoB1.jpg'),                      //suspect_image,
    ),





  ];

  var UpdatesList = [

    //No Updates Case
    Updates('None', // case date

    // required time and location data
    'Nowhere',               //case_location,
    'No Updates',   //update_date,
    'No updates have been made at this time',   //update_message,

    // requiredVictim information and photo
    'No Body',            //victim_name,
    'Age is just a Number',                        //victim_age,
    ),

    // Test Update 1
    Updates('December 25, 2022', // case date

    // required time and location data
    'San Antonio, TX',               //case_location,
    'December 31, 2022, 23:59',   //update_date,
    'Mary Christmas was recently sited at the North Pole, Artic Ocean',   //update_message,

    // requiredVictim information and photo
    'Mary Kristmis',            //victim_name,
    '15',                        //victim_age,
    ),

    // Test Update 2
    Updates('February 29, 2022', // case date

    // required time and location data
    'Bryan, TX',               //case_location,
    'November 18, 2022, 02:42',   //update_date,
    'Maddy Kleid was recently sited in Denton, Texas, on University of North Texas Campus',   //update_message,

    // requiredVictim information and photo
    'Maddy Kleid',            //victim_name,
    '13',                        //victim_age,
    ),

    // Test Update 3
    Updates('May 4, 2022', // case date

    // required time and location data
    'San Antonio, TX',               //case_location,
    'October 31, 2022, 13:13',   //update_date,
    'Luke Skywalker was recently sited going house to house trick-or-treating in residential areas of College Station, Texas, seen with Suspect Darth Vader',   //update_message,

    // requiredVictim information and photo
    'Luke Skywalker',            //victim_name,
    '16',                        //victim_age,
    ),
  ];


  var CaseReportsList = <CaseReports>[];

  GlobalKey? historyListKey;

  GlobalKey? UpdatesListKey;

  GlobalKey? ReportsListKey;

}