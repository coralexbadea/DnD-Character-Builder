

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:play_ground/sheet.dart';
import 'package:provider/provider.dart';

import 'myCharacter.dart';

class DnDRace {
  const DnDRace({this.imageURL, this.name, this.description, this.traits, this.iconURL});

  final String imageURL;
  final String name;
  final String description;
  final String traits;
  final String iconURL;
  

  factory DnDRace.fromJson(Map<String, dynamic> json){
    return new DnDRace(
        imageURL: json["imageURL"] as String,
        name: json['name'] as String,
        description: json["description"] as String,
        traits: json["traits"] as String,
        iconURL: json["iconURL"] as String
    );
  }
}

class DnDRacesList extends StatelessWidget {
  final List<DnDRace> dndRaces;

  DnDRacesList({Key key, this.dndRaces}): super(key: key);


  Widget _dialogueBuilder(BuildContext context, DnDRace dndRace) {
    final myCharacter = Provider.of<MyCharacter>(context, listen: false);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.network(dndRace.imageURL,
          fit: BoxFit.fill,),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(dndRace.name, style: Theme.of(context).textTheme.headline6,),
              SizedBox(height: 10,),
              Text(dndRace.description, style: Theme.of(context).textTheme.subtitle2.copyWith(fontStyle: FontStyle.italic)),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    children: [
                      Text("Racial Traits: ", style: TextStyle(fontWeight: FontWeight.w600),),
                      //Text(dndRace.traits),
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
                    myCharacter.stateManagementRace = dndRace;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CharacterSheet())
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
                builder: (context) => _dialogueBuilder(context, dndRaces.elementAt(index))),
        child:
        Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            margin: EdgeInsets.only(left: 10),
            child: Row(
                children: <Widget>[
                  Image.network(dndRaces.elementAt(index).iconURL),
                  SizedBox(width: 10,),
                  Text(dndRaces.elementAt(index).name,
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
      itemCount: dndRaces.length,
      itemExtent: 60.0,
    );
  }
}
