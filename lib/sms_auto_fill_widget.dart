library sms_auto_fill_widget;

import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

// /// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }

class SmsAutoFillWidget extends StatefulWidget {
  @override
  _SmsAutoFillWidgetState createState() => _SmsAutoFillWidgetState();
}

class _SmsAutoFillWidgetState extends State<SmsAutoFillWidget> {
  String _code;
  String signature = "{{ app signature }}";
  int _codeLength = 4;

  @override
  void initState() {
    super.initState();
    _listenOTP();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: PinFieldAutoFill(
        codeLength: _codeLength,
        onCodeChanged: (val) {
          print(val);
        },
      ),
    );
  }

  void setCodeLenght(int length) {
    _codeLength = length;
  }

  void _listenOTP() async {
    await SmsAutoFill().listenForCode;
  }

  void getAppSignature() async {
    await SmsAutoFill().getAppSignature;
  }
}
