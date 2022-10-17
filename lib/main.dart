import 'package:flutter/material.dart';

String larryphoto = "images/larry.jpg";
String curlyphoto = "images/curly.jpg";
String moephoto = "images/moe.jpg";
String shempphoto = "images/shemp.jpg";

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //create a textcontroller
  TextEditingController textController1 = TextEditingController();

  int _groupValue1 = 0;

  String selectStooge = "images/larry.jpg";

  void _setTextField(String value) {
    setState(() {
      textController1.text = value.toString();
    });
  }

  Widget wItemSelected() {
    return Container(
      padding: const EdgeInsets.all((20.0)),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(selectStooge), fit: BoxFit.fitHeight, alignment: Alignment.centerRight)),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text("Item Selected",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
          TextField(controller: textController1, onChanged: _setTextField),

        ],
      ),
    );
  }

  Widget radioButtons1() {
    return Row(children: [
      Column(
        children: [
          Row(
            children: [
              Text(
                "Larry",
                style: TextStyle(fontSize: 18.0),
              ),
              Radio(
                  value: "Larry",
                  groupValue: _groupValue1,
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      _groupValue1 = 0;
                      textController1.text = value.toString();
                      selectStooge = larryphoto;
                    });
                  }),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                      child:
                      Image.asset(larryphoto, width: 100, fit: BoxFit.cover))) ],
          ),

        ],
      )
    ]);
  }

  Widget radioButtons2() {
    return Row(children: [
      Column(
        children: [
          Row(children: [
            Text(
              "Curly",
              style: TextStyle(fontSize: 18.0),
            ),
            Radio(
                value: "Curly",
                groupValue: _groupValue1,
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    _groupValue1 = 0;
                    textController1.text = value.toString();
                    selectStooge = curlyphoto;
                  });
                })
          ]),
        ],
      ),
      Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
              child:
              Image.asset(curlyphoto, width: 100, fit: BoxFit.cover)))
    ]);
  }

  Widget radioButtons3() {
    return Row(children: [
      Column(
        children: [
          Row(
            children: [
              Text(
                "Moe",
                style: TextStyle(fontSize: 18.0),
              ),
              Radio(
                  value: "Moe",
                  groupValue: _groupValue1,
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      _groupValue1 = 0;
                      textController1.text = value.toString();
                      selectStooge = moephoto;
                    });
                  }),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                      child:
                      Image.asset(moephoto, width: 100, fit: BoxFit.cover)))
            ],
          ),

        ],
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Radio Buttons")),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            wItemSelected(),
            const Divider(height: 20, thickness: 5.0, color: Colors.pinkAccent),
            radioButtons1(),
            radioButtons2(),
            radioButtons3()
          ],
        ));
  }
}
