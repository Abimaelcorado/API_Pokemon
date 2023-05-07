import 'package:flutter/material.dart';
import '../api/api_pokemon.dart';
import '../models/pokemons.dart';

class Detalhe_pokemon extends StatelessWidget {

  final String img_pokemon;
  final String numero_pokemon;
  final String nome_pokemon;
  final String altura_pokemon;
  final String peso_pokemon;
  final String tipo_pokemon;
  final String fraquezas_pokemon;

  const Detalhe_pokemon(
    {
      required this.img_pokemon,
      required this.numero_pokemon,
      required this.nome_pokemon,
      required this.altura_pokemon,
      required this.peso_pokemon,
      required this.tipo_pokemon,
      required this.fraquezas_pokemon,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Detalhes do pokemon")),
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
            return PokemonsDetalhes(
              img: img_pokemon,
              numero: numero_pokemon,
              nome: nome_pokemon,
              altura: altura_pokemon,
              peso: peso_pokemon,
              tipo: tipo_pokemon,
              fraquezas: fraquezas_pokemon,
            );
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

class PokemonsDetalhes extends StatelessWidget {

  final String img;
  final String numero;
  final String nome;
  final String altura;
  final String peso;
  final String tipo;
  final String fraquezas;


  PokemonsDetalhes(
    {
      required this.img,
      required this.numero,
      required this.nome,
      required this.altura,
      required this.peso,
      required this.tipo,
      required this.fraquezas,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(img),
                      backgroundColor: Color.fromARGB(0, 255, 255, 255),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7),
                child: Row(
                  children: [
                    Text(
                      "Nome: ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      nome,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7),
                child: Row(
                  children: [
                    Text(
                      "Numero: ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      numero,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7),
                child: Row(
                  children: [
                    Text(
                      "Altura: ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      altura,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7),
                child: Row(
                  children: [
                    Text(
                      "Peso: ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      peso,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7),
                child: Row(
                  children: [
                    Text(
                      "Tipo: ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      tipo,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 7),
                child: Row(
                  children: [
                    Text(
                      "Fraquezas: ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      fraquezas,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}