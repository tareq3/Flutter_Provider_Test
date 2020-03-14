import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  String _units;
  List<String> _waxLines;

  SettingsProvider() {
    _units = 'Imperial';
    _waxLines = ['Swix', 'Toko'];

    loadPreferences();
  }

  //Getters
  String get units {
    return _units;
  }

  List<String> get waxLines {
    return _waxLines;
  }

  //Setters
  void setUnits(String units) {
    _units = units;
    notifyListeners();
    savePreferences();
  }

  void _setWaxes(List<String> waxLines) {
    _waxLines = waxLines;
  }

  void addWaxLine(String waxLine) {
    if (!(_waxLines.contains(waxLine))) {
      _waxLines.add(waxLine);
      notifyListeners();
      savePreferences();
    }
  }

  void removeWaxLine(String waxLine) {
    if (_waxLines.contains(waxLine)) {
      _waxLines.remove(waxLine);
      notifyListeners();
      savePreferences();
    }
  }

  savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('units', _units);
    prefs.setStringList('waxLines', _waxLines);
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String units = prefs.getString('units');
    List<String> waxLines = prefs.getStringList('waxLines');
    if (units != null) setUnits(units);

    if (waxLines != null) _setWaxes(waxLines);
  }
}
