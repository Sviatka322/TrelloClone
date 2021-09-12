FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build-env
WORKDIR /app

COPY *.csproj ./
COPY /Migrations/Setup.sh Setup.sh

RUN dotnet tool install --global dotnet-ef --version 3.1.1
ENV PATH="${PATH}:~/.dotnet/tools"
ENV ASPNETCORE_ENVIRONMENT Production
RUN dotnet restore "./TrelloClone.csproj"
COPY ./ ./

WORKDIR "/app"

RUN dotnet ef migrations add InitialMigrations -v

RUN chmod +x ./Setup.sh
CMD /bin/bash ./Setup.sh
