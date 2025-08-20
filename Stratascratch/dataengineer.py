# Import your libraries
import pyspark
from pyspark.sql import SparkSession
from pyspark.sql.functions import month, countDistinct, col

# Start writing code
fact_events



fact_events = fact_events.withColumn("time_id", fact_events["time_id"].cast("date"))

# Compute unique users per client per month
fact_events = (
    fact_events.withColumn("month", month("time_id"))
    .groupBy("month", "client_id")
    .agg(countDistinct("user_id").alias("unique_users"))
    .orderBy("month", "client_id"))
# To validate your solution, convert your final pySpark df to a pandas df
fact_events.toPandas()