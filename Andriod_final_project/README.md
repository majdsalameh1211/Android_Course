## 🤝 Team Collaboration Instructions

1. Clone the repository by running:  
`git clone https://github.com/majdsalameh1211/Android_Course.git`  
Then go into the project folder:  
`cd Android_Course`

2. Create a new branch to work on by running:  
`git checkout -b project2_dev`  
(Replace `project2_dev` with any name you want for your feature branch.)

3. Inside the project folder, create a new subfolder called `Android_Project2/` and do all your work inside it. Do **not** touch or modify the existing `lec_6/` folder, as it is already complete.

4. After you've made changes and added files in `Android_Project2/`, save them to Git by running:  
`git add .`  
Then commit your changes:  
`git commit -m "Initial work on Project 2"`  
Then push your branch to GitHub:  
`git push origin project2_dev`

5. If other changes are made to the main branch while you are working, update your branch before merging by running:  
`git pull origin main --rebase`

--> merging with main branch

7. Once your part of the project is complete and tested, switch back to the main branch by running:  
`git checkout main`  
Then merge your work into it:  
`git merge project2_dev`

8. Finally, push the updated main branch to GitHub:  
`git push origin main`

💡 Make sure your work stays isolated in the `Android_Project2/` folder and that you do not modify or delete any files from the `Android_final_project/` directory. 


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





