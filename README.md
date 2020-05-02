**DB table creation:**

create table colour(id integer primary key autoincrement, background varchar(255));


**Setting a new background colour:**

curl -X POST -H "Content-Type: application/json" -d '{"background":"green"}' https://URL/background


**Docker**

sudo docker run -d -p 5000:5000 --restart=always --name registry registry:2

sudo docker build -t setcolour .

sudo docker run setcolour

sudo docker commit e82a40a9c816 setcolour

sudo docker tag setcolour localhost:5000/horni/setcolour

sudo docker push localhost:5000/horni/setcolour


**Kubernetes**

kubectl apply -f setcolour.yaml

kubectl create svc nodeport setcolour --tcp=80

kubectl get svc setcolour


