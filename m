Received: from mx0.gmx.net ([213.165.64.100])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Y52r-0003ep-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2002 14:22:13 +0100
Date: Fri, 26 Jul 2002 15:21:42 +0200 (MEST)
From: Frank Oltmanns <frank.oltmanns.ml@gmx.de>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Subject: Compiling Grub for DOC2000
Message-ID: <23438.1027689702@www54.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi all,

I'm trying to run Linux (to be exact: RT-Linux) from a DiskOnChip. It's
already booting from NFS. I've got a Kernel (2.4.18) with build-in MTD-
support. I can mount/access the DOC when booting NFS. So far everything
is allright.
Here's my problem:
I want the whole thing to boot without NFS from DOC. I want to use grub
to get it work, but I can't even compile grub. This is what I did:
  1) I patched grub-0.92 with the mtd-patch
  2) I ran aclocal (everythings fine so far)
  3) I ran automake (Version 1.6.2)
Now I'm getting some strange Error-Messages (see below), and I don't
know what to do. I also tried to run autoconf and make afterwards.
Autoconf (Version 2.5.3) works fine, but make aborts.
Does anyone know what to do?

Thanks in advance
  Frank Oltmanns

Here's the script of what I did:

master:/home/frank/grub-0.92 # patch -p0 -i
../mtd-tools/mtd/patches/grub-2002-02-19-doc.patch
patching file AUTHORS
patching file ChangeLog
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- saving rejects to file ChangeLog.rej
patching file README_DiskOnChip
patching file configure.in
patching file stage1/Makefile.am
patching file stage1/doc_stage1.S
patching file stage1/doc_stage1.h
patching file stage1/doc_stage1b.S
patching file stage1/makecsum.c
patching file stage2/Makefile.am
patching file stage2/asm.S
patching file stage2/bdev_diskonchip.c
patching file stage2/bios.c
patching file stage2/boot.c
patching file stage2/builtins.c
Hunk #1 succeeded at 1350 (offset 60 lines).
Hunk #2 succeeded at 3083 (offset 60 lines).
patching file stage2/char_io.c
patching file stage2/disk_io.c
patching file stage2/shared.h
Hunk #3 succeeded at 897 (offset 1 line).
Hunk #4 succeeded at 1038 (offset 1 line).
patching file stage2/stage2.c
master:/home/frank/grub-0.92 # aclocal
master:/home/frank/grub-0.92 # echo $?
0
master:/home/frank/grub-0.92 # automake
automake: docs/Makefile.am: Assembler source seen but `CCAS' not defined in
`configure.in'
automake: docs/Makefile.am: Assembler source seen but `CCASFLAGS' not
defined in `configure.in'
automake: stage1/Makefile.am: Assembler source seen but `CCAS' not defined
in `configure.in'
automake: stage1/Makefile.am: Assembler source seen but `CCASFLAGS' not
defined in `configure.in'
automake: stage2/Makefile.am: Assembler source seen but `CCAS' not defined
in `configure.in'
automake: stage2/Makefile.am: Assembler source seen but `CCASFLAGS' not
defined in `configure.in'
master:/home/frank/grub-0.92 # echo $?
1
master:/home/frank/grub-0.92 # autoconf
master:/home/frank/grub-0.92 # echo $?
0
master:/home/frank/grub-0.92 # a ./configure --enable-diskonchip-2000
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... gawk
checking whether make sets ${MAKE}... yes
checking build system type... i586-pc-linux-gnu
checking host system type... i586-pc-linux-gnu
checking whether to enable maintainer-specific portions of Makefiles... no
checking for gcc... gcc
checking for gcc... (cached) gcc
checking for C compiler default output... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for style of include used by make... GNU
checking dependency style of gcc... gcc
checking dependency style of gcc... (cached) gcc
checking for ranlib... ranlib
checking whether optimization for size works... yes
checking whether -Wundef works... yes
checking for objcopy... objcopy
checking if C symbols get an underscore after compilation... no
checking whether objcopy works for absolute addresses... yes
checking whether addr32 must be in the same line as the instruction... yes
checking for .code16 addr32 assembler support... yes
checking whether an absolute indirect call/jump must not be prefixed with an
asterisk... no
checking if start is defined by the compiler... no
checking if _start is defined by the compiler... yes
checking if __bss_start is defined by the compiler... yes
checking if _edata is defined by the compiler... yes
checking if edata is defined by the compiler... yes
checking if end is defined by the compiler... yes
checking if _end is defined by the compiler... yes
checking for opendisk in -lutil... no
checking for wgetch in -lncurses... yes
checking how to run the C preprocessor... gcc -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for string.h... (cached) yes
checking for strings.h... (cached) yes
checking ncurses/curses.h usability... no
checking ncurses/curses.h presence... no
checking for ncurses/curses.h... no
checking ncurses.h usability... yes
checking ncurses.h presence... yes
checking for ncurses.h... yes
checking curses.h usability... yes
checking curses.h presence... yes
checking for curses.h... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating stage1/Makefile
config.status: creating stage2/Makefile
config.status: creating docs/Makefile
config.status: creating lib/Makefile
config.status: creating util/Makefile
config.status: creating grub/Makefile
config.status: creating netboot/Makefile
config.status: creating util/grub-image
config.status: creating util/grub-install
config.status: creating util/grub-md5-crypt
config.status: creating config.h
config.status: executing depfiles commands
master:/home/frank/grub-0.92 # echo $?
0
master:/home/frank/grub-0.92 # make
make  all-recursive
make[1]: Entering directory `/home/frank/grub-0.92'
Making all in netboot
make[2]: Entering directory `/home/frank/grub-0.92/netboot'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/frank/grub-0.92/netboot'
Making all in stage2
make[2]: Entering directory `/home/frank/grub-0.92/stage2'
/bin/sh: CCASFLAGS@: command not found
make[2]: *** [asm.o] Error 127
make[2]: Leaving directory `/home/frank/grub-0.92/stage2'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/frank/grub-0.92'
make: *** [all] Error 2
master:/home/frank/grub-0.92 # echo $?
2

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
