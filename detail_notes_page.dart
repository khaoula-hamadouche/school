import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  // Données fictives pour les notes
  final List<Map<String, dynamic>> notes = [
    {
      'subject': 'Mathématiques',
      'teacher': 'Mme Dupont',
      'grades': {
        'CC': '18/20',
        'Devoir': '17/20',
        'Examen': '16/20',
      },
    },
    {
      'subject': 'Physique',
      'teacher': 'M. Martin',
      'grades': {
        'CC': '15/20',
        'Devoir': '14/20',
        'Examen': '13/20',
      },
    },
    {
      'subject': 'Français',
      'teacher': 'Mme Bernard',
      'grades': {
        'CC': '14/20',
        'Devoir': '13/20',
        'Examen': '12/20',
      },
    },
    {
      'subject': 'Histoire-Géo',
      'teacher': 'M. Lefebvre',
      'grades': {
        'CC': '19/20',
        'Devoir': '18/20',
        'Examen': '17/20',
      },
    },
  ];

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
            child: CircleAvatar(
              backgroundColor: Colors.blue, // Cercle bleu
              child: Icon(Icons.person, color: Colors.black), // Icône noire dans le cercle
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF85BEF5), // Couleur bleue
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note['subject']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600, // Texte plus gras
                      color: Colors.black, // Texte en noir
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Professeur : ${note['teacher']}',
                    style: TextStyle(
                      color: Colors.black, // Texte en noir
                      fontWeight: FontWeight.w500, // Texte un peu gras
                    ),
                  ),
                  SizedBox(height: 8),
                  Divider(color: Colors.black), // Ligne noire
                  Text(
                    'Note CC : ${note['grades']['CC']}',
                    style: TextStyle(
                      color: Colors.black, // Texte en noir
                      fontWeight: FontWeight.w400, // Texte un peu gras
                    ),
                  ),
                  Text(
                    'Note Devoir : ${note['grades']['Devoir']}',
                    style: TextStyle(
                      color: Colors.black, // Texte en noir
                      fontWeight: FontWeight.w400, // Texte un peu gras
                    ),
                  ),
                  Text(
                    'Note Examen : ${note['grades']['Examen']}',
                    style: TextStyle(
                      color: Colors.black, // Texte en noir
                      fontWeight: FontWeight.w400, // Texte un peu gras
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
