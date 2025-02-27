. "$DIST_ROOT"/build_env/build_scripts/inc-start.sh "$1" "$(basename "$0")"

./configure --prefix=/usr                     \
            --host="$LFS_TGT"                 \
            --build="$(build-aux/config.guess)" \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime

make && make DESTDIR="$LFS" install

mv -v "$LFS"/usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} "$LFS"/bin
mv -v "$LFS"/usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm}        "$LFS"/bin
mv -v "$LFS"/usr/bin/{rmdir,stty,sync,true,uname}               "$LFS"/bin
mv -v "$LFS"/usr/bin/{head,nice,sleep,touch}                    "$LFS"/bin
mv -v "$LFS"/usr/bin/chroot                                     "$LFS"/usr/sbin
mkdir -pv "$LFS"/usr/share/man/man8
mv -v "$LFS"/usr/share/man/man1/chroot.1                        "$LFS"/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/'                                             "$LFS"/usr/share/man/man8/chroot.8

. "$DIST_ROOT"/build_env/build_scripts/inc-end.sh "$1" "$(basename "$0")"
