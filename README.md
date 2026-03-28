# 🚀 Space Legends

**Space Legends** is a high-performance mobile game built entirely with **Flutter**, bypassing traditional game engines like Flame to leverage the full power of Flutter's reactive framework and hardware integration.

The player controls a starfighter using real-time **Device Motion Sensors (Accelerometer)**, creating a physical, immersive link between the player's movements and the ship's flight path.

---

## 🛠 Tech Stack & Architecture

Unlike most Flutter games that rely on the Flame Engine, **Space Legends** was developed using a "Pure Flutter" approach. This decision was made to demonstrate how advanced animations and 3D-like transformations can be achieved using the standard Flutter SDK.

### Why No Flame Engine?
* **Granular Control:** Direct manipulation of the **Canvas API** via `CustomPainter` for projectiles and special effects.
* **Widget-Based Game Loop:** Utilizing `StreamBuilder` and `AnimationControllers` to handle game states, proving that Flutter's reconciliation algorithm is fast enough for 60FPS gaming.
* **Lightweight Footprint:** By avoiding heavy external game libraries, the app remains small, fast to load, and easy to maintain using standard Flutter patterns.



---

## 🧠 Key Features & Engineering Challenges

### 🛰 Sensor-Based Navigation
The core mechanic uses the `sensors_plus` package. The challenge was mapping raw accelerometer data ($m/s^2$) to a smooth 3D tilting effect.
* **Math:** Implemented a `clamp` logic to limit the ship’s rotation to $45^\circ$, preventing "infinite spinning" and ensuring a stable UI.
* **Logic:** $Rotation = \text{clamp}(\text{axisY} \times \text{sensitivity}, -0.785, 0.785)$.

### ☄️ Pure Flutter Rendering
* **Custom Graphics:** All laser beams and particle effects are rendered using `CustomPaint`, reducing the need for heavy image assets.
* **3D Transformations:** Using `Matrix4` transformations to create a "2.5D" perspective, giving depth to the spaceship and its movements.

### 🏗 State Management (Modular & BLoC)
The game logic is decoupled from the UI using **Flutter Modular** for Dependency Injection and **BLoC** for the game loop.
* **Streams:** The shooting mechanics and enemy spawns are handled via reactive streams, ensuring the UI only repaints when necessary.

---

## 📱 How to Play
1.  **Tilt your device** left or right to steer the ship.
2.  **Tap the screen** to fire your plasma cannons.
3.  **Dodge** the incoming enemy saucers to stay alive!

---

## 🏗 Installation & Setup
1.  Ensure you have **Flutter 3.x** installed.
2.  Clone this repository.
3.  Run `flutter pub get`.
4.  **Important (iOS):** This project requires physical hardware for the accelerometer. Ensure you have a valid `NSMotionUsageDescription` in your `Info.plist`.



https://github.com/user-attachments/assets/4193e8ff-397d-4be5-93dd-236ba1675f7a



