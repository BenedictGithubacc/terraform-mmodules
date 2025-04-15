output "aws_public_subnet_1"{
    value = aws_subnet.pub-sub-1.id
}

output "public_securitygroup"{
    value = aws_security_group.public-sg.id
}

output "private_securitygroup"{
    value = aws_security_group.private-sg.id
}

output "public_subnet_2"{
    value = aws_subnet.pub-sub-2.id
}

output "private_subnet_1"{
    value = aws_subnet.pvt-sub-1.id
}

output "private_subnet_2"{
    value = aws_subnet.pvt-sub-2.id
}
output "aws_vpc" {
    value = aws_vpc.main.id
}
