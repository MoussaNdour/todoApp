import 'package:flutter/material.dart';
import 'package:todo/data/notifier.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: todos,
      builder: (context, value, child) {
        // 1. On vérifie si la liste est vide pour éviter l'erreur et afficher un message sympa
        if (value.isEmpty) {
          return const Center(child: Text("Aucune tâche pour le moment !"));
        }

        return ListView.builder(
          // 2. IMPORTANT : On dit à la liste combien d'éléments afficher
          itemCount: value.length, 
          itemBuilder: (context, index) {
            // 3. On affiche l'élément à la position 'index'
            // (Et non pas seulement le 'last')
            return value[index]; 
          },
        );
      },
    );
  }
}