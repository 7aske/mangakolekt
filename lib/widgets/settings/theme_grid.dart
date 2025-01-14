import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangakolekt/bloc/theme/theme_bloc.dart';
import 'package:mangakolekt/models/bloc/theme.dart';
import 'package:mangakolekt/widgets/settings/theme_button.dart';

class ThemeGreed extends StatelessWidget {
  const ThemeGreed({super.key});

  @override
  build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      final List<ThemeStore> themes;
      if (state is ThemeLoaded) {
        themes = state.themes;
      } else {
        themes = (state as ThemeInitial).themes;
      }
      final List<ThemeButton> themesList = [];
      final len = themes.length;
      for (var i = 0; i < len; i++) {
        themesList.add(ThemeButton(
          themeStore: themes[i],
          index: i,
        ));
      }
      // themesList.add(ThemeButton(index: index, themeStore: themeStore))
      return Row(children: themesList);
    });
  }
}
