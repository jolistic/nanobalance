import 'package:flutter/services.dart';
import 'dart:async';
import 'package:async/async.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:js' as js;
import 'package:js/js.dart';
import 'javascript_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(MaterialApp(
      home: NanoBalance(),
    ));

class NanoBalance extends StatefulWidget {
  NanoBalance({Key? key}) : super(key: key);

  @override
  State<NanoBalance> createState() => _NanoBalanceState();
}

class _NanoBalanceState extends State<NanoBalance> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  test(controller) {
    // String balanceNano = await (js.context.callMethod('find', [
    //   'nano_1yb83g9ykz83ewqh65zhckiohaj4am6stub5b4opt7pxfjrzn845khp96d4p'
    // ])).toString();
    // return balanceNano;
    js.context.callMethod('find', [controller]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                // child: Text(
                //   'Peek -X- Nano',
                //   style: GoogleFonts.poppins(
                //     fontSize: 50,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.white,
                //   ),
                // ),
                ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFE3E6EC),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFD1D9E6),
                    spreadRadius: 1,
                    blurRadius: 7.17,
                    offset: Offset(5.38, 5.38),
                  ),
                  BoxShadow(
                    color: Color(0x40FFFFFF),
                    spreadRadius: 1,
                    blurRadius: 7.17,
                    offset: Offset(-5.38, -5.38),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(10.0),
              width: 800.0,
              height: 200.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: FutureBuilder(
                  // future: retrieve(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        (snapshot.data.toString()),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          shadows: [
                            Shadow(
                              color: Color(0x40FFFFFF),
                              offset: const Offset(-5.38, -5.38),
                              blurRadius: 7.17,
                            ),
                            Shadow(
                              color: Color(0xFFD1D9E6),
                              offset: const Offset(5.38, 5.38),
                              blurRadius: 7.17,
                            ),
                          ],
                          fontSize: 100,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
                        child: Text('Peek-X-Nano',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              shadows: [
                                Shadow(
                                  color: Color(0x40FFFFFF),
                                  offset: const Offset(-5.38, -5.38),
                                  blurRadius: 7.17,
                                ),
                                Shadow(
                                  color: Color(0xFFD1D9E6),
                                  offset: const Offset(5.38, 5.38),
                                  blurRadius: 7.17,
                                ),
                              ],
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                      );
                    }
                  },
                ),
                // Text(
                //   '123.456',
                //   textAlign: TextAlign.center,
                //   style: GoogleFonts.poppins(
                //     shadows: [
                //       Shadow(
                //         color: Color(0x40FFFFFF),
                //         offset: const Offset(-5.38, -5.38),
                //         blurRadius: 7.17,
                //       ),
                //       Shadow(
                //         color: Color(0xFFD1D9E6),
                //         offset: const Offset(5.38, 5.38),
                //         blurRadius: 7.17,
                //       ),
                //     ],
                //     fontSize: 100,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.white,
                //   ),
                // ),
              ),
            ),
            SizedBox(height: 20),
            Neumorphic(
              style: NeumorphicStyle(color: Color(0xFFE3E6EC)),
              child: Container(
                width: 500.0,
                child: TextField(
                  controller: _controller,
                  onSubmitted: (_controller) {
                    test(_controller);
                    //value is entered text after ENTER press
                    //you can also call any function here or make setState() to assign value to other variable
                  },
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Enter Nano Address',
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
            ),
          ],
        )),
        backgroundColor: Color(0xFFE3E6EC),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors