Redcap
====================================
This tutorial describes how to access Redcap datasets using functionality in `motionTools`.

## Managing secrets
1. Request an API token from the Redcap instance.
    * *The API token is essentially a password. It should never be synced to github or similar.*
2. Store the API token in an .Renviron file in your project directory. The `.gitignore` file in `motionTools` is configured so that this file is ignored by any sync requests.
3. When downloading reports, the report ID can be obtained in the *API playground* section of the Redcap instance:
    * [screenshot](https://github.com/jlucasmckay/motionTools/blob/main/media/secrets.png)
4. Supply your API token and this report ID to the ReadRedcapReport() function.
