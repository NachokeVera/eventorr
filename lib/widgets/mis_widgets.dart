import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EventoContainer extends StatefulWidget {
  final String nombre;
  final String lugar;
  final String fecha;
  final String hora;

  const EventoContainer(
      {super.key,
      required this.nombre,
      required this.lugar,
      required this.fecha,
      required this.hora});

  @override
  State<EventoContainer> createState() => _EventoContainerState();
}

class _EventoContainerState extends State<EventoContainer> {
  bool likeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500, // Color de la sombra
              spreadRadius: 0, // Extensión de la sombra
              blurRadius: 12, // Difuminado de la sombra
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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Titulo: ${widget.nombre}'),
              Text('Lugar: ${widget.lugar}'),
              Text('Fecha: ${widget.fecha}'),
              Text('Hora: ${widget.hora}'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              height: 100,
                              //width: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal),
                            ),
                          );
                        });
                  },
                  icon: Icon(MdiIcons.informationVariant)),
              IconButton(
                  isSelected: likeSelected,
                  onPressed: () {
                    setState(() {
                      likeSelected = !likeSelected;
                    });
                  },
                  icon: Icon(MdiIcons.heartOutline),
                  selectedIcon: Icon(MdiIcons.heart)),
              Text('0',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.onPrimaryContainer))
            ],
          )
        ],
      ),
    );
  }
}
