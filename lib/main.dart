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

  String _groupValue1 = "Stooges";
  int _groupValue2 = 0;
  int _groupValue3 = 0;


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
          image: DecorationImage(image: AssetImage(selectStooge), fit: BoxFit.fitHeight,  alignment: Alignment.centerRight)),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text("Item Selected",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
          TextField(controller: textController1, onChanged: _setTextField, maxLength: 8, ),

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
                      _groupValue1 = "Stooges";
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
  }//end of radiobuttions 1

  Widget radioButtonsNew(){

    List<Widget> wlist = <Widget>[];

    var StoogeList = ["Larry", "Curly", "Moe", "Shemp"];

    for(int i = 0; i<StoogeList.length; i++){

      wlist.add(SizedBox(
                  width: 150.0,
                  height: 50.0,
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(StoogeList[i].toString(),style: TextStyle(fontSize: 18.0)),
                          Radio(
                            value: i,
                            groupValue: _groupValue2,
                            onChanged: (value){
                              setState((){
                                _groupValue2=i;
                                if(value == 0){
                                selectStooge = larryphoto;
                                }else if (value ==1) {
                                  selectStooge = curlyphoto;
                                }
                                else if (value ==2) {
                                selectStooge = moephoto;
                                }
                                 else if (value ==3) {
                                 selectStooge = shempphoto;
                                         }


                                });


                              })
                        ])
      ));
  

    }// end of for where list


    
    Column myColumn = Column(children: wlist);
    Row myRow = Row(children: [
      myColumn,
      Padding(padding: const EdgeInsets.all(5.0),
              child: Container(
                child: Image.asset(selectStooge, width: 150.0, fit: BoxFit.cover,),
              ))]);

    return myRow;
  }

  Widget radioTiles(){

    List aNames = ["Bob", "Betty", "Beau", "Brian"];
    List jTitles = ["Doctor", "Engineer" , "Barber", "Coder"];

    List <Widget> wList = <Widget>[];

    for(int c = 0; c < aNames.length; c++){

      wList.add(RadioListTile(
        value: c,
        groupValue: _groupValue3,
          controlAffinity: ListTileControlAffinity.trailing,
        title: Text('Name: ' + aNames[c]),
        subtitle: Text('Job Title: ' + jTitles[c]),
        onChanged: (value){
          setState(() {
            _groupValue3 = c;
            textController1.text = aNames[c] + " - " + jTitles[c];
          });
        },
           )
        );
    }
    return Column(children: (wList));
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
                    _groupValue1 = "Stooges";
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
                      _groupValue1 = "Stooges";
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
            //radioButtons1(),
          //  radioButtons2(),
           // radioButtons3()
            radioButtonsNew(),
            radioTiles()
          ],
        ));
  }
}
