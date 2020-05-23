#created some seed data to test associations
#CREATE USERS

shar = User.create(name: "Shar", email: "sg@sg.com", password: "testpassword")
nae = User.create(name: "Nae", email: "nae@nae.com", password: "testpassword")

#create discussion post

PostDiscussion.create(topic: "Sinatra Project", content: "How did your sinatra project go? Let's discuss some wins and some losses", date: "May 23rd 2020", user_id: shar.id)
PostDiscussion.create(topic: "Time management", content: "What are some ways you manage time while working fulltime during coding bootcamp?", date: "May 23rd 2020", user_id: nae.id)

