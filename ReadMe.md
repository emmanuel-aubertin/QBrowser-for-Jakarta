# QBrowser for Glassfish 6+

Starting from Glassfish 6, `javax` is no longer in use. Instead, we present a version of QBrowser that works with `Jakarta`.

More info about QBrowser [here](https://github.com/payara/patched-src-openmq/tree/master/mq/src/share/java/examples/applications/qbrowser)

## Compile:

To compile, add the Glassfish jar to your ClassPath. Then, you can compile QBrowser using:

```bash
javac QBrowser.java
```

## Launch it:

To run QBrowser, use:

```bash
java -cp .:$CLASSPATH QBrowser
```

By default, QBrowser connects to the port at `localhost:7676`. You can change this by specifying a different port as follows:

```bash
java -cp .:$CLASSPATH -DimqAddressList=mq://localhost:<port>/jms QBrowser
```