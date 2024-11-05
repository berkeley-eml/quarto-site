---
title: Manage SSH Keys
---

It is possible to open an SSH connection without having to type your
password everytime. Instead, you can use a passphrase in combination
with SSH "key pairs". On macOS or UNIX, you will be able to type in your
passphrase once at login, and during that session, connect to different
remote computers without typing in a password or passphrase each time.
On Windows PCs, using the passphrase enables you to connect to different
accounts or hosts in the same session seamlessly, without having to type
in a password or passphrase every time.

You will need to create an SSH keypair to facilitate this process. One
key, the private key, stays on the machine you will connect from. The
other key, the public key, can be put in any account you connect to.
Think of this process as leaving a real key (the public key) in a remote
door. The door will only open if you have the associated private key as
you approach. This is why you must keep the private key to yourself,
otherwise people who have a copy of it can pass through all the doors in
which you left your public key.

## On Windows

Note: newer versions of Windows 10 may have native SSH clients. If you
have the software already installed, see the UNIX and macOS instructions
below. You can run the same commands in the Windows command prompt
program.

### Creating the key pair

1.  Install PuTTY on your machine, and go to Start Menu &gt; PuTTY &gt;
    PuTTYgen.
2.  A new window will appear. At the bottom, for "Type of key", choose
    RSA, ECDSA, or ED25519. Then click the the "Generate" button. You
    may need to move your mouse about in the small window area in order
    to generate randomness that the process requires.
3.  Type in a unique passphrase in the Key and Confirm passphrase
    fields. The passphrase is used to protect your key and you will be
    asked for it when you connect via SSH using public key
    authentication.
4.  Click on the "Save Public Key" and "Save Private Key" buttons to
    save the keys.

### Uploading the public key

Once you have generated the key pair, you will need to transfer the
public key to the remote site. You can transfer the public key in any
number of ways, such as by emailing it to the owner of the remote
account or an administrator, or SCP or SFTP if you have access. The
public key file is actually just a text file.

### Installing the public key

See the UNIX instructions for this step below as they are identical.

## On UNIX and macOS

### Generating SSH Keys

You can generate keys with `ssh-keygen`:

```bash
% ssh-keygen -t ed25519
Generating public/private ed25519 key pair.
Enter file in which to save the key ($HOME/.ssh/id_ed25519):    
Enter passphrase (empty for no passphrase): 
Enter same passphrase again:
Your identification has been saved in $HOME/.ssh/id_ed25519.
Your public key has been saved in $HOME/.ssh/id_ed25519.pub.
```

### Uploading the public key

Once you have generated the key pair, you will need to transfer the public key,
e.g. `id_ed25519.pub`, to the remote site. You can transfer the public key in
any number of ways, such as SFTP, or even by copying its content and pasting it
into a new file. The public key file is actually just a text file. Upload the
file to anyplace in the top-level of your home directory.

To transfer the file to the remote machine using SCP, execute:
```bash
scp ~/.ssh/id_ed25519.pub username@remotehost:mynewkey.pub
```

### Installing the public key

Append the public key to `~/.ssh/authorized_keys` on the remote machine.
SSH to that computer and run:

```bash
$ cat ~/mynewkey.pub >> ~/.ssh/authorized_keys
$ rm ~/mynewkey.pub
```
