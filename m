From: igor.trevisan@bluewind.it (Igor Trevisan)
Date: Fri, 07 Feb 2003 15:18:50 +0100
Subject: mkfs.jffs on arm
In-Reply-To: <1044626056.21169.11.camel@passion.cambridge.redhat.com>
References: <3E43C03E.4616.12A05CE@localhost>
Message-ID: <3E43CE5A.28886.1612269@localhost>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Thanks!

Modifiing Makefile in /utils with the right CROSS definition
and doing make util from /mtd did the job...
but not completely.
I could build almost all the utilities related with JFFS
a part from mkfs.jffs2 (mkfs.jffs is ok).
This is how the compile flow ends...

 /home/igortr/arm-tools/gcc-3.2.1/bin/../lib/gcc-lib/arm-
linux/3.2.1/../../../../arm-linux/bin/as -o compr_rtime.o 
/home/igortr/tmp/cc0T634m.s
arm-uclibc-gcc -v -I/home/igortr/arm-tools/linux/include -
I/home/igortr/arm-tools/linux/include/linux-O2 -static -Wall -Wstrict-
prototypes -Wshadow   -c -o mkfs.jffs2.o mkfs.jffs2.c
Reading specs from /home/igortr/arm-tools/gcc-3.2.1/bin/../lib/gcc-
lib/arm-linux/3.2.1/specs
Configured with: /home/igortr/arm-tools/toolchain/gcc-3.2.1/build/gcc-
3.2.1/configure --target=arm-linux --prefix=/home/igortr/arm-
tools/toolchain/gcc-3.2.1 --exec-prefix=/home/igortr/arm-
tools/toolchain/gcc-3.2.1 --bindir=/home/igortr/arm-tools/toolchain/gcc-
3.2.1/bin --sbindir=/home/igortr/arm-tools/toolchain/gcc-3.2.1/sbin --
sysconfdir=/home/igortr/arm-tools/toolchain/gcc-3.2.1/etc --
datadir=/home/igortr/arm-tools/toolchain/gcc-3.2.1/share --
localstatedir=/home/igortr/arm-tools/toolchain/gcc-3.2.1/var --
mandir=/home/igortr/arm-tools/toolchain/gcc-3.2.1/man --
infodir=/home/igortr/arm-tools/toolchain/gcc-3.2.1/info --with-local-
prefix=/home/igortr/arm-tools/toolchain/gcc-3.2.1/usr/local --
libdir=/home/igortr/arm-tools/toolchain/gcc-3.2.1/lib --
includedir=/home/igortr/arm-tools/toolchain/gcc-3.2.1/include --with-
gxx-include-dir=/home/igortr/arm-tools/toolchain/gcc-3.2.1/include/c++ 
--oldincludedir=/home/igortr/arm-tools/toolchain/gcc-3.2.1/include --
enable-shared --enable-target-optspace --disable-nls --with-gnu-ld --
disable-__cxa_atexit --enable-languages=c,c++ --program-prefix=arm-
uclibc-
Thread model: posix
gcc version 3.2.1
 /home/igortr/arm-tools/gcc-3.2.1/bin/../lib/gcc-lib/arm-linux/3.2.1/cc1 -
lang-c -v -I/home/igortr/arm-tools/linux/include -I/home/igortr/arm-
tools/linux/include/linux-O2 -iprefix /home/igortr/arm-tools/gcc-
3.2.1/bin/../lib/gcc-lib/arm-linux/3.2.1/ -D__GNUC__=3 -
D__GNUC_MINOR__=2 -D__GNUC_PATCHLEVEL__=1 -
D__GXX_ABI_VERSION=102 -Dunix -D__gnu_linux__ -Dlinux -
D__ELF__ -D__unix__ -D__gnu_linux__ -D__linux__ -D__ELF__ -
D__unix -D__linux -Asystem=unix -Asystem=posix -D__NO_INLINE__ 
-D__STDC_HOSTED__=1 -Acpu=arm -Amachine=arm -
D__ARM_ARCH_4T__ -D__APCS_32__ -D__ARMEL__ -D__arm__ 
mkfs.jffs2.c -quiet -dumpbase mkfs.jffs2.c -Wall -Wstrict-prototypes -
Wshadow -version -o /home/igortr/tmp/ccJ41T7C.s
ignoring nonexistent directory "/home/igortr/arm-
tools/linux/include/linux-O2"
GNU CPP version 3.2.1 (cpplib) (ARM GNU/Linux with ELF)
GNU C version 3.2.1 (arm-linux)
        compiled by GNU C version 2.96 20000731 (Mandrake Linux 8.1 
2.96-0.62mdk).
ignoring duplicate directory "/home/igortr/arm-tools/gcc-3.2.1/arm-
linux/include"
ignoring duplicate directory "/home/igortr/arm-tools/toolchain/gcc-
3.2.1/include"
ignoring duplicate directory "/home/igortr/arm-tools/toolchain/gcc-
3.2.1/lib/gcc-lib/arm-linux/3.2.1/include"
ignoring duplicate directory "/home/igortr/arm-tools/toolchain/gcc-
3.2.1/lib/../arm-linux/sys-include"
ignoring duplicate directory "/home/igortr/arm-tools/toolchain/gcc-
3.2.1/lib/../arm-linux/include"
#include "..." search starts here:
#include <...> search starts here:
 /home/igortr/arm-tools/linux/include
 /home/igortr/arm-tools/gcc-3.2.1/lib/gcc-lib/arm-linux/3.2.1/include
 /home/igortr/arm-tools/gcc-3.2.1/arm-linux/sys-include
End of search list.
mkfs.jffs2.c:66:18: zlib.h: No such file or directory
mkfs.jffs2.c: In function `write_dirent':
mkfs.jffs2.c:770: warning: implicit declaration of function `cpu_to_je16'
mkfs.jffs2.c:772: warning: implicit declaration of function `cpu_to_je32'
mkfs.jffs2.c: In function `write_regular_file':
mkfs.jffs2.c:829: warning: implicit declaration of function 
`cpu_to_jemode'
mkfs.jffs2.c:884: warning: implicit declaration of function `je32_to_cpu'
mkfs.jffs2.c: In function `write_special_file':
mkfs.jffs2.c:993: `jint16_t' undeclared (first use in this function)
mkfs.jffs2.c:993: (Each undeclared identifier is reported only once
mkfs.jffs2.c:993: for each function it appears in.)
mkfs.jffs2.c:993: parse error before "kdev"
mkfs.jffs2.c:1001: `kdev' undeclared (first use in this function)
make: *** [mkfs.jffs2.o] Error 1

Any ideas about this error?
Thanks again...
	Igor.


On 7 Feb 2003 at 13:54, David Woodhouse wrote:

> On Fri, 2003-02-07 at 13:18, Igor Trevisan wrote:
> > Hi all!
> > 
> > I have to port mkfs.jffs and erase commands on my
> > EDB7312 board (arm core by CirrusLogic) but I'm having
> > some problems...
> > Are there any suggestion to cross-compile mtd utilities
> > for an arm target?
> > Thanks inadvance..
> > 	Igor.
> 
> make CROSS=arm-linux-
> 
> -- 
> dwmw2
