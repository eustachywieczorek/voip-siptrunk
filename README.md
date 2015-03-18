# voip-siptrunk

Fake SIP trunk used for development

## Usage

Change the value of `ACCEPT_IP` in `docker-compose.yml` to whatever IP you want
FreeSWITCH to accept. Do

    docker-compose up siptrunk

and you should have a FreeSWITCH listening on 172.17.42.1:5060. It will
automatically accept any incoming connections from `ACCEPT_IP`. If you are
coming from a different IP, you can still log in using

    username: 1000
    password: mypassword
