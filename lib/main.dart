import 'package:flutter/material.dart';
//import 'dart:math';
void main() => runApp(const CardApp());
//StatelessWidget le widget qui ne change pas d'etat
class CardApp extends StatelessWidget {
  const CardApp({super.key});//le constructeur de la classe CardApp

  @override
  Widget build(BuildContext context){
    //il permet de decrire d'ecran en retounant un widget
    return MaterialApp(
      theme: ThemeData(
        //une seul couleurs genere pour toute l'application
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 13, 26, 143),
      ),
      ),
      home: Scaffold(
        //le widget qui permet de creer une page avec un appbar et un body
        appBar: AppBar(title: const Text('Mon Statut')),
        body: Padding(
          padding: const EdgeInsets.all(16),//ici on a la marge de bordure sur les 4 coter
          child: Column(
            children: [
              ProfileCard(
              //le widget qui permet de creer une carte de profil et qui donne les donnees de la carte par des paramettre donner 
                name: 'Jean Claude',
                role: 'etudiant en software engineering',
                phone: '+237 659 42 34 86',
                email: 'hangban.jean@ictu.edu.cm',
                level: '3',
          ),
          ]
          )
        ),
      ),
    );
    
  }
}

// PARTI 2 LA carte 

class ProfileCard extends StatelessWidget{
  //required est undispensable pour cree une carte 
  const ProfileCard({
    super.key,
    required this.name,
    required this.role,
    required this.phone,
    required this.email,
    required this.level,
  });
   //les paramettre de la carte NE CHANGE plus une fois donner 
  final String name;
  final String role;
  final String phone;
  final String email;
  final String level;

  @override
  Widget build(BuildContext context){
    //on recupere les style de texte du theme 
    final textTheme = Theme.of(context).textTheme;
    return Card(//la surface est surelever
      child: Padding(
        padding: const EdgeInsets.all(16),//la marge de bordure sur les 4 coter
        child: Row(
          children:[
            //rond avec une icon de personne a l'interieur
            const CircleAvatar(radius:33, child: Icon(Icons.person, size: 33),),
            // espace libre entre le rond et les information de la carte
            const SizedBox(width:18),
            //Expanded prend tout l'espace disponible pour les information de la  carte et evite le depassement part les long nom
            Expanded(
              child: Column(//un element sur l'autre et alignement
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: textTheme.titleLarge),
                Text(role),
                Text(email),
                const SizedBox(height:8),
                //icon de phone + numero de telephone
                Row(children: [
                  const Icon(Icons.phone, size: 16),
                  const SizedBox(width:4),
                  Text(phone),
                ],),
                Row(children: [
                  const Icon(Icons.school, size: 16),
                  const SizedBox(width:4),
                  Text('Niveau $level'),
                ],),
              ]
              ),
            ),
          ]
        ),//pour les element cote a cot 
      ),
    );

  }
}