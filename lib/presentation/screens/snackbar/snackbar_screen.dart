import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showCustomSnackbar() {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Hola mundo")));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars y dialogos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        "Excepteur ipsum occaecat eu ullamco aliqua esse sint aute deserunt consequat labore reprehenderit ullamco. Anim nostrud sint nisi culpa ex aliquip eu anim. Nulla incididunt magna non Lorem occaecat cupidatat dolore. Et labore voluptate est fugiat sint reprehenderit. Lorem dolor velit amet deserunt incididunt exercitation. Commodo sunt sint magna minim id dolor sint et ea.")
                  ]);
                },
                child: const Text("Licencias usadas")),
            FilledButton(
                onPressed: () {}, child: const Text("Mostrar diálogos"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: () {
            showCustomSnackbar();
          },
          label: const Text("Mostrar snackbar")),
    );
  }
}
