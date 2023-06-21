import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  static const name = "theme_changer_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final bool isdarkModeProvider = ref.watch(isDarkModeProvider);
    final isdarkModeProvider = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Theme changer",
        ),
        actions: [
          IconButton(
              onPressed: () {
                //ref.read(isDarkModeProvider.notifier).update((state) => !state);
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              },
              icon: isdarkModeProvider == false
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode_outlined))
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(colorListProvider);
    //final selectedIndex = ref.watch(selectedColorProvider);
    final selectedIndex = ref.watch(themeNotifierProvider).selectedColor;
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        final color = colors[index];
        return RadioListTile(
            title: Text(
              "Este color",
              style: TextStyle(color: color),
            ),
            subtitle: Text("${color.value}"),
            activeColor: color,
            value: index,
            groupValue: selectedIndex,
            onChanged: (value) {
              //ref
              //    .read(selectedColorProvider.notifier)
              //    .update((state) => value!);
              ref.read(themeNotifierProvider.notifier).changeColorIndex(value!);

              //TODO: Notificar cambio
            });
      },
    );
  }
}
