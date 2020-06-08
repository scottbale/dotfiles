# dotfiles

See branches for environment-specific dotfiles

## Java

Put these script files somewhere in `$PATH` (currently they reside in `~/.local/bin/`)

### java_11

``` shell
#!/bin/sh

export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
export JAVA8_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export JAVA11_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64

sudo update-java-alternatives --set /usr/lib/jvm/java-1.11.0-openjdk-amd64
. javawtf
```

### java_8

``` shell
#!/bin/sh

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export JAVA8_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export JAVA11_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64

sudo update-java-alternatives --set java-1.8.0-openjdk-amd64
. javawtf
```

### javawtf

``` shell
#!/bin/sh
env | grep JAVA
java -version
echo 'Use `java8` or `java11` cmd to update java alternative'
echo 'See `~/.bash_aliases`, `~/.local/bin/`'
```
