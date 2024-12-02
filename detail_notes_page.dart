import 'package:flutter/material.dart';
import 'profile_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}

class NotesPage extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vos Classes',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent, // Couleur du titre
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Nombre de colonnes
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(), // Animation de défilement fluide
                children: [
                  _buildYearCard('1AM', context),
                  _buildYearCard('2AM', context),
                  _buildYearCard('3AM', context),
                  _buildYearCard('4AM', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYearCard(String year, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Naviguer vers la page des élèves
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentNotesPage(year: year),
          ),
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF85BEF5), Color(0xFF63A7E1)], // Dégradé bleu
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              year,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Texte blanc pour plus de contraste
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StudentNotesPage extends StatelessWidget {
  final String year;

  StudentNotesPage({required this.year});

  @override
  Widget build(BuildContext context) {
    final students = [
      'Cherif Khaoula',
      'Hamadouche Khaoula',
      'Hamadouche Roufaida',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/logo.png'), // Logo en haut à gauche
          ),
        ),
        title: Text(
          'Gestion des Notes ($year)',
          style: TextStyle(color: Colors.blueAccent),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Placeholder pour la page de profil
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      students[index],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'CC',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Devoir',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Examen',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
