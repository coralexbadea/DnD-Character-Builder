import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:provider/provider.dart';

import 'myCharacter.dart';

class CharacterSheet extends StatefulWidget {
  @override
  _CharacterSheetState createState() => _CharacterSheetState();
}

class _CharacterSheetState extends State<CharacterSheet> {


  TextEditingController _inventory ;
  TextEditingController _name ;
  TextEditingController _str ;
  TextEditingController _dex ;
  TextEditingController _const ;
  TextEditingController _int ;
  TextEditingController _wis ;
  TextEditingController _cha ;

  bool strSwitch = false;
  bool dexSwitch = false;
  bool constSwitch = false;
  bool intSwitch = false;
  bool wisSwitch = false;
  bool chaSwitch = false;

  bool acrSwitch = false;
  bool ahSwitch = false;
  bool arcSwitch = false;
  bool athSwitch = false;
  bool decSwitch = false;
  bool hisSwitch = false;
  bool insSwitch = false;
  bool intiSwitch = false;
  bool invSwitch = false;
  bool medSwitch = false;
  bool natSwitch = false;
  bool perceSwitch = false;
  bool perfSwitch = false;
  bool persSwitch = false;
  bool relSwitch = false;
  bool sohSwitch = false;
  bool steSwitch = false;
  bool surSwitch = false;

  int strModifier = 0;
  int dexModifier = 0;
  int chaModifier = 0;
  int wisModifier = 0;
  int intModifier = 0;
  int constModifier = 0;
  int proficiency = 2;

  List<String> switches;

  TextEditingController level;
  TextEditingController exp;
  TextEditingController inspiration;
  TextEditingController prof;
  TextEditingController armor;
  TextEditingController initiative;
  TextEditingController speed;
  TextEditingController hp;
  TextEditingController temphp;
  TextEditingController traits;
  TextEditingController ideals;
  TextEditingController bonds;
  TextEditingController flaws;
  TextEditingController abilities;
  TextEditingController cp;
  TextEditingController sp;
  TextEditingController ep;
  TextEditingController gp;
  TextEditingController pp;
  TextEditingController equipment;
  TextEditingController perception;
  TextEditingController others;



  File jsonFile;
  Directory dir;
  String fileName = "myFile.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;

  int failureGroup = 1;
  int successGroup = 1;
  @override
  void dispose() {
    _name.dispose();
    _inventory.dispose();
    _str.dispose();
    _dex.dispose();
    _cha.dispose();
    _const.dispose();
    _int.dispose();
    _wis.dispose();
    super.dispose();
  }
  void _changeModifiers() {
    setState(() {
      strModifier = ((int.parse(_str.text)-10)/2).ceil();
      dexModifier = ((int.parse(_dex.text)-10)/2).ceil();
      intModifier = ((int.parse(_int.text)-10)/2).ceil();
      chaModifier = ((int.parse(_cha.text)-10)/2).ceil();
      wisModifier = ((int.parse(_wis.text)-10)/2).ceil();
      constModifier = ((int.parse(_const.text)-10)/2).ceil();
    });
  }
  @override
  void initState()  {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;

      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) {
        fileExists = true;
        this.setState(() {
          fileContent = json.decode(jsonFile.readAsStringSync());
        _name = TextEditingController(text: fileContent['name']);
        _inventory = TextEditingController(text: fileContent['inventory']);
        _str = TextEditingController(text: fileContent['str']);
        _dex = TextEditingController(text: fileContent['dex']);
        _const = TextEditingController(text: fileContent['const']);
        _wis = TextEditingController(text: fileContent['wis']);
        _int = TextEditingController(text: fileContent['int']);
        _cha = TextEditingController(text: fileContent['cha']);
          level= TextEditingController(text: fileContent['level']);
          exp= TextEditingController(text: fileContent['exp']);
          inspiration= TextEditingController(text: fileContent['inspiration']);
          prof= TextEditingController(text: fileContent['prof']);
          armor= TextEditingController(text: fileContent['armor']);
          initiative= TextEditingController(text: fileContent['initiative']);
          speed= TextEditingController(text: fileContent['speed']);
          hp= TextEditingController(text: fileContent['hp']);
          temphp= TextEditingController(text: fileContent['temphp']);
          traits= TextEditingController(text: fileContent['traits']);
          ideals= TextEditingController(text: fileContent['ideals']);
          bonds= TextEditingController(text: fileContent['bonds']);
          flaws= TextEditingController(text: fileContent['flaws']);
          abilities= TextEditingController(text: fileContent['abilities']);
          cp= TextEditingController(text: fileContent['cp']);
          sp= TextEditingController(text: fileContent['sp']);
          ep= TextEditingController(text: fileContent['ep']);
          gp= TextEditingController(text: fileContent['gp']);
          pp= TextEditingController(text: fileContent['pp']);
          equipment= TextEditingController(text: fileContent['equipment']);
          perception= TextEditingController(text: fileContent['perception']);
          others= TextEditingController(text: fileContent['others']);


        switches = List.from(fileContent["switches"]);

        strSwitch = switches[0] == "0" ? false :true;
        dexSwitch = switches[1]== "0" ? false :true;
        constSwitch = switches[2]== "0" ? false :true;
        intSwitch = switches[3]== "0" ? false :true;
        wisSwitch = switches[4]== "0" ? false :true;
        chaSwitch = switches[5]== "0" ? false :true;
        acrSwitch = switches[6]== "0" ? false :true;
        ahSwitch = switches[7]== "0" ? false :true;
        arcSwitch =switches[8]== "0" ? false :true;
        athSwitch =switches[9]== "0" ? false :true;
        decSwitch =switches[10]== "0" ? false :true;
        hisSwitch =switches[11]== "0" ? false :true;
        insSwitch =switches[12]== "0" ? false :true;
        intiSwitch  = switches[13]== "0" ? false :true;
        invSwitch =switches[14]== "0" ? false :true;
        medSwitch =switches[15]== "0" ? false :true;
        natSwitch =switches[16]== "0" ? false :true;
        perceSwitch =switches[17]== "0" ? false :true;
        perfSwitch =switches[18]== "0" ? false :true;
        persSwitch =switches[19]== "0" ? false :true;
        relSwitch =switches[20]== "0" ? false :true;
        sohSwitch =switches[21]== "0" ? false :true;
        steSwitch =switches[22]== "0" ? false :true;
        surSwitch = switches[23]== "0" ? false :true;
        proficiency = int.parse(fileContent["prof"]);
        _changeModifiers();
      });

      }
      else{
        _name = TextEditingController();
        _str = TextEditingController();
        _dex = TextEditingController();
        _const = TextEditingController();
        _int = TextEditingController();
        _wis = TextEditingController();
        _cha = TextEditingController();
        _inventory = TextEditingController();
        level = TextEditingController();
        exp = TextEditingController();
        inspiration = TextEditingController();
        prof = TextEditingController();
        armor = TextEditingController();
        initiative = TextEditingController();
        speed = TextEditingController();
        hp = TextEditingController();
        temphp = TextEditingController();
        traits = TextEditingController();
        ideals = TextEditingController();
        bonds = TextEditingController();
        flaws = TextEditingController();
        abilities = TextEditingController();
        cp = TextEditingController();
        sp = TextEditingController();
        ep = TextEditingController();
        gp = TextEditingController();
        pp = TextEditingController();
        equipment = TextEditingController();
        perception = TextEditingController();
        others = TextEditingController();
        Map<String, dynamic> content = {"name": "Name", "inventory": "", "str": "0",
        "dex": "0", "const": "0", "int": "0", "wis": "0", "cha": "0",
          "switches": ["0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0"],
          "level": "1", "exp" : "0" , "inspiration" : "0","prof" : "2","armor" : "0","initiative" : "0",
          "temphp" : "0","hp" : "0","speed" : "0", "cp" : "0","sp" : "0","ep" : "0","gp" : "0","pp" : "0","perception" : "0",
          "traits" : "traits", "ideals" : "ideals", "bonds" : "bonds","flaws" : "flaws","abilities" : "abilities","equipment" : "equip","others" : "others"

        };

        createFile(content, dir, fileName);



      }

      _name.addListener(_printNameValue);
      _str.addListener(_printStrValue);
      _dex.addListener(_printDexValue);
      _const.addListener(_printConstValue);
      _int.addListener(_printIntValue);
      _wis.addListener(_printWisValue);
      _cha.addListener(_printChaValue);
      _inventory.addListener(_printInventoryValue);
      level.addListener(_printLevelValue);
      exp.addListener(_printExpValue);
      inspiration.addListener(_printInspirationValue);
      prof.addListener(_printProfValue);
      armor.addListener(_printArmorValue);
      initiative.addListener(_printInitiativeValue);
      speed.addListener(_printSpeedValue);
      hp.addListener(_printHpValue);
      temphp.addListener(_printTemphpValue);
      traits.addListener(_printTraitsValue);
      ideals.addListener(_printIdealsValue);
      bonds.addListener(_printBondsValue);
      flaws.addListener(_printFlawsValue);
      abilities.addListener(_printAbilitiesValue);
      cp.addListener(_printCpValue);
      sp.addListener(_printSpValue);
      ep.addListener(_printEpValue);
      gp.addListener(_printGpValue);
      pp.addListener(_printPpValue);
      equipment.addListener(_printEquipmentValue);
      perception.addListener(_printPerceptionValue);
      others.addListener(_printOthersValue);

    });

  }

  void createFile(Map<String, dynamic> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = new File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }


  void writeToFile(String key, dynamic value) {
    print("Writing to file!");
    _changeModifiers();
    Map<String, dynamic> content = {key: value};
    if (fileExists) {
      print("File exists");
      Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    }
//    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
//    print(fileContent);
  }


  _printInventoryValue() {
    writeToFile("inventory", _inventory.text);
  }

  _printNameValue() {
    writeToFile("name", _name.text);
  }
  _printStrValue() {
    writeToFile("str", _str.text);
  }
  _printDexValue() {
    writeToFile("dex", _dex.text);
  }
  _printConstValue() {
    writeToFile("const", _const.text);
  }
  _printIntValue() {
    writeToFile("int", _int.text);
  }
  _printWisValue() {
    writeToFile("wis", _wis.text);
  }
  _printChaValue() {
    writeToFile("cha", _cha.text);
  }
  _printLevelValue() {
    writeToFile("level", level.text);
  }
  _printExpValue() {
    writeToFile("exp", exp.text);
  }
  _printInspirationValue() {
    writeToFile("inspiration", inspiration.text);
  }
  _printProfValue() {
    writeToFile("prof", prof.text);
  }
  _printArmorValue() {
    writeToFile("armor", armor.text);
  }
  _printInitiativeValue() {
    writeToFile("initiative", initiative.text);
  }
  _printSpeedValue() {
    writeToFile("speed", speed.text);
  }
  _printHpValue() {
    writeToFile("hp", hp.text);
  }
  _printTemphpValue() {
    writeToFile("temphp", temphp.text);
  }
  _printTraitsValue() {
    writeToFile("traits", traits.text);
  }
  _printIdealsValue() {
    writeToFile("ideals", ideals.text);
  }
  _printBondsValue() {
    writeToFile("bonds", bonds.text);
  }
  _printFlawsValue() {
    writeToFile("flaws", flaws.text);
  }
  _printAbilitiesValue() {
    writeToFile("abilities", abilities.text);
  }
  _printCpValue() {
    writeToFile("cp", cp.text);
  }
  _printSpValue() {
    writeToFile("sp", sp.text);
  }
  _printEpValue() {
    writeToFile("ep", ep.text);
  }
  _printGpValue() {
    writeToFile("gp", gp.text);
  }
  _printPpValue() {
    writeToFile("pp", pp.text);
  }
  _printEquipmentValue() {
    writeToFile("equimpment", equipment.text);
  }
  _printPerceptionValue() {
    writeToFile("perception", perception.text);
  }
  _printOthersValue() {
    writeToFile("others", others.text);
  }


//  double resizeTop(int initial) {
//    return (initial * MediaQuery.of(context).size.height)/683.43;
//  }
//
//  double resizeLeft(int initial) {
//    return (initial * MediaQuery.of(context).size.width)/411.43;
//  }
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Character Sheet"),),
      body: Container(
        width: 411.43,
        height: 683.43,
        child: ZoomableWidget(
          child: Consumer<MyCharacter>(
            builder: (context, myCharacter, child) => Stack(
              children: <Widget>[
                  Image(
                      image: AssetImage('assets/sheet.jpg',),
                      fit: BoxFit.fitWidth),


                Container(
                  padding: const EdgeInsets.only(top:40.0),
                  margin: const EdgeInsets.only(left: 40.0),
                  width: 120,
                  child: TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                        border: InputBorder.none

                  ),
                ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:245.0),
                  margin: const EdgeInsets.only(left: 275.0),
                  width: 120,
                  child: TextFormField(
                    controller: _inventory,
                    style: TextStyle(fontSize: 8.0),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:220.0),
                  margin: const EdgeInsets.only(left: 170.0),
                  width: 50,
                  child: Text("${myCharacter.stateManagementClass.hitDie}")
                ),
                Container(
                  padding: const EdgeInsets.only(top:90.0),
                  margin: const EdgeInsets.only(left: 30.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: _str,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:138.0),
                  margin: const EdgeInsets.only(left: 30.0),
                  width: 20,

                  child: TextFormField(

                    controller: _dex,
                    decoration: InputDecoration(
                        border: InputBorder.none

                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:186.0),
                  margin: const EdgeInsets.only(left: 30.0),
                  width: 20,

                  child: TextFormField(

                    controller: _const,
                    decoration: InputDecoration(
                        border: InputBorder.none

                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:234.0),
                  margin: const EdgeInsets.only(left: 30.0),
                  width: 20,

                  child: TextFormField(

                    controller: _int,
                    decoration: InputDecoration(
                        border: InputBorder.none

                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:282.0),
                  margin: const EdgeInsets.only(left: 30.0),
                  width: 20,

                  child: TextFormField(

                    controller: _wis,
                    decoration: InputDecoration(
                        border: InputBorder.none

                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:330.0),
                  margin: const EdgeInsets.only(left: 30.0),
                  width: 20,

                  child: TextFormField(

                    controller: _cha,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top:118.0),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                       child: Switch(
                         value: strSwitch,
                         onChanged: (newVal) {
                           print(newVal);

                           setState(() {

                              strSwitch = newVal;
                              switches[0] = newVal == false ? "0" : "1";
                              writeToFile("switches",switches);

                           });
                         },
                       )
                      ),

                  ),

                Container(
                  padding: const EdgeInsets.only(top:135.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(strSwitch ? "${strModifier+proficiency}" : "${strModifier}",
                    style: TextStyle(fontSize: 8),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:127.0),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: dexSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {

                            dexSwitch = newVal;

                            switches[1] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);

                          });
                        },
                      )
                  ),

                ),

                Container(
                  padding: const EdgeInsets.only(top:144.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(dexSwitch ? "${dexModifier+proficiency}" : "${dexModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:136.0),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: constSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            constSwitch = newVal;
                            switches[2] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                          });
                        },
                      )
                  ),

                ),

                Container(
                  padding: const EdgeInsets.only(top:153.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(constSwitch ? "${constModifier+proficiency}" : "${constModifier}",
                    style: TextStyle(fontSize: 10),),
                ),
                Container(
                  padding: const EdgeInsets.only(top:145.0),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: intSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[3] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            intSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),

                Container(
                  padding: const EdgeInsets.only(top:162.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(intSwitch ? "${intModifier+proficiency}" : "${intModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:154.0),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: wisSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[4] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            wisSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),

                Container(
                  padding: const EdgeInsets.only(top:171.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(wisSwitch ? "${wisModifier+proficiency}" : "${wisModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:163.0),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: chaSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[5] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            chaSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),

                Container(
                  padding: const EdgeInsets.only(top:180.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(chaSwitch ? "${chaModifier+proficiency}" : "${chaModifier}",
                    style: TextStyle(fontSize: 10),),
                ),


                /////=============acrobatics etc ===================/////////
                Container(
                  padding: const EdgeInsets.only(top:195.5),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: acrSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[6] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            acrSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),

                Container(
                  padding: const EdgeInsets.only(top:213.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(acrSwitch ? "${dexModifier+proficiency}" : "${dexModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:204.5),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: ahSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[7] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            ahSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:222.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(ahSwitch ? "${wisModifier+proficiency}" : "${wisModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:213.5),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: arcSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[8] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            arcSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:231.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(arcSwitch ? "${intModifier+proficiency}" : "${intModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:222.5),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: athSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {

                            switches[9] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            athSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:240.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(athSwitch ? "${strModifier+proficiency}" : "${strModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:231.5),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: decSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[10] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            decSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:249.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(decSwitch ? "${chaModifier+proficiency}" : "${chaModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:240.5),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: hisSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[11] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            hisSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:258.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(hisSwitch ? "${intModifier+proficiency}" : "${intModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:249.5),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: insSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[12] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            insSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:267.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(insSwitch ? "${wisModifier+proficiency}" : "${wisModifier}",
                    style: TextStyle(fontSize: 10),),
                ),


                Container(
                  padding: const EdgeInsets.only(top:258.5),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: intiSwitch,
                        onChanged: (newVal) {
                          print(newVal);
                          switches[13] = newVal == false ? "0" : "1";
                          writeToFile("switches",switches);
                          setState(() {

                            intiSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:276.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(intiSwitch ? "${chaModifier+proficiency}" : "${chaModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:267.7),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: invSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[14] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            invSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:285.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(invSwitch ? "${intModifier+proficiency}" : "${intModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:276.7),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: medSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[15] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            medSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:294.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(medSwitch ? "${wisModifier+proficiency}" : "${wisModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:285.8),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: natSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[16] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            natSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:303.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(natSwitch ? "${intModifier+proficiency}" : "${intModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:294.8),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: perceSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[17] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            perceSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:312.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(perceSwitch ? "${wisModifier+proficiency}" : "${wisModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:303.8),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: perfSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[18] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            perfSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:321.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(perfSwitch ? "${chaModifier+proficiency}" : "${chaModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:312.8),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: persSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[19] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            persSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:330.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(persSwitch ? "${chaModifier+proficiency}" : "${chaModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:322),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: relSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[20] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            relSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:340.5),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(relSwitch ? "${intModifier+proficiency}" : "${intModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:331),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: sohSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[21] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            sohSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:349.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(sohSwitch ? "${dexModifier+proficiency}" : "${dexModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:340.5),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: steSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[22] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            steSwitch= newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:358.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(steSwitch ? "${dexModifier+proficiency}" : "${dexModifier}",
                    style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:349.5),
                  margin: const EdgeInsets.only(left: 39.0),

                  child: Transform.scale(
                      scale: 0.2,
                      child: Switch(
                        value: surSwitch,
                        onChanged: (newVal) {
                          print(newVal);

                          setState(() {
                            switches[23] = newVal == false ? "0" : "1";
                            writeToFile("switches",switches);
                            surSwitch = newVal;
                          });
                        },
                      )
                  ),

                ),
                Container(
                  padding: const EdgeInsets.only(top:367.0),
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(surSwitch ? "${wisModifier+proficiency}" : "${wisModifier}",
                    style: TextStyle(fontSize: 10),),
                ),



                Container(
                  padding: const EdgeInsets.only(top:125),
                  margin: const EdgeInsets.only(left: 35.0),
                  child: Text("${strModifier}", style: TextStyle(fontSize: 10),),
                ),
                Container(
                  padding: const EdgeInsets.only(top:173),
                  margin: const EdgeInsets.only(left: 35.0),
                  child: Text("${dexModifier}", style: TextStyle(fontSize: 10),),
                ),
                Container(
                  padding: const EdgeInsets.only(top:222),
                  margin: const EdgeInsets.only(left: 35.0),
                  child: Text("${constModifier}", style: TextStyle(fontSize: 10),),
                ),
                Container(
                  padding: const EdgeInsets.only(top:270),
                  margin: const EdgeInsets.only(left: 35.0),
                  child: Text("${intModifier}", style: TextStyle(fontSize: 10),),
                ),
                Container(
                  padding: const EdgeInsets.only(top:318),
                  margin: const EdgeInsets.only(left: 35.0),
                  child: Text("${wisModifier}", style: TextStyle(fontSize: 10),),
                ),Container(
                  padding: const EdgeInsets.only(top:366),
                  margin: const EdgeInsets.only(left: 35.0),
                  child: Text("${chaModifier}", style: TextStyle(fontSize: 10),),
                ),

                Container(
                  padding: const EdgeInsets.only(top:15.0),
                  margin: const EdgeInsets.only(left: 210.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: level,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:100.0),
                  margin: const EdgeInsets.only(left: 200.0),
                  child: ColoredBox(
                    color: Color.fromARGB(50, 255, 255, 255),
                  ),
                  width: 100,
                  height: 40,
                ),
                Container(
                    padding: const EdgeInsets.only(top:30.0),
                    margin: const EdgeInsets.only(left: 140.0),
                    width: 50,
                    child: Text("${myCharacter.stateManagementClass.name}")
                ),
                Container(
                    padding: const EdgeInsets.only(top:50.0),
                    margin: const EdgeInsets.only(left: 140.0),
                    width: 70,
                    child: Text("${myCharacter.stateManagementRace.name}")
                ),
                Container(
                  padding: const EdgeInsets.only(top:33.0),
                  margin: const EdgeInsets.only(left: 278.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: exp,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top:70.0),
                  margin: const EdgeInsets.only(left: 67.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: inspiration,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:93.0),
                  margin: const EdgeInsets.only(left: 67.5),
                  width: 20,

                  child: TextField(

                    autofocus: false,
                    controller: prof,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:82.0),
                  margin: const EdgeInsets.only(left: 162.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: armor,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:82.0),
                  margin: const EdgeInsets.only(left: 200.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: initiative,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:82.0),
                  margin: const EdgeInsets.only(left: 238.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: speed,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:130.0),
                  margin: const EdgeInsets.only(left: 200.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: hp,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:165.0),
                  margin: const EdgeInsets.only(left: 200.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: temphp,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:82.0),
                  margin: const EdgeInsets.only(left: 285.0),
                  width: 100,

                  child: TextField(
                    autofocus: false,
                    controller: traits,
                    style: TextStyle(fontSize: 8.0),
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),

                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:127.0),
                  margin: const EdgeInsets.only(left: 285.0),
                  width: 100,

                  child: TextField(
                    autofocus: false,
                    controller: ideals ,
                    style: TextStyle(fontSize: 8.0),
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),

                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:163.0),
                  margin: const EdgeInsets.only(left: 285.0),
                  width: 100,

                  child: TextField(
                    autofocus: false,
                    controller: bonds ,
                    style: TextStyle(fontSize: 8.0),
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),

                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:204.0),
                  margin: const EdgeInsets.only(left: 285.0),
                  width: 100,

                  child: TextField(
                    autofocus: false,
                    controller: flaws ,
                    style: TextStyle(fontSize: 8.0),
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),

                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:245.0),
                  margin: const EdgeInsets.only(left: 150.0),
                  width: 120,

                  child: TextField(
                    autofocus: false,
                    controller: abilities ,
                    style: TextStyle(fontSize: 8.0),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),

                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:384.0),
                  margin: const EdgeInsets.only(left: 158.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: cp,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:402.0),
                  margin: const EdgeInsets.only(left: 158.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: sp,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:420.0),
                  margin: const EdgeInsets.only(left: 158.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: ep,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:437.0),
                  margin: const EdgeInsets.only(left: 158.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: gp,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:454.0),
                  margin: const EdgeInsets.only(left: 158.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: pp,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:384.0),
                  margin: const EdgeInsets.only(left: 180.0),
                  width: 100,

                  child: TextField(
                    autofocus: false,
                    controller: equipment ,
                    style: TextStyle(fontSize: 8.0),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),

                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:377.0),
                  margin: const EdgeInsets.only(left: 20.0),
                  width: 20,

                  child: TextField(
                    autofocus: false,
                    controller: perception,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top:410.0),
                  margin: const EdgeInsets.only(left: 25.0),
                  width: 100,

                  child: TextField(
                    autofocus: false,
                    controller: others ,
                    style: TextStyle(fontSize: 8.0),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),

                  ),
                ),


                Container(
                  padding: const EdgeInsets.only(top:195.5),
                  margin: const EdgeInsets.only(left: 185.5),
                  width: 100,
                   child:
                      Transform.scale(
                        scale: 0.3,
                        child: Radio(
                          value:1,
                          groupValue: successGroup,
                          onChanged: (T) => {
                            setState((){
                              successGroup = T;
                            })
                          },
                        ),
                      ),

                  ),


                Container(
                  padding: const EdgeInsets.only(top:195.5),
                  margin: const EdgeInsets.only(left: 194.0),
                  width: 100,
                  child:
                  Transform.scale(
                    scale: 0.3,
                    child: Radio(
                      value:2,
                      groupValue: successGroup,
                      onChanged: (T) => {
                        setState((){
                          successGroup = T;
                        })
                      },
                    ),
                  ),

                ),


                Container(
                  padding: const EdgeInsets.only(top:195.5),
                  margin: const EdgeInsets.only(left: 203),
                  width: 100,
                  child:
                  Transform.scale(
                    scale: 0.3,
                    child: Radio(
                      value:3,
                      groupValue: successGroup,
                      onChanged: (T) => {
                        setState((){
                          successGroup = T;
                        })
                      },
                    ),
                  ),

                ),


                Container(
                  padding: const EdgeInsets.only(top:205.5),
                  margin: const EdgeInsets.only(left: 185.5),
                  width: 100,
                  child:
                  Transform.scale(
                    scale: 0.3,
                    child: Radio(
                      value:1,
                      groupValue: failureGroup,
                      onChanged: (T) => {
                        setState((){
                          failureGroup = T;
                        })
                      },
                    ),
                  ),

                ),


                Container(
                  padding: const EdgeInsets.only(top:205.5),
                  margin: const EdgeInsets.only(left: 194.0),
                  width: 100,
                  child:
                  Transform.scale(
                    scale: 0.3,
                    child: Radio(
                      value:2,
                      groupValue: failureGroup,
                      onChanged: (T) => {
                        setState((){
                          failureGroup = T;
                        })
                      },
                    ),
                  ),

                ),


                Container(
                  padding: const EdgeInsets.only(top:205.5),
                  margin: const EdgeInsets.only(left: 203),
                  width: 100,
                  child:
                  Transform.scale(
                    scale: 0.3,
                    child: Radio(
                      value:3,
                      groupValue: failureGroup,
                      onChanged: (T) => {
                        setState((){
                          failureGroup = T;
                        })
                      },
                    ),
                  ),

                )











              ]
            ),
          ),
        ),
      ),
    );
  }
}

class ZoomableWidget extends StatefulWidget {
  final Widget child;

  const ZoomableWidget({Key key, this.child}) : super(key: key);
  @override
  _ZoomableWidgetState createState() => _ZoomableWidgetState();
}

class _ZoomableWidgetState extends State<ZoomableWidget> {
  Matrix4 matrix = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return MatrixGestureDetector(
      onMatrixUpdate: (Matrix4 m, Matrix4 tm, Matrix4 sm, Matrix4 rm) {
        setState(() {
          matrix = m;
        });
      },
      child: Transform(
        transform: matrix,
        child: widget.child,
      ),
    );
  }
}