import json
import os
import urllib.request
import boto3
from datetime import datetime

def lambda_handler(event, context):
    # TODO implement
    # Source file url path of the dataset
    source_file_url="https://data.cityofnewyork.us/resource/8wbx-tsch.csv"
    
    # S3 bucket name and object key (to make sure the new folder called nyc-data and timestamp folder inside that to different the files arrived date)
    bucket_name = "nyc-data-store-bucket-2023"
    object_key = f"nyc-data/{datetime.now().strftime('%Y-%m-%d')}/nyc-fhv.csv"

    # Download the file using the url library.
    local_filename, headers = urllib.request.urlretrieve(source_file_url)

    # Upload the file to S3
    s3 = boto3.client('s3')
    s3.upload_file(local_filename, bucket_name, object_key)

    # Remove local file
    os.remove(local_filename)
    
    return {
        'statusCode': 200,
        'body': f'Object Name {object_key} inserted into {bucket_name}.'
    }
