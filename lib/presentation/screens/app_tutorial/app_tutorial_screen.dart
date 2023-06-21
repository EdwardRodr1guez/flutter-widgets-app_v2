import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  PageController pageViewController = PageController();
  bool endReached = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        endReached = true;
        setState(() {});
      }
      //print(pageViewController.page);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((e) => Slide(
                    title: e.title, caption: e.caption, imageUrl: e.imageUrl))
                .toList()),
        Positioned(
            right: 20,
            top: 50,
            child: TextButton(onPressed: () {}, child: const Text("Salir"))),
        endReached
            ? Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(seconds: 1),
                  child: FilledButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text("comenzar")),
                ))
            : const SizedBox()
      ]),
    );
  }
}

class Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const Slide(
      {super.key,
      required this.title,
      required this.caption,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(imageUrl),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}

final slides = <SlidesInfo>[
  SlidesInfo(
      title: "Busca la comida",
      caption:
          "Minim duis do veniam Lorem ex magna do proident ut est magna duis pariatur.",
      imageUrl: "assets/images/1.png"),
  SlidesInfo(
      title: "Entrega rápida",
      caption: "Dolore in Lorem eu cupidatat.",
      imageUrl: "assets/images/2.png"),
  SlidesInfo(
      title: "Disfruta la comida",
      caption:
          "Voluptate magna ullamco sint exercitation qui incididunt proident.",
      imageUrl: "assets/images/3.png"),
];

class SlidesInfo {
  final String title;
  final String caption;
  final String imageUrl;
  SlidesInfo(
      {required this.title, required this.caption, required this.imageUrl});
}
