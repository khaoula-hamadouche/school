import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil de l\'élève'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.jpg'), // Image de profil
              ),
            ),
            SizedBox(height: 20),
            _buildInfoRow(Icons.person, 'Nom : khaoula hamadouche'),
            SizedBox(height: 10),
            _buildInfoRow(Icons.school, 'Classe : 3AM4'),
            SizedBox(height: 10),
            _buildInfoRow(Icons.email, 'Email : khaoula@example.com'),
            SizedBox(height: 10),
            _buildInfoRow(Icons.phone, 'Téléphone : 054937'),
            SizedBox(height: 10),
            _buildInfoRow(Icons.location_on, 'Adresse : 123, Rue de lorange'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String info) {
    return Row(
      children: [
        Icon(
          icon, // L'icône correspondante
          color: Colors.blue, // Couleur de l'icône
        ),
        SizedBox(width: 10), // Espacement entre l'icône et le texte
        Expanded(
          child: Text(
            info, // Texte associé
            style: TextStyle(fontSize: 16), // Style du texte
          ),
        ),
      ],
    );
  }
}
