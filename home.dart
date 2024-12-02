import 'package:flutter/material.dart';
import 'profile_page.dart'; // Assurez-vous que ProfilePage est importé
import 'detail_absences_page.dart';
import 'detail_cours_page.dart';
import 'detail_temps_page.dart';
import 'detail_notes_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fond blanc pour toute la page
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
            child: GestureDetector(
              onTap: () {
                // Lorsque l'icône est cliquée, naviguer vers la page ProfilePage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()), // Naviguer vers la page de profil
                );
              },
              child: CircleAvatar(
                backgroundColor: Colors.blue, // Cercle bleu
                child: Icon(Icons.person, color: Colors.black), // Icône noire dans le cercle
              ),
            ),
          ),
        ],
      ),
      body: Center( // Centrer tout le contenu
        child: Column(
          mainAxisSize: MainAxisSize.min, // Réduit la hauteur pour juste contenir les éléments
          children: [
            Text(
              'Prof',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Texte en noir
              ),
            ),
            SizedBox(height: 20), // Espace entre le texte et les cartes
            GridView.count(
              crossAxisCount: 2, // Nombre de colonnes
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              shrinkWrap: true, // Permet à GridView d'occuper seulement l'espace nécessaire
              physics: NeverScrollableScrollPhysics(), // Empêche le défilement
              children: [
                _buildCard('Gestion absences', 'assets/absence.png', context, AbsencesPage()),
                _buildCard('Gestion des notes', 'assets/note.png', context, NotesPage()),
                _buildCard('Emplois du temps', 'assets/temps.png', context, TempsPage()),
                _buildCard('Gestion des cours', 'assets/cours.png', context, CoursPage()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, String assetPath, BuildContext context, Widget detailPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => detailPage,
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: 150, // Taille fixe pour uniformiser les cartes
          height: 200, // Idem
          decoration: BoxDecoration(
            color: Color(0xFF85BEF5), // Fond bleu clair
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(assetPath, height: 100), // Taille fixe de l'image
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12, // Taille de texte
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Texte en noir
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
