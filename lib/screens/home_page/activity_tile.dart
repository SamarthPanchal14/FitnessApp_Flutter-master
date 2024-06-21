

import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final bool showPhoto;

  const ActivityTile({super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    this.showPhoto = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: showPhoto
          ? const CircleAvatar(
        backgroundImage: AssetImage('assets/images/progress_photo.png'),
      )
          : const Icon(Icons.fitness_center),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(date),
    );
  }
}