**DB table creation:**

create table colour(id integer primary key autoincrement, background varchar(255));


**Setting a new background colour:**

curl -X POST -H "Content-Type: application/json" -d '{"background":"green"}' https://URL/background


**Docker**

docker run -d -p 5000:5000 --restart=always --name registry registry:2

docker build -t setcolour .

docker run setcolour

docker commit e82a40a9c816 setcolour

docker tag setcolour localhost:5000/horni/setcolour

docker push localhost:5000/horni/setcolour

**Container for Github**

cat .token | sudo docker login docker.pkg.github.com --username horni23 --password-stdin

sudo docker tag setcolour docker.pkg.github.com/horni23/set-colour/setcolour:2.0

sudo docker push docker.pkg.github.com/horni23/set-colour/setcolour:2.0

**Kubernetes**

kubectl apply -f setcolour.yaml

kubectl create svc nodeport setcolour --tcp=80

kubectl get svc setcolour

**TODO**

- include service nodeport in setcolour.yaml

- Helm, ArgoCD
