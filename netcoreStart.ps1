dotnet new webapi -o NewAspNetCoreApp --no-https
#http://localhost:5000/weatherforecast
docker build -t imgnewnetcoreapp:v1 .
docker run -it --rm -p 8080:80 imgnewnetcoreapp:v1
#http://localhost:8080/weatherforecast