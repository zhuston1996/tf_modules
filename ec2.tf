resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  iam_instance_profile   = var.instance_profile
  key_name               = var.key_name
  root_block_device {
    volume_type = var.root_volume_type
    volume_size = var.root_volume_size
    encrypted   = var.root_volume_encrypted

    # Add in a tag section here
  }
  tags = {
    Name        = var.device_name
    Application = var.app_type
    StandardBackup = "True"
  }
}
resource "aws_ebs_volume" "ebs_vol" {
  for_each          = var.ebs_volume_names
  size              = each.value.ebs_size
  type              = each.value.ebs_type
  iops              = each.value.ebs_iops
  throughput        = each.value.ebs_throughput
  availability_zone = each.value.availability_zone
  encrypted         = each.value.encrypted
  kms_key_id        = each.value.kms_key_id

  tags = {
    Name        = "${each.value.ebs_volume}-${aws_instance.ec2.tags.Name}"
    device_name = each.value.ebs_device_name
  }
}
resource "aws_volume_attachment" "ebs_att" {
  for_each    = aws_ebs_volume.ebs_vol
  device_name = aws_ebs_volume.ebs_vol[each.key].tags.device_name
  volume_id   = aws_ebs_volume.ebs_vol[each.key].id
  instance_id = aws_instance.ec2.id
}

resource "aws_eip" "ec2_eip" {
  count    = var.add_eip ? 1 : 0
  instance = aws_instance.ec2.id
  vpc      = true
}
