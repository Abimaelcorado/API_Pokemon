import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemons.dart';

Future <List<Dados>> dados() async {
  final List<dynamic> result = await fetchUsers();
  //print(result);
  List<Dados> pokemons;
  pokemons = (result).map((pokemon) => Dados.fromJson(pokemon)).toList();
  return pokemons;
}

const String url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
    
Future <List<dynamic>> fetchUsers() async {
  var result = await http.get(Uri.parse(url));
  return jsonDecode(result.body)['pokemon'];
}