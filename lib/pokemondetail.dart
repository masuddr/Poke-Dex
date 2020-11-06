import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';

class PokemonDetail extends StatelessWidget {

  final Pokemon pokemon;

  PokemonDetail({this.pokemon});


  bodyWidget(context) => Stack(
    children: [
      Positioned(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10.0,
        top: MediaQuery.of(context).size.height * 0.1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 70.0,),
              Text(pokemon.name,style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
              ),),
              Text("Height: ${pokemon.height}",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("Weight: ${pokemon.weight}",style: TextStyle(fontWeight: FontWeight.bold),),
              Text("Types",style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                  pokemon.type.
                  map((t) => FilterChip(backgroundColor: Colors.purpleAccent,label: Text(t),onSelected: (b){},)).toList()
                ,
              ),
              Text("Weakness",style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                pokemon.weaknesses.
                map((w) => FilterChip(backgroundColor:Colors.red,label: Text(w),onSelected: (b){},)).toList()
                ,
              ),
            ],
          ),
        ),),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(tag: pokemon.img,child: Container(
          height: 180.0,
            width: 180.0,
          decoration: BoxDecoration(
            image: DecorationImage(image:NetworkImage(pokemon.img),fit: BoxFit.cover)
          ),
        ),),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(pokemon.name),
      ),
      body: bodyWidget(context),
    );
  }
}
