# cloud.local

## >>> This repository is no longer maintained! <<<

![cloud.local](https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Cartoon_cloud.svg/320px-Cartoon_cloud.svg.png)

Your personal cloud on a local machine, will later include cloud storage, mail server, calendar, contacts, and many more. All from your local internet connection.

## Try it out locally

To try it on a local machine you need VirtualBox and Vagrant.

```bash
vagrant up
vagrant ssh dev
```

Now copy the file `ansible/group_vars/ansible-vars.yml.sample` to `vagrant-data/ansible-vars.yml` and fill in the values. Afterwards you can run the playbook.

```bash
ansible-playbook ansible/cloud.yml
```

## Install it as a productive instance

You can also install it on a real server, therefore you need Ansible to be installed.

**Note: This is currently no recommended!**

Create a inventory and add the host where you want to install `local.cloud`. Also ensure that your user is able to authenticate the given server with your current users ssh ceritficate.

```
[cloud]
server.domain.example  ansible_ssh_user=root
```

Now deploy the stack on your machine.

```bash
ansible-playbook -i your-inventory ansible/cloud.yml
```
