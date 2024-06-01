
## Run Windows XP in Docker container!

- Registry: [DockerHub](https://hub.docker.com/r/google85/qemu-docker/tags/)

- Source code: [GitHub](https://github.com/google85/qemu-docker)

### Getting started:

- copy an `xp.iso` ISO image in current dirrectory

- create / download a copy of my `docker-compose.yml` file:
    ```bash
    # download from the GitHub
    wget https://raw.githubusercontent.com/google85/qemu-docker/master/docker-compose.yml

    # or
    cat <<EOF | tee docker-compose.yml
    version: "3.6"
    services:
        win-xp:
            image: google85/qemu-docker:win-xp
            container_name: win-xp
            environment:
            - USER=root
            - PASSWORD=password1
            volumes:
            - .:/isos
            ports:
            - 8888:80
    EOF
    ```

- Open a terminal and type:
    ```bash
    docker compose up -d
    ```
- You will then be able to open a browser page via this URL: [http://localhost:8888/vnc.html](http://localhost:8888/vnc.html)

- Run in the browser's terminal [using the provided Clipboard app from VNC]:
    ```bash
    qemu-img create -f vpc /isos/xp.vhd 20G
    # ==> this will create a max 20 GB hdd file `xp.vhd`
    ls -al /isos

    # run:
    qemu-system-i386 -cpu pentium -m 2G  -hda /isos/xp.vhd -cdrom /isos/xp.iso -boot d -nic user,model=e1000,hostfwd=tcp::8888-:80 -soundhw ac97
    # ==> starts virtual machine in boot mode
    ```

- URL: [link](http://localhost:8888/vnc.html)

##

