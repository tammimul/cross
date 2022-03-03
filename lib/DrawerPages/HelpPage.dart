import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final vari = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4",
    "Option 5",
    "Option 6",
    "Option 7"

  ];
  int index = 0;
  var val = 'Select';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(elevation: 0,automaticallyImplyLeading: false,backgroundColor: Colors.black54,),
        body: OrientationBuilder(builder: (context, orientation) {
          if( orientation == Orientation.portrait){
            return potraitMode();
          }else{
            return landscapeMode();
          }
        },
        )
    );
  }

  Widget Roll(BuildContext context ) =>  SizedBox(
    height: 300,
    child: CupertinoPicker(itemExtent: 42, onSelectedItemChanged: (index){
      setState(() => this.index = index );
    },
        children: vari.map((option) => Center(child: Text(option))).toList()
    ),
  );

  Widget potraitMode() {
    return Container(
      color: Colors.deepPurple[50],
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: ScreenUtil().setHeight(40),
                color: Colors.white,
                child: Row(
                  children: [
                    TextButton(onPressed: (){
                      showCupertinoModalPopup(context: context, builder: (context) => CupertinoActionSheet(actions: [Roll(context)],
                        cancelButton: CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () { Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),),
                      )
                      );
                    }, child: Text(vari[index],style: TextStyle(fontSize: 16.sp ,color: Colors.black26),))
                  ],
                ),
              ),),
          ),
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 40.h,
                color: Colors.white,
                child: Row(
                  children: [
                    TextButton(onPressed: (){
                      showCupertinoModalPopup(context: context, builder: (context) => CupertinoActionSheet(actions: [Roll(context)],
                        cancelButton: CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () { Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),),
                      )
                      );
                    }, child: Text(vari[index],style: TextStyle(fontSize: 16,color: Colors.black26),))
                  ],
                ),
              ),),
          ),


          Padding(
            padding: EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                decoration: BoxDecoration( color: Colors.white, boxShadow: [BoxShadow(color: Colors.black),]),

                height: MediaQuery.of(context).size.height*0.3,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 14,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FloatingActionButton(
                  onPressed: (){},
                  child: Icon(Icons.add,size: ScreenUtil().setHeight(20),),
                  shape: CircleBorder(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget landscapeMode() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.deepPurple[50],
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text("Query",style: TextStyle(fontWeight: FontWeight.bold,fontSize: ScreenUtil().setWidth(20)),),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: ScreenUtil().setWidth(130),
                          color: Colors.white,
                          child: Row(
                            children: [
                              TextButton(onPressed: (){
                                showCupertinoModalPopup(context: context, builder: (context) => CupertinoActionSheet(actions: [Roll(context)],
                                  cancelButton: CupertinoActionSheetAction(
                                    isDestructiveAction: true,
                                    onPressed: () { Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"),),
                                )
                                );
                              }, child: Text(vari[index],style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.025 ,color: Colors.black26),))
                            ],
                          ),
                        ),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: ScreenUtil().setWidth(130),
                          color: Colors.white,
                          child: Row(
                            children: [
                              TextButton(onPressed: (){
                                showCupertinoModalPopup(context: context, builder: (context) => CupertinoActionSheet(actions: [Roll(context)],
                                  cancelButton: CupertinoActionSheetAction(
                                    isDestructiveAction: true,
                                    onPressed: () { Navigator.of(context).pop();
                                    },
                                    child: Text("Cancel"),),
                                )
                                );
                              }, child: Text(vari[index],style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.025,color: Colors.black26),))
                            ],
                          ),
                        ),),
                    ),

                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.47,
                  height: MediaQuery.of(context).size.height*0.55,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        decoration: BoxDecoration( color: Colors.white, boxShadow: [BoxShadow(color: Colors.black),]),

                        height: MediaQuery.of(context).size.height*0.3,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 14,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

