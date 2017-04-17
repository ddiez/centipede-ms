centipede-ms
============

[![Build Status](https://travis-ci.org/ddiez/centipede-ms.svg?branch=master)](https://travis-ci.org/ddiez/centipede-ms)

# Introduction

A docker container for [msCentipede](https://github.com/rajanil/msCentipede).

# Usage

Python scripts are stored in `/opt/lib/centipede-ms`. A bash script called `centipede-ms` is located in `/opt/bin` and calls the appropriate scripts. To obtain help on the available options run:

```
docker run ddiez/centipede-ms centipede-ms -h
```

This is equivalent to `docker run ddiez/centipede-ms python /opt/lib/centipede-ms/call_binding.py -h` but shorter for convenience.
