Received: from f243.law7.hotmail.com ([216.33.237.243] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15uGel-0006N8-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2001 18:08:31 +0100
From: "arunchandra kalluri" <arunchandrak@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: mtd compiling problem on 2.2.16
Date: Thu, 18 Oct 2001 17:17:09 
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F2431PArh8Hw3xQfVCC00009305@hotmail.com>
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





Hi

I have seen the below problem when trying to compile(making zImage) the mtd
using 2.2.16, could some one show me a pointer or gave me a patch to resolve
this issue.

thanks
Arun

Script started on Thu Oct 18 05:44:27 2001
[root@localhost linux]# make zImage
kgcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -fno-strict-aliasing -D__SMP__ -pipe
-fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2
-malign-functions=2 -DCPU=686 -DUTS_MACHINE='"i386"' -c -o init/version.o
init/version.c
make -C  kernel
make[1]: Entering directory `/usr/src/linux-2.2.16/kernel'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.2.16/kernel'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/linux-2.2.16/kernel'
make[1]: Leaving directory `/usr/src/linux-2.2.16/kernel'
make -C  drivers
make[1]: Entering directory `/usr/src/linux-2.2.16/drivers'
make -C block
make[2]: Entering directory `/usr/src/linux-2.2.16/drivers/block'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/block'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/block'
make[2]: Leaving directory `/usr/src/linux-2.2.16/drivers/block'
make -C char
make[2]: Entering directory `/usr/src/linux-2.2.16/drivers/char'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/char'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/char'
make[2]: Leaving directory `/usr/src/linux-2.2.16/drivers/char'
make -C net
make[2]: Entering directory `/usr/src/linux-2.2.16/drivers/net'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/net'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/net'
make[2]: Leaving directory `/usr/src/linux-2.2.16/drivers/net'
make -C misc
make[2]: Entering directory `/usr/src/linux-2.2.16/drivers/misc'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/misc'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/misc'
make[2]: Leaving directory `/usr/src/linux-2.2.16/drivers/misc'
make -C sound
make[2]: Entering directory `/usr/src/linux-2.2.16/drivers/sound'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/sound'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/sound'
make[2]: Leaving directory `/usr/src/linux-2.2.16/drivers/sound'
make -C pci
make[2]: Entering directory `/usr/src/linux-2.2.16/drivers/pci'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/pci'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/pci'
make[2]: Leaving directory `/usr/src/linux-2.2.16/drivers/pci'
make -C video
make[2]: Entering directory `/usr/src/linux-2.2.16/drivers/video'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/video'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/video'
make[2]: Leaving directory `/usr/src/linux-2.2.16/drivers/video'
make -C mtd
make[2]: Entering directory `/usr/src/linux-2.2.16/drivers/mtd'
make -C chips
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/mtd/chips'
make all_targets
make[4]: Entering directory `/usr/src/linux-2.2.16/drivers/mtd/chips'
make[4]: Nothing to be done for `all_targets'.
make[4]: Leaving directory `/usr/src/linux-2.2.16/drivers/mtd/chips'
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/mtd/chips'
make -C maps
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/mtd/maps'
make all_targets
make[4]: Entering directory `/usr/src/linux-2.2.16/drivers/mtd/maps'
make[4]: Nothing to be done for `all_targets'.
make[4]: Leaving directory `/usr/src/linux-2.2.16/drivers/mtd/maps'
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/mtd/maps'
make -C devices
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/mtd/devices'
make all_targets
make[4]: Entering directory `/usr/src/linux-2.2.16/drivers/mtd/devices'
make[4]: Nothing to be done for `all_targets'.
make[4]: Leaving directory `/usr/src/linux-2.2.16/drivers/mtd/devices'
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/mtd/devices'
make -C nand
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/mtd/nand'
make all_targets
make[4]: Entering directory `/usr/src/linux-2.2.16/drivers/mtd/nand'
make[4]: Nothing to be done for `all_targets'.
make[4]: Leaving directory `/usr/src/linux-2.2.16/drivers/mtd/nand'
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/mtd/nand'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/mtd'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/mtd'
make[2]: Leaving directory `/usr/src/linux-2.2.16/drivers/mtd'
make -C scsi
make[2]: Entering directory `/usr/src/linux-2.2.16/drivers/scsi'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/scsi'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/scsi'
make[2]: Leaving directory `/usr/src/linux-2.2.16/drivers/scsi'
make -C cdrom
make[2]: Entering directory `/usr/src/linux-2.2.16/drivers/cdrom'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/drivers/cdrom'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/drivers/cdrom'
make[2]: Leaving directory `/usr/src/linux-2.2.16/drivers/cdrom'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.2.16/drivers'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/linux-2.2.16/drivers'
make[1]: Leaving directory `/usr/src/linux-2.2.16/drivers'
make -C  mm
make[1]: Entering directory `/usr/src/linux-2.2.16/mm'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.2.16/mm'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/linux-2.2.16/mm'
make[1]: Leaving directory `/usr/src/linux-2.2.16/mm'
make -C  fs
make[1]: Entering directory `/usr/src/linux-2.2.16/fs'
make -C ext2
make[2]: Entering directory `/usr/src/linux-2.2.16/fs/ext2'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/fs/ext2'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/fs/ext2'
make[2]: Leaving directory `/usr/src/linux-2.2.16/fs/ext2'
make -C proc
make[2]: Entering directory `/usr/src/linux-2.2.16/fs/proc'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/fs/proc'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/fs/proc'
make[2]: Leaving directory `/usr/src/linux-2.2.16/fs/proc'
make -C isofs
make[2]: Entering directory `/usr/src/linux-2.2.16/fs/isofs'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/fs/isofs'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/fs/isofs'
make[2]: Leaving directory `/usr/src/linux-2.2.16/fs/isofs'
make -C nfs
make[2]: Entering directory `/usr/src/linux-2.2.16/fs/nfs'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/fs/nfs'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/fs/nfs'
make[2]: Leaving directory `/usr/src/linux-2.2.16/fs/nfs'
make -C lockd
make[2]: Entering directory `/usr/src/linux-2.2.16/fs/lockd'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/fs/lockd'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/fs/lockd'
make[2]: Leaving directory `/usr/src/linux-2.2.16/fs/lockd'
make -C romfs
make[2]: Entering directory `/usr/src/linux-2.2.16/fs/romfs'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/fs/romfs'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/fs/romfs'
make[2]: Leaving directory `/usr/src/linux-2.2.16/fs/romfs'
make -C jffs
make[2]: Entering directory `/usr/src/linux-2.2.16/fs/jffs'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/fs/jffs'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/fs/jffs'
make[2]: Leaving directory `/usr/src/linux-2.2.16/fs/jffs'
make -C autofs
make[2]: Entering directory `/usr/src/linux-2.2.16/fs/autofs'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/fs/autofs'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/fs/autofs'
make[2]: Leaving directory `/usr/src/linux-2.2.16/fs/autofs'
make -C devpts
make[2]: Entering directory `/usr/src/linux-2.2.16/fs/devpts'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/fs/devpts'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/fs/devpts'
make[2]: Leaving directory `/usr/src/linux-2.2.16/fs/devpts'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.2.16/fs'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/linux-2.2.16/fs'
make[1]: Leaving directory `/usr/src/linux-2.2.16/fs'
make -C  net
make[1]: Entering directory `/usr/src/linux-2.2.16/net'
make -C core
make[2]: Entering directory `/usr/src/linux-2.2.16/net/core'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/net/core'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/net/core'
make[2]: Leaving directory `/usr/src/linux-2.2.16/net/core'
make -C ethernet
make[2]: Entering directory `/usr/src/linux-2.2.16/net/ethernet'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/net/ethernet'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/net/ethernet'
make[2]: Leaving directory `/usr/src/linux-2.2.16/net/ethernet'
make -C sched
make[2]: Entering directory `/usr/src/linux-2.2.16/net/sched'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/net/sched'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/net/sched'
make[2]: Leaving directory `/usr/src/linux-2.2.16/net/sched'
make -C 802
make[2]: Entering directory `/usr/src/linux-2.2.16/net/802'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/net/802'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/net/802'
make[2]: Leaving directory `/usr/src/linux-2.2.16/net/802'
make -C ipv4
make[2]: Entering directory `/usr/src/linux-2.2.16/net/ipv4'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/net/ipv4'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/net/ipv4'
make[2]: Leaving directory `/usr/src/linux-2.2.16/net/ipv4'
make -C unix
make[2]: Entering directory `/usr/src/linux-2.2.16/net/unix'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/net/unix'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/net/unix'
make[2]: Leaving directory `/usr/src/linux-2.2.16/net/unix'
make -C packet
make[2]: Entering directory `/usr/src/linux-2.2.16/net/packet'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/net/packet'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/net/packet'
make[2]: Leaving directory `/usr/src/linux-2.2.16/net/packet'
make -C sunrpc
make[2]: Entering directory `/usr/src/linux-2.2.16/net/sunrpc'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.16/net/sunrpc'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.16/net/sunrpc'
make[2]: Leaving directory `/usr/src/linux-2.2.16/net/sunrpc'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.2.16/net'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/linux-2.2.16/net'
make[1]: Leaving directory `/usr/src/linux-2.2.16/net'
make -C  ipc
make[1]: Entering directory `/usr/src/linux-2.2.16/ipc'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.2.16/ipc'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/linux-2.2.16/ipc'
make[1]: Leaving directory `/usr/src/linux-2.2.16/ipc'
make -C  lib
make[1]: Entering directory `/usr/src/linux-2.2.16/lib'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.2.16/lib'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/linux-2.2.16/lib'
make[1]: Leaving directory `/usr/src/linux-2.2.16/lib'
make -C  arch/i386/kernel
make[1]: Entering directory `/usr/src/linux-2.2.16/arch/i386/kernel'
make[1]: Nothing to be done for `all'.
make[1]: Leaving directory `/usr/src/linux-2.2.16/arch/i386/kernel'
make -C  arch/i386/mm
make[1]: Entering directory `/usr/src/linux-2.2.16/arch/i386/mm'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.2.16/arch/i386/mm'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/linux-2.2.16/arch/i386/mm'
make[1]: Leaving directory `/usr/src/linux-2.2.16/arch/i386/mm'
make -C  arch/i386/lib
make[1]: Entering directory `/usr/src/linux-2.2.16/arch/i386/lib'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.2.16/arch/i386/lib'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/linux-2.2.16/arch/i386/lib'
make[1]: Leaving directory `/usr/src/linux-2.2.16/arch/i386/lib'
kgcc -D__KERNEL__ -I/usr/src/linux/include -E -C -P -I/usr/src/linux/include
-imacros /usr/src/linux/include/asm-i386/page_offset.h -Ui386
arch/i386/vmlinux.lds.S >arch/i386/vmlinux.lds
ld -m elf_i386 -T /usr/src/linux/arch/i386/vmlinux.lds -e stext
arch/i386/kernel/head.o arch/i386/kernel/init_task.o init/main.o
init/version.o \
	--start-group \
	arch/i386/kernel/kernel.o arch/i386/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o
ipc/ipc.o \
	fs/filesystems.a \
	net/network.a \
	drivers/block/block.a drivers/char/char.a drivers/misc/misc.a
drivers/net/net.a drivers/scsi/scsi.a drivers/cdrom/cdrom.a
drivers/pci/pci.a drivers/video/video.a drivers/mtd/mtdlink.o \
	/usr/src/linux/arch/i386/lib/lib.a /usr/src/linux/lib/lib.a
/usr/src/linux/arch/i386/lib/lib.a \
	--end-group \
	-o vmlinux
fs/fs.o: In function `filesystem_setup':
fs/fs.o(.text.init+0x397): undefined reference to `init_jffs_fs'
drivers/mtd/mtdlink.o: In function `init_mtd':
drivers/mtd/mtdlink.o(.text.init+0x22): undefined reference to
`init_mtd_devices'
make: *** [vmlinux] Error 1
[root@localhost linux]# exit
exit

Script done on Thu Oct 18 05:45:07 2001


_________________________________________________________________


_________________________________________________________________
Get your FREE download of MSN Explorer at http://explorer.msn.com/intl.asp
