# IntelSEAPI demo

* https://github.com/intel/IntelSEAPI/wiki/Getting-started
* https://www.gamasutra.com/view/news/176420/Indepth_Using_Chrometracing_to_view_your_inline_profiling_data.php
* https://src.chromium.org/viewvc/chrome/trunk/src/base/debug/trace_event.h?view=markup
* http://www.chromium.org/developers/how-tos/trace-event-profiling-tool/tracing-event-instrumentation


## build

```sh
docker build -t seapi-sandbox ./
```

## usage

```sh
docker run --rm -ti -v `pwd`:/data/ --workdir /data seapi-sandbox bash -c " \
g++ -v -Wall main.cpp -I/opt/IntelSEAPI/ -I/opt/IntelSEAPI/ittnotify/include/ /opt/IntelSEAPI/bin/libIntelSEAPI64.so -lpthread && \
python /opt/IntelSEAPI/runtool/sea_runtool.py -o /data/result -f gt ! /data/a.out"
```

open `chrome://tracing/` and load `result.pid-*.json`


