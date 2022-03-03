import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:cross/models/model1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
extension ColorExtension on String {

}
class Events extends StatefulWidget {


  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  void initState() {
    super.initState();
    load();
  }
  load() async{
    var jsonloader = await rootBundle.loadString("lib/files/file/concert.json");
    var decodeData = jsonDecode(jsonloader);
    var objectData = decodeData["objects"];
    concert.elements = List.from(objectData).map<Elements>((data) => Elements.fromMap(data)).toList();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.black54,automaticallyImplyLeading: false,),
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
}


class potraitMode extends StatelessWidget {
  const potraitMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("This Week", style: TextStyle(
                    fontSize: 18.sp, fontWeight: FontWeight.w500),),
                Text("All", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),)
              ],
            ),
          ),
          Container(
            height: 200, //MediaQuery.of(context).size.height*0.25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: concert.elements.length,
                itemBuilder: (context, index) {
                  final data = concert.elements[index];
                  return Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.symmetric(
                        horizontal: 22, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.6),
                        offset: Offset(0.0, 10.0),
                        blurRadius: 10.0,
                        spreadRadius: -6.0,
                      ),
                      ],
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(Colors.black
                            .withOpacity(0.35),
                            BlendMode.multiply
                        ),
                        image: NetworkImage(data.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.date_range_outlined,
                                      color: Colors.white, size: 18,),
                                    SizedBox(width: 5),
                                    Text("17.09", style: TextStyle(fontSize: 13, color: Colors.white),)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.access_time, color: Colors.white,
                                      size: 18,),
                                    SizedBox(width: 5),
                                    Text("7:09 PM", style: TextStyle(
                                        fontSize: 13, color: Colors.white),)
                                  ],
                                ),
                              )
                            ],
                          ),
                          alignment: Alignment.bottomLeft,
                        ),
                      ],
                    ),
                  );
                }
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Upcoming Events", style: TextStyle(
                    fontSize: 18.sp, fontWeight: FontWeight.w500)),

                Text("All", style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 18.sp),)
              ],
            ),
          ),

          Container(
            height: 200, //MediaQuery.of(context).size.height*0.25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: concert.elements.length,
                itemBuilder: (context, index) {
                  var data = concert.elements[index];
                  return
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.symmetric(
                          horizontal: 22, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.6),
                          offset: Offset(0.0, 10.0),
                          blurRadius: 10.0,
                          spreadRadius: -6.0,
                        ),
                        ],
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35),
                              BlendMode.multiply
                          ),

                          image: NetworkImage(data.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.date_range_outlined,
                                        color: Colors.white, size: 18,),
                                      SizedBox(width: 5,),
                                      Text("17.09", style: TextStyle(
                                          fontSize: 13, color: Colors.white),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.white,
                                        size: 18,),
                                      SizedBox(width: 5,),
                                      Text("7:09 PM", style: TextStyle(
                                          fontSize: 13, color: Colors.white),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                        ],
                      ),
                    );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Registered Events", style: TextStyle(
                    fontSize: 18.sp, fontWeight: FontWeight.w500)),
                Text("All", style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 18.sp),),
              ],

            ),
          ),
          Container(
            height: 200, //MediaQuery.of(context).size.height*0.25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: concert.elements.length,
                itemBuilder: (context, index) {
                  var data = concert.elements[index];
                  return
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.symmetric(
                          horizontal: 22, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.6),
                          offset: Offset(0.0, 10.0),
                          blurRadius: 10.0,
                          spreadRadius: -6.0,
                        ),
                        ],
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35),
                              BlendMode.multiply
                          ),

                          image: NetworkImage(data.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.date_range_outlined,
                                        color: Colors.white, size: 18,),
                                      SizedBox(width: 5,),
                                      Text("17.09", style: TextStyle(
                                          fontSize: 13, color: Colors.white),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.white,
                                        size: 18,),
                                      SizedBox(width: 5,),
                                      Text("7:09 PM", style: TextStyle(
                                          fontSize: 13, color: Colors.white),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                        ],
                      ),
                    );
                }
            ),
          ),
        ],
      ),
    );
  }
}

class landscapeMode extends StatelessWidget {
  const landscapeMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
          child: Container(
              child: Column(
                  children: [
                    // SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16,top: 20),
                          child: Text(
                            "This Week",
                            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.6),
                        Padding(
                          padding: const EdgeInsets.only(right: 16,top: 20),
                          child: Text(
                            "All",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 200, //MediaQuery.of(context).size.height*0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: concert.elements.length,
                          itemBuilder: (context, index) {
                            final data = concert.elements[index];
                            return Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.45,
                              margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    offset: Offset(0.0, 10.0),
                                    blurRadius: 10.0,
                                    spreadRadius: -6.0,
                                  ),
                                ],
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.35), BlendMode.multiply),
                                  image: NetworkImage(data.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.date_range_outlined,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "17.09",
                                                style: TextStyle(
                                                    fontSize: 13, color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "7:09 PM",
                                                style: TextStyle(
                                                    fontSize: 13, color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    alignment: Alignment.bottomLeft,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text("Upcoming Events",
                              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.45),
                        Text(
                          "All",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 200, //MediaQuery.of(context).size.height*0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: concert.elements.length,
                          itemBuilder: (context, index) {
                            var data = concert.elements[index];
                            return Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.45,
                              margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    offset: Offset(0.0, 10.0),
                                    blurRadius: 10.0,
                                    spreadRadius: -6.0,
                                  ),
                                ],
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.35), BlendMode.multiply),
                                  image: NetworkImage(data.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.date_range_outlined,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "17.09",
                                                style: TextStyle(
                                                    fontSize: 13, color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "7:09 PM",
                                                style: TextStyle(
                                                    fontSize: 13, color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    alignment: Alignment.bottomLeft,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text("Registerd Events",
                              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.45),
                        Text(
                          "All",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 200, //MediaQuery.of(context).size.height*0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: concert.elements.length,
                          itemBuilder: (context, index) {
                            var data = concert.elements[index];
                            return Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.45,
                              margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    offset: Offset(0.0, 10.0),
                                    blurRadius: 10.0,
                                    spreadRadius: -6.0,
                                  ),
                                ],
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.35), BlendMode.multiply),
                                  image: NetworkImage(data.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.date_range_outlined,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "17.09",
                                                style: TextStyle(
                                                    fontSize: 13, color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.access_time,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "7:09 PM",
                                                style: TextStyle(
                                                    fontSize: 13, color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    alignment: Alignment.bottomLeft,
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ])),
        ));
  }
}
