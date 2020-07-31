


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:play_ground/myCharacter.dart';
import 'package:play_ground/racesRoute.dart';
import 'package:provider/provider.dart';


class DnDClass {
  const DnDClass({this.name, this.description, this.hitDie, this.primaryAbility, this.saves, this.imageURL, this.iconURL});
  final String imageURL;
  final String name;
  final String description;
  final String hitDie;
  final String primaryAbility;
  final String saves;
  final String iconURL;

  factory DnDClass.fromJson(Map<String, dynamic> json){
    return new DnDClass(
        imageURL: json["imageURL"] as String,
        name: json['name'] as String,
        description: json["description"] as String,
        hitDie: json["hitDie"] as String,
        primaryAbility: json["primaryAbility"] as String,
        saves: json["saves"] as String,
        iconURL: json["iconURL"] as String
    );
  }
}


class DnDClassesList extends StatelessWidget {
  final List<DnDClass> dndClasses;

  DnDClassesList({Key key, this.dndClasses}): super(key: key);


  Widget _dialogueBuilder(BuildContext context, DnDClass dndClass) {
    final myCharacter = Provider.of<MyCharacter>(context, listen: false);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.network(dndClass.imageURL,
          fit: BoxFit.fill,),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(dndClass.name, style: Theme.of(context).textTheme.headline6,),
              SizedBox(height: 10,),
              Text(dndClass.description, style: Theme.of(context).textTheme.subtitle2.copyWith(fontStyle: FontStyle.italic)),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text("Hit Die: ", style: TextStyle(fontWeight: FontWeight.w600),),
                      Text(dndClass.hitDie),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Primary Ability: ", style: TextStyle(fontWeight: FontWeight.w600),),
                      Text(dndClass.primaryAbility),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Saves: ", style: TextStyle(fontWeight: FontWeight.w600),),
                      Text(dndClass.saves),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("BACK"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      myCharacter.stateManagementClass = dndClass;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DnDRaces()),
                      );
                    },
                    child: const Text("CHOOSE"),
                  )
                ],),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () =>
          showDialog(context: context,
              builder: (context) => _dialogueBuilder(context, dndClasses.elementAt(index))),
      child:
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: <Widget>[
                Image.network(dndClasses.elementAt(index).iconURL),
                SizedBox(width: 10,),
                Text(dndClasses.elementAt(index).name,
                style: Theme.of(context).textTheme.headline4,),
                SizedBox(width: 100,)
              ]
            )
          )


    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: _listItemBuilder,
        itemCount: dndClasses.length,
        itemExtent: 60.0,
    );
  }
}
