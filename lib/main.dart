import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (ctx, child) {
        ScreenUtil.init(ctx);
        return Theme(data: ThemeData(), child: MyHomePage());
      },
      title: 'Flutter Demo',
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body());
  }

  Widget body() {
    return CustomPaint(
      child: Container(
        padding: EdgeInsets.only(right: 30.w),
        child: LoginForm(),
      ),
      painter: CustomShape(),
    );
  }
}

class CustomShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ///////////////////////////Bottom////////////////////////////////
    Paint paint0 = Paint()
      ..color = const Color(0xff3FB8FD)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint0.shader = ui.Gradient.radial(
        Offset(size.width * 0.16, size.height * 1.05),
        size.width * 2.53,
        [Color(0xff1ADEF6), Color(0xff3FB8FD)],
        [0.00, 1.00]);

    Path path0 = Path();
    path0.moveTo(size.width, size.height * 0.5813333);
    path0.cubicTo(
        size.width * 0.9050000,
        size.height * 1.0460000,
        size.width * 0.2770000,
        size.height * 0.9286667,
        size.width * 0.1640000,
        size.height);
    path0.quadraticBezierTo(
        size.width * 0.3717500, size.height, size.width, size.height);
    path0.quadraticBezierTo(size.width * 1.0122500, size.height * 0.7846667,
        size.width, size.height * 0.5813333);
    path0.close();
    //////////////////////////////Top////////////////////////////////////////////////

    Paint paint1 = Paint()
      ..color = const Color(0xffF2685E)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    paint1.shader = ui.Gradient.radial(
        Offset(size.width * 0.16, size.height * 1.05),
        size.width * 2.53,
        [Color(0xffF2685E), Color(0xffF7955C)],
        [0.00, 1.00]);

    Path path1 = Path();
    path1.moveTo(size.width, 0);
    path1.quadraticBezierTo(size.width * 0.2500000, 0, 0, 0);
    path1.quadraticBezierTo(
        0, size.height * 0.2750000, 0, size.height * 0.3666667);
    path1.cubicTo(size.width * 0.3420000, size.height * -0.0503333,
        size.width * 0.9860000, size.height * 0.1390000, size.width, 0);
    path1.close();

    canvas.drawPath(path0, paint0);
    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Circle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Color(0xff20D2BA);
    paint.style = PaintingStyle.fill;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.shader = ui.Gradient.radial(
        Offset(size.width * 0.16, size.height * 1.05),
        size.width * 2.53,
        [Color(0xff20D2BA), Color(0xff22DEAE)],
        [0.00, 1.00]);

    Offset offset = Offset(size.width * .5, size.height * .5);
    canvas.drawCircle(offset, 30.w, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Login",
          style: TextStyle(
              color: Colors.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 60,
        ),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 12.w, top: 20.h, right: 12.w, bottom: 20.h),
              margin: EdgeInsets.only(right: 20.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffE1E1E1),
                      blurRadius: 10,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.w),
                    bottomRight: Radius.circular(50.w),
                  )),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/user.png",
                          width: 20.w,
                          height: 20.w,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'UserName',
                            ),
                          ),
                        )                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/user.png",
                          width: 20.w,
                          height: 20.w,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '*********',
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomPaint(
              painter: Circle(),
              child: Container(
                width: 50.w,
                height: 50.w,
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Image.asset(
                    "assets/arrow.png",
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Align(
            alignment: Alignment.topRight,
            child: Text(
              "Forget?",
              style: TextStyle(
                  color: Color(0xffBCBCBC),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Register",
                style: TextStyle(
                    color: Color(0xffF1D8BF),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              )),
        )
      ],
    );
  }
}
