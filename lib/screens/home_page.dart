import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('EVENTOR!',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.surfaceTint)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        alignment: Alignment.topCenter,
        color: Theme.of(context).colorScheme.secondary,
        child: const EventoContainer(),
      ),
    );
  }
}

class EventoContainer extends StatelessWidget {
  final String title;
  const EventoContainer({
    super.key,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0)
                  .withOpacity(0.4), // Color de la sombra
              spreadRadius: 3, // Extensión de la sombra
              blurRadius: 10, // Difuminado de la sombra
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Column(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                iconSize: 35,
                onPressed: () {},
                icon: Icon(MdiIcons.informationVariant),
              )
            ],
          )
        ],
      ),
    );
  }
}
