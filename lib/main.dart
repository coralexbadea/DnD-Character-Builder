
import 'package:flutter/material.dart';
import 'package:play_ground/myCharacter.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:play_ground/listClasses.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCharacter(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,//no debug mode
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          buttonColor: Colors.deepPurple,
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'DnD Classes'),
      ),
    );
  }
}


List<DnDClass> parseJsonClasses(String response) {
  if(response==null){
    return [];
  }
  final parsed =
  json.decode(response.toString())["classes"].cast<Map<String, dynamic>>();
  return parsed.map<DnDClass>((json) => new DnDClass.fromJson(json)).toList();
}


class MyHomePage extends StatelessWidget {
  MyHomePage({this.title}) ;
  final String title;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: new Container(
          child: new Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString('assets/dataClasses.json'),
                //https://flutter.dev/docs/cookbook/networking/background-parsing
                builder: (context, snapshot) {

                  if(snapshot.hasData){
                   // print("here"+snapshot.data.toString());
                    List<DnDClass> dndClasses =
                    parseJsonClasses(snapshot.data.toString());
                    return DnDClassesList(dndClasses: dndClasses);

                 }else {
                    return Center(child: new CircularProgressIndicator());
                  }
                }),
          ),
        )
    );
  }
}




