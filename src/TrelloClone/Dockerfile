FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build-env
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore
ENV ASPNETCORE_ENVIRONMENT Production

COPY ./ ./
RUN dotnet publish -c Release -o out -- -v

FROM mcr.microsoft.com/dotnet/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "TrelloClone.dll"]
