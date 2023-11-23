import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormEvento extends StatefulWidget {
  const FormEvento({super.key});

  @override
  State<FormEvento> createState() => _FormEventoState();
}

class _FormEventoState extends State<FormEvento> {
  GlobalKey formKey = GlobalKey<FormState>();
  final nombreCtrl = TextEditingController();
  final lugarCtrl = TextEditingController();
  final descripcionCtrl = TextEditingController();
  late final List<DateTime?> fecha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Agregar Evento!',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.inversePrimary)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
          padding: const EdgeInsets.all(30),
          alignment: Alignment.topCenter,
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: Form(
            child: ListView(
              children: [
                TextFormField(
                  controller: nombreCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Nombre:',
                    border: OutlineInputBorder(),
                  ),
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                      calendarType: CalendarDatePicker2Type.single),
                  value: fecha,
                  onValueChanged: (dates) => fecha = dates,
                )
              ],
            ),
          )),
    );
  }
}
