import 'package:flutter/material.dart';

class AbsencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absences'),
      ),
      body: Center(
        child: Text(
          'Ici, vous pouvez voir les absences des élèves.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
