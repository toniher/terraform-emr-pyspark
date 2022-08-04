# EMR general configurations
export TF_VAR_profile=default
export TF_VAR_region=eu-central-1
export TF_VAR_credentials='["/home/myuser/.aws/credentials"]'

export TF_VAR_name=spark-app
export TF_VAR_subnet_id=subnet-8a280df7
export TF_VAR_vpc_id=vpc-68c6c103

export TF_VAR_key_name=key-nf
export TF_VAR_ingress_cidr_blocks=0.0.0.0/0
export TF_VAR_release_label=emr-6.7.0
export TF_VAR_applications='["Hadoop", "Spark"]'

export TF_VAR_root_ebs_size=100 #Max is 100

# Master node configurations
export TF_VAR_master_instance_type=m3.xlarge
export TF_VAR_master_ebs_size=200

# Slave nodes configurations
export TF_VAR_core_instance_type=m3.xlarge
export TF_VAR_core_instance_count=2
export TF_VAR_core_ebs_size=200
