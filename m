From: chaffmanus@yahoo.com (tony Tong)
Date: Sat, 8 Feb 2003 18:40:42 -0800 (PST)
Subject: grub-doc patch problem
In-Reply-To: <200302081157.05636.mark@lakeshoremicro.com>
Message-ID: <20030209024042.2482.qmail@web20802.mail.yahoo.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

The problem still stands!! The result dejected me so
much .
I have tested the combination of 2003-0108.patch and
Grub from CVS by Wincvs tool .
The patch still cannot pass without errors.
The  following is my all steps :
1:use "rpm -Uvh " to update automake 1.5 autoconf
autoconf 2.53
2:use Wincvs to get grub directory from CVS
use winrar  to get grub.zip
3.copy grub.zip to linux platform 
and use "unzip grub.zip"
4.from ftp.uk.linux.org ,I get the 0208 snapshot of
mtd
5."bunzip -d  mtd.tar.bz2 " 
  tar xvf mtd.tar
6.cd grub
7."patch -p0 -i
../mtd/patches/grub-2003-01-08-doc.patch " 
then I get the following output:
"patching file ./AUTHORS
Hunk #1 FAILED at 45.
1 out of 1 hunk FAILED -- saving rejects to file
./AUTHORS.rej
patching file ./ChangeLog
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 197.
Hunk #3 FAILED at 287.
3 out of 3 hunks FAILED -- saving rejects to file
./ChangeLog.rej
patching file ./README_DiskOnChip
patching file ./configure.in
Hunk #1 FAILED at 247.
1 out of 1 hunk FAILED -- saving rejects to file
./configure.in.rej
patching file ./stage1/Makefile.am
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 53.
2 out of 2 hunks FAILED -- saving rejects to file
./stage1/Makefile.am.rej
patching file ./stage1/doc_stage1.S
patching file ./stage1/doc_stage1.h
patching file ./stage1/makecsum.c
patching file ./stage2/Makefile.am
Hunk #1 FAILED at 83.
1 out of 1 hunk FAILED -- saving rejects to file
./stage2/Makefile.am.rej
patching file ./stage2/asm.S
Hunk #1 FAILED at 133.
Hunk #2 FAILED at 2331.
2 out of 2 hunks FAILED -- saving rejects to file
./stage2/asm.S.rej
patching file ./stage2/bdev_diskonchip.c
patching file ./stage2/bios.c
Hunk #1 FAILED at 129.
Hunk #2 FAILED at 226.
2 out of 2 hunks FAILED -- saving rejects to file
./stage2/bios.c.rej
patching file ./stage2/boot.c
Hunk #1 FAILED at 61.
1 out of 1 hunk FAILED -- saving rejects to file
./stage2/boot.c.rej
patching file ./stage2/builtins.c
Hunk #1 FAILED at 1322.
Hunk #2 FAILED at 3062.
2 out of 2 hunks FAILED -- saving rejects to file
./stage2/builtins.c.rej
patching file ./stage2/char_io.c
Hunk #1 FAILED at 1170.
Hunk #2 FAILED at 1195.
Hunk #3 FAILED at 1257.
3 out of 3 hunks FAILED -- saving rejects to file
./stage2/char_io.c.rej
patching file ./stage2/disk_io.c
Hunk #1 FAILED at 126.
Hunk #2 FAILED at 319.
Hunk #3 FAILED at 396.
Hunk #4 FAILED at 655.
Hunk #5 FAILED at 737.
Hunk #6 FAILED at 997.
Hunk #7 FAILED at 1024.
Hunk #8 FAILED at 1136.
Hunk #9 FAILED at 1227.
Hunk #10 FAILED at 1261.
Hunk #11 FAILED at 1646.
11 out of 11 hunks FAILED -- saving rejects to file
./stage2/disk_io.c.rej
patching file ./stage2/shared.h
Hunk #1 FAILED at 27.
Hunk #2 FAILED at 188.
Hunk #3 FAILED at 982.
3 out of 3 hunks FAILED -- saving rejects to file
./stage2/shared.h.rej
patching file ./stage2/stage2.c
Hunk #1 FAILED at 824.
Hunk #2 FAILED at 907.
2 out of 2 hunks FAILED -- saving rejects to file
./stage2/stage2.c.rej"

Why this happen ? 
It seems to have nothing to do with automake or
autoconf because the patch process doesnot need it .
Can you mail me your grub cvs version ?
For some reasons ,our country limit our access to
website of foreign countries . I have to use proxy but
when using Wincvs ,proxy often cannot work.
I guess maybe the grub cvs version is the key .










-- Mark Meade <mark@lakeshoremicro.com> wrote:
> Use the grub-2003-01-08-doc.patch with the latest
> GRUB cvs.  You will get 
> errors when patching ChangeLog, but those don't
> matter. 


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
