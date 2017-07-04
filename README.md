# fluent-plugin-jopentsdb

## Component

### OpenTsdbOutput

Plugin for send json to OpenTSDB

## Configuration

### OpenTsdbOutput json to OpenTSDB

Example of source:
~~~
       <source>                                                                                                                                                                                                                                              
	  @type tail                                                                                                                                                                                                                                          
	  path /var/log/json/metrics.log                                                                                                                                                                                                             
          tag json.metrics                                                                                                                                                                                                                                          
          format json                                                                                                                                                                                                                                          
       </source> 
~~~
Logfile has line as:
~~~
{"metric":"METRICNAME","timestamp":1499072486,"value":1128,"tags":{"hostname":"host1","app":"app1","TimeResponse":304.0,"count":166.0}}
~~~       
To graph in OpenTSDB:
~~~
	<match json.metrics>
	    @type jopentsdb
	    host localhost
	    port 4242
	</match>	
~~~
Will send to OpenTSDB post json lines


## TODO

* add more parameters

## License

* License
  * Apache License, Version 2.0
