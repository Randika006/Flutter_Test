
import 'dart:convert';

import 'package:flutter/material.dart'; 
import 'package:flutter/services.dart' show rootBundle; 

void main() { 
runApp(const MyApp()); 
} 

class MyApp extends StatefulWidget {
  const MyApp({super.key});
 
@override 
State<MyApp> createState() => _MyAppState(); 
} 

class _MyAppState extends State<MyApp> { 
// ignore: prefer_typing_uninitialized_variables
var jsonData; 
Future<void> loadJsonAsset() async { 
	final String jsonString = await rootBundle.loadString('assets/data/ecom.json'); 
	var data = jsonDecode(jsonString); 
	setState(() { 
	jsonData = data; 
	}); 
} 

@override 
void initState() { 
	super.initState(); 
	loadJsonAsset(); 
} 

@override 
Widget build(BuildContext context) { 
	return MaterialApp( 
	title: 'Ecommerce App', 
	debugShowCheckedModeBanner: false, 
	theme: ThemeData(primarySwatch: Colors.green), 
	home: Scaffold( 
		appBar: AppBar( 
		title: const Text('Load Assets Json'), 
		), 
		body: Center( 
			child: jsonData != null 
				? Column( 
					mainAxisAlignment: MainAxisAlignment.center, 
					children: [Text(jsonData['name']), Text(jsonData['handler']),Text(jsonData['description']), Text(jsonData['category']),Text(jsonData['price']),Text(jsonData['images'])], 
				) 
				: const CircularProgressIndicator()), 
	), 
	); 
} 
} 
