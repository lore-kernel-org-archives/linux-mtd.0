From: btuch@usa.net (Brian)
Date: Tue, 4 Mar 2003 15:25:24 -0600
Subject: compile problem
Message-ID: <003c01c2e294$91781b40$150a0ac0@jbmsoft.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I posted before about a mount problem, but I believe it is because I was
compiling the utils outside my embedded build.  The embedded build I use
passes in a -nostdinc option to gcc.  I left this option out for the
mtd-utilites to try to get up and running with a newer kernel.  I am
attempting to get the current CVS tree to compile, but I get the following
errors:

--snip--
gcc -O2 -fomit-frame-pointer -fno-builtin -DCONFIG_LINEO -DCONFIG_NETtel -DC
ONFIG_X86 -Dlinux -D__linux__ -Dunix -DEMBED -nostdinc -I/usr/lib/gcc-lib/i3
86-redhat-linux/2.96/./include -I/usr/src/Lineo/current_build2/lib/glibc/bui
ld/include -I/usr/src/Lineo/current_build2 -I/usr/src/Lineo/current_build2/l
inux-2.4.x/include -I/usr/src/Lineo/current_build2/linux-2.4.x/include  -I/u
sr/src/Lineo/current_build2/linux-2.4.x/include/linux -I/usr/src/Lineo/curre
nt_build2/linux-2.4.x/fs/jffs2/
 -c -o compr_zlib.o compr_zlib.c
compr_zlib.c: In function `jffs2_zlib_compress':
compr_zlib.c:63: structure has no member named `zalloc'
compr_zlib.c:64: structure has no member named `zfree'
compr_zlib.c: In function `jffs2_zlib_decompress':
compr_zlib.c:108: structure has no member named `zalloc'
compr_zlib.c:109: structure has no member named `zfree'
make[2]: *** [compr_zlib.o] Error 1
--snip--

compr_zlib.c was not including the header zlib.h, so I changed that, and now
get the above errors.  I can't locate the file which lists zalloc, or zfree
in a structure.

Can anyone offer some insite into the problem?  I have tried copying headers
from the kernel souce, and several other things, but nothing had helped yet.

Thanks in advance!

-Brian
