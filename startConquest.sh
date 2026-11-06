#!/bin/sh
set -eu

cd "$(dirname "$0")"

if [ -n "${JAVA_HOME:-}" ]; then
    JAVA="$JAVA_HOME/bin/java"
elif /usr/libexec/java_home >/dev/null 2>&1; then
    JAVA="$(/usr/libexec/java_home)/bin/java"
else
    JAVA=java
fi

if ! "$JAVA" -version >/dev/null 2>&1; then
    echo "Java was not found. Install a Java 21 JDK for your Mac, or set JAVA_HOME to your JDK directory." >&2
    exit 1
fi

if [ ! -f classes/com/osi/conquest/Main.class ]; then
    echo "Compiled game files are missing. Run ./build.sh first." >&2
    exit 1
fi

exec "$JAVA" -classpath "classes:lib/log4j-full.jar" com.osi.conquest.Main "$PWD/classes"
