import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'providers/ticket_provider.dart';
import 'pages/home_page.dart';
import 'pages/create_ticket_page.dart';
import 'pages/edit_ticket_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TicketProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/create',
      builder: (context, state) => const CreateTicketPage(),
    ),
    GoRoute(
      path: '/edit/:id',
      builder: (context, state) {
        // Aquí cambiamos de state.params a state.pathParameters
        final id = state.pathParameters['id']!;
        return EditTicketPage(ticketId: id);
      },
    ),
  ],
);
