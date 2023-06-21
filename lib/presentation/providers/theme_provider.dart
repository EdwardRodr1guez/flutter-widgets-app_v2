import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final colorListProvider =
    Provider((ref) => colorList); //es inmutable, no se puede cambiar

final isDarkModeProvider = StateProvider((ref) {
  // no es inmutable, puede cambiar
  return false;
});

final selectedColorProvider =
    StateProvider((ref) => 0); // no es inmutable, puede cambiar

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  //<la clase, la clase que controla la otra clase>
  return ThemeNotifier();
}); // no es inmutable, puede cambiar, pero es algo más complejo, es decir, admite data mas compleja.

class ThemeNotifier extends StateNotifier<AppTheme> {
  //específicamos el genérico
  ThemeNotifier()
      : super(
            AppTheme()); //es decir, ThemeNotifier se hace con una instancia de la class apptheme con estos valores por defecto

  //al extender la clase statenotifier tenemos acceso a state que es el tipo de dato que devuelve el provider

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int selectedColorr) {
    state = state.copyWith(selectedColor: selectedColorr);
  }
}
