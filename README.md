# Vargant Ubuntu/RSB configuration


Keep in mind, that you should change:

- `config.vm.share_folder "workspace", "/home/vagrant/rsb", "/Users/kp/rsb"` last path (to your directory) in `Vagrantfile`
- fill `[user]` section with your details in `modules/user/files/dot.gitconfig` 

```bash
cd ubuntu_more_vagrant
vagrant up
vagrant provision
vagrant ssh
```
