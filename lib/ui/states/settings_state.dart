import 'package:flutter/widgets.dart';
import 'package:week6/data/repositories/settings/setting_repository.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  AppSettingsRepository repo;

  AppSettings? _appSettings;

  AppSettingsState({required this.repo}) {
    init();
  }

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await repo.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);

    notifyListeners();
  }
}
