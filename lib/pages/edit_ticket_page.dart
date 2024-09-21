import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ticket_provider.dart';
import '../models/ticket.dart';

class EditTicketPage extends StatelessWidget {
  final String ticketId;

  const EditTicketPage({super.key, required this.ticketId});

  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<TicketProvider>(context);
    final ticket = ticketProvider.tickets.firstWhere((t) => t.id == ticketId);

    // Inicializamos los controladores con los valores actuales del ticket
    final TextEditingController numeroVueloController = TextEditingController(text: ticket.numeroVuelo);
    final TextEditingController aerolineaController = TextEditingController(text: ticket.aerolinea);
    final TextEditingController pasajeroController = TextEditingController(text: ticket.pasajero);
    final TextEditingController origenController = TextEditingController(text: ticket.origen);
    final TextEditingController destinoController = TextEditingController(text: ticket.destino);
    final TextEditingController asientoController = TextEditingController(text: ticket.asiento);
    final TextEditingController claseController = TextEditingController(text: ticket.clase);

    return Scaffold(
      appBar: AppBar(title: const Text('Editar Ticket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: numeroVueloController,
              decoration: const InputDecoration(labelText: 'Número de Vuelo'),
            ),
            TextField(
              controller: aerolineaController,
              decoration: const InputDecoration(labelText: 'Aerolínea'),
            ),
            TextField(
              controller: pasajeroController,
              decoration: const InputDecoration(labelText: 'Pasajero'),
            ),
            TextField(
              controller: origenController,
              decoration: const InputDecoration(labelText: 'Origen'),
            ),
            TextField(
              controller: destinoController,
              decoration: const InputDecoration(labelText: 'Destino'),
            ),
            TextField(
              controller: asientoController,
              decoration: const InputDecoration(labelText: 'Asiento'),
            ),
            TextField(
              controller: claseController,
              decoration: const InputDecoration(labelText: 'Clase'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Actualizamos el ticket con los nuevos valores
                final updatedTicket = Ticket(
                  id: ticket.id,
                  numeroVuelo: numeroVueloController.text,
                  aerolinea: aerolineaController.text,
                  pasajero: pasajeroController.text,
                  origen: origenController.text,
                  destino: destinoController.text,
                  asiento: asientoController.text,
                  clase: claseController.text,
                );

                ticketProvider.updateTicket(ticket.id, updatedTicket);
                Navigator.of(context).pop();
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
