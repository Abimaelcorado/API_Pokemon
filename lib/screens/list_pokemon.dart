import 'package:flutter/material.dart';
import '../api/api_pokemon.dart';
import '../models/pokemons.dart';
import '../screens/detalhe_pokemon.dart';

// PokemonsList(pokemons: snapshot.data!);

class MyHomePage extends StatefulWidget {

  final String title;

  const MyHomePage({Key? key, required this.title, }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        backgroundColor: Color.fromARGB(255, 154, 69, 194),
      ),
      body: FutureBuilder<List<Dados>>(
        future: dados(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PokemonsList(pokemons: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PokemonsList extends StatelessWidget {
  const PokemonsList({Key? key, required this.pokemons}) : super(key: key);

  final List<Dados> pokemons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 238, 238),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(0, 184, 184, 184),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network("${pokemons[index].img}"),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nome: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Text("${pokemons[index].name}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 10,),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detalhe_pokemon(
                                    img_pokemon: '${pokemons[index].img}',
                                    numero_pokemon: '${pokemons[index].num}',
                                    nome_pokemon: '${pokemons[index].name}',
                                    altura_pokemon: '${pokemons[index].height}',
                                    peso_pokemon: '${pokemons[index].weight}',
                                    tipo_pokemon: '${pokemons[index].type}',
                                    fraquezas_pokemon: '${pokemons[index].weaknesses}',
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 183, 146, 189),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.catching_pokemon,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Ver mais",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ), 
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
