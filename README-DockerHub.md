
## Run Windows XP in Docker container!

- Registry: [DockerHub](https://hub.docker.com/r/google85/qemu-docker/tags/)

- Source code: [GitHub](https://github.com/google85/qemu-docker)

### Getting started:

- copy an `xp.iso` ISO image in current dirrectory

- Open a terminal and type:
    ```bash
    docker compose up -d
    # open http://localhost:8888/vnc.html

    # run in browser's terminal: [using Clipboard app]
    #   qemu-img create -f vpc /isos/xp.vhd 20G
    # ==> this will create xp.vhd
    #   ls -al /isos

    # run in browser's terminal:
    #  qemu-system-i386 -cpu pentium -m 2G  -hda /isos/xp.vhd -cdrom /isos/xp.iso -boot d -nic user,model=e1000,hostfwd=tcp::8888-:80 -soundhw ac97
    # ==> starts virtual machine in boot mode
    ```

- URL: [link](http://localhost:8888/vnc.html)

##

