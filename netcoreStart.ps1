dotnet new webapi -o NewAspNetCoreApp --no-https
#http://localhost:5000/weatherforecast
docker build -t imgnewnetcoreapp:v1 .
docker run -it --rm -p 8080:80 imgnewnetcoreapp:v1
#http://localhost:8080/weatherforecast

#K8s commands
kubectl config get-contexts
kubectl apply -f .\deployment.yml
kubectl get deployments
kubectl get pods
kubectl logs newnetcoreapp-8c79b699d-rb249
#services and WHY!!
kubectl apply -f .\service.yml
kubectl get services

kubectl delete svc newnetcore-service