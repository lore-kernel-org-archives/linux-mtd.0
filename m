Received: from cmsrelay01.mx.net ([165.212.11.110])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgP3O-0001Uw-R1
	for linux-mtd@lists.infradead.org; Fri, 02 Jul 2004 10:30:16 -0400
Message-ID: <03c201c46041$57b3fa10$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 2 Jul 2004 09:32:01 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: 2.6.x nettel.c compile problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry if this was covered, but I didn't see anything when searching.  I'm
trying to get the 2.6.2 kernel working with JFFS2 and MTD (Snapgear/Intel
chipset).  The standard ~/mtd/maps/nettel.c gave me an error when compiling,
so I patched to the CVS from 6/30, but I was still getting the same error :

  CC      drivers/mtd/maps/nettel.o
drivers/mtd/maps/nettel.c: In function `nettel_init':
drivers/mtd/maps/nettel.c:429: error: `ROOT_DEV' undeclared (first use in
this function)
drivers/mtd/maps/nettel.c:429: error: (Each undeclared identifier is
reported only once
drivers/mtd/maps/nettel.c:429: error: for each function it appears in.)
drivers/mtd/maps/nettel.c:429: warning: implicit declaration of function
`MKDEV'
make[3]: *** [drivers/mtd/maps/nettel.o] Error 1
make[2]: *** [drivers/mtd/maps] Error 2
make[1]: *** [drivers/mtd] Error 2
make: *** [drivers] Error 2

If I add this to the top of nettel.c ...

#ifndef CONFIG_BLK_DEV_INITRD
#include <linux/config.h>
#include <linux/fs.h>
#include <linux/major.h>
#include <linux/root_dev.h>
#endif

...then it compiles fine, but when booting the kernel it is unable to mount
mtd1 :

JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
Initializing Cryptographic API
Serial: 8250/16550 driver $Revision: 1.90 $ 56 ports, IRQ sharing enabled
ÿttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 24576K size 1024 blocksize
PPP generic driver version 2.4.2
PPP Deflate Compression module registered
PPP BSD Compression module registered
Using anticipatory io scheduler
JEDEC: Found no SnapGear AMD device at location zero
SnapGear Intel: Found 1 x16 devices at 0x0 in 16-bit mode
 Intel/Sharp Extended Query Table at 0x0031
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
SnapGear Intel: Found 1 x16 devices at 0x0 in 16-bit mode
 Intel/Sharp Extended Query Table at 0x0031
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
SNAPGEAR: Intel flash device size = 16384K
Creating 6 MTD partitions on "SnapGear Intel":
0x00000000-0x000e0000 : "JBM kernel"
mtd: Giving out device 0 to JBM kernel
0x00100000-0x00fe0000 : "JBM filesystem"
mtd: Giving out device 1 to JBM filesystem
0x000e0000-0x00100000 : "JBM config"
mtd: Giving out device 2 to JBM config
0x00000000-0x01000000 : "JBM Intel"
mtd: Giving out device 3 to JBM Intel
0x00fe0000-0x01000000 : "JBM BIOS Config"
mtd: Giving out device 4 to JBM BIOS Config
0x00fe0000-0x01000000 : "JBM BIOS"
mtd: Giving out device 5 to JBM BIOS
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 4096)
NET: Registered protocol family 1
NET: Registered protocol family 17
Kernel panic: VFS: Unable to mount root fs on mtdblock1

I also tried enabling INITRD without the headers I added at the top, but
with the same result.

Any ideas on this?

Thanks,

-Brian
