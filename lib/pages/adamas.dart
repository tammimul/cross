import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:cross/Login_page.dart';

class adamaspage extends StatefulWidget {
  const adamaspage({Key? key}) : super(key: key);

  @override
  _adamaspageState createState() => _adamaspageState();
}

class _adamaspageState extends State<adamaspage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _introend() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => loginpage()));
  }

  Widget _imageBuid(String assetName, [double width = 300.0]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 30.0);
    var pagedecoration =  PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w700),
        bodyTextStyle: bodyStyle,
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
        contentMargin: EdgeInsets.all(10.h)
    );
    return Center(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
              title: '',
              body: "Adamas brings a new way to everyone",
              image: _imageBuid("image3.png"),
              footer: Text("")
          ),
          PageViewModel(
              title: '',
              body: "Recommended apps are.....",
              image: _imageBuid("edited.png")
          ),
          PageViewModel(
              title: 'Lorem Ipsum',
              body: "You can access all of these from this app and as well as all information that you should need to know",
              image: _imageBuid("crossroad.jpeg")
          ),
          // PageViewModel(
          //     title: 'Time',
          //     body: "You can save your time and your device's storage",
          //     image: _imageBuid("time.png"),
          // ),
        ],
        onDone: () {
          return _introend();
        },
        onSkip: (){
          return _introend();
        },
        showSkipButton: true,
        showNextButton: true,
        skip:  Text('Skip',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500),),color: Colors.indigoAccent,
        next:  Icon(Icons.arrow_forward,size: 28.sp,),nextColor: Colors.indigo,
        done:  Text('Done', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.sp),),
        curve: Curves.ease,
        dotsDecorator: DotsDecorator(
            size: Size(10.0.sp, 10.0.sp),
            color: Color(0xFF0f0c69),
            activeSize: Size(22.0.sp, 10.0.sp),activeColor: Colors.lightBlueAccent,
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))
        ),
      ),
    );
  }
}

