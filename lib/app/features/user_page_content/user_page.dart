import 'package:flutter/material.dart';

class UserPageContent extends StatelessWidget {
  const UserPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('images/ONX.jpg'),
          radius: 100,
        ),
        SizedBox(height: 40),
        Center(
          child: Text('Tutaj będzie profil użytkownika'),
        ),
      ],
    );
  }
}
