import 'package:flutter/material.dart';
import 'skill.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;
  // The key identifies a widget, and this tells flutter whether a widget should be inflated new, or whether it should replace an existing widget in the tree during a build
  const SkillCard({required this.skill, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AutoSizeText(
            skill.title,
            style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
            maxLines: 1,
          ),
          Text(
            skill.experienceYear > 1
                ? '${skill.experienceYear.toString()} + years'
                : '${skill.experienceYear.toString()} + year',
            style: const TextStyle(fontSize: 14.0, color: Colors.blue),
          )
        ]),
      ),
    );
  }
}
