# infrastructure
The Shared Infrastructure


### One time setup for secrets
aws ssm put-parameter --name STRAVA_CLIENT_ID --type String --value ${STRAVA_CLIENT_ID}
aws ssm put-parameter --name STRAVA_CLIENT_SECRET --type String --value ${STRAVA_CLIENT_SECRET}
aws ssm put-parameter --name STRAVA_ACCESS_TOKEN --type String --value ${STRAVA_ACCESS_TOKEN}
aws ssm put-parameter --name STRAVA_VERIFY_TOKEN --type String --value ${STRAVA_VERIFY_TOKEN}