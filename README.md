# Autocomplete Widget Presentation

**Project Description:** A Flutter **Autocomplete** widget demo that shows **type-ahead suggestions** for Name and Country fields.

## Screenshot

![Autocomplete demo screenshot](https://raw.githubusercontent.com/Emma001code/Autocomplete-Widget-Presentation/main/assets/screenshots/Autocompleteimg.png)

## How to run

```bash
git clone https://github.com/Emma001code/Autocomplete-Widget-Presentation.git
flutter pub get
flutter run
```

Optional (web):

```bash
flutter run -d chrome
```

Optional (Android/iOS emulator or physical device):

```bash
flutter devices
flutter run -d <device-id>
```

## What to look for in the demo

- **Name**: start typing (e.g., `em`) to see suggestions filter live
- **Country**: start typing (e.g., `gh`) to see suggestions filter live

## The three Autocomplete attributes

This project demonstrates these three `Autocomplete<String>` properties:

- **`optionsBuilder` : receives the current `TextEditingValue` and returns a filtered list of options to display.
- **`fieldViewBuilder` : builds the text field UI (we use it to set the controller/focus and apply hint + underline styling).
- **`displayStringForOption` : controls how each option is shown in the dropdown (here it’s just the option string).
