#!/bin/bash
echo "destroying demo skg"
read -r -p "Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    terraform destroy --auto-approve
    export VES_P12_PASSWORD=""
else
    echo "canceling"
fi
