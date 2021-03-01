FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["NewAspNetCoreApp.csproj", "./"]
RUN dotnet restore "NewAspNetCoreApp.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "NewAspNetCoreApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "NewAspNetCoreApp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "NewAspNetCoreApp.dll"]
