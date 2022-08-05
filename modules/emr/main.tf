resource "aws_emr_cluster" "emr-spark-cluster" {
  name                              = var.name
  release_label                     = var.release_label
  applications                      = var.applications
  termination_protection            = false
  keep_job_flow_alive_when_no_steps = true

  ec2_attributes {
    subnet_id                         = var.subnet_id
    key_name                          = var.key_name
    emr_managed_master_security_group = var.emr_master_security_group
    emr_managed_slave_security_group  = var.emr_slave_security_group
    instance_profile                  = var.emr_ec2_instance_profile
  }

  ebs_root_volume_size = var.root_ebs_size

  master_instance_group {
    name           = "EMR master - ${var.rand}"
    instance_type  = var.master_instance_type
    instance_count = 1

    ebs_config {
      size                 = var.master_ebs_size
      type                 = "gp2"
      volumes_per_instance = 1
    }
  }

  core_instance_group {
    name           = "EMR slave - ${var.rand}"
    instance_type  = var.core_instance_type
    instance_count = var.core_instance_count

    ebs_config {
      size                 = var.core_ebs_size
      type                 = "gp2"
      volumes_per_instance = 1
    }
  }

  tags = {
    Name = "${var.name} - Spark cluster"
  }

  service_role     = var.emr_service_role
  autoscaling_role = var.emr_autoscaling_role

  bootstrap_action {
    name = "Bootstrap setup. - ${var.rand}"
    path = "s3://${var.name}/scripts/bootstrap_actions.sh"
  }
/* 
  step {
    name              = "Copy script file from s3. - ${var.rand}"
    action_on_failure = "CONTINUE"

    hadoop_jar_step {
      jar  = "command-runner.jar"
      args = ["aws", "s3", "cp", "s3://${var.name}/scripts/pyspark_quick_setup.sh", "/home/hadoop/"]
    }
  }
  step {
    name              = "Setup pyspark with conda. - ${var.rand}"
    action_on_failure = "CONTINUE"

    hadoop_jar_step {
      jar  = "command-runner.jar"
      args = ["sudo", "bash", "/home/hadoop/pyspark_quick_setup.sh"]
    }
  }
 */

  configurations_json = <<EOF
  [
    {
      "Classification": "yarn-site",
      "Properties": {
        "yarn.nodemanager.vmem-check-enabled": "false",
        "yarn.nodemanager.pmem-check-enabled": "false"
      }
    },
    {
      "Classification": "spark",
      "Properties": {
        "maximizeResourceAllocation": "true"
      }
    },
    {
    "Classification": "spark-defaults",
      "Properties": {
        "spark.dynamicAllocation.enabled": "true"
      }
    },
    {
      "Classification": "hadoop-env",
      "Properties": {
      },
      "Configurations": [
        {
          "Classification": "export",
          "Properties": {
            "HADOOP_NAMENODE_HEAPSIZE": "4096"
          },
          "Configurations": [
            
          ]
        }
      ]
    }
  ]
  EOF
}
