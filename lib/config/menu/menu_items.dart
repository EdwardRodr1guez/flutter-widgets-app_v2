import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Counter',
      subTitle: 'counter en Flutter',
      link: '/counter',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicator',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'snackbars y dialogos',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      title: 'animated containter',
      subTitle: 'stateful widget animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank_outlined),
  MenuItem(
      title: 'ui controls + tiles',
      subTitle: 'una serie de controles en flutter',
      link: '/ui-controls',
      icon: Icons.car_crash_rounded),
  MenuItem(
      title: 'introducción a la aplucación',
      subTitle: '',
      link: '/tutorial',
      icon: Icons.accessibility_rounded),
  MenuItem(
      title: 'infinite scroll y pull',
      subTitle: 'Listas infinitas y pull to refresh',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
  MenuItem(
      title: 'cambiar tema',
      subTitle: 'pantalla para cambiar el tema',
      link: '/theme-changer',
      icon: Icons.color_lens_outlined)
];
