RecordNow.me
===========================

## Intro
[RecordNow.me](http://RecordNow.me) is a demo of [OpenTok](http://tokbox.com)'s standalone archiving feature. Create a recorder object, record a message, and retrieve the download url for the video that you recorded.

## Demo
[http://recordnow.me]()

## Run the code
First, make sure you have the necessary ruby gems
`bundle install`

Next, run the ruby file. 
`ruby app.rb` or `shotgun app.rb`  

## File Description
`Gemfile`, `Gemfile.lock`, and `Procfile` are used to deploy to [heroku](http://heroku.com).  
`app.rb` is the server code to generate token and retrieve download url.  
`views/main.erb` contains the javascript code to create a recorder object and retrieve download url.  
`public/stylesheets/style.css` contains the stylesheets for the site  

## Contact
For questions about the OpenTok API, contact [support@tokbox.com](mailto:support@tokbox.com)

# Happy Coding!

