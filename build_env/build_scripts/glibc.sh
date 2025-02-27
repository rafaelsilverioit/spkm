echo 
echo "Glibc"
echo
sleep 1

cd "$LFS"/sources
tar -xf glibc-2.33.tar.xz
cd glibc-2.33

ln -sfv ../lib/ld-linux-x86-64.so.2 "$LFS"/lib64
ln -sfv ../lib/ld-linux-x86-64.so.2 "$LFS"/lib64/ld-lsb-x86-64.so.3

patch -Np1 -i ../glibc-2.33-fhs-1.patch

mkdir -p build && cd build

../configure                               \
      --prefix=/usr                        \
      --host="$LFS_TGT"                    \
      --build="$(../scripts/config.guess)" \
      --enable-kernel=3.2                  \
      --with-headers="$LFS/usr/include"    \
      libc_cv_slibdir=/lib

make

make DESTDIR="$LFS" install

echo
echo "TESTING GLIBC"
echo
echo 'int main(){}' > dummy.c
"$LFS_TGT-gcc" dummy.c

readelf -l a.out | grep '/ld-linux'

"$LFS/tools/libexec/gcc/$LFS_TGT/10.2.0/install-tools/mkheaders"

cd "$LFS"/sources
rm -rf glibc-2.33