import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'dart:convert';

import 'package:flutter/services.dart';

import '../data/models/content.dart';

final getIt = GetIt.instance;
final talker = TalkerFlutter.init();

Future<void> setupLocator() async {
  getIt.registerSingleton<Talker>(talker);
  final text = await rootBundle.loadString('assets/data/recipes.json');
  final json = jsonDecode(text) as Map<String, dynamic>;
  final samples = (json['recipes'] as List)
      .map((item) => Content.fromJson(item as Map<String, dynamic>))
      .toList();
  getIt.registerSingleton<List<Content>>(samples);
}
