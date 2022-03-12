import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_js/flutter_js.dart';

void main() => runApp(MaterialApp(
      home: NanoBalance(),
    ));

void addFromJs(JavascriptRuntime jsRuntime,
String address) async {
    String balance = await rootBundle.loadString("/assets/getBalance.js");
    final jsResult = jsRuntime.evaluate(balance + """add($nanoAddress)""");
    final jsStringResult = jsResult.stringResult;
return(jsStringResult); //6:48 https://www.youtube.com/watch?v=13v_BwZcCLk
}

class NanoBalance extends StatefulWidget {
  final JavascriptRuntime jsRuntime = getJavascriptRuntime();
  NanoBalance({Key? key}) : super(key: key);

  @override
  State<NanoBalance> createState() => _NanoBalanceState();
}

class _NanoBalanceState extends State<NanoBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 50),
          Text(
            'Peek -X- Nano',
            style: GoogleFonts.poppins(
              fontSize: 100,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 50),
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
              child: Text(
                '123.456',
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
              ),
            ),
          ),
          SizedBox(height: 20),
          Neumorphic(
            style: NeumorphicStyle(
              color: Color(0xFFE3E6EC)
            ),
            child: Container(
            width: 500.0,
            child: TextField(
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: 'Enter Nano Address',
                border: InputBorder.none,
                hintStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                )
              ),
            ),
          ),
          ),
          
        ],
      )),
      backgroundColor: Color(0xFFE3E6EC),
    );
  }
}

// ignore_for_file: prefer_const_constructors