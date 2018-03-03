// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  //debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder> {
        "/signUp": (BuildContext context) => new SignUpPage(),
        "/logIn": (BuildContext context) => new LogInPage(),
      },
    );

  } // WIDGET Build()
} // End class.

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Welcome to Meet-Greet',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                    ),
                  ),
                ),
                new Text(
                  'Start a Conversation!',
                  style: new TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );


    Widget buildRaisedButton() {
    return new Align(
      alignment: const Alignment(0.0, -0.2),
      child: new ButtonBar(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new RaisedButton(
            child: const Text('Sign Up'),
            onPressed: () => Navigator.of(context).pushNamed("/signUp")
          ),
          new RaisedButton(
            child: const Text('Sign In'),
            onPressed: () => Navigator.of(context).pushNamed("/logIn")
          )
        ],
      ),
    );
  }

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
      Meet-Greet App tested on Android SDK and flutter with Dart framework.
        ''',
        softWrap: true,
      ),
    );

    Widget bottomText = new Container(
      padding: const EdgeInsets.all(20.0),
      child: new Row( 
        children: [
          new Icon(
            Icons.copyright,
            color: Colors.red[500],
          ),
          new Text('Copyright 2018'),
        ],
      ),
    );

     return new Scaffold(
        appBar: new AppBar(
          title: new Text('Meet Greet - HACKFSU 2018'),
        ),
        body: new ListView(
          children: [
            new Image.asset(
              'images/meet_greet.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
           titleSection,
           buildRaisedButton(),
            textSection,
            bottomText,
          ],
        ),
      );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  String _firstName;
  String _lastName;
  String _email;
  String _password;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performSignUp();
    }
  }

  void _performSignUp() {
    // This is just a demo, so no actual Sign Up here.
    final snackbar = new SnackBar(
      content: new Text('First Name: $_firstName, Last Name: $_lastName,Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: new ValueKey<String>('/signUp'),
      appBar: new AppBar(
        title: new Text('Create new Account'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: [
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Your First Name'),
                onSaved: (val) => _firstName = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Your Last Name'),
                onSaved: (val) => _firstName = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Your email'),
                validator: (val) =>
                !val.contains('@') ? 'Not a valid email.' : null,
                onSaved: (val) => _email = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Your password'),
                validator: (val) =>
                val.length < 6 ? 'Password too short.' : null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),
              new RaisedButton(
                onPressed: _submit,
                child: new Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogInPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LogInPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    }
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    final snackbar = new SnackBar(
      content: new Text('Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Sign On'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: [
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Your email'),
                validator: (val) =>
                !val.contains('@') ? 'Not a valid email.' : null,
                onSaved: (val) => _email = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Your password'),
                validator: (val) =>
                val.length < 6 ? 'Password too short.' : null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),
              new RaisedButton(
                onPressed: _submit,
                child: new Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}