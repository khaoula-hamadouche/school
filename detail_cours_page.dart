import 'package:flutter/material.dart';

class CoursPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController courseDescriptionController = TextEditingController();
  final TextEditingController courseDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          'Ajouter un Cours',
          style: TextStyle(color: Colors.blueAccent),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Placeholder pour la page de profil
                print("Naviguer vers la page de profil");
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Ajouter un nouveau cours',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: courseNameController,
                decoration: InputDecoration(
                  labelText: 'Nom du cours',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du cours';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: courseDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: courseDateController,
                decoration: InputDecoration(
                  labelText: 'Date (YYYY-MM-DD)',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une date valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Récupérer les données des champs
                    final courseName = courseNameController.text;
                    final courseDescription = courseDescriptionController.text;
                    final courseDate = courseDateController.text;

                    // Exemple de traitement
                    print('Cours ajouté :');
                    print('Nom : $courseName');
                    print('Description : $courseDescription');
                    print('Date : $courseDate');

                    // Effacer les champs après l'ajout
                    courseNameController.clear();
                    courseDescriptionController.clear();
                    courseDateController.clear();

                    // Afficher un message de succès
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cours ajouté avec succès !')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Ajouter le Cours'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
