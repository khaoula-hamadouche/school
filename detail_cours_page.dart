import 'package:flutter/material.dart';

class CoursPage extends StatelessWidget {
  final Map<String, List<String>> courses = {
    'Mathématiques': ['Cours 1', 'Cours 2', 'Cours 3'],
    'Physique': ['Cours 1', 'Cours 2'],
    'Histoire': ['Cours 1', 'Cours 2', 'Cours 3', 'Cours 4'],
  };

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
            backgroundImage:
            AssetImage('assets/logo.png'), // Logo en haut à gauche
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue, // Cercle bleu
              child: Icon(Icons.person,
                  color: Colors.black), // Icône noire dans le cercle
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[200]!,
              Colors.blue[400]!,
              Colors.blue[600]!,
            ],
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          itemCount: courses.keys.length,
          itemBuilder: (context, index) {
            String subject = courses.keys.elementAt(index);
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: ExpansionTile(
                tilePadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                title: Text(
                  subject,
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                iconColor: Colors.blue[800],
                children: courses[subject]!
                    .map(
                      (course) => ListTile(
                    title: Text(
                      course,
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 16,
                      ),
                    ),
                    leading: Icon(
                      Icons.book,
                      color: Colors.blue[600],
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Vous avez sélectionné $course.'),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.blue[600],
                        ),
                      );
                    },
                  ),
                )
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
