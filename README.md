# redstone-cache-service-lightsail

1. From the Lightsail console click `Create Instance`.

1. Choose whichever region you prefer.

1. Under `Select a blueprint` click on `OS Only` and choose the `Ubuntu 20.04 LTS` image.

1. Click on `+ Add launch script`.

1. Enter the following code into the dialog box:

   ```
   curl -o lightsail-setup.sh https://raw.githubusercontent.com/redstone-finance/redstone-cache-service-lightsail/main/lightsail-setup.sh
   chmod +x ./lightsail-setup.sh
   ./lightsail-setup.sh
   ```

   **Note**: To see contents of that script, please [visit the github repository](https://github.com/redstone-finance/redstone-cache-service-lightsail/blob/main/lightsail-setup.sh)

1. Choose the appropriate instance size (min: 1GB, recommended: 2GB)

1. Optionally rename the instance.

1. Click `Create`.

   Lightsail will launch a new instance, copy in our shell script, and execute it on first boot.

   The shell script installs `docker-compose` and launches our instance. Please be patient as it can take more than 10 minutes.

1. Once the instance is up and running you can navigate to its IP address to see the running site.
