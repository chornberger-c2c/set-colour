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

kubectl create namespace cert-manager

helm repo add jetstack https://charts.jetstack.io

helm repo update

helm install   cert-manager jetstack/cert-manager   --namespace cert-manager   --version v0.15.1   --set installCRDs=true

kubectl apply -f setcolour.yaml

kubectl apply -f service.yaml

kubectl apply -f ingress.yaml

kubectl apply -f cert-staging.yaml cert.yaml tls-staging.yaml tls.yaml


**TODO**

- Helm, ArgoCD
