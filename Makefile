########################################################################################
# Makefile
########################################################################################
# docker run is for images
# docker exec is for containers

docker-build:
	docker build -t docker-spark .

docker-run:
	@docker run -it --name inquirefire_master_1 docker-spark /bin/bash
	@docker rm inquirefire_master_1 

docker-start:
	docker start inquirefire_master_1 

docker-stop:
	docker stop inquirefire_master_1 

docker-rm:
	docker rm inquirefire_master_1 

docker: 
	@echo "http://localhost:8080/"
	docker-compose up &

docker-thrift:
	docker exec -it inquirefire_master_1 sbin/start-thriftserver.sh

docker-pyspark:
	docker exec -it inquirefire_master_1 /bin/bash bin/pyspark

docker-test:
	docker cp 


########################################################################################
# End of file
########################################################################################

