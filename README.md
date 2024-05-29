## Run Windows XP in Docker container!

- credits:
    - [YouTube video of Tech on Fire](https://www.youtube.com/watch?v=2EEzKlF7miA)
    - [GitHub repo](https://github.com/theonemule/qemu-docker/blob/main/dockerfile)

- uses VNC
- uses Nginx as reverse proxy,
- injects audio in NoVNC client
- uses supervisord for bootstrapping all processes, not in entrypoint

- Usage:
```bash
# copy xp.iso ISO image in current dirrectory

# run:
docker compose up -d
# open http://localhost:8888/vnc.html

# run in browser's terminal: [using Clipboard app]
#   qemu-img create -f vpc /isos/xp.vhd 20G
# ==> this will create xp.vhd
#   ls -al /isos

# run in browser's terminal:
#  qemu-system-i386 -cpu pentium -m 2G  -hda /isos/xp.vhd -cdrom /isos/xp.iso -boot d -nic user,model=e1000,hostfwd=tcp::8888-:80 -soundhw ac97
# ==> starts virtual machine in boot mode



# manual:
docker build -t qemu-xp .
docker run -p 8888:80 -v ./:/isos qemu-xp
```