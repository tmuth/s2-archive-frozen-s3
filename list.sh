#!/usr/bin/env bash

echo "Objects"
aws s3api list-object-versions --output table --bucket ${S3_BUCKET} --prefix SVA-Images --query 'Versions[*].[Key,IsLatest]'
echo "Delete Markers"
aws s3api list-object-versions --output table --bucket ${S3_BUCKET} --prefix SVA-Images --query 'DeleteMarkers[*].[Key,IsLatest]'