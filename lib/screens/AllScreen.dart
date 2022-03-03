
import 'dart:convert';

import 'package:cross/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  _AllScreenState createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false,backgroundColor: Colors.black54,title: Image.asset('assets/cross.png'),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Fav",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.double_arrow_rounded))
                ],
              ),
              Container(
                height: 140.h,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 5),
                  shrinkWrap: true,
                  // itemExtent: 140,
                  scrollDirection: Axis.horizontal,
                  itemCount: cat.items.length,
                  itemBuilder:(context , index){
                    final item = cat.items[index];
                    return InkWell(
                      onTap: (){
                        openUrl(item.url);
                      },
                      child: SizedBox(
                        height: 100.h,
                        width: 150.w,
                        child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: GridTile(
                                header: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  // child: Text(item.name,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                                ),
                                child: Image.network(item.image))),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Reco",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.double_arrow_rounded))
                ],
              ),
              Container(
                height: 140.h,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 5),
                  // itemExtent: 120,
                  scrollDirection: Axis.horizontal,
                  itemCount: cat.items.length,
                  itemBuilder:(context , index){
                    final item = cat.items[index];
                    return InkWell(
                      onTap: (){
                        openUrl(item.url);
                      },
                      child: SizedBox(
                        height: 100.h,
                        width: 150.w,
                        child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: GridTile(
                                header: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  // child: Text(item.name,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                                ),
                                child: Image.network(item.image))),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("All",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.double_arrow_rounded))
                ],
              ),
              Container(
                height: 140.h,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 5),
                  //itemExtent: 120,
                  scrollDirection: Axis.horizontal,
                  itemCount: cat.items.length,
                  itemBuilder:(context , index){
                    final item = cat.items[index];
                    return InkWell(
                      onTap: (){
                        openUrl(item.url);
                      },
                      child: SizedBox(
                        height: 100.h,
                        width: 150.w,
                        child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            child: GridTile(
                                header: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  // child: Text(item.name,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                                ),
                                child: Image.network(item.image))),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ) //: Center(child: CircularProgressIndicator(),),
    );
  }

  openUrl(String url) async {
    //const URL = url
    if (await canLaunch(url)) {
      await launch(url);
    }else {
      throw 'URL Err...';
    }
  }
}
