import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokedex/pokemon.dart';
import 'package:pokedex/pokemondetail.dart';

void main()=> runApp(MaterialApp(
  title: "PokeDex",
  debugShowCheckedModeBanner: false,
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeHub pokedex;
  var url = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async{

    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    pokedex = PokeHub.fromJson(decodedJson);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokéDex'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: pokedex == null?Center(child: CircularProgressIndicator(),): GridView.count(crossAxisCount: 2,children: pokedex.pokemon.map((poke) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PokemonDetail(pokemon: poke,)));
          },
          child: Hero(
            tag: poke.img,
            child: Card(
              elevation: 3.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(poke.img))
                  ),
                ),
                Text(poke.name,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)
              ],
            ),
            ),
          ),
        ),
      )).toList(),),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.red,
      ),
    );
  }
}
