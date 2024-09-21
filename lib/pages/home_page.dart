import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/ticket_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<TicketProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tickets')),
      body: FutureBuilder(
        future: ticketProvider.fetchTickets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: ticketProvider.tickets.length,
            itemBuilder: (context, index) {
              final ticket = ticketProvider.tickets[index];
              return ListTile(
                title: Text(ticket.numeroVuelo),
                subtitle: Text('${ticket.origen} -> ${ticket.destino}'),
                onTap: () => context.go('/edit/${ticket.id}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ticketProvider.deleteTicket(ticket.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/create'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
