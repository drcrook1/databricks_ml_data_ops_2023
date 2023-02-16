az deployment sub create --template-file ./biceps/main-deployment.bicep --location eastus --parameters resourcePrefix=dacrook

curl --netrc -X POST \
https://adb-1234567890123456.7.azuredatabricks.net/api/2.0/clusters/create \
--data @create-cluster.json