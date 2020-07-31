
import 'package:flutter/material.dart';
import 'dart:convert';


import 'listsRaces.dart';



List<DnDRace> parseJsonRaces(String response) {
  if(response==null){
    return [];
  }
  final parsed =
  json.decode(response.toString())["races"].cast<Map<String, dynamic>>();
  return parsed.map<DnDRace>((json) => new DnDRace.fromJson(json)).toList();
}

class DnDRaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("DnD Races")),
        body: new Container(
          child: new Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child:new FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString('assets/dataClasses.json'),

                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    List<DnDRace> dndRaces =
                    parseJsonRaces(snapshot.data.toString());
                    return !dndRaces.isEmpty
                        ? new DnDRacesList(dndRaces: dndRaces)
                        : new Center(child: new CircularProgressIndicator());
                  }else{
                    return Center(child: new CircularProgressIndicator());
                  }
                }),
          ),
        )
    );
  }
}




