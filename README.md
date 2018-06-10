# My own compose for PHP development
## Feel free for:
### Use, modify, create issues, сriticize
## Feel confuse for:
### Unreasonable  criticize and offtopic shit

## How to start up in first time:
- First build (and other):
```
make build; make up
# NORE: this compose will be started
```

- Prepare your anu^W directories structure:
```
rm etc/nginx/vhost.conf
# Remove dummy config
```

- Copy your project dir to `app` dir 
```
cp -r ${PATH}/${PROJECT_NAME} app/${PROJECT_NAME}.local
# NOTE: PROJECT_NAME.local will be DOMAIN.local
# Just dummy command :)
```

- Register project dir
```
./register-vhost.sh ${PROJECT_NAME}.local
# NOTE: this command will restart this compose
```

## How to use shorthands:
- `make goto`: enter into php image
- `make build`: build some images
- `make up`: start compose
- `make logs`: show me the money
- `make halt`: gracefully shutdown compose
