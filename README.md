# 🎬 Sypto - OMDb Movie Explorer

[![Flutter](https://img.shields.io/badge/flutter-v3.16-blue)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Sypto is a movie discovery app built with Flutter that uses the [OMDb API](https://www.omdbapi.com/) to let users search for movies, view trending titles, and explore detailed movie information in a clean and responsive UI.

---

## 🚀 Features

- 🔍 **Search by Title** – Users can search any movie title and get instant results.
- 🏠 **Trending Movies** – Displays a list of default popular movies on the home screen.
- 🎞️ **Detailed Movie View** – Poster, genre, runtime, rating, plot, and more.
- 📱 **Responsive UI** – Fully responsive layout for mobile and tablet devices.
- 📜 **Infinite Scroll / Pagination** – Automatically fetch more results as the user scrolls.
- 🖼️ **Movie Posters** – High-quality poster display from OMDb.
- 🌙 **Dark Mode Support** – Adapts to your device's theme.

---

## 📸 Screenshots

> _Add screenshots here for better visual understanding of your app._

| Home Screen                     | Search Results                   | Movie Details                  |
|--------------------------------|----------------------------------|-------------------------------|
| ![home](screenshots/home.png) | ![search](screenshots/search.png) | ![detail](screenshots/detail.png) |

---

## 🛠️ Tech Stack

- **Flutter** – UI toolkit for building cross-platform apps
- **OMDb API** – Open Movie Database for movie data
- **http** – For RESTful API communication
- **Provider (optional)** – For future state management
- **Material Design** – For a native-looking, intuitive UI

---

## 📦 Installation

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A valid [OMDb API Key](https://www.omdbapi.com/apikey.aspx)

### Steps

```bash
# 1. Clone the repository
git clone https://github.com/your-username/sypto.git
cd sypto

# 2. Get packages
flutter pub get

# 3. Add your OMDb API key
# Open lib/services/api_service.dart and replace the placeholder
static const String apiKey = 'your_api_key';

# 4. Run the app
flutter run
