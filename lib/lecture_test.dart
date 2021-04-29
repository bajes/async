import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

enum Gender { male, female }

class LectureTest extends StatefulWidget {
  @override
  _LectureTestState createState() => _LectureTestState();
}

class _LectureTestState extends State<LectureTest> {
  Gender gender = Gender.male;
  String userName;
  String email;
  bool isPhd = false;
  bool isMaster = false;
  bool isBa = false;
  List<String> certifications = [];
  String result;
  String getCertifications() {
    String certifications = '';
    if (this.certifications.isEmpty) {
      return null;
    } else {
      this.certifications.forEach((element) {
        certifications += '$element ';
      });
      return certifications;
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();
  void saveForm() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    }
    if (this.certifications.isEmpty) {
      openDialoug('text', 'text1', context);
    } else {
      formKey.currentState.context;
    }
  }

  void openDialoug(String title, String message, BuildContext context) {
    showOkCancelAlertDialog(
      context: context,
      title: title,
      message: message,
    );
    // showDialog<AlertDialog>(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text(title),
    //         content: Text(message),
    //         actions: [
    //           TextButton(
    //               onPressed: () {
    //                 Navigator.of(context).pop();
    //               },
    //               child: Text('ok'))
    //         ],
    //       );
    //     });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                validator: (value) {
                  if (value.length == 0) {
                    return 'required field';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  userName = value;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'UserName'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                validator: (value) {
                  if (value.length == 0) {
                    return 'required field';
                  } else if (!isEmail(value)) {
                    return 'InCorrect Email Syntax';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Email'),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text('Gender')),
                      Row(
                        children: [
                          Radio(
                              value: Gender.male,
                              groupValue: gender,
                              onChanged: (Gender value) {
                                this.gender = value;
                                setState(() {});
                              }),
                          Text('Male')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: Gender.female,
                              groupValue: gender,
                              onChanged: (Gender value) {
                                this.gender = value;
                                setState(() {});
                              }),
                          Text('Female')
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Certifications'),
                    Row(
                      children: [
                        Checkbox(
                            value: isPhd,
                            onChanged: (value) {
                              this.isPhd = value;
                              setState(() {});
                              if (value) {
                                certifications.add('PHD');
                              } else {
                                certifications.remove('PHD');
                              }
                            }),
                        Text('PHD')
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isMaster,
                            onChanged: (value) {
                              isMaster = value;
                              setState(() {});
                              if (value) {
                                certifications.add('MASTER');
                              } else {
                                certifications.remove('MASTER');
                              }
                            }),
                        Text('Master')
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isBa,
                            onChanged: (value) {
                              isBa = value;

                              setState(() {});
                              if (value) {
                                certifications.add('BA');
                              } else {
                                certifications.remove('BA');
                              }
                            }),
                        Text('BA')
                      ],
                    )
                  ],
                ))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  saveForm();
                  // result = this.certifications.isEmpty
                  //     ? 'you have to select one certifications at least'
                  //     : '''
                  // UserName: ${this.userName}
                  // Email: ${this.email}
                  // Gender: ${this.gender == Gender.male ? "Male" : "Female"}
                  // Certifications: ${getCertifications()}
                  // ''';
                  // setState(() {});
                },
                child: Text('SUBMIT')),
            result == null ? Container() : Text(result)
          ],
        ),
      ),
    );
  }
}
