import 'package:cross/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String val = "";
  bool change = false;
  final _key = GlobalKey<FormState>();
  move(BuildContext context)async{
    { if(_key.currentState!.validate()) {
      setState(() {
        change = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, Routes.rootView);
      setState(() {
        change = false;
      });
    }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(backgroundColor: Colors.white,elevation: 0.0,),
        body:  OrientationBuilder(builder: (context, orientation) {
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
    return Form(
      key: _key,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset("assets/login.png",alignment: Alignment.center,fit: BoxFit.fill,),
              Text("Welcome",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w500)),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                child: Column(
                  children: [
                    SizedBox(height: ScreenUtil().setHeight(60)),
                    Text("Login with your university email id to continue",textAlign: TextAlign.center,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400)),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     hintText: "Enter your username",
                    //     labelText: "username"
                    //   ),
                    //   validator: (value){
                    //     if(value!.isEmpty){
                    //       return ("Username cannont be empty!");
                    //     }
                    //     return null;
                    //   },
                    //   onChanged: (value){
                    //     value = val;
                    //     setState(() {
                    //
                    //     });
                    //   },
                    // ),
                    // SizedBox(height: 30,),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       hintText: "Enter your password",
                    //       labelText: "password",
                    //       ),
                    //   validator: (value){
                    //     if(value!.isEmpty){
                    //       return ("Password cannont be empty!");
                    //     } else if(value.length < 6 ) {
                    //       return ("Password length must be 6");
                    //     }
                    //     return null;
                    //   },
                    //     ),
                    SizedBox(height: ScreenUtil().setHeight(60)),
                    InkWell(
                      onTap: () => move(context),
                      child: Container(
                        height: ScreenUtil().setHeight(53),
                        width: ScreenUtil().setWidth(240),
                        child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Image.network("https://docs.microsoft.com/en-us/azure/active-directory/develop/media/howto-add-branding-in-azure-ad-apps/ms-symbollockup_signin_dark.png",height: ScreenUtil().setHeight(50),width: ScreenUtil().setWidth(110),fit: BoxFit.fill,)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget landscapeMode() {
    return SafeArea(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/login.png",alignment: Alignment.center,fit: BoxFit.fill,height: 180,width: 250,),
              Text("Welcome",style: TextStyle(fontSize: 35.sp,fontWeight: FontWeight.w500)),
              Text("Login with your university email id to continue",textAlign: TextAlign.center,style: TextStyle(fontSize: 40.sp,fontWeight: FontWeight.w400)),
              SizedBox(height: 20,),
              InkWell(
                onTap: () => move(context),
                child: Container(
                  height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(53),
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Image.network("https://docs.microsoft.com/en-us/azure/active-directory/develop/media/howto-add-branding-in-azure-ad-apps/ms-symbollockup_signin_dark_short.png",height: ScreenUtil().setHeight(50),width: ScreenUtil().setWidth(100),fit: BoxFit.fill,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
