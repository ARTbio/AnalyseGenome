#!/usr/bin/env bash
set -e
cd /root/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFdDo/U2shXOKSwSz1JhYY7jDCwuAt4sgPH2pw0r1fKmxJpsY7vZgwkn1XvZPDPPo9Go2LgNVCRBgRZ60f1ivlviy5D1deo/5XtMshDjJDSBaGx4QQhtjAsCgvZ/2Sx+wP2l7IVEYKzWdKens4JVZ+gIh/PwXS0PzNeWOLiCynlLncEm0nuV9Y6wCbhnUt9Zjbe/y0/Cm6wPpOqu9J2BKVerGZtnfvM2+MD6S40n4CH7iFRrnqlOlc6junnuJ6g/u2sIcYXhmD6bOttI5cOINGcDacitp7enUaiSt5ViVz0vjkHfuxr42rtq5dLMI6hQxnq8sjpfb1ygpe7HHHnHCn chris@lbcd-17.snv.jussieu.fr" >> authorized_keys
chmod 600 authorized_keys
echo "Thanks Christophe ANTONIEWSKI has now root access to you VM."
echo "To revoke this access, remove the ssh pub key in /root/.ssh/authorized_keys"
