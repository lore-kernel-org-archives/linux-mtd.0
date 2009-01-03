Received: from web15703.mail.cnb.yahoo.com ([202.165.102.70])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LJ2bN-00085F-QK
	for linux-mtd@lists.infradead.org; Sat, 03 Jan 2009 09:15:27 +0000
Date: Sat, 3 Jan 2009 17:15:23 +0800 (CST)
From: peter meng <mengsanshui@yahoo.com.cn>
Subject: Question relates 2K page size flash chip
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <448671.97417.qm@web15703.mail.cnb.yahoo.com>
Reply-To: mengsanshui@yahoo.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I met a problem that use K9F1G08 flash with 2K page size on Linux .
I tried jffs2 and yaffs2 file system but occurs same error info as following 

----------------------------------------------------------
NAND device: Manufacturer ID: 0xec, Chip ID: 0xa1 (Samsung NAND 128MiB 1,8V 8-bit)
NAND_ECC_NONE selected by board driver. This is not recommended !!
Scanning device for bad blocks
nand_read_oob: from = 0x00000000, len = 64
Bad eraseblock 0 at 0x00000000
nand_read_oob: from = 0x00020000, len = 64
Bad eraseblock 0 at 0x00020000
........
........
nand_isbad_bbt(): bbt info for offs 0x007a0000: (block 61) 0x03
block 46 is bad
nand_isbad_bbt(): bbt info for offs 0x007c0000: (block 62) 0x03
block 47 is bad
nand_isbad_bbt(): bbt info for offs 0x007e0000: (block 63) 0x03
block 48 is bad
VFS: Mounted root (yaffs2 filesystem).
Freeing init memory: 88K
Warning: unable to open an initial console.
Failed to execute /linuxrc.  Attempting defaults...
Kernel panic - not syncing: No init found.  Try passing init= option to kernel.

------------------------------------------------------------

I checked the /dev/console and /linuxrc is exist on rootfs .

Seems this problem is caused since 2K page size with flash ,so how to resolve this problem ? Whether need do related work within u-boot because I suppose u-boot given wrong data format to flash that Linux mtd does not know it ?



Thanks Advanced .
Best Regards.
Peter Meng



      
