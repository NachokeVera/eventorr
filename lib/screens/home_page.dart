import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventor/service/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:eventor/widgets/mis_widgets.dart';
//import 'package:intl/intl.dart';
//import 'package:eventor/firebase_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, "/formpage");
      }),
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
          child: StreamBuilder(
              stream: FirestoreService().eventos(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  //esperando datos
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var evento = snapshot.data!.docs[index];
                      var fechaHoraTimestamp = evento['fecha'] as Timestamp;
                      var t = fechaHoraTimestamp.toDate();
                      return EventoContainer(
                          nombre: evento['nombre'],
                          lugar: evento['lugar'],
                          fecha: '${t.day}/${t.month}/${t.year}',
                          hora: '${t.hour}:${t.minute}');
                    },
                  );
                }
              })),
    );
  }
}
