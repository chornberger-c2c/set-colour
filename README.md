Creating the table:

create table colour(id integer primary key autoincrement, background varchar(255));

For setting a new background colour:

curl -X POST -H "Content-Type: application/json" -d '{"background":"green"}' https://URL/background


