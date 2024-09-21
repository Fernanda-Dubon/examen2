import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  String id;
  String numeroVuelo;
  String aerolinea;
  String pasajero;
  String origen;
  String destino;
  String asiento;
  String clase;

  Ticket({
    required this.id,
    required this.numeroVuelo,
    required this.aerolinea,
    required this.pasajero,
    required this.origen,
    required this.destino,
    required this.asiento,
    required this.clase,
  });

  factory Ticket.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Ticket(
      id: doc.id,
      numeroVuelo: data['numeroVuelo'],
      aerolinea: data['aerolinea'],
      pasajero: data['pasajero'],
      origen: data['origen'],
      destino: data['destino'],
      asiento: data['asiento'],
      clase: data['clase'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'numeroVuelo': numeroVuelo,
      'aerolinea': aerolinea,
      'pasajero': pasajero,
      'origen': origen,
      'destino': destino,
      'asiento': asiento,
      'clase': clase,
    };
  }
}
