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

bitcoin-cli -regtest setaccount "mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo" "Account1"
bitcoin-cli -regtest setaccount "mzdF3oEx8mKrpGb5rVnTE7MhQfL8N8oSnW" "Account2"
bitcoin-cli -regtest setaccount "mtdVMhiWWmegkkBhzYDrz84yfgofPNLNmb" "Account3"
bitcoin-cli -regtest setaccount "mqNnZTyFxhB6EzF1iDEAp9enrT84fwd1X5" "Account4"
bitcoin-cli -regtest setaccount "mnk2URqujBqMEfhALMby1WZHoBRauW37Kg" "Account5"

bitcoin-cli -regtest sendmany "" '{"mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo":123.12345,"mzdF3oEx8mKrpGb5rVnTE7MhQfL8N8oSnW":25.4112}'
bitcoin-cli -regtest sendmany "" '{"mtdVMhiWWmegkkBhzYDrz84yfgofPNLNmb":62.4322,"mqNnZTyFxhB6EzF1iDEAp9enrT84fwd1X5":31.2345}'
bitcoin-cli -regtest sendmany "" '{"mnk2URqujBqMEfhALMby1WZHoBRauW37Kg":14.1337}'

bitcoin-cli -regtest $AUTH generate 3

bitcoin-cli -regtest sendmany "Account2" '{"mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo":1.1337,"mqNnZTyFxhB6EzF1iDEAp9enrT84fwd1X5":4.123, "mzdF3oEx8mKrpGb5rVnTE7MhQfL8N8oSnW":6.324}'
bitcoin-cli -regtest sendmany "Account3" '{"mqNnZTyFxhB6EzF1iDEAp9enrT84fwd1X5":2.1337,"mzdF3oEx8mKrpGb5rVnTE7MhQfL8N8oSnW":6.123, "mtdVMhiWWmegkkBhzYDrz84yfgofPNLNmb": 7.34}'
bitcoin-cli -regtest sendmany "Account4" '{"mnJQyeDFmGjNoxyxKQC6MMFdpx77rYV3Bo":7.1337,"mnk2URqujBqMEfhALMby1WZHoBRauW37Kg":1.123}'

bitcoin-cli -regtest $AUTH generate 1

bitcoin-cli -regtest $AUTH listaccounts

bitcoin-cli -regtest $AUTH stop

sleep 1

screen -dms blocks /bin/bash -c "while true ; do bitcoin-cli -regtest $AUTH generate 1 & sleep 5; done"

bitcored