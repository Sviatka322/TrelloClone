#!/bin/bash

set -e

until /root/.dotnet/tools/dotnet-ef database update --no-build; do
>&2 echo "SQL Server is starting up"
sleep 2
done

>&2 echo "SQL Server is up - executing command"

/root/.dotnet/tools/dotnet-ef database update
