import 'package:flutter/material.dart';

class TempsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF85BEF5), // Fond bleu clair comme la page des notes
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/logo.png'), // Logo en haut à gauche
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue, // Cercle bleu
              child: Icon(Icons.person, color: Colors.black), // Icône noire dans le cercle
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xFF85BEF5), // Fond bleu clair
        child: Center(
          child: Image.asset(
            'assets/emploi_du_temps.png', // Remplacez par votre image
            fit: BoxFit.contain, // Ajuste l'image pour la maintenir dans l'espace sans la déformer
            width: MediaQuery.of(context).size.width * 0.8, // Utilise 80% de la largeur de l'écran
            height: MediaQuery.of(context).size.height * 0.5, // Utilise 50% de la hauteur de l'écran
          ),
        ),
      ),
    );
  }
}
