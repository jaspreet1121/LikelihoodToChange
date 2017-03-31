library(shiny)

function(input, output) {
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, it will be a data frame with 'name',
    # 'size', 'type', and 'datapath' columns. The 'datapath'
    # column will contain the local filenames where the data can
    # be found.
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    a<-read.csv(inFile$datapath, header=input$header, sep=input$sep, 
             quote=input$quote)
    b<-a[c(2,4,30,32)]
    b$ch<-0
    c<-data.frame(position=c("Research","Student","B.Tech","B Tech","BA","B.A.","Guest"),score=c(9,9,9,9,9,9,9))
    d<-data.frame(position=c("Intern","Volunteer","PhD","Ph.D","Casual Staff"),score=c(8,8,8,8,8))
    e<-data.frame(position=c("Tutor","Captain","Secretary","Fellow","Member","General Secretary","Resident","Trainee","Freelance","Coordinator","Co-ordinator","Mentor"),score=c(7,7,7,7,7,7,7,7,7,7,7,7))
    f<-data.frame(position=c("Engineer","engineer","Engg","Analyst","Architect","Data Scientist","Developer","Associate","Strategist","Expert","Leader","Post Doc","Assistant","Teacher","Creator","Maintainer","Debator","Actor","Actress"),score=c(6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6))
    g<-data.frame(position=c("Clerk","Originator","Governor","Mentor","Expert","Innovator","Organiser","Doctor","Nurse","Registrar","Physician","Specialist","Geophysicist","Physicist","Developer","Dev","Programmer","Representative","Head","Designer","Lead","Professional","Recruiter","Data Analyst","Data Engineer","Consultant","Faculty"),score=c(5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5))
    h<-data.frame(position=c("Advisor","Chief of Staff","Chief","CTO","Chief Technical Officer","Principal","Talent Acquisition","Professor","Chief of Strategy","Chief of Research","Executive","Execution","Specialist","Advisory","Pharmacist","Editor","Journalist","HR","Human Resource","Recruiter","Representative","Ambassador"),score=c(4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4))
    i<-data.frame(position=c("Scientist","Manager","VP","Vice President","Surgeon","Treasurer"),score=c(3,3,3,3,3,3))
    j<-data.frame(position=c("Director","CEO","Chief Executive Officer","Founding","General Manager","Dean","Administrator","Creator"),score=c(2,2,2,2,2,2,2,2))
    k<-data.frame(position=c("Chairman","Founder","Cofounder","Co Founder","Co-Founder","Co-founder","Owner"),score=c(1,1,1,1,1,1,1))
    l<-rbind(c,d,e,f,g,h,i,j,k)
    for(i in 1:nrow(l)){
         a<-grep(l$position[i],b$Job.Title)
         b$ch[a]<-l$score[i]
    }
    m<-data.frame(add=c("Senior","Associate","Junior","Assistant"),factor=c(-1,1,1,1))
    for(i in 1:nrow(m)){
      a<-grep(m$add[i],b$Job.Title)
      b$ch[a]<-m$factor[i]+b$ch[a]
    }
    names(b)[5]<-"Likelihood.to.change"
    
    b
  })
}
