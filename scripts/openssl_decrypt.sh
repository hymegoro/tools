#!/bin/sh

openssl enc -d -aes-256-cbc -salt -pass file:./encryptkey
