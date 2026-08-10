# 🚀 API Calls & Clean Architecture in Flutter

A Flutter application built with a strong focus on **Clean Code principles** and maintainable architecture. This project demonstrates how to seamlessly handle RESTful APIs, manage UI states, and integrate engaging visual elements like animated text.

## 🌟 Core Focus: Clean Architecture & Maintainability
The primary goal of this project is to showcase writing clean, scalable, and readable code. 
- **Separation of Concerns:** Strict separation between Business Logic, Data Layer (API Services), and the UI Layer.
- **Robust State Handling:** Efficient management of API states (Loading, Success, and Error) preventing UI freezing or unhandled exceptions.
- **Reusable Components:** Extracting UI elements into separate, reusable widgets to keep the main screens clean and readable.

## 📸 App Features & Screenshots

### 1. Smooth Loading State
Delivering a seamless UX while fetching data from the server (API) by displaying a clean loading indicator instead of freezing the screen.

<img width="497" height="1054" alt="1" src="https://github.com/user-attachments/assets/51e79184-57a4-4853-a371-dc6e15bdea68" />

### 2. Responsive Grid View
Once data is fetched, characters are displayed in a neat grid layout with smooth scrolling, emphasizing clear character images and names.

<img width="523" height="1059" alt="2" src="https://github.com/user-attachments/assets/3c36f6dc-307f-40f3-a330-482ceffedf9b" />

### 3. Real-time Search & Filtering
A powerful search feature that filters data and updates the UI in real-time as the user types (e.g., searching for "a"), reflecting robust state management.

<img width="502" height="1038" alt="3" src="https://github.com/user-attachments/assets/929df3a4-1e27-4fea-8171-6f41c03dac0b" />
<img width="504" height="1061" alt="6" src="https://github.com/user-attachments/assets/7aee0d43-8780-478e-883e-ef966deba914" />

### 4. Detailed Character View
Tapping a character navigates smoothly to a details screen, displaying comprehensive data retrieved from the API (Status, Species, Gender) along with visually appealing location/dimension details.

<img width="513" height="1073" alt="4" src="https://github.com/user-attachments/assets/e7c09884-605c-415e-95da-4b1b845f55a7" />
<img width="486" height="1057" alt="5" src="https://github.com/user-attachments/assets/e841586e-4be7-470b-a383-667b4343ec51" />

### 🎥 App Demo Video

<video src="https://github.com/TahaKospar/ApiCalls/raw/main/screanshots/ToDoApp.mp4" width="600" controls autoplay muted></video>

## 🛠️ Tech Stack
- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** Dart
- **Key Packages:** 
  - `animated_text_kit` (For UI animations)
  - `http` / `dio` (For network requests)
  - `flutter_bloc` (State Management)

## 🚀 How to Run the App

1. Clone the repository:
   ```bash
   git clone [https://github.com/TahaKospar/ApiCalls.git](https://github.com/TahaKospar/ApiCalls.git)
