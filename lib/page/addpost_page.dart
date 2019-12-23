import 'package:flutter/material.dart';import 'package:fluttertoast/fluttertoast.dart';import 'package:get_put_delete/data/api_provider.dart';import 'package:get_put_delete/model/add_post.dart';class AddPostPage extends StatefulWidget {  @override  _AddPostPageState createState() => _AddPostPageState();}class _AddPostPageState extends State<AddPostPage> {  ApiProvider provider = ApiProvider();  Future<AddPost> addPost;  bool _isFieldTitleValid;  bool _isFieldBodyValid;  TextEditingController _controllerTitle = TextEditingController();  TextEditingController _controllerBody = TextEditingController();  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(        centerTitle: true,        title: Text(          'ADD POST',          style: TextStyle(color: Colors.black),        ),        backgroundColor: Colors.white,        leading: IconButton(          icon: Icon(            Icons.arrow_back,            color: Colors.black,          ),          onPressed: () {            Navigator.pop(context);          },        ),      ),      body: Column(        children: <Widget>[          Container(            margin: EdgeInsets.all(10),            child: TextField(              controller: _controllerTitle,              keyboardType: TextInputType.text,              decoration: InputDecoration(                labelText: "Title Name",                errorText: _isFieldTitleValid == null || _isFieldTitleValid                    ? null                    : "FTitle Name is required",              ),            ),          ),          Container(            margin: EdgeInsets.all(10),            child: TextField(              controller: _controllerBody,              keyboardType: TextInputType.text,              decoration: InputDecoration(                labelText: "Body name",                errorText: _isFieldBodyValid == null || _isFieldBodyValid                    ? null                    : "Body name is required",              ),            ),          ),          FutureBuilder(            future: addPost,            builder: (BuildContext context, AsyncSnapshot snapshot) {              if (snapshot.hasData) {                Fluttertoast.showToast(                    msg: "Success",                    toastLength: Toast.LENGTH_SHORT,                    gravity: ToastGravity.CENTER,                    timeInSecForIos: 1,                    backgroundColor: Colors.red,                    textColor: Colors.white,                    fontSize: 16.0                );                Navigator.pop(context);                return Container(                  margin: EdgeInsets.all(10),                  child: RaisedButton(                    onPressed: () {                      String body = _controllerBody.text.toString();                      String title = _controllerTitle.text.toString();                      setState(() {                        addPost = provider.addPost(title, body);                      });                    },                    child: Text(                      "Submit".toUpperCase(),                      style: TextStyle(                        color: Colors.white,                      ),                    ),                    color: Colors.black,                  ),                );              } else if (snapshot.hasError) {                print('Has Error : ${snapshot.hasError}');                return Text(' ERROR !!!');              } else {                print('Sedang Loading !!!!!!');                return Container(                  margin: EdgeInsets.all(10),                  child: RaisedButton(                    onPressed: () {                      String body = _controllerBody.text.toString();                      String title = _controllerTitle.text.toString();                      setState(                        () {                          addPost = provider.addPost(title, body);                        },                      );                    },                    child: Text(                      "Submit".toUpperCase(),                      style: TextStyle(                        color: Colors.white,                      ),                    ),                    color: Colors.black,                  ),                );              }            },          ),        ],      ),    );  }}