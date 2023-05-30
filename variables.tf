variable "aws_region" {
  description = "REQUIRED: AWS Region to deploy the Customer Edge into"
  type        = string
}

variable "aws_access_key" {
  description = "REQUIRED: AWS programatic access key"
  type        = string
}

variable "aws_secret_key" {
  description = "REQUIRED: AWS programatic secret key"
  type        = string
}

variable "create_iam_role" {
  description = "OPTIONAL: Set to true to create the IAM policy & role for the instance."
  type        = bool
  default     = true
}
variable "f5xc_ce_iam_role_name" {
  description = "OPTIONAL: Name of IAM ROLE to create or name to reference to existing role if one already exists."
  type        = string
  default     = "f5xc_ce_iam_role"
}
variable "f5xc_ce_gateway_multi_node" {
  description = "OPTIONAL: Set to true to deploy a 3 node cluster of Customer Edges"
  type        = bool
  default     = false
}
variable "f5xc_ce_gateway_multi_nic" {
  description = "OPTIONAL: Set to true to deploy a multi nic cluster of Customer Edges"
  type        = bool
  default     = false
}

variable "f5xc_ce_assign_eip" {
  description = "OPTIONAL: Set to true to assign an EIP on the outside interface of Customer Edges"
  type        = bool
  default     = false
}

variable "az1" {
  description = "OPTIONAL: AWS availability zone to deploy first Customer Edge into"
  type        = string
  default     = ""
}

variable "az2" {
  description = "OPTIONAL: AWS availability zone to deploy second Customer Edge into"
  type        = string
  default     = ""
}

variable "az3" {
  description = "OPTIONAL: AWS availability zone to deploy third Customer Edge into"
  type        = string
  default     = ""
}

variable "project_prefix" {
  description = "OPTIONAL: Provide a project name prefix that will be applied"
  type        = string
  default     = "demo"
}

variable "resource_owner" {
  description = "OPTIONAL: Provide owner of the deployment for tagging purposes"
  type        = string
  default     = "demo.user"
}

variable "ce1_outside_subnet_id" {
  description = "REQUIRED: The AWS subnet ID for the outside subnet of Customer Edge 1"
  type        = string
}

variable "ce1_inside_subnet_id" {
  description = "REQUIRED: The AWS subnet ID for the inside subnet of Customer Edge 1"
  type        = string
}


variable "ce2_outside_subnet_id" {
  description = "OPTIONAL: The AWS subnet ID for the outside subnet of Customer Edge 2"
  type        = string
  default     = ""
}

variable "ce2_inside_subnet_id" {
  description = "OPTIONAL: The AWS subnet ID for the inside subnet of Customer Edge 2"
  type        = string
  default     = ""
}

variable "ce3_outside_subnet_id" {
  description = "OPTIONAL: The AWS subnet ID for the outside subnet of Customer Edge 3"
  type        = string
  default     = ""
}

variable "ce3_inside_subnet_id" {
  description = "OPTIONAL: The AWS subnet ID for the inside subnet of Customer Edge 3"
  type        = string
  default     = ""

}

variable "outside_security_group" {
  description = "REQUIRED: The AWS security group ID for the outside interfaces"
  type        = string
}

variable "inside_security_group" {
  description = "REQUIRED: The AWS security group ID for the inside interfaces"
  type        = string
}


variable "multinic_amis" {
  description = "OPTIONAL: The AWS amis for the Customer Edge Multi-NIC image"
  type        = map(any)
  default = {
    "ca-central-1"   = "ami-052252c245ff77338"
    "af-south-1"     = "ami-0c22728f79f714ed1"
    "ap-east-1"      = "ami-0a6cf3665c0612f91"
    "ap-northeast-2" = "ami-01472d819351faf92"
    "ap-southeast-2" = "ami-03ff18dfb7f90eb54"
    "ap-south-1"     = "ami-0277ab0b4db359c93"
    "ap-northeast-1" = "ami-0384d075a36447e2a"
    "ap-southeast-1" = "ami-0d6463ee1e3727e84"
    "eu-central-1"   = "ami-06d5e0073d97ecf99"
    "eu-west-1"      = "ami-090680f491ad6d46a"
    "eu-west-3"      = "ami-03bd7c41ca1b586a8"
    "eu-south-1"     = "ami-0baafa10ffcd081b7"
    "eu-north-1"     = "ami-006c465449ed98c69"
    "eu-west-2"      = "ami-0df8a483722043a41"
    "me-south-1"     = "ami-094efc1a78169dd7c"
    "sa-east-1"      = "ami-07369c4b06cf22299"
    "us-east-1"      = "ami-089311edbe1137720"
    "us-east-2"      = "ami-01ba94b5a83adcb35"
    "us-west-1"      = "ami-092a2a07d2d3a445f"
    "us-west-2"      = "ami-07252e5ab4023b8cf"
  }
}

variable "singlenic_amis" {
  description = "REQUIRED: The AWS amis for the Customer Edge Single-NIC image"
  type        = map(any)
  default = {
    "ca-central-1"   = "ami-0ddc009ae69986eb4"
    "af-south-1"     = "ami-0bcfb554a48878b52"
    "ap-east-1"      = "ami-03cf35954fb9084fc"
    "ap-south-1"     = "ami-099c0c7e19e1afd16"
    "ap-northeast-2" = "ami-04f6d5781039d2f88"
    "ap-southeast-2" = "ami-0ae68f561b7d20682"
    "ap-northeast-1" = "ami-07dac882268159d52"
    "ap-southeast-1" = "ami-0dba294abe676bd58"
    "eu-central-1"   = "ami-027625cb269f5d7e9"
    "eu-west-1"      = "ami-01baaca2a3b1b0114"
    "eu-west-3"      = "ami-0e1361351f9205511"
    "eu-south-1"     = "ami-00cb6474298a310af"
    "eu-north-1"     = "ami-0366c929eb2ac407b"
    "eu-west-2"      = "ami-05f5a414a42961df6"
    "me-south-1"     = "ami-0fb5db9d908d231c3"
    "sa-east-1"      = "ami-09082c4758ef6ec36"
    "us-east-1"      = "ami-0f94aee77d07b0094"
    "us-east-2"      = "ami-0660aaf7b6edaa980"
    "us-west-1"      = "ami-0cf44e35e2aecacb4"
    "us-west-2"      = "ami-0cba83d31d405a8f5"
  }
}


// Pulled from: https://github.com/turnkeylinux/aws-datacenters/blob/master/input/datacenters
variable "aws_region_latitude" {
  description = "REQUIRED: The AWS Region Latitude and Longitude"
  type        = map(any)
  default = {
    "ca-central-1"   = "45.5"
    "af-south-1"     = "-33.93"
    "ap-east-1"      = "22.27"
    "ap-south-1"     = "19.08"
    "ap-northeast-1" = "35.41"
    "ap-northeast-2" = "37.56"
    "ap-southeast-1" = "1.37"
    "ap-southeast-2" = "-33.86"
    "eu-central-1"   = "50"
    "eu-west-1"      = "53"
    "eu-west-2"      = "51"
    "eu-west-3"      = "48.86"
    "eu-south-1"     = "45.43"
    "eu-north-1"     = "59.25"
    "me-south-1"     = "26.10"
    "sa-east-1"      = "-23.34"
    "us-east-1"      = "38.13"
    "us-east-2"      = "39.96"
    "us-west-1"      = "37.35"
    "us-west-2"      = "46.15"
  }
}
// Pulled from: https://github.com/turnkeylinux/aws-datacenters/blob/master/input/datacenters
variable "aws_region_longitude" {
  description = "REQUIRED: The AWS Region Latitude and Longitude"
  type        = map(any)
  default = {
    "ca-central-1"   = "-73.6"
    "af-south-1"     = "18.42"
    "ap-east-1"      = "114.16"
    "ap-south-1"     = "72.88"
    "ap-northeast-1" = "193.42"
    "ap-northeast-2" = "126.98"
    "ap-southeast-1" = "103.8"
    "ap-southeast-2" = "151.2"
    "eu-central-1"   = "8"
    "eu-west-1"      = "-8"
    "eu-west-2"      = "-0.1"
    "eu-west-3"      = "2.35"
    "eu-south-1"     = "9.29"
    "eu-north-1"     = "17.81"
    "me-south-1"     = "50.46"
    "sa-east-1"      = "-46.38"
    "us-east-1"      = "-78.45"
    "us-east-2"      = "-83"
    "us-west-1"      = "-121.96"
    "us-west-2"      = "-123.88"
  }
}


variable "instance_type" {
  description = "OPTIONAL: The AWS instance type for the Customer Edge"
  type        = string
  default     = "t3.xlarge"
}

variable "instance_disk_size" {
  description = "OPTIONAL: The AWS disk size for the Customer Edge"
  type        = string
  default     = "80"
}
variable "sitelatitude" {
  description = "OPTIONAL: This will override the longitude lookup from the region, Site Physical Location Latitude. See https://www.latlong.net/"
  type        = string
}
variable "sitelongitude" {
  description = "OPTIONAL: This will override the longitude lookup from the region, Site Physical Location Longitude. See https://www.latlong.net/"
  type        = string
}
variable "clustername" {
  description = "REQUIRED: Customer Edge site cluster name."
  type        = string
}
variable "sitetoken" {
  description = "REQUIRED: Distributed Cloud Customer Edge site registration token."
  type        = string
  sensitive   = true
}