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

💡 Make sure your work stays isolated in the `Android_Project2/` folder and that you do not modify or delete any files from the `Android_final_project/` directory. Ask Majd before merging if you're not sure. Avoid using `--force` unless you're absolutely certain.
