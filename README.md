# Garmin FaceClock for fenix6pro

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A modern, feature-rich watch face for Garmin fenix6pro devices, designed with both functionality and aesthetics in mind.

## Features

- **Clean, modern design** with customizable elements
- **Multiple data fields** (steps, heart rate, battery, etc.)
- **Customizable colors** to match your style
- **Low power consumption** optimized for Garmin fenix6pro
- **12/24 hour time format** support
- **Date and day of week** display
- **Battery saver mode** for extended usage

## Screenshots

*Screenshots will be added soon*

## Installation

### Prerequisites
- [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/)
- [Visual Studio Code](https://code.visualstudio.com/) with Monkey C extension
- Garmin Developer Account

### Building the Project
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/GarminFaceClock.git
   ```
2. Open the project in Visual Studio Code
3. Install required dependencies
4. Build and deploy to your device using the Connect IQ SDK

## Configuration

Edit the `monkey.jungle` file to customize build settings for different devices.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter) - your.email@example.com

Project Link: [https://github.com/yourusername/GarminFaceClock](https://github.com/yourusername/GarminFaceClock)

## Acknowledgments

- [Garmin Developer Documentation](https://developer.garmin.com/connect-iq/)
- [Monkey C Language Reference](https://developer.garmin.com/connect-iq/monkey-c/)
- [Connect IQ UI Guidelines](https://developer.garmin.com/connect-iq/ui-panels/)

---

## Przegląd Repozytoriów GitHub do Tworzenia Tarcz Garmin

Na bazie analizy dostępnych repozytoriów GitHub, oto najpraktyczniejsze projekty, które stanowią idealne punkty wyjścia do napisania własnej tarczy:

### **1. AndrewKhassapov/connect-iq - Poradnik dla Początkujących**[^1]

To repozytorium jest **najlepszym punktem wyjścia** dla każdego nowego developera. Zawiera kompletny poradnik "Creating a Garmin watch-face 101" obejmujący:

**Struktura projektu:**

- Instrukcje instalacji Garmin IQ SDK z SDK Manager
- Konfiguracja Visual Studio Code z rozszerzeniem Monkey C
- Generowanie developer key
- Tworzenie projektu z szablonu "Simple Watch Face"

**Kluczowe foldery:**

- `/resources/layouts/layout.xml` - definicja wizualnych elementów tarczy
- `/source/*.mc` - kod Monkey C implementujący funkcjonalność
- Układ współrzędnych: (0,0) w lewym górnym rogu, zakres **([0, screenWidth], [0, screenHeight])**

**Repozytorium zawiera linki do wyspecjalizowanych projektów:**

- Simple Times by winston-de (tarcza analogowa)
- SmartArcs Active by okdar (wskaźniki w formie łuków)
- Garmin Written Watchface by Cutwell (godziny zapisane słowami)


### **2. myneur/late - Zaawansowana Implementacja**[^2]

To jedno z **najbardziej zaawansowanych** otwartych repozytoriów (60 gwiazdek). Zawiera tarcę z integracją Google Calendar i prognozą pogody.

**Kluczowe cechy do nauki:**

- Obsługa wielu metryki aktywności jednocześnie
- Integracja z zewnętrznymi API (Google Calendar, pogoda)
- Zaawansowana optymalizacja pamięci (krytycze dla urządzeń Garmin)
- Skrypty testowania `integrationTests.sh` do automatycznego testowania na wielu urządzeniach (macOS)

**Ważne ostrzeżenie autorów:** Framework Garmin ma ścisłe limity pamięci i jest niestabilny na różnych urządzeniach - projekt demonstruje, jak to rozwiązywać.

### **3. winston-de/Simple-Times - Elegancka Tarcza Analogowa**[^3]

Idealna do nauki **podstawowych technik rysowania analogowych wskazówek:**

- Dostępna w Garmin Connect IQ Store
- Czysty kod dla początkujących
- Zaawansowana wiki z dokumentacją ustawień


### **4. okdar/smartarcsactive - Nowoczesny Design**[^4]

Projekt z **nowoczesnym podejściem do wizualizacji danych** (10 gwiazdek):

- SmartArcs Active - wskaźniki w formie łuków
- SmartArcs Origin - bardziej zaawansowana wersja
- SmartArcs Trip - specjalizowana dla podróży
- Ostatnia aktualizacja: maj 2025


### **5. blotspot/garmin-watchface-protomolecule - Zaawansowany Design**[^5]

Projekt inspirowany serialem "The Expanse" (70 gwiazdek, 23 forki):

**Cechy dla zaawansowanych developerów:**

- Wiele projektów wizualnych (Orbit, Circles, Sleep Mode)
- Obsługiwane pola danych: HR, bateria, kalorie, kroki, minuty aktywne, piętra, notyfikacje, alarmy, stan Bluetooth, Body Battery, poziom stresu
- Custom fonty (zmodyfikowana czcionka DINish)
- Ikony z The Noun Project

**Struktura dla danych:**

- Implementacja wielu wskaźników jednocześnie
- Obsługa trybów snu z konfiguracją godzin


### **6. Kai Hao Blog - Praktyczny Tutorial Implementacji**[^6]

Szczegółowy poradnik pokazujący jak załadować zasoby:

**Zasoby (Resources):**

- **Obrazy**: `/resources/drawables/` z `drawables.xml`
- **Fonty**: `/resources/fonts/` z `fonts.xml`
- Konwersja fontów TTF do formatu Garmin za pomocą BMFont

**Kod Monkey C - Kluczowe metody:**

```
class [WatchFaceName]View extends WatchUi.WatchFace {
  function initialize() { }
  function onLayout() { }
  function onUpdate(dc as Graphics.Dc) { }
}
```

**Pobieranie danych:**

- `System.getClockTime()` - godzina, minuta, sekunda
- `Time.now()` i `Date.info()` - data
- `Activity.getActivityInfo()` - aktualny HR
- `ActivityMonitor.getHeartRateHistory()` - historia HR
- `System.getSystemStats().battery` - procent baterii


### **7. bhugh/ElegantAnalog-Watchface - Optymalizacja Baterii**[^7]

Specjalistyczne podejście do **oszczędzania energii:**

- Tarcza analogowa z ruchomą sekundnikiem
- Inteligentne opcje wyświetlania sekundnika (1-10 minut po spojrzeniu na zegarek)
- Kilka stylów drugiej ręki z różnym poborem energii
- Wskaźniki wschodu/zachodu słońca (Solar Clock)


### **8. Likenttt/garmin-connectiq-samples-brief-explanations - Kolekcja Przykładów**[^8]

Repozytorium zawierające **115 gwiazdek** - zbiór próbek i wyjaśnień do развития Connect IQ (częściowo po chińsku, ale kod jest uniwersalny).

### **Rekomendowana Ścieżka Nauki:**

1. **Start**: AndrewKhassapov/connect-iq - nauczysz się podstaw setup'u i struktury
2. **Proste projekty**: Simple-Times - zrozumiesz renderowanie analogowe
3. **Zasoby**: Kai Hao blog - jak ładować obrazy, fonty, dane
4. **Zaawansowane**: myneur/late - jak obsługiwać skomplikowaną logikę i optymalizować pamięć
5. **Design**: okdar/smartarcsactive - nowoczesne podejścia do wizualizacji

### **Krytyczne Aspekty do Pamiętania:**[^2]

- **Limity pamięci** - Framework Garmin ma ścisłe ograniczenia, nawet mała zmiana bez optymalizacji pamięci może być nierealna
- **Fragmentacja** - Framework jest podatny na błędy specyficzne dla każdego urządzenia
- **Rozdzielczości ekranów** - Różne urządzenia mają różne rozmiary i technologie ekranu (AMOLED vs LCD)
- **Testowanie** - Zawsze testuj na docelowych urządzeniach, simulator nie jest zawsze wiarygodny

Wszystkie te repozytoria są dostępne do klonowania i analizy kodu, co pozwoli ci szybko nauczyć się konwencji i najlepszych praktyk przy pisaniu własnej tarczy!
<span style="display:none">[^10][^11][^12][^13][^14][^15][^16][^17][^18][^9]</span>

<div align="center">⁂</div>

[^1]: https://github.com/AndrewKhassapov/connect-iq

[^2]: https://www.ottorinobruni.com/getting-started-with-garmin-connect-iq-development-build-your-first-watch-face-with-monkey-c-and-vs-code/

[^3]: https://www.reddit.com/r/Garmin/comments/159btwx/hi_im_josh_i_made_a_website_that_lets_you_build/

[^4]: https://repos.ecosyste.ms/hosts/GitHub/topics/garmin-watchface

[^5]: https://www.youtube.com/watch?v=9-h4vZjGM0A

[^6]: https://www.pocket-lint.com/how-to-create-garmin-watch-faces/

[^7]: https://github.com/blotspot/garmin-watchface-protomolecule

[^8]: https://www.petergundel.de/garmin/2022/08/22/garmin-connect-iq-development-getting-started.html

[^9]: https://mharwood.uk/creating-a-simple-garmin-watch-face/

[^10]: https://github.com/topics/garmin-watchface?l=shell%2F1000\&o=desc\&s=forks

[^11]: https://github.com/winston-de/Simple-Times

[^12]: https://github.com/Cutwell/garmin-written-watchface

[^13]: https://github.com/topics/garmin-connect-iq

[^14]: https://github.com/bhugh/ElegantAnalog-Watchface

[^15]: https://kaihao.dev/posts/Develop-a-Garmin-watch-face

[^16]: https://github.com/topics/garmin-watch

[^17]: https://github.com/tomfogg/garmin-roundedtext

[^18]: https://herold.solutions/blog/2024-08-22-build-your-own-garmin-watchface

