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
        color: Theme.of(context).colorScheme.surfaceVariant,
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
              color: Colors.grey.shade400, // Color de la sombra
              spreadRadius: 1, // Extensión de la sombra
              blurRadius: 15, // Difuminado de la sombra
              offset: const Offset(4.0, 4.0),
            ),
            const BoxShadow(
              color: Colors.white70, // Color de la sombra
              spreadRadius: 1, // Extensión de la sombra
              blurRadius: 15, // Difuminado de la sombra
              offset: Offset(-4.0, -4.0),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Evento:'),
              Align(
                child: Row(
                  children: [
                    Text('Fecha:'),
                    Text('Me gustas: '),
                  ],
                ),
              ),
            ],
          ),
          IconButton.filled(
            iconSize: 30,
            onPressed: () {},
            icon: Icon(MdiIcons.informationVariant),
          )
        ],
      ),
    );
  }
}
