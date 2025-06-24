# 📚 Educational Kids Book App (Flutter)

A beautiful, responsive Flutter app designed to provide children with age-appropriate educational books. Users can choose books by age group and format (Word or PDF), download them with a smooth UI interaction, and open them when ready.

---

## 📦 Features Implemented

### ✅ Age Group Selection
- Home screen displays **3 age groups**: 0–4, 4–8, 8–12.
- Each option is represented as a **stylized card with background image**.
- Tapping an age group navigates to a book list.

### ✅ Book Format Toggle
- At the top of each book list screen, users can toggle between:
  - **Word books**
  - **PDF books**
- Switch is placed inside a **custom-designed AppBar**.

### ✅ Custom AppBar
- A reusable app bar used across screens.
- Rounded bottom corners, app logo, and theme-aware styling.
- **Dark mode support**: light blue in light mode, bold deep blue in dark mode.
- Contains toggle switch and action icons.

### ✅ BookTile Widget
- Displays book title, icon, and **a smart action button**:
  - Initial: `GET`
  - On tap: animates a **one-time circular progress ring with stop icon**
  - After download: `OPEN` button appears
- Responsive to **light/dark mode**, with different background and text colors.

### ✅ Upload Book Button
- Positioned at the **center bottom** of the screen.
- Matches AppBar color in both light and dark modes.
- Placeholder for future functionality: will open file picker and upload to Firebase.

---

## 📱 Screens Implemented

### 🏠 Home Screen
- 3 age groups with tappable image cards
- Navigates to the appropriate `BookListScreen`

### 📚 Book List Screen
- Custom AppBar with format toggle
- Displays `BookTile` widgets for Word or PDF
- Upload Book button at bottom center

---

## 🎨 Theme Configuration

The app uses a **global light/dark theme** setup with full support for:

- AppBar color changes
- Book tiles adapting their background & text
- Switch styles and button colors

### 🌞 Light Mode:
- AppBar: Soft light blue (`Color(0xFFB3E5FC)`)
- BookTile background: Light sky blue (`Colors.blue[50]`)
- Text: Dark (`Colors.black87`)
- Upload button: Light blue with dark text

### 🌙 Dark Mode:
- AppBar: Deep blue (`Color(0xFF0D47A1)`)
- BookTile background: Deep blue (`Color(0xFF0D47A1)`)
- Text: White
- Upload button: Deep blue with white text

### 🛠 How Theme is Applied
- `Theme.of(context).brightness` is used to check if dark mode is active
- Based on this, dynamic colors are selected inside:
  - `BookTile` widget
  - Upload button
  - AppBar (`CustomAppBar`)
- The AppBar and buttons share consistent theming via conditional colors





