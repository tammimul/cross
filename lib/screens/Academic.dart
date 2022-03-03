import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Academic extends StatefulWidget {
  const Academic({Key? key}) : super(key: key);

  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.black54,automaticallyImplyLeading:false,actions: [IconButton(onPressed: (){}, icon: Icon(Icons.logout))], ),
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

  Widget potraitMode() {
    return Column(
      children: [
        SizedBox(height: 10,),
        Container(
          height : ScreenUtil().setHeight(90),
          width: ScreenUtil().setWidth(90),
          child: CircleAvatar(
            radius: 2.0,
            // backgroundColor: Colors.amber,
            backgroundImage: NetworkImage('https://png.pngtree.com/png-clipart/20190924/original/pngtree-user-vector-avatar-png-image_4830521.jpg') ,
          ),
        ),
        SizedBox(height: 10,),
        Text("Tammimul Haque",style: TextStyle(fontSize: 18.sp),),
        SizedBox(height: MediaQuery.of(context).size.height*0.035),
        Expanded(
          flex: 1,
          child: Container(
            //  color: Colors.lightBlueAccent,
            height: ScreenUtil().setHeight(50),
            child: Column(
              children: [
                ListTile(title: Text("Enrolled Programme",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp)),subtitle: Text("Btech",style: TextStyle(fontSize: 16),),),
                Divider(height: 2,),
                ListTile(title: Text("Academic Department",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp)),subtitle: Text("Cse",style: TextStyle(fontSize: 16),),),
                Divider(height: 2),
                ListTile(title: Text("Enrolment Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp )),subtitle: Text("AU/2018/02/0001905",style: TextStyle(fontSize: 16),),),
                Divider(height: 2),
                ListTile(title: Text("Roll Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp)),subtitle: Text("UG/02/BTCSE/2018/014",style: TextStyle(fontSize: 16),),),

              ],
            ),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //   Container(
        //     height: MediaQuery.of(context).size.height*0.06,
        //     width: MediaQuery.of(context).size.width*0.33,
        //     child: FloatingActionButton.extended(
        //       onPressed: (){},
        //       icon: Icon(Icons.logout,size: ScreenUtil().setHeight(20),),
        //       label: Text("Sing Out"),
        //     ),
        //    ),
        //     SizedBox(width: ScreenUtil().setWidth(10),)
        //   ],
        // ),
        SizedBox(height: ScreenUtil().setHeight(12))
      ],
    );
  }

  Widget landscapeMode() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height : ScreenUtil().setHeight(180),
                    width: ScreenUtil().setWidth(80),
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width*0.8,
                      //  backgroundColor: Colors.amber,
                      backgroundImage: NetworkImage('https://png.pngtree.com/png-clipart/20190924/original/pngtree-user-vector-avatar-png-image_4830521.jpg') ,
                    ),
                  ),
                  Text("Tammimul Haque",style: TextStyle(fontSize: ScreenUtil().setWidth(12)),),

                ],
              ),
              SizedBox(width: 30,),
              list(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget list (){
  return Expanded(
    child: ListView(
      //physics: NeverScrollableScrollPhysics(),
      children: [
        ListTile(title: Text("Enrolled Programme",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28.sp)),subtitle: Text("Btech",style: TextStyle(fontSize: 24.sp),),),
        Divider(thickness: 2,height: 2.h,),
        ListTile(title: Text("Academic Department",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28.sp)),subtitle: Text("Cse",style: TextStyle(fontSize: 24.sp),),),
        Divider(thickness: 2,height: 2.h,),
        ListTile(title: Text("Enrolment Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28.sp )),subtitle: Text("AU/2018/02/0001905",style: TextStyle(fontSize: 24.sp),),),
        Divider(thickness: 2,height: 2.h,),
        ListTile(title: Text("Roll Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28.sp)),subtitle: Text("UG/02/BTCSE/2018/014",style: TextStyle(fontSize: 24.sp),),),
      ],
    ),
  );
}
