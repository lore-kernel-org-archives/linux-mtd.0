Received: from ns1.ixmail.hkcix.com ([202.181.230.228] helo=ixmail.hkcix.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tqNe-0003zg-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2001 14:05:06 +0100
Received: from uniquemodem.com ([202.181.182.134])
	by ixmail.hkcix.com (8.11.5/8.10.2) with ESMTP id f9HD88518367
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2001 21:08:08 +0800
Message-ID: <3BCD84E1.4DD484A6@uniquemodem.com>
Date: Wed, 17 Oct 2001 21:17:21 +0800
From: data <data@uniquemodem.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtdblock.c cannot compile under Linux 2.2.x
Content-Type: text/plain; charset=us-ascii
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

Hi David,

Thanks for your information for fixing the parsing error in chipreg.c. I
have gone through another step and the compilation fail in the
mtdblock.c area. I don't know what goes wrong. Could you please have a
look at our problem? I have attacked the log for your reference.


Build log:

make all_targets
make[3]: Entering directory `/home/root/linux-2.2.18/drivers/mtd'
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce
-m386 -DCPU=386   -c -o mtdcore.o mtdcore.c
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce
-m386 -DCPU=386   -c -o mtdchar-compat.o mtdchar-compat.c
cc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce
-m386 -DCPU=386   -c -o mtdblock.o mtdblock.c
mtdblock.c: In function `mtdblock_ioctl':
mtdblock.c:544: impossible register constraint in `asm'
mtdblock.c:544: impossible register constraint in `asm'
mtdblock.c:544: impossible register constraint in `asm'
mtdblock.c:563: confused by earlier errors, bailing out
make[3]: *** [mtdblock.o] Error 1
make[3]: Leaving directory `/home/root/linux-2.2.18/drivers/mtd'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/home/root/linux-2.2.18/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory `/home/root/linux-2.2.18/drivers'
make: *** [_dir_drivers] Error 2
[root@localhost linux]#

Build: End

In order to let me carry forward the compilation process, I have change
our selection to drop the MTD_BLOCK_DEVICE option. The compilation has
passed the mtd but fail again at kernel build. I have also attached the
console log for your reference.

Could you please llet me know what goes wrong for the compilation
process?

Thanks and regards,

Jimmy Chun


Build Log:

make[2]: Leaving directory `/home/root/linux-2.2.18/arch/i386/lib'
make[1]: Leaving directory `/home/root/linux-2.2.18/arch/i386/lib'
cc -D__KERNEL__ -I/usr/src/linux/include -E -C -P
-I/usr/src/linux/include -imacros
/usr/src/linux/include/asm-i386/page_offset.h -Ui386
arch/i386/vmlinux.lds.S >arch/i386/vmlinux.lds
ld -m elf_i386 -T /usr/src/linux/arch/i386/vmlinux.lds -e stext
arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o
init/version.o \
 --start-group \
 arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o mm/mm.o
fs/fs.o ipc/ipc.o \
 fs/filesystems.a \
 net/network.a \
 drivers/block/block.a drivers/char/char.o drivers/misc/misc.a
drivers/net/net.a drivers/pci/pci.a drivers/video/video.a \
 /usr/src/linux/arch/i386/lib/lib.a /usr/src/linux/lib/lib.a
/usr/src/linux/arch/i386/lib/lib.a \
 --end-group \
 -o vmlinux
init/main.o: In function `do_basic_setup':
init/main.o(.text.init+0xec7): undefined reference to `init_mtd'
fs/fs.o: In function `filesystem_setup':
fs/fs.o(.text.init+0x533): undefined reference to `init_jffs_fs'
make: *** [vmlinux] Error 1
[root@localhost linux]#


Build END
