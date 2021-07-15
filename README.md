# dockscan
dockscan  
usage:

docker build -t sudo-phantom/dockscan .

to copy files after scan runs:
docker ps
docker cp <container-id>:/data .
