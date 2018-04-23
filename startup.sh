#!/bin/bash

rm -rf /data/bitcoin/regtest

bitcoind -regtest -daemon --datadir=/data/bitcoin --config=/data/bitcoin/bitcoin.conf

sleep 2

cd /data/bitcore/data

AUTH="-rpcuser=bitcoin -rpcpassword=password123"

bitcoin-cli -regtest $AUTH getblockchaininfo

bitcoin-cli -regtest $AUTH generate 110

bitcoin-cli -regtest importprivkey "cVVGgzVgcc5S3owCskoneK8R1BNGkBveiEcGDaxu8RRDvFcaQaSG" "Account1" false
bitcoin-cli -regtest importprivkey "cRGkipHiYFRSAgdY9NjUT7egHTuNXoKYWQea3kWVbkSJAs4VDi8r" "Account2" false
bitcoin-cli -regtest importprivkey "cTc8XCQZuSt5E1LArqCxyaXhn1cQkvcBMAGQ159raPSQTuBpHWdi" "Account3" false
bitcoin-cli -regtest importprivkey "cQ9JwsoYHC2Md41uDbczDVpsuWAeYjDDrDiGbCBZ4stZhZvLZWj8" "Account4" false
bitcoin-cli -regtest importprivkey "cQrY4VypAuemJtHmNNJLyx1SNjY7mpfkdQEJpccpLSvan5YoMAkM" "Account5" true

bitcoin-cli -regtest $AUTH generate 1

bitcoin-cli -regtest sendtoaddress "mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo" 100
bitcoin-cli -regtest sendfrom "" "mzdF3oEx8mKrpGb5rVnTE7MhQfL8N8oSnW" 12
bitcoin-cli -regtest sendfrom "" "mtdVMhiWWmegkkBhzYDrz84yfgofPNLNmb" 14
bitcoin-cli -regtest sendfrom "" "mqNnZTyFxhB6EzF1iDEAp9enrT84fwd1X5" 17
bitcoin-cli -regtest sendfrom "" "mnk2URqujBqMEfhALMby1WZHoBRauW37Kg" 20

bitcoin-cli -regtest $AUTH generate 1

bitcoin-cli -regtest sendtoaddress "mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo" 1
bitcoin-cli -regtest sendtoaddress "mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo" 2
bitcoin-cli -regtest sendtoaddress "mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo" 3

bitcoin-cli -regtest $AUTH generate 1

bitcoin-cli -regtest $AUTH getbalance

bitcoin-cli -regtest $AUTH stop

sleep 1

screen -dms blocks /bin/bash -c "while true ; do bitcoin-cli -regtest $AUTH generate 1 & sleep 5; done"

bitcored