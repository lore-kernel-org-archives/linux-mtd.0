From: tom@ceisystems.com (Thomas Cameron)
Date: Sun, 30 Mar 2003 01:38:48 -0500
Subject: Can not compile patched 2.4.20 kernel...
Message-ID: <6D31D5429FA6884CBE9ECAB6C9B5E6A94445@intel-srvr.patcameron.ne.mediaone.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hello all,

	I have been trying (for a few days now) to get my kernel patched
and compiled with the latest CVS sources for jffs(2), and the MTD
devices.  The problem, however, is that I keep getting the `parse error
before "struct"` message when actually compiling the sources.

       I have searched through google for every possible combination of
header file names, structure names, etc. that I can think of, and have
had no good reference to fixing this on the x86 platform for the 2.4.20
kernel series.  I would really love to be able to use the MTD sources
instead of the M-Systems "DiskOnChip" kernel module, because of
continuing development, support, and performance enhancements.

	To let everybody know, I am not a kernel hacker.  My confidence
in my C skills is not even close to that high.  I do have a moderate
working knowledge of the language and it's structure, so I can look at
code and at least understand it.  So, I guess if I have to jam some
patches in somewhere, I would be capable, but I think my abilities would
end there.

	Below is the last line of output from my kernel build (make
bzImage).  I hope that this explains enough what files are being looked
at during the failure.  If not, please mail me personally, and I can see
what else I can find.

---- Output Snippet ----

/opt/development/bootcd/buildroot/build/staging_dir/bin/i386-uclibc-gcc
-D__KERNEL__
-I/opt/development/bootcd/buildroot/build/linux-2.4.20-krd2/include
-Wall -Wstrict-prototypes -Wno-trigraphs -O3 -fno-strict-aliasing
-fno-common -march=3Di586 -fomit-frame-pointer -pipe
-mpreferred-stack-boundary=3D2 -march=3Di586   -nostdinc -iwithprefix
include -DKBUILD_BASENAME=3Dmtdcore  -DEXPORT_SYMTAB -c mtdcore.c
In file included from mtdcore.c:20:
/opt/development/bootcd/buildroot/build/linux-2.4.20-krd2/include/linux/
mtd/compatmac.h:523:1: warning: "set_user_nice" redefined
In file included from
/opt/development/bootcd/buildroot/build/linux-2.4.20-krd2/include/linux/
modversions.h:166,
                 from
/opt/development/bootcd/buildroot/build/linux-2.4.20-krd2/include/linux/
module.h:21,
                 from mtdcore.c:10:
/opt/development/bootcd/buildroot/build/linux-2.4.20-krd2/include/linux/
modules/ksyms.ver:624:1: warning: this is the location of the previous
definition
/opt/development/bootcd/buildroot/build/staging_dir/bin/i386-uclibc-gcc
-D__KERNEL__
-I/opt/development/bootcd/buildroot/build/linux-2.4.20-krd2/include
-Wall -Wstrict-prototypes -Wno-trigraphs -O3 -fno-strict-aliasing
-fno-common -march=3Di586 -fomit-frame-pointer -pipe
-mpreferred-stack-boundary=3D2 -march=3Di586   -nostdinc -iwithprefix
include -DKBUILD_BASENAME=3Dmtdchar  -c -o mtdchar.o mtdchar.c
/opt/development/bootcd/buildroot/build/staging_dir/bin/i386-uclibc-gcc
-D__KERNEL__
-I/opt/development/bootcd/buildroot/build/linux-2.4.20-krd2/include
-Wall -Wstrict-prototypes -Wno-trigraphs -O3 -fno-strict-aliasing
-fno-common -march=3Di586 -fomit-frame-pointer -pipe
-mpreferred-stack-boundary=3D2 -march=3Di586   -nostdinc -iwithprefix
include -DKBUILD_BASENAME=3Dftl  -c -o ftl.o ftl.c
In file included from
/opt/development/bootcd/buildroot/build/linux-2.4.20-krd2/include/linux/
blk.h:4,
                 from ftl.c:134:
/opt/development/bootcd/buildroot/build/linux-2.4.20-krd2/include/linux/
blkdev.h:147: parse error before "struct"
make[3]: *** [ftl.o] Error 1
make[3]: Leaving directory
`/opt/development/bootcd/buildroot/build/linux-2.4.20-krd2/drivers/mtd'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory
`/opt/development/bootcd/buildroot/build/linux-2.4.20-krd2/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory
`/opt/development/bootcd/buildroot/build/linux-2.4.20-krd2/drivers'
make: *** [_dir_drivers] Error 2

---- Output Snippet ----

Thanks in advance,
Thomas Cameron
