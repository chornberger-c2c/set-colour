**DB table creation:**

create table colour(id integer primary key autoincrement, background varchar(255));


**Setting a new background colour:**

curl -X POST -H "Content-Type: application/json" -d '{"background":"green"}' https://URL/background


**Docker**

docker run -d -p 5000:5000 --restart=always --name registry registry:2

docker build -t setcolour .

docker run setcolour

docker commit $(docker ps | awk '/apachectl/ { print $1 }') setcolour

docker tag setcolour localhost:5000/horni/setcolour

docker push localhost:5000/horni/setcolour


**Kubernetes**

kubectl apply -f setcolour.yaml

kubectl apply -f service.yaml

kubectl apply -f ingress.yaml

**TODO**

- Helm, ArgoCD
