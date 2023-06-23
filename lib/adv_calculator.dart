import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'colors.dart';

class AdvCalculator extends StatefulWidget {
  const AdvCalculator({super.key});

  @override
  State<AdvCalculator> createState() => _AdvCalculatorState();
}

class _AdvCalculatorState extends State<AdvCalculator> {
  double firstnum = 0.0;
  double second = 0.0;
  var input = '';
  var output = '';
  var operator = '';
  var hideinput = false;
  //double outputsize = 44;

  onbuttonclick(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      var userinput = input;
      userinput = input.replaceAll('x', '*');
      Parser p = Parser();
      Expression expression = p.parse(userinput);
      ContextModel cm = ContextModel();
      var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalvalue.toString();
      if (output.endsWith('.0')) {
        output = output.substring(0, output.length - 2);
      }

      //hideinput = true;
      //outputsize = 44;
    } else {
      input = input + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  input,
                  style: const TextStyle(fontSize: 44, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  output,
                  style: TextStyle(
                      fontSize: 34, color: Colors.white.withOpacity(0.7)),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          )),
          Row(
            children: [
              buildbutton(
                  text: 'AC',
                  buttonbgcolor: operatorColor,
                  tcolor: orangeColor),
              buildbutton(
                  text: '<', tcolor: orangeColor, buttonbgcolor: operatorColor),
              buildbutton(
                  text: '/', tcolor: orangeColor, buttonbgcolor: operatorColor),
            ],
          ),
          Row(
            children: [
              buildbutton(text: '7'),
              buildbutton(
                text: '8',
              ),
              buildbutton(
                text: '9',
              ),
              buildbutton(
                  text: 'x', tcolor: orangeColor, buttonbgcolor: operatorColor),
            ],
          ),
          Row(
            children: [
              buildbutton(text: '4'),
              buildbutton(
                text: '5',
              ),
              buildbutton(
                text: '6',
              ),
              buildbutton(
                  text: '-', tcolor: orangeColor, buttonbgcolor: operatorColor),
            ],
          ),
          Row(
            children: [
              buildbutton(
                text: '1',
              ),
              buildbutton(text: '2'),
              buildbutton(
                text: '3',
              ),
              buildbutton(
                  text: '+', tcolor: orangeColor, buttonbgcolor: operatorColor),
            ],
          ),
          Row(
            children: [
              buildbutton(
                text: '%',
              ),
              buildbutton(text: '0'),
              buildbutton(
                text: '.',
              ),
              buildbutton(text: '=', buttonbgcolor: orangeColor),
            ],
          )
        ],
      ),
    );
  }

  buildbutton({text, tcolor = Colors.white, buttonbgcolor = buttonColor}) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              backgroundColor: buttonbgcolor,
              padding: const EdgeInsets.all(22)),
          onPressed: () => onbuttonclick(text),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: tcolor),
          )),
    ));
  }
}
