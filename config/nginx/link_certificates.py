#!/usr/bin/env python3

import os
import sys
import shutil

cert_dir = "/etc/letsencrypt/live"

def main():
    if not os.access(cert_dir, os.W_OK) or not os.path.isdir(cert_dir):
        raise RuntimeError(f"Cannot access certificat directory: {cert_dir}.")
    base_domain = sys.argv[1]
    key_file = os.path.join(cert_dir, base_domain, "privkey.pem")
    cert_file = os.path.join(cert_dir, base_domain, "fullchain.pem")
    for domain in sys.argv[2:]:
        print(f"linking {domain} in {base_domain}")
        symlink = os.path.join(cert_dir, f"{domain}.{base_domain}.key")
        if os.path.isfile(symlink):
            os.remove(symlink)
        shutil.copy(key_file, symlink)
        symlink = os.path.join(cert_dir, f"{domain}.{base_domain}.crt")
        if os.path.isfile(symlink):
            os.remove(symlink)
        shutil.copy(cert_file, symlink)



if __name__ == "__main__":
    sys.exit(main())

# eof
