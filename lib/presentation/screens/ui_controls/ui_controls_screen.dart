import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls"),
      ),
      body: const _UIcontrolsView(),
    );
  }
}

class _UIcontrolsView extends StatefulWidget {
  const _UIcontrolsView();

  @override
  State<_UIcontrolsView> createState() => _UIcontrolsViewState();
}

enum transportation { car, plane, boat, submarine }

class _UIcontrolsViewState extends State<_UIcontrolsView> {
  transportation selectedTransportation = transportation.car;
  bool isDeveloper = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Developer mode"),
          subtitle: const Text("Controles adicionales"),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text("Vehículo de transporte"),
          subtitle: Text("$selectedTransportation"),
          children: [
            RadioListTile(
              groupValue: selectedTransportation,
              value: transportation.car,
              title: const Text("by car"),
              subtitle: const Text("viajar por carro"),
              onChanged: (value) {
                setState(() {
                  selectedTransportation = transportation.car;
                });
              },
            ),
            RadioListTile(
              groupValue: selectedTransportation,
              value: transportation.boat,
              title: const Text("by boat"),
              subtitle: const Text("viajar por barco"),
              onChanged: (value) {
                setState(() {
                  selectedTransportation = transportation.boat;
                });
              },
            ),
            RadioListTile(
              groupValue: selectedTransportation,
              value: transportation.plane,
              title: const Text("by plane"),
              subtitle: const Text("viajar por avión"),
              onChanged: (value) {
                setState(() {
                  selectedTransportation = transportation.plane;
                });
              },
            ),
            RadioListTile(
              groupValue: selectedTransportation,
              value: transportation.submarine,
              title: const Text("by submarine"),
              subtitle: const Text("viajar por submarino"),
              onChanged: (value) {
                setState(() {
                  selectedTransportation = transportation.submarine;
                });
              },
            )
          ],
        ),
        CheckboxListTile(
          title: const Text("Desayuno?"),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Almuerzo?"),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Comida?"),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}
