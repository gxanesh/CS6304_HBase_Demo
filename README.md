# HBase_Demo

### Start HBase
Open a terminal and start the service
```
$HBASE_HOME/bin/start-hbase.sh
```
In another window if we write 'jps', we will see HMaster running. It should show hadoop namenode, datanode and datamanger are also running.  
Your $HBASE_HOME is /opt/hbase.


### Importing Project:
* Open “eclipse”, right click on “Package Explorer” window, click import.
* Select “Git”-> “Projects from Git” and click “next”.
* Select “clone url” and click “next”.
* Paste “https://github.com/ArindamK92/CS6304_HBase_Demo” in the “url” textbox, and click “next”. 
* Choose “Import existing project” and click “finish”.

### Referencing HBase libraries:
* Right click on project and select “build path”-> “configure build path” ->”libraries”->”add external jars”.
* Go to "other location"(right side, last option)-> computer->opt->hbase->lib and select all jars.
* REMEMBER: there is a folder named "ruby", do not select it while selecting all the jars
* Add the jars and close

### How to run
Follow Commands.txt to run on terminal.
Java codes will run on eclipse directly after referencing HBase libraries.

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
Error 1: mkdir: Call From cs6304-akkcm-02/127.0.1.1 to localhost:9000 failed on connection exception: java.net.ConnectException: Connection refused  
Explanation and Fix: In general this error comes if you are running hadoop first time on your VM after a reset. The below commands will fix it.
```
stop-all.sh
hadoop namenode -format
start-all.sh
```
You can use the below command to check if namenode, datanode and nodemanager are running.
```
jps

```

Error 2: mkdir: `hdfs://localhost:9000/user/<username>': No such file or directory  
Explanation and Fix: The error comes when there is no directory /user and /user/<username> in hdfs and you are trying to create a folder using "hadoop fs -mkdir InputFolder ".   
Below command will create the directory structure if required and solves the problem.
```
hdfs dfs -mkdir -p InputFolder
```
Error: "shell-init: error retrieving current directory: getcwd"  
- the directory at which you are when you try to run hadoop command does not exist anymore.  

Warning 1: WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable  
Fix: You can just ignore this warning.