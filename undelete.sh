#!/usr/bin/env bash

aws s3api list-object-versions --bucket ${S3_BUCKET} --prefix SVA-Images/ --output json --query 'DeleteMarkers[?IsLatest==`true`].[Key, VersionId]' | jq -r '.[] | "--key '\''" + .[0] + "'\'' --version-id " + .[1]' | xargs -L1 aws s3api delete-object --bucket ${S3_BUCKET}