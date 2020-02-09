// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';

import 'package:flutter/material.dart';
String myDay = "Woow";
void main() => runApp(MaterialApp(
  home: Home(),
));
Image appLogo = new Image(
    image: AssetImage("assets/logo1.png"),
    height: 200.0,
    width: 200.0,
    fit: BoxFit.fill);
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appLogo,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.dehaze,
              color: Colors.grey,
            ),
            onPressed: () {
              // do something
            },
          )
        ],

      ),
      body: new Stack(
          children: <Widget>[
      new Container(
      decoration: new BoxDecoration(
      image: new DecorationImage(image: new AssetImage("assets/background.jpg"), fit: BoxFit.cover,),
    ),
    ),
    MyCustomForm(),
    ],
    ),



      /*Center(
          child: Container(
          margin:EdgeInsets.all(8.0),
          child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: InkWell(
          onTap: () => print("ciao"),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network(
                    'https://placeimg.com/640/480/any',
                    // width: 300,
                    height: 150,
                    fit:BoxFit.fill
                ),
              ),
              ListTile(
                title: Text('Pub 1'),
                subtitle: Text('Location 1'),
                ),
              ],
            ),
          ),
        ),
      ),
      ),

       */
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  bool passwordVisible = true;
  static FocusNode nodeOne = FocusNode();
  static FocusNode nodeTwo = FocusNode();

  final _formKey = GlobalKey<FormState>();
  var textField1 = TextFormField(
  decoration: new InputDecoration(
  labelText: "Enter Email",
  fillColor: Colors.white,
  ),
  focusNode: nodeOne,
  validator: (value) {
  if (value.isEmpty ||! (value.contains("@")) ){
  return 'Please enter some valid email';
  }
  return null;
  },);
  var textField2 = TextFormField(
  decoration: new InputDecoration(
  labelText: "S.I.N",
  fillColor: Colors.white,
  ),
  focusNode: nodeTwo,
  validator: (value) {
  if (value.isEmpty || value.length != 9) {
  return 'Please enter some text';
  }
  return null;
  },);
  final _formKeyScreen1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child:Container(
        margin: EdgeInsets.all(20),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(30),
      ),
       textField1, textField2,
      TextFormField(
        keyboardType: TextInputType.text,
        obscureText: passwordVisible,//This will obscure text dynamically
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          // Here is key idea
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              passwordVisible
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
        ),
      ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                    builder: (BuildContext context) => Screen2(),
                  ));
                }
                else{
                  _formKeyScreen1.currentState.reset();
                  FocusScope.of(context).requestFocus(nodeOne);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
class Screen2 extends StatefulWidget {
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _formKeyScreen2 = GlobalKey<FormState>();

  void _processData() {
    // Process your data and upload to server
    _formKeyScreen2.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appLogo,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.dehaze,
              color: Colors.grey,
            ),
            onPressed: () {
              // do something
            },
          )
        ],

      ),
      body: Center(
        child: Form(
          key: _formKeyScreen2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(30),
                width: 90.0,
                height: 90.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new AssetImage("assets/people images.jpg")
                        )
                    ),
              ),
              Container(
                child: new Text("Adam Andrews"),
              ),
              TextFormField(),
              TextFormField(),
              TextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}


