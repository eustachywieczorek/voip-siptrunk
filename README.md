# voip-siptrunk

Fake SIP trunk used for development

## Usage

Change the value of `ACCEPT_IP` in `docker-compose.yml` to whatever IP you want
FreeSWITCH to accept. Do

    docker-compose up siptrunk

and you should have a FreeSWITCH listening on 172.17.42.1:5060. You can log in
using

    username: 1000
    password: mypassword
