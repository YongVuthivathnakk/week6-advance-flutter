import 'package:week6/data/repositories/settings/setting_repository.dart';
import 'package:week6/model/settings/app_settings.dart';

class AppSettingMock implements AppSettingsRepository {
  AppSettings appSetting = AppSettings(themeColor: ThemeColor.blue);

  @override
  Future<AppSettings> load() async {
    return appSetting;
  }

  @override
  Future<void> save(AppSettings setting) async {
    appSetting = setting;
  }
}
