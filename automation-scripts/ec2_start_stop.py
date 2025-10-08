import boto3
import sys

# Configure your AWS credentials and region here (for automation/demo use)
AWS_ACCESS_KEY = 'YOUR_AWS_ACCESS_KEY'
AWS_SECRET_KEY = 'YOUR_AWS_SECRET_KEY'
AWS_REGION = 'eu-central-1'  # Change as needed

# Configure the EC2 instance ID to operate on
INSTANCE_ID = 'YOUR_EC2_INSTANCE_ID' # Replace with your instance ID

def get_ec2_client():
    return boto3.client(
        'ec2',
        aws_access_key_id=AWS_ACCESS_KEY,
        aws_secret_access_key=AWS_SECRET_KEY,
        region_name=AWS_REGION
    )

# Start EC2 instance
def start_instance(instance_id):
    ec2 = get_ec2_client()
    response = ec2.start_instances(InstanceIds=[instance_id])
    print(f"Started instance: {instance_id}")
    print(response)

# Stop EC2 instance
def stop_instance(instance_id):
    ec2 = get_ec2_client()
    response = ec2.stop_instances(InstanceIds=[instance_id])
    print(f"Stopped instance: {instance_id}")
    print(response)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python ec2_start_stop.py start|stop")
        sys.exit(1)
    action = sys.argv[1].lower()
    if action == "start":
        start_instance(INSTANCE_ID)
    elif action == "stop":
        stop_instance(INSTANCE_ID)
    else:
        print("Unknown action, use 'start' or 'stop'")
