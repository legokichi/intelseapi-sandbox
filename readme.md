# IntelSEAPI demo

* https://github.com/intel/IntelSEAPI/wiki/Getting-started
* chrome://tracing/


## build

```sh
docker build -t seapi-sandbox ./
```

## usage

```sh
docker run --rm -ti -v `pwd`:/data/ --workdir /data seapi-sandbox bash -c " \
g++ -v -Wall main.cpp -I/opt/IntelSEAPI/ -I/opt/IntelSEAPI/ittnotify/include/ /opt/IntelSEAPI/bin/libIntelSEAPI64.so && \
(cd /opt/IntelSEAPI && python ./runtool/sea_runtool.py -o /data/result -f gt ! /data/a.out;) "
```

open `chrome://tracing/` and load `result.pid-*.json`


