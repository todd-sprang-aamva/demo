$region = 'eastus'
$rg = 'tcs-demo-dev-rg'
$svcPlan = 'tcs-demo-svcplan-dev'
$webApp = 'tcs-demo-webapp-dev-01'
$aciWebApp = 'tcs-demo-webapp-dev-02'

az login

az group list

az group create `
    -l $region `
    -n $rg

az appservice plan create `
    -g $rg `
    -n $svcPlan `
    --is-linux `
    --number-of-workers 1 `
    --sku S1

az webapp create `
    -g $rg `
    -p $svcPlan `
    -n $webApp `
    --% --runtime "DOTNETCORE|3.0"

az container create `
    -g $rg `
    -l $region `
    -n $aciWebApp `
    --image nginx `
    --cpu 1 `
    --memory 1.5 `
    --ip-address Public
