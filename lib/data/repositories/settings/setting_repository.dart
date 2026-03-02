import 'package:week6/model/settings/app_settings.dart';

abstract class AppSettingsRepository {
  Future<AppSettings> load();
  Future<void> save(AppSettings setting);
}
