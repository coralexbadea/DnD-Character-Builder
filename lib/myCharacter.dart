

import 'package:flutter/cupertino.dart';
import 'package:play_ground/listClasses.dart';
import 'package:play_ground/listsRaces.dart';
import 'package:flutter/foundation.dart';

class MyCharacter with ChangeNotifier {
  DnDClass _stateManagementClass = null;
  DnDRace _stateManagementRace = null;

  DnDClass get stateManagementClass => _stateManagementClass;

  set stateManagementClass(DnDClass value) {
    _stateManagementClass = value;
    notifyListeners();
  }


  DnDRace get stateManagementRace => _stateManagementRace;

  set stateManagementRace(DnDRace value) {
    _stateManagementRace = value;
    notifyListeners();
  }



  MyCharacter();
}