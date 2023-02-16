docker stop dbopsiac
docker rm dbopsiac
docker build -t dbopsiac .
docker run -it --name dbopsiac --env-file ./terraform/dev.env -v ~/projects_data/dbopsiac:/mnt/ dbopsiac