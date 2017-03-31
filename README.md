# Likelihood to apply for a Job change

## Aim
To create a simple web app that could compute the "Likelihood to Job Change" score for LinkedIn connections

## Procedure
Since only LinkedIn connections file has to be used for generating the algorithm, it is quite difficult to predict likelihood for job 
change as the .csv file only consists of 5 columns which have data in it. The columns being "First.Name", "Last.Name", "E.Mail", "Company"
and "Job.Title".

The technique I used was hierarchy to predict whether the person would be likely to apply for job change. Since a person at a higher post 
would have worked hard for reaching that goal, it would be difficult for him to leave that post. I researched various hierarchies in 
institutions online for eg. in top management order would be "Chairman" , "Vice President", "Directors" then "CEO" so I gave them points 
according to their higher posts. Since their were some people who have two or more posts in their job title, to deal with them the code starts searching for positions from high score to low score. Then I researched for the post which have frequent job changes and increased their likelihood score. Then I searched for keywords like "Senior", "Junior" etc. in the person's Job.Title and changed the score accordingly.

Had the person's activity been available it would have different and more accurate. The likelihood would have depended on if the person 
like posts with keywords like "recruit", "hire" etc. Since I had to generated the score solely based on the Job.Title, the only way I 
could think of was this. 

### Programming Language
I used R and used Shiny package.

### Web App
To generate the web app I used Shiny Package on Rstudio and hosted the app on shinyapps.io.

### Code 
It consists of two files "ui.R" and "server.R", which have been included in this repositary.
