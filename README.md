# Bitcoin Regtest with Insight API
Finally, a way to test your bitcoin applications using a Bitcoin Regtest network for temporary use. All you have to do is start this docker image, and connect your application to the Insight API endpoint! 

Start in Docker: `docker run -it -p 3001:3001 hunterlong/regtestinsight:latest`

Get BTC Balance for address: `http://localhost:3001/api/addr/mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo/balance`

### Private Keys
The private keys are based on a mnemonic phrase by default. For ease of use, use these private keys while interacting with your application.
```
            ADDRESS                |                     PRIVATE KEY

mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo | cVVGgzVgcc5S3owCskoneK8R1BNGkBveiEcGDaxu8RRDvFcaQaSG
mzdF3oEx8mKrpGb5rVnTE7MhQfL8N8oSnW | cRGkipHiYFRSAgdY9NjUT7egHTuNXoKYWQea3kWVbkSJAs4VDi8r
mtdVMhiWWmegkkBhzYDrz84yfgofPNLNmb | cTc8XCQZuSt5E1LArqCxyaXhn1cQkvcBMAGQ159raPSQTuBpHWdi
mqNnZTyFxhB6EzF1iDEAp9enrT84fwd1X5 | cQ9JwsoYHC2Md41uDbczDVpsuWAeYjDDrDiGbCBZ4stZhZvLZWj8
mnk2URqujBqMEfhALMby1WZHoBRauW37Kg | cQrY4VypAuemJtHmNNJLyx1SNjY7mpfkdQEJpccpLSvan5YoMAkM

```
Mnemonic phrase: `myth like bonus scare over problem client lizard pioneer submit female collect`