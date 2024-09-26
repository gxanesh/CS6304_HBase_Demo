#!/bin/bash

# HBase Uninstallation Script for Ubuntu

HBASE_INSTALL_DIR="/opt/hbase"
HBASE_PROFILE_FILE="/etc/profile.d/hbase.sh"

echo "Stopping HBase services..."

# Stop HBase if it's running
$HBASE_INSTALL_DIR/bin/stop-hbase.sh

echo "HBase services stopped."

# Remove HBase installation directory
if [ -d "$HBASE_INSTALL_DIR" ]; then
    echo "Removing HBase installation from $HBASE_INSTALL_DIR..."
    sudo rm -rf $HBASE_INSTALL_DIR
else
    echo "HBase installation not found in $HBASE_INSTALL_DIR."
fi

# Remove HBase environment variable settings
if [ -f "$HBASE_PROFILE_FILE" ]; then
    echo "Removing HBase environment variable file..."
    sudo rm -f $HBASE_PROFILE_FILE
else
    echo "HBase environment variables already removed."
fi

# Remove any HBase-related logs and data (Optional: Check if you have custom directories for logs or data)
HBASE_LOG_DIR="/var/log/hbase"
HBASE_DATA_DIR="/var/lib/hbase"

if [ -d "$HBASE_LOG_DIR" ]; then
    echo "Removing HBase logs..."
    sudo rm -rf $HBASE_LOG_DIR
fi

if [ -d "$HBASE_DATA_DIR" ]; then
    echo "Removing HBase data..."
    sudo rm -rf $HBASE_DATA_DIR
fi

# Reload environment variables
echo "Reloading environment variables..."
source ~/.bashrc

# Final message
echo "HBase has been successfully uninstalled."

