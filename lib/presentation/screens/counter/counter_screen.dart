import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  static const String name = 'counter_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final int countervalue = ref.watch(counterProviver);
    //final bool isdarkModeProvider = ref.watch(isDarkModeProvider);
    final bool isdarkModeProvider = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              //ref.read(isDarkModeProvider.notifier).update((state) => !state);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: isdarkModeProvider == false
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode_outlined))
      ], title: const Text("Counter Screen")),
      body: Center(
        child: Text(
          "Valor: $countervalue",
          style: titleStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //solo leer ref.read(counterProviver);
          //forma#1
          //ref.read(counterProviver.notifier).state =
          //    ref.read(counterProviver.notifier).state + 1;
          //forma#2
          ref.read(counterProviver.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
