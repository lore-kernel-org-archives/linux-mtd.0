Received: from smtp.orbitel.bg ([195.24.32.22])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C4dXD-00084s-86
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2004 06:49:13 -0400
Received: from smtp.orbitel.bg ([10.0.0.3])
	by localhost (sof-rv2.orbitel.bg [10.0.0.4]) (amavisd-new, port 10024)
	with SMTP id 23643-14 for <linux-mtd@lists.infradead.org>;
	Tue,  7 Sep 2004 14:55:16 +0300 (EEST)
Message-ID: <1094554143.413d921f56b09@mail.orbitel.bg>
Date: Tue,  7 Sep 2004 13:49:03 +0300
From: zaho@architect.bg
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 8bit
Subject: Problems getting DiskOnChip boot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 


Hi there !

I am desperate. I am trying to make my DiskOnChip 2000 bootable but till now I 
get no
much success. I have a Debian distro and with it I can read and write to the 
device. The problem
comes when I am trying to compile the 2.4.18 kernel with the new snapshot from 
mtd. I follow the
instructions from mtd-jffs-HOWTO. But after executing make bzImage I get the 
following errors:

fs/fs.o: In function `jffs2_garbage_collect_dnode':
fs/fs.o(.text+0x55ad6): undefined reference to `BUG_ON'
fs/fs.o(.text+0x55d4f): undefined reference to `BUG_ON'
fs/fs.o(.text+0x55d64): undefined reference to `BUG_ON'
fs/fs.o(.text+0x55d80): undefined reference to `BUG_ON'
fs/fs.o: In function `jffs2_build_filesystem':
fs/fs.o(.text+0x56257): undefined reference to `BUG_ON'
fs/fs.o: In function `jffs2_gc_fetch_inode':
fs/fs.o(.text+0x589a4): undefined reference to `ilookup'
drivers/mtd/mtdlink.o: In function `put_mtd_device':
drivers/mtd/mtdlink.o(.text+0x308): undefined reference to `BUG_ON'
drivers/mtd/mtdlink.o: In function `mtd_blktrans_thread':
drivers/mtd/mtdlink.o(.text+0x2a24): undefined reference to `BUG_ON'
drivers/mtd/mtdlink.o: In function `_DoC_WaitReady':
drivers/mtd/mtdlink.o(.text+0x57af): undefined reference to `cond_resched'
drivers/mtd/mtdlink.o: In function `DoC_IdentChip':
drivers/mtd/mtdlink.o(.text+0x5c9d): undefined reference to `nand_flash_ids'
drivers/mtd/mtdlink.o(.text+0x5ca9): undefined reference to `nand_flash_ids'
drivers/mtd/mtdlink.o(.text+0x5cc1): undefined reference to `nand_manuf_ids'
drivers/mtd/mtdlink.o(.text+0x5cce): undefined reference to `nand_manuf_ids'
drivers/mtd/mtdlink.o(.text+0x5cdf): undefined reference to `nand_flash_ids'
drivers/mtd/mtdlink.o(.text+0x5cee): undefined reference to `nand_manuf_ids'
drivers/mtd/mtdlink.o(.text+0x5d44): undefined reference to `nand_flash_ids'
drivers/mtd/mtdlink.o(.text+0x5d60): undefined reference to `nand_flash_ids'
make: *** [vmlinux] Error 1


Can someone help and give info how to make the DiskOnChip bootable without 
using 
M-Sys stuff ?

Best regards,
     Zax 
