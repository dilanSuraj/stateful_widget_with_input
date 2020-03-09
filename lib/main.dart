import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyButton(),
    );
  }
}

class MyButton extends StatefulWidget {


  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {

    int counter = 0;
  List<String> strings = ['Flutter', 'is', 'cool', 'and', 'awesome!'];
  String displayMsg = 'Hello World!';
  String inputText = "";

  final TextEditingController textEditingController = TextEditingController();

  void onPressBtn(){
    setState(() {
      displayMsg = strings[counter];
      counter = counter < 4? counter + 1: 0;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Stateful Widget"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                displayMsg,
                style: TextStyle(fontSize: 40),),
                Padding(padding: const EdgeInsets.all(10)),
                RaisedButton(
                  onPressed: onPressBtn,
                  color: Colors.red,
                  child: Text(
                    "Press me",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter text here....."
                  ),
                  onSubmitted: (String str){
                    setState(() {
                        inputText += "\n" + str;
                        textEditingController.text = "";
                    });
                  },
                  controller: textEditingController,
                ),
                Text(inputText)
            ],
          ),
        ),
      ),
    );
  }
}