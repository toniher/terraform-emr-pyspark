# EMR general configurations
export TF_VAR_name=spark-app
export TF_VAR_region=eu-central-1
export TF_VAR_subnet_id=subnet-8a280df7
export TF_VAR_vpc_id=vpc-68c6c103

export TF_VAR_key_name=key-nf
export TF_VAR_ingress_cidr_blocks=0.0.0.0/0
export TF_VAR_release_label=emr-5.16.0
export TF_VAR_emr_applications='["Hadoop", "Spark"]'

# Master node configurations
export TF_VAR_master_instance_type=m3.xlarge
export TF_VAR_master_ebs_size=50

# Slave nodes configurations
export TF_VAR_core_instance_type=m3.xlarge
export TF_VAR_core_instance_count=1
export TF_VAR_core_ebs_size=50
