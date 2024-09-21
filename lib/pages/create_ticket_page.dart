import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ticket_provider.dart';
import '../models/ticket.dart';

class CreateTicketPage extends StatelessWidget {
  const CreateTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<TicketProvider>(context);

    final TextEditingController numeroVueloController = TextEditingController();
    final TextEditingController aerolineaController = TextEditingController();
    final TextEditingController pasajeroController = TextEditingController();
    final TextEditingController origenController = TextEditingController();
    final TextEditingController destinoController = TextEditingController();
    final TextEditingController asientoController = TextEditingController();
    final TextEditingController claseController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Crear Ticket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: numeroVueloController, decoration: const InputDecoration(labelText: 'Número de Vuelo')),
            TextField(controller: aerolineaController, decoration: const InputDecoration(labelText: 'Aerolínea')),
            TextField(controller: pasajeroController, decoration: const InputDecoration(labelText: 'Pasajero')),
            TextField(controller: origenController, decoration: const InputDecoration(labelText: 'Origen')),
            TextField(controller: destinoController, decoration: const InputDecoration(labelText: 'Destino')),
            TextField(controller: asientoController, decoration: const InputDecoration(labelText: 'Asiento')),
            TextField(controller: claseController, decoration: const InputDecoration(labelText: 'Clase')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newTicket = Ticket(
                  id: '', // Firestore genera el ID
                  numeroVuelo: numeroVueloController.text,
                  aerolinea: aerolineaController.text,
                  pasajero: pasajeroController.text,
                  origen: origenController.text,
                  destino: destinoController.text,
                  asiento: asientoController.text,
                  clase: claseController.text,
                );
                ticketProvider.addTicket(newTicket);
                Navigator.of(context).pop();
              },
              child: const Text('Crear Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
