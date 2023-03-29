# SmartAmberAlert


//imports the flutter package
import 'package:flutter/material.dart';

//Runs the app
void main() {
  runApp(const MainApp());
}

//Main portion of the Login Page
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //tells it to run
    return MaterialApp(
      //title of the page
      title:"Smart Amber Alert Admin Login",
      //sets theme
      theme: ThemeData(
        //light theme
        brightness:Brightness.light,
        //Color at top
        primarySwatch: Colors.blueGrey,
        //Background color
        scaffoldBackgroundColor:Colors.blueGrey[100],
        //Sets the font
        fontFamily: "Roboto",
      ),
      //Sets up the organization of the app
      home: Scaffold( 
        //The top bar
        appBar: AppBar(
          //The title of the top bar
          title:
           Text('Smart Amber Alert\n     Login Page'),
           //sets text to the center
           centerTitle: true, 
        ),
        //Centers it horizontally in middle
        body: Center(
        //Sets it to column (how widgets are added)
        child: Column(
          //Centers it vertically in the middle
          mainAxisAlignment: MainAxisAlignment.center,
          //allows for mutiple aspects in the body as opposed to child which is one
          children: [
          //adds the image at the top
          Image.asset('assets/images/drawing.png', 
          //sets the height and width of the image
            height: 150,
            width: 400),
         //Text box says login and sets style of text
          Text("Login",style:TextStyle(fontSize:18)),
          //Where text is entered. This one is for username
            TextField(
            
              onSubmitted:(username){
                var user_correct;
              if(username=="SmartAmber1!"){
                  user_correct=true;
                  print("Username: Correct");
                }
                else{
                  user_correct=false;
                  print("Username: Incorrect");
                }
                return user_correct;
              },
              maxLength: 15,
              //look of the textbox
              decoration: InputDecoration(
                //makes it blue filled
                filled:true,
                fillColor: Colors.blueGrey[200],
                //border to the box
                border: OutlineInputBorder(),
                //adds text to the box
                hintText: 'Username',
              ),
            ),

            TextField(
              
              
              
              /* onSubmitted:(password){*/
                  onEditingComplete(){
                var pass_correct;
              if(password=="Amber123!"){
                  pass_correct=true;
                  print("Password: Correct");
                }
                else{
                  pass_correct=false;
                  print("Password: Incorrect");
                }
                return pass_correct;
              },

              obscureText: true,
              obscuringCharacter:"*",
              maxLength: 15,
              decoration: InputDecoration(
                filled:true,
                fillColor: Colors.blueGrey[200],
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),

            FilledButton(
              //style: style,
              onPressed: (){
             /* if (user_correct = true) {
                print("Username");
              }
              else{
                print("NOPE"),
              };*/
              },
              
              child: Text('Continue'),
            ) 
            
        ],))
      ),
    );
  }
}
/*
check_password getMyPass(string user, string pass){
  if (user = 'Meow1!' and pass = 'Password2!')
  then{
    return user,
  }
}*/
