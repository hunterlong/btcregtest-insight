#!/bin/bash

rm -rf /data/bitcoin/regtest

bitcoind -regtest -daemon --datadir=/data/bitcoin --config=/data/bitcoin/bitcoin.conf

sleep 2

cd /data/bitcore/data

AUTH="-rpcuser=bitcoin -rpcpassword=password123"

bitcoin-cli -regtest $AUTH getblockchaininfo

bitcoin-cli -regtest $AUTH generate 100

bitcoin-cli -regtest importprivkey "cVVGgzVgcc5S3owCskoneK8R1BNGkBveiEcGDaxu8RRDvFcaQaSG" "Account" false
bitcoin-cli -regtest importprivkey "cRGkipHiYFRSAgdY9NjUT7egHTuNXoKYWQea3kWVbkSJAs4VDi8r" "Account" false
bitcoin-cli -regtest importprivkey "cTc8XCQZuSt5E1LArqCxyaXhn1cQkvcBMAGQ159raPSQTuBpHWdi" "Account" false
bitcoin-cli -regtest importprivkey "cQ9JwsoYHC2Md41uDbczDVpsuWAeYjDDrDiGbCBZ4stZhZvLZWj8" "Account" false
bitcoin-cli -regtest importprivkey "cQrY4VypAuemJtHmNNJLyx1SNjY7mpfkdQEJpccpLSvan5YoMAkM" "Account" true

bitcoin-cli -regtest $AUTH generate 1

bitcoin-cli -regtest sendtoaddress "mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo" 12 "" "" true
bitcoin-cli -regtest sendtoaddress "mzdF3oEx8mKrpGb5rVnTE7MhQfL8N8oSnW" 8.2123 "" "" true
bitcoin-cli -regtest sendtoaddress "mtdVMhiWWmegkkBhzYDrz84yfgofPNLNmb" 23.5434 "" "" true

bitcoin-cli -regtest $AUTH generate 1

bitcoin-cli -regtest $AUTH getbalance

bitcoin-cli -regtest $AUTH stop

sleep 1

screen -dms blocks /bin/bash -c "while true ; do bitcoin-cli -regtest $AUTH generate 1 & sleep 5; done"

bitcored