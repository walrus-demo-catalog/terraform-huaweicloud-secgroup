resource "huaweicloud_networking_secgroup" "secgroup" {
  name                 = var.secgroup_name
  delete_default_rules = true
}

resource "huaweicloud_networking_secgroup_rule" "secgroup_rule_v4" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "egress"
  ethertype         = "IPv4"
}

resource "huaweicloud_networking_secgroup_rule" "secgroup_rule_v6" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "egress"
  ethertype         = "IPv6"
}

resource "huaweicloud_networking_secgroup_rule" "allow_icmp" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  action            = "allow"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "huaweicloud_networking_secgroup_rule" "allow_ports" {
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  direction         = "ingress"
  action            = "allow"
  ethertype         = "IPv4"
  protocol          = "tcp"
  ports             = var.allowed_ports
  remote_ip_prefix  = "0.0.0.0/0"
}