import 'dart:convert';
import 'package:cross/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../routes.dart';
class RecoScreen extends StatefulWidget {
  const RecoScreen({Key? key}) : super(key: key);

  @override
  _RecoScreenState createState() => _RecoScreenState();
}

class _RecoScreenState extends State<RecoScreen> {
  @override
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var loaddata = await rootBundle.loadString("lib/files/file/apps.json");
    var decodedData = jsonDecode(loaddata);
    var productData = decodedData["products"];
    cat.items = List.from(productData).map<Items>((item) => Items.fromMap(item)).cast<Items>().toList();
    setState(() {

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(

        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return potraitMode();
          } else {
            return landscapeMode();
          }
        },
        )
    );
  }



  Widget potraitMode() {
    return Scaffold(
      appBar: AppBar(title: Text("All Apps"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 1.0 : 0.0,
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: (cat.items.isNotEmpty) ?
        Padding(
          padding: const EdgeInsets.only(top: 35.0,bottom: 10),
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 10), itemBuilder:(context , index){
            final item = cat.items[index];
            return InkWell(
              onTap: (){
                openUrl(item.url);
              },
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: GridTile(
                      header: Padding(
                        padding: const EdgeInsets.all(8.0),
                        //  child: Text(item.name,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                      ),
                      child: Image.network(item.image))),
            );
          },itemCount: cat.items.length,
          ),
        ) : Center(child: CircularProgressIndicator(),),
      ),
      ),
    );
  }

  Widget landscapeMode() {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(40),
        child: AppBar(leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)), elevation: 0.0,),),
      body: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width*0.12,
            color: Colors.lightBlueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap:(){
                      //  Navigator.pushNamed(context, Routes.Academic);
                    },
                    child: Icon(Icons.person)),
                InkWell(
                    onTap: (){
                      //   Navigator.pushNamed(context, Routes.Event);
                    },
                    child: Icon(Icons.event)),
                InkWell(
                    onTap: (){
                      // Navigator.pushNamed(context, Routes.HelpPage);
                    },
                    child: Icon(Icons.chat)),
                InkWell(
                    onTap: (){

                    },
                    child: Icon(Icons.logout)),

              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 50,left: 20),
              child: (cat.items.isNotEmpty) ?
              GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 20,crossAxisSpacing: 10), itemBuilder:(context , index){
                final item = cat.items[index];
                return InkWell(
                  onTap: (){
                    openUrl(item.url);
                  },
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: GridTile(
                          header: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.name,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                          ),
                          child: Image.network(item.image))),
                );
              },itemCount: cat.items.length,
              ) : Center(child: CircularProgressIndicator(),),
            ),
          ),
        ],
      ),
    );
  }
}

openUrl(String url) async {
  //const URL = url
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'URL Err...';
  }
}
