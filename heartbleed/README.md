### Setup

run ``` make ```


#### Running

run ```./run.sh```

#### Testing

run ```python heartbleed_test.py localhost -p 45373```\


#### For Testing EXPORT

Run openssl server:
```/usr/local/ssl/bin/openssl s_server -key cert.key -cert cert.crt -accept 4430```

Test for export cipher suits using client:

``` openssl s_client -connect localhost:4430 -cipher EXPORT ```


