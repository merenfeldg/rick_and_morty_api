import 'package:flutter/material.dart';
import 'package:rick_and_morty_api/app_widget.dart';
import 'package:rick_and_morty_api/shared/providers/providers.dart';

void main() {
  setupProviders();
  runApp(const AppWidget());
}