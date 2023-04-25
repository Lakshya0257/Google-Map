# Google-Map
# Flutter Google Map

A basic Google Map application built with Flutter that displays the user's current location along with the corresponding address on the map.

## Features

- Displays a Google Map with the user's current location marked with a marker.
- Shows the user's current address in an info window when the marker is tapped.
- Utilizes Flutter's built-in location package to access the user's location.
- Utilizes Google Maps API to display the map and geocode the user's address.

## Screenshots

![Flutter Google Map Screenshot](screenshot.png)

## Installation

1. Clone the repository to your local machine using the following command:
2. Navigate to the project directory:
3. Install the dependencies by running the following command:
4. Ensure that you have a valid Google Maps API key. If you don't have one, you can get it from the [Google Cloud Console](https://console.cloud.google.com/).
5. Replace the placeholder `YOUR_API_KEY` in the `android/app/src/main/AndroidManifest.xml` file with your actual Google Maps API key.
6. Run the application on an emulator or a physical device using the following command:


## Usage

- The application will start with a Google Map centered on the user's current location.
- The user's current location will be marked with a marker on the map.
- Tapping on the marker will display an info window with the user's current address.

## Dependencies

- [flutter](https://pub.dev/packages/flutter) - The core Flutter framework.
- [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) - A Flutter plugin for embedding Google Maps into a Flutter application.
- [geolocator](https://pub.dev/packages/geolocator) - A Flutter plugin for accessing the device's location.
- [geocoding](https://pub.dev/packages/geocoding) - A Flutter plugin for geocoding and reverse geocoding.

## Contributing

If you would like to contribute to this project, feel free to submit a pull request. Please make sure to follow the [contributing guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

- This project was inspired by the official Google Maps documentation and the Flutter community.
- Special thanks to the authors and contributors of the used Flutter plugins for their hard work and dedication.

