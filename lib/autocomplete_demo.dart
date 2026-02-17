import 'package:flutter/material.dart';

/// Demo screen showing Flutter's [Autocomplete] widget with Name and Country
/// fields that filter suggestions as the user types.
class AutocompleteDemo extends StatelessWidget {
  const AutocompleteDemo({super.key});

  /// Fixed list of names. [optionsBuilder] filters this by the current input.
  static const List<String> _kNames = [
    'Emmanuel',
    'Faith',
    'Andrew',
    'Samiratu',
    'Chibuikem',
  ];

  /// Fixed list of countries. [optionsBuilder] filters this by the current input.
  static const List<String> _kCountries = [
    'United States',
    'Ghana',
    'Kenya',
    'South Africa',
    'Egypt',
    'Rwanda',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autocomplete Form'),
        backgroundColor: Colors.deepOrange.shade700,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        children: [
          // ----- Email: plain text field (no autocomplete) -----
          const Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              border: UnderlineInputBorder(),
            ),
          ),
          const SizedBox(height: 28),
          // ----- Name: Autocomplete over _kNames -----
          const Text('Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Autocomplete<String>(
            // Required: return options that match the current text.
            optionsBuilder: (TextEditingValue value) {
              final query = value.text.toLowerCase();
              if (query.isEmpty) return const Iterable<String>.empty();
              return _kNames.where((String option) =>
                  option.toLowerCase().contains(query));
            },
            // Optional: how each option appears in the dropdown.
            displayStringForOption: (String option) => option,
            // Optional: custom text field (controller, focus, styling).
            fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                onSubmitted: (_) => onFieldSubmitted(),
                decoration: const InputDecoration(
                  hintText: 'Write your name',
                  border: UnderlineInputBorder(),
                ),
              );
            },
          ),
          const SizedBox(height: 28),
          // ----- Country: Autocomplete over _kCountries -----
          const Text('Country', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue value) {
              final query = value.text.toLowerCase();
              if (query.isEmpty) return const Iterable<String>.empty();
              return _kCountries.where((String option) =>
                  option.toLowerCase().contains(query));
            },
            displayStringForOption: (String option) => option,
            fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
              return TextField(
                controller: controller,
                focusNode: focusNode,
                onSubmitted: (_) => onFieldSubmitted(),
                decoration: const InputDecoration(
                  hintText: 'Input your country',
                  border: UnderlineInputBorder(),
                ),
              );
            },
          ),
          ],
      ),
    );
  }
}
