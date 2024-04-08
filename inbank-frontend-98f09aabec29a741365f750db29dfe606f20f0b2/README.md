# InBank Frontend

This project is a frontend application for the InBank loan application service.
It is built using Flutter and communicates with the backend API to
display loan options and handle loan applications.

## Technologies Used
- Flutter 3.19.5
- Dart 3.3.3

## Installing Flutter
Running the application requires having Flutter installed.
It can be installed by following the instructions in the [Flutter documentation](https://docs.flutter.dev/get-started/install) for the Web.

Quick links:
- [Windows installation](https://docs.flutter.dev/get-started/install/windows/web#install-the-flutter-sdk)
- [Linux installation](https://docs.flutter.dev/get-started/install/linux/web)
- [MacOS installation](https://docs.flutter.dev/get-started/install/macos/web)

You can verify your installation by running `flutter doctor`

## Running the application
To run the application, follow these steps:

1. Clone the repository.
2. Navigate to the root directory of the project.
3. Run `flutter pub get` to install the required dependencies.
4. Run `flutter run` to start the application in debug mode.

## Functionality
The InBank Frontend application provides a form for submitting loan applications.
The form consists of two sliders for selecting the loan amount and loan period,
and a text field for entering the national ID number.
The application communicates with the backend API to calculate the approved
loan amount and loan period, which are displayed to the user.

## Components
The application consists of the following main components:

### LoanForm
The LoanForm component displays the loan application form,
including the sliders for selecting the loan amount and loan period
and the text field for entering the national ID number.
It communicates with the backend API to calculate the approved loan amount
and loan period based on the form inputs.

### ApiService
The ApiService component provides methods for making API calls to the backend API.
It sends loan application information to the backend API and receives a response
with the approved loan amount and loan period.
