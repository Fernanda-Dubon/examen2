import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/ticket.dart';

class TicketProvider with ChangeNotifier {
  final CollectionReference _ticketCollection =
      FirebaseFirestore.instance.collection('TicketAvion');

  List<Ticket> _tickets = [];

  List<Ticket> get tickets => _tickets;

  Future<void> fetchTickets() async {
    final snapshot = await _ticketCollection.get();
    _tickets = snapshot.docs.map((doc) => Ticket.fromFirestore(doc)).toList();
    notifyListeners();
  }

  Future<void> addTicket(Ticket ticket) async {
    await _ticketCollection.add(ticket.toMap());
    fetchTickets();
  }

  Future<void> updateTicket(String id, Ticket ticket) async {
    await _ticketCollection.doc(id).update(ticket.toMap());
    fetchTickets();
  }

  Future<void> deleteTicket(String id) async {
    await _ticketCollection.doc(id).delete();
    fetchTickets();
  }
}
