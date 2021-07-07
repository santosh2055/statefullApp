import 'package:flutter/material.dart';

import 'constant.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController firstinterger = TextEditingController();
  final TextEditingController secondtinterger = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  var _result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Statefull App'),
        ),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Result :$_result',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? "Enter First  Number" : null,
                  controller: firstinterger,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'First Number'),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? "Enter  Second number" : null,
                  controller: secondtinterger,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Second Number'),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.cyan)),
                        onPressed: () {
                          setState(() {
                            if (_formkey.currentState!.validate()) {
                              double a = double.parse(firstinterger.text);
                              double b = double.parse(secondtinterger.text);
                              var sum = a + b;
                              _result = "The sum is " + sum.toString();
                            }
                          });
                        },
                        child: Text('Addition'),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_formkey.currentState!.validate()) {
                                double a = double.parse(firstinterger.text);
                                double b = double.parse(secondtinterger.text);
                                var sub = a - b;
                                _result =
                                    "The Subtraction is " + sub.toString();
                              }
                            });
                          },
                          child: Text('Subtraction')),
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green)),
                          onPressed: () {
                            setState(() {
                              if (_formkey.currentState!.validate()) {
                                double a = double.parse(firstinterger.text);
                                double b = double.parse(secondtinterger.text);
                                var mul = a * b;
                                _result =
                                    "The Multiplication is " + mul.toString();
                              }
                            });
                          },
                          child: Text('Multiplication')),
                    )
                  ],
                ),
                SizedBox(height: 50),
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueGrey)),
                      onPressed: () {
                        setState(() {
                          _result = '';
                          firstinterger.text = '';
                          secondtinterger.text = '';
                        });
                      },
                      child: Text(
                        'Clear',
                        style: TextStyle(fontSize: 20),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
