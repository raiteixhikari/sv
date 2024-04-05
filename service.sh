echo "Configuring Firewall"
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload

echo "Creating Service Unit"
touch /etc/systemd/system/SparkView.service

cat << EOF > /etc/systemd/system/SparkView.service
[Unit]
Description=SparkView Service
After=network.target
[Service]
User=$CURRUSER
WorkingDirectory=/usr/local/bin/SparkGateway
ExecStart=java -jar /usr/local/bin/SparkGateway/SparkGateway.jar
SuccessExitStatus=143
[Install]
WantedBy=multi-user.target
EOF

echo "Reloading service daemon"
systemctl daemon-reload

echo "Enabling SparkView service"
systemctl enable SparkView

echo "Starting SparkView service"
systemctl start SparkView

echo "Display Service Status, hit ctrl+c to exit"
systemctl status SparkView
