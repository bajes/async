import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:login_tsbbar/lecture_test.dart';
import 'package:login_tsbbar/pages/todo_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/langs/',
    apiKeyGoogle: '<Key>', // NOT YET TESTED
  );

  runApp(LocalizedApp(
    child: Directionality(
      textDirection: translator.currentLanguage == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: MaterialApp(
          localizationsDelegates:
              translator.delegates, // Android + iOS Delegates
          locale: translator.locale, // Active locale
          supportedLocales: translator.locals(),
          home: Page1()),
    ),
  ));
}

class BajesResponsive extends StatefulWidget {
  @override
  _BajesResponsiveState createState() => _BajesResponsiveState();
}

class _BajesResponsiveState extends State<BajesResponsive> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    // return orientation == Orientation.portrait
    //     ? Scaffold(
    //         appBar: AppBar(
    //           title: Text('New'),
    //         ),
    //         drawer: Drawer(
    //           child: Column(
    //             children: [
    //               ListTile(
    //                 title: const Text('Home'),
    //                 onTap: () {
    //                   Navigator.of(context).pop();
    //                 },
    //               ),
    //               ListTile(
    //                 title: const Text('Fav'),
    //                 onTap: () {
    //                   Navigator.of(context).pop();
    //                 },
    //               ),
    //               ListTile(
    //                 title: const Text('New'),
    //                 onTap: () {
    //                   Navigator.of(context).pop();
    //                 },
    //               )
    //             ],
    //           ),
    //         ),
    //       )
    //     : Scaffold(
    //         body: Row(
    //           children: [
    //             Expanded(
    //                 flex: 1,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     ListTile(
    //                       title: const Text('Home'),
    //                       onTap: () {
    //                         text = 'Home';
    //                         setState(() {});
    //                       },
    //                     ),
    //                     ListTile(
    //                       title: const Text('Fav'),
    //                       onTap: () {
    //                         text = 'Fav';
    //                         setState(() {});
    //                       },
    //                     ),
    //                     ListTile(
    //                       title: const Text('New'),
    //                       onTap: () {
    //                         text = 'New';
    //                         setState(() {});
    //                       },
    //                     )
    //                   ],
    //                 )),
    //             Expanded(
    //                 flex: 2,
    //                 child: Center(
    //                   child: Container(
    //                     color: Colors.amber,
    //                     child: Text(text),
    //                   ),
    //                 ))
    //           ],
    //         ),
    //       );
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(translator.translate('name')),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              translator.setNewLanguage(
                context,
                newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
                remember: true,
                restart: true,
              );
              //setState(() {});
            },
          )
        ],
      ),
      body: Center(child: Text(translator.translate('name'))),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translator.translate('Page1')),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              translator.setNewLanguage(
                context,
                newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
                remember: true,
                restart: true,
              );
              //setState(() {});
            },
          )
        ],
      ),
      body: Center(
          child: InkWell(
        child: Text(translator.translate('name')),
        onTap: () async {
          String x = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return Page2();
          }));
          print(x);
        },
      )),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(translator.translate('Page2')),
          actions: [
            IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                translator.setNewLanguage(
                  context,
                  newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
                  remember: true,
                  restart: true,
                );
              },
            )
          ],
        ),
        body: Center(
            child: InkWell(
                child: Text(translator.translate('name')),
                onTap: () {
                  Navigator.pop(context, 'Bajes Osama Abu Amona');
                })));
  }
}
