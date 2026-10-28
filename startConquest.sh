CONQUEST_HOME=/Users/paulfolbrecht/dev/Conquest
JAVA_HOME=/usr

CLASSPATH=$CONQUEST_HOME/classes:$CONQUEST_HOME/lib/log4j-full.jar
echo "CLASSPATH=$CLASSPATH"

$JAVA_HOME/bin/java -classpath $CLASSPATH com.osi.conquest.Main $CONQUEST_HOME/classes
