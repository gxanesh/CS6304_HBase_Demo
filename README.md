# HBase_Demo

### Start HBase
Open a terminal and start the service
```
$HBASE_HOME/bin/start-hbase.sh
```
In another window, if we write 'jps', we will see HMaster running.  
Your $HBASE_HOME is /opt/hbase.


### Importing Project:
* Open “Eclipse”, right-click on “Package Explorer” window, and click import.
* Select “Git”-> “Projects from Git” and click “next”.
* Select “clone URI” and click “next”.
* Copy and Paste https://github.com/gxanesh/CS6304_HBase_Demo in the “URI” textbox, and click “next”. 
* Choose “Import existing project” and click “Finish”.


### (If required only) Referencing Java Runtime Enviromnent Library(JavaSE-1.8(jre(1)):
* Right-click on project and select “build path” --> “configure build path” --> ”libraries”--> Select All the imported libraries-->Click "Remove"
* Click ”Add Library” --> Select "JRE System Library" --> Click "Next"--> Select "Execution Environment" -->Click on the drop down --> Select JavaSE-1.8(jre(1) --> Click "Finish" 

### Referencing HBase libraries:
* Right-click on project and select “build path”-> “configure build path” ->”libraries”->”Add External Jars”.
* Go to " + Other Locations"(Left Pane, Last option)-> computer->opt->hbase->lib and select all jars.
* REMEMBER: There is a non-jar folder named "ruby", unselect it (Ctrl+click) while selecting all the jars.
* Add the jars and close

### How to run
Follow Commands.txt to run on terminal.
Java codes will run on Eclipse directly after referencing HBase libraries.

### Stop HBase
Stop the service when required using below command
```
$HBASE_HOME/bin/stop-hbase.sh
```


### General Information (access your VM):
* Operating System:         Mac -> Microsoft Remote Desktop, Windows -> Default Remote Desktop, Ubuntu -> Remmina
* Machine:                  cs6304-<mst_username>-01.class.mst.edu
* User:                     <mst_username>
* Default Password:         <mst_password>




### Common error fix:
Error 1: ERROR [main] zookeeper.RecoverableZooKeeper: ZooKeeper exists failed after 4 attempts  
org.apache.zookeeper.KeeperException$ConnectionLossException: KeeperErrorCode = ConnectionLoss for /hbase/hbaseid  
Explanation and Fix: If you run "jps" in terminal you will not find any "HMaster" service running. To fix this run below command 
```
$HBASE_HOME/bin/start-hbase.sh
```
You can use the below command to check if HMaster is running.
```
jps

```

Error 2: Exception in thread "main" org.apache.hadoop.hbase.client.RetriesExhaustedException: Cannot get the location for replica0 of region for Twitter,, in hbase:meta  
Explanation and Fix: You will get this error in Eclipse if you run HBase on Eclipse when HMaster is not running.   
Go to terminal and run command:
```
$HBASE_HOME/bin/start-hbase.sh
```

### Hadoop Commands
Open new tab on the terminal

Check if Hadoop Daemons are Running:
```
jps
```
If Hadoop Daemons are not running correctly, run the following commands to stop and restart the daemons:
```
stop-all.sh
hadoop namenode -format
start-all.sh
```
Check again:
```
jps
```
if data node is not running go to the following location in your local and delete the data folder:
```
/temp/hadoop-<your-sso>/dfs
```

Run Hadoop Commands:
```
hadoop fs -rm -r InputFolder					//remove inputfolder if exist
hadoop fs -mkdir -p InputFolder				       //make the inputfolder

hadoop fs -copyFromLocal '/home/gs37r/git/CS6304_HBase_Demo/Twitter.txt' InputFolder  // copy Twitter.txt to hdfs inputfolder
					  
hadoop fs -rm -r OutputFolder					//remove outputfolder if exist
hadoop fs -ls OutputFolder					//see the files in outputfolder
hadoop fs -cat OutputFolder/part-00000				//see the content of the result
```
