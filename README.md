# Dockerfile for testing of the TON blockchain lite client

After spending half a weekend trying to start TON lite client on Mac OS 10.13 I gave up and moved it to Ubuntu inside Docker 

The Dockerfile is clearly not-ideal but it at least allows to run the client from scratch 
All the files are downloaded from the https://test.ton.org/download.html where they are reportedly updated a few times a week

# How to run 
```
docker build -t ton.test-client . && docker run -it --name ton-testing ton.test-client 
```



