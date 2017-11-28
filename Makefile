########################################################################################
# Makefile
########################################################################################

docker: 
	@echo "http://localhost:8080/"
	docker-compose up &

docker-run:
	docker exec -it inquirefire_master_1 bin/spark-submit --driver-java-options "-Dlog4j.configuration=file:/tmp/dist/log4j.properties" \
	--py-files /tmp/dist/jobs.zip /tmp/dist/main.py --job Element \
	--job-args startdir="/tmp/data/START" enddir="/tmp/data/END" db=$(DBNAME) hdfs=$(HDFS) task=1 

docker-thrift:
	docker exec -it inquirefire_master_1 sbin/start-thriftserver.sh

docker-shell:
	docker exec -it inquirefire_master_1 /bin/bash

docker-pyspark:
	docker exec -it inquirefire_master_1 /bin/bash bin/pyspark


docker-test:
	docker cp /local/path "$(docker-compose ps -q <container>)":/destination/path


########################################################################################
# End of file
########################################################################################

