# What?!

If you want to have a public Slackteam where everybody can join you have to deal with [slackin](https://github.com/rauchg/slackin). While slackin is a cool solution build with NodeJS it brings also much overhead to your system. Running it on a Raspberry Pi is possible but think about this: You have to install NodeJS. If you want to run it inside a Container, you'll also need all the dependencys. You'll end up on something about **550 MB**.

You don't want to be the engineer that is running a container that size for only 1 interface. 

Some cool dudes rebuild it using Go -> https://github.com/flexd/slackinviter

I did some `env GOOS=linux GOARCH=arm GOARM=7 go build` foo and compiled it for the Raspberry Pi 2+3. Afterwards I put it inside a Container and ran a few tests. This is acutally pretty simple to use now and only needs about 15MB. 

## Prerequisites

What you'll need is an adminuser on your Slack channel. Create one and get a token for him to interact with his rights. Afterwards you'll need to create a reCaptcha V2 at google -> https://www.google.com/recaptcha/admin to avoid bots. Thats it.

## Usage

Adjust and execute the following on your Dockerhost to run it:

```
docker run -d \
-p 3000:3000 \
zepp/rpi-slackin \
./slagger \
-slackToken "xoxp-XXX" \
-captchaSecret "XXX" \
-captchaSitekey "XXX" \
-listenAddr ":3000"
```

It will be now available at http://your-ip:3000`

## Rebuild for different architecture

Go grab your own copy of the slackinviter from flexd and build it on your own.
For Raspberry Pi it would be:

```
`env GOOS=linux GOARCH=arm GOARM=6 go build`
```

I just renamed the binary to slagger and put it into the root folder, then executed it within the `docker run` command. 