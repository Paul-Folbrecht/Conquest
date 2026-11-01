#!/bin/sh
set -eu

cd "$(dirname "$0")"
mkdir -p classes
find src -name '*.java' -exec "${JAVA_HOME:+$JAVA_HOME/bin/}javac" \
    -classpath "lib/log4j-full.jar:classes" -d classes {} +
