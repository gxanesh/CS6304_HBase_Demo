#!/bin/bash

# Apache HBase installation script


HBASE_VERSION="1.7.2"  # Specify your desired HBase version
HBASE_TAR_URL="https://archive.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz"
HBASE_TAR_FILE="hbase-$HBASE_VERSION-bin.tar.gz"
HBASE_INSTALL_DIR="/opt/hbase"

# Step 1: Download HBase tarball
echo "Downloading HBase $HBASE_VERSION..."
wget --progress=dot:mega $HBASE_TAR_URL -P /tmp

# Step 2: Extract the tarball
echo "Extracting HBase..."
tar xzvf /tmp/$HBASE_TAR_FILE

# Step 3: Remove the tarball
echo "Cleaning up..."
rm /tmp/$HBASE_TAR_FILE

# Step 4: Configure JAVA_HOME in hbase-env.sh
echo "Configuring HBase environment..."
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre" >> hbase-$HBASE_VERSION/conf/hbase-env.sh

# Step 5: Move HBase to /opt/hbase and set appropriate permissions
echo "Installing HBase to $HBASE_INSTALL_DIR..."
sudo mv hbase-$HBASE_VERSION/ $HBASE_INSTALL_DIR
sudo chmod 777 -R $HBASE_INSTALL_DIR

# Step 6: Set up HBase environment variables
echo "Setting up HBase environment variables..."
cat > /etc/profile.d/hbase.sh <<'EOF'
export HBASE_HOME=/opt/hbase
export PATH=$PATH:$HBASE_HOME/bin
EOF

# Step 7: Load the environment variables for the current session
echo "Exporting HBASE_HOME for this session..."
export HBASE_HOME=/opt/hbase
source /etc/profile.d/hbase.sh

# Step 8: Configure hbase-site.xml
echo "Configuring hbase-site.xml..."
cat > $HBASE_HOME/conf/hbase-site.xml <<'EOF'
<configuration>
   <property>
       <name>hbase.rootdir</name>
       <value>file:///opt/hbase/HBASE/hbase</value>
   </property>
   <property>
      <name>hbase.zookeeper.property.dataDir</name>
      <value>/opt/hbase/HBASE/zookeeper</value>
   </property>
   <property>
      <name>hbase.cluster.distributed</name>
      <value>false</value>
   </property>
   <property>
      <name>hbase.tmp.dir</name>
      <value>./tmp</value>
   </property>
   <property>
      <name>hbase.unsafe.stream.capability.enforce</name>
      <value>false</value>
   </property>
</configuration>
EOF

# Step 9: Start HBase
echo "Starting HBase..."
$HBASE_HOME/bin/start-hbase.sh

# Step 10: Verify HBase installation
echo "Checking HBase status..."
jps | grep -i HMaster

# Step 11: Final message
echo "HBase installation and configuration completed."

