// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCRo00esgcpRLmEMlsqeUl7rNzI85iun04",
  authDomain: "smartamberalert.firebaseapp.com",
  projectId: "smartamberalert",
  storageBucket: "smartamberalert.appspot.com",
  messagingSenderId: "891674538347",
  appId: "1:891674538347:web:a1f2d82c213f0903d1dc2e",
  measurementId: "G-HZVZ5KVEN4"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);



document.addEventListener("DOMContentLoaded", event =>{

    const app = firebase.app();

    const db = firebase.firestore();

    const testPost = db.collection('posts').doc();

    testPost.get().then(doc =>{
            const data = doc.data();
            document.write( data.title + '<br>')
            document.write( data.createdAt)
        })

    //console.log(app)

});


function googleLogin() 
{
    var provider = new firebase.auth.GoogleAuthProvider();

    firebase.auth().signInWithPopup(provider)
        .then((result) =>{
            const user = result.user;
            document.write('Hello ${user.displayName}');
            console.log(user);
        })
        .catch((error) => {
            console.log("This is an error");
        });
};


// UPLOAD IMAGE FUNCTION
 function uploadImage() {
    const ref = firebase.storage().ref();
    const file = document.querySelector("#photo").files[0];
    const name = +new Date() + "-" + file.name;
    const metadata = {
       contentType: file.type
    };
    const task = ref.child(name).put(file, metadata);task
    .then(snapshot => snapshot.ref.getDownloadURL())
    .then(url => {
    console.log(url);
    alert('image uploaded successfully');
    document.querySelector("#image").src = url;
 })
 .catch(console.error);
 }
 const errorMsgElement = document.querySelector('span#errorMsg');