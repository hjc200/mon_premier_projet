import 'package:flutter/material.dart';
//import 'dart:math';
class person{
  const person(this.name, this.role, this.phone, this.email, this.level);
  final String name;
  final String role;
  final String phone;
  final String email;
  final String level;
    
}
void main() => runApp(const CardApp());
//StatelessWidget le widget qui ne change pas d'etat
const people = [
  person('hangabn jean claude','etudiant en software engineering DE ICT UNIVERSITY DU CAMEROUN ','+237 659 41 34 86','hangban.jean@ictu.edu.cm','3'),
  person('Gilbert fox','etudiant en computer science','+237 699 92 89 99','gilbert.fox@ictu.edu.cm','2'),
  person('EMMA WILSONN','etudiante en cyber security','+237 689 99 19 29','emma.wilson@ictu.edu.cm','1'),
  person('Carl WINSLO', 'etudiant en robotique', '+237 690 89 89 09', 'carl.winsli@ictu.edu.cm', '4'),
  person('SHIN ARSTON', 'etudiant en data science', '+237 650 58 89 09', 'shin.arston@ictu.edu.cm', '5'),
];
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
        body: ListView.builder(
          padding: const EdgeInsets.all(16),//ici on a la marge de bordure sur les 4 coter
          itemCount:5,//le nombre de carte a afficher
          itemBuilder:(context, index) {
            //on cree une liste de personne avec des information differente
            final p = people[index];
              return ProfileCard(
                name: p.name,
                role: p.role,
                phone: p.phone,
                email: p.email,
                level: p.level,
              );
          },
         )
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
              child:  Column(//un element sur l'autre et alignement
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: textTheme.titleLarge),
                Text(role,overflow:TextOverflow.ellipsis),
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