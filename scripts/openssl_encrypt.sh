#!/bin/sh

openssl enc -aes-256-cbc -salt -pass file:./encryptkey
