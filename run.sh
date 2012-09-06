#!/bin/bash

java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=4000  -jar file-upload-service/target/file-upload-service-1.0-SNAPSHOT.jar server file-upload-service/src/main/resources/file-upload-service.yml
