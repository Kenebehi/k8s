val df = spark.read.format("jdbc")
    .option("url", "jdbc:mysql://my-release-mysql-headless")
    .option("dbtable","(select * from information_schema.tables limit 1) as onerow")
    .option("user", "root")
    .option("driver", "com.mysql.jdbc.Driver")
    .option("password", "J6VzAyVG2c")
    .load()


spark-shell --packages mysql-connector-java-5.1.36  --master spark://master_host:master_port