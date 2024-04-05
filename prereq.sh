echo "Downloading OpenJDK"
wget https://cdn.azul.com/zulu/bin/zulu11.50.19-ca-jdk11.0.12-linux.x86_64.rpm

echo "Installing OpenJDK"
rpm -ivh zulu11.50.19-ca-jdk11.0.12-linux.x86_64.rpm

echo "Confirming Java Version"
java -version
