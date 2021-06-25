provider "aws" {
  region = "us-east-1"
}

#variables - string

variable "vpcname" {
    type = string
    default = "terraformvpc"


}

#variables - integer

variable "sshport" {
    type = number
    default = 22
}

#variables - boolean

variable "aku" {
    default = true
}

#variables - list

variable "mylist" {
    type = list(string)
    default = ["value1", "value2", "value3"]
}

#variables - map

variable "enabled" {
    type = map
    default = {
        key1 = "value1"
        key2 = "value2"
    }
}


#variables - tuple

variable "mytupule" {
    type = tuple ([string,number,string])
    default = [
    "dog",1,"dog"]
}

#variables - object

variable "myobject" {
    type = object ({name = string, port = list(number)})
    default = {
        name = "Tobi"
        port = [22,80,433]
    }
}

#variables - inputname

variable "inputname" {
    type = string
    description = "Set the name of the VPC"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
    Name = var.inputname
    }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}