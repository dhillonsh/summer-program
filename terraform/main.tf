resource "aws_key_pair" "deployer" {
  key_name   = "my-secret-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBEVGNfJj2EpYejdr0tNooOvK4N3s1eun3jksN3PB1LthyU9FD+kcMJys/JLWJdzfdAl1iNJDbfhzXDCxFTEyy0PalNP55y45+7F7gKB8kxk2be6WasrRmQh96kFfDrFnGDt1eRLwDxEVflPxE5w100KRe5yKYWpgWEWDGy4ZKumgAwqCbfPb5f59icBEWH9UNuo2mblHs1nrjVYbNGTF33WImLvHu9GQInnpkGj5kr97mgRb/Z9HAVuUnCtgsabcZIfW5q7AkWehpX3BjTlDZRGVva7v8V8nFhbsLJwia29Lup41P564/p1WTn+hRcV+lj/95dWDG2u3KIOHcY9SoDJ07y8jOEYBk36n3UnFILaVwXTZPNz1yEfaIuWMb/QNWeQpzkKYkDAJO3gLB/9SXyC6+z42YuW52dniHA1APxAXKo9FD6+T/ojrp0B17pyfj6DZZQfkUy/4f1rsW1uE8FeSR5zmaF3Xy+M66kARE7/6Kdbe6inmgdwiqKStahLk= harpreet dhillon@DESKTOP-1L38KLJ"
}

module "website_virtual_machine" {
    source = "./modules/virtual_machine"

    name = "my-module-vm"
    inbound_ports = [
        "3000"
    ]

    ssh_key_name = "my-secret-key"
}

module "ecr" {
    source = "./modules/container_registry"

    name = "my-repository1231231asdf213"
}
