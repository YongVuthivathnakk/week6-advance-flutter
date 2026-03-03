import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week6/ui/states/settings_state.dart';

import '../../../model/settings/app_settings.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettingsState settings = context.watch<AppSettingsState>();
    Color background = settings.theme.backgroundColor;

    return Container(
      decoration: BoxDecoration(color: background),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Settings", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Text(
            "Theme",
            style: AppTextStyles.label.copyWith(color: AppColors.textLight),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ThemeColor.values
                .map(
                  (theme) => ThemeColorButton(
                    themeColor: theme,
                    isSelected: theme == settings.theme,
                    onTap: (value) {
                      settings.changeTheme(value);
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
