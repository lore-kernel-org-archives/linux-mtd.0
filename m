Received: from setabox.com.tw ([220.135.128.161] helo=mail.setabox.com.tw)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eeuf4-0004nt-Pk
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 08:27:52 -0500
Received: from [192.168.2.126] (dhcp-126.setabox.com [192.168.2.126])
	by mail.setabox.com.tw (Postfix) with ESMTP id 7641E5675C
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Nov 2005 21:27:27 +0800 (CST)
Message-ID: <43846D5B.4060908@setabox.com>
Date: Wed, 23 Nov 2005 21:23:39 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------020002020106010103000105"
Subject: NAND flash utilities and driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020002020106010103000105
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Greetings,
The following driver allows one to access NAND flash through the IDE
interface on a PC. There is also a patch for the Makefile and Kconfig in
mtd/nand.

A set of userspace utilities for accessing a flash device:
http://sourceforge.net/projects/nand-flash-util/

May be useful for people interested in developing/experimenting with
NAND flash on a PC that don't have a development board.

William
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFDhG1Zyy8yU+fh2zsRApDdAJ9I4L/B22rxmMDwKWEVVdz9JbdPrQCeN+KU
TZ9gHutPgfKGh64SBagQEQc=
=5I85
-----END PGP SIGNATURE-----

--------------020002020106010103000105
Content-Type: text/x-csrc;
 name="ide.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ide.c"

/* drivers/mtd/nand/ide.c
 *
 * Copyright (C) 2005  William J Beksi <wjbeksi@users.sourceforge.net> 
 *
 * Overview:
 *  This driver allows a NAND flash device to be accessed from
 *  an IDE interface.  
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or 
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111, USA.
 */

#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/module.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <linux/delay.h>
#include <asm/io.h>

/*
 * Values specific to the IDE
 */
#define IDE_IO_BASE_1   0x1F0		/* IDE1 NAND flash I/O base address */
#define IDE_IO_BASE_2   0x170		/* IDE2 NAND flash I/O base address */

#define IDE_IO_BASE IDE_IO_BASE_1

#ifdef CONFIG_MTD_NAND_USE_IO_INSTR
static int nand_use_io_instr = 1;
#else
static int nand_use_io_instr = 0;
#endif

#ifdef CONFIG_MTD_NAND_X86_IO_INSTR
static int nand_x86_io_instr = 1;
#endif

/*
 * IDE MTD structure
 */
static struct mtd_info *ide_mtd = NULL;

/*
 * Define partitions for flash device
 */
const static struct mtd_partition partition_info[] = {
	{ 
		.name   = "IDE flash partition 1", 
		.offset = 0,  
		.size   = 4*1024*1024 
	},
	{
		.name   = "IDE flash partition 2",
		.offset = 4*1024*1024,
		.size   = 4*1024*1024
	}
};
#define NUM_PARTITIONS  2 

static void ide_hwcontrol(struct mtd_info *mtd, int cmd) 
{
	struct nand_chip *this = (struct nand_chip *)mtd->priv;

	switch (cmd) {
		case NAND_CTL_SETCLE: this->IO_ADDR_W = (unsigned char *) IDE_IO_BASE+1; break;
		case NAND_CTL_CLRCLE: this->IO_ADDR_W = (unsigned char *) IDE_IO_BASE;   break;
		case NAND_CTL_SETALE: this->IO_ADDR_W = (unsigned char *) IDE_IO_BASE+2; break;	
		case NAND_CTL_CLRALE: this->IO_ADDR_W = (unsigned char *) IDE_IO_BASE;   break;
	}
}

static u_char ide_read_byte(struct mtd_info *mtd)
{
	struct nand_chip *this = (struct nand_chip *)mtd->priv;

	if (nand_use_io_instr) {
		if (nand_x86_io_instr)
			return inb((unsigned int) this->IO_ADDR_R);
	}

	return readb(this->IO_ADDR_R);
}

static void ide_write_byte(struct mtd_info *mtd, u_char byte)
{
	struct nand_chip *this = (struct nand_chip *)mtd->priv;

	switch (nand_use_io_instr) {
		case 0:
			writeb(byte, this->IO_ADDR_W);
			break;
		case 1:
			if (nand_x86_io_instr)
				outb(byte, (unsigned int)this->IO_ADDR_W);
			break;
	}
}

static void ide_read_buf(struct mtd_info *mtd, u_char *buf, int len)
{
	int i;
	struct nand_chip *this = mtd->priv;
	
	switch(nand_use_io_instr) {
		case 0:
			for (i=0; i<len; i++)
				buf[i] = readb(this->IO_ADDR_R);
			break;
		case 1:
			for (i=0; i<len; i++)
				if (nand_x86_io_instr)
					buf[i] = inb((unsigned int)this->IO_ADDR_R);
			break;
	}
}

static void ide_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
{
	int i;
	struct nand_chip *this = (struct nand_chip *)mtd->priv;

	switch (nand_use_io_instr) {
		case 0:
			for (i=0; i<len; i++)
				writeb(buf[i], this->IO_ADDR_W);
			break;
		case 1:
			for (i=0; i<len; i++)
				if (nand_x86_io_instr)
					outb(buf[i], (unsigned int) this->IO_ADDR_W);
			break;
	}
}

static int ide_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
{
	int i;
	struct nand_chip *this = (struct nand_chip *)mtd->priv;

	switch (nand_use_io_instr) {
		case 0:
			for (i=0; i<len; i++)
				if (buf[i] != readb(this->IO_ADDR_R))
					return -EFAULT;
			break;
		case 1:
			for (i=0; i<len; i++)
				if (nand_x86_io_instr)
					if (buf[i] != inb((unsigned int) this->IO_ADDR_R))
						return -EFAULT;
			break;
	}
	
	return 0;
}

/*
 * Main initialization routine
 */
int __init ide_init(void)
{
	struct nand_chip *this;

	/* Allocate memory for MTD device structure and private data */
	ide_mtd = kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip), GFP_KERNEL);
	if (!ide_mtd) {
		printk("Unable to allocate IDE NAND MTD structure\n");
		return -ENOMEM; 
	}

	/* Initialize structures */
	memset((char *) ide_mtd, 0, sizeof(struct mtd_info) + sizeof(struct nand_chip));

	/* Get pointer to private data */
	this = (struct nand_chip *) (&ide_mtd[1]);

	/* Link the private data with the MTD structure */
	ide_mtd->priv = this;

	/* Set address of NAND IO lines */
	this->IO_ADDR_R  = (void __iomem *) IDE_IO_BASE;
	this->IO_ADDR_W  = (void __iomem *) IDE_IO_BASE;

	/* Reference hardware control function */
	this->hwcontrol = ide_hwcontrol;

	/* Set read/write functions */
	this->read_buf   = ide_read_buf;
	this->read_byte  = ide_read_byte;
	this->write_buf  = ide_write_buf;
	this->write_byte = ide_write_byte;
	this->verify_buf = ide_verify_buf;

	/* Set command delay time */
	this->chip_delay = 20;

	/* Assign the device ready function */
	this->dev_ready = NULL;

	/* Set the ECC generator mode */
	this->eccmode = NAND_ECC_SOFT;

	/* Scan to find existance of the device */
	if (nand_scan(ide_mtd, 1)) {
		kfree(ide_mtd);
		return -ENXIO;
	}

	/* Register the partitions */
	add_mtd_partitions(ide_mtd, partition_info, NUM_PARTITIONS);

	return 0;
}
module_init(ide_init);

/*
 * Clean up routine
 */
#ifdef MODULE
static void __exit ide_cleanup (void)
{
	/* Release resources, unregister the device */
	nand_release(ide_mtd);	

	/* Free the MTD device structure */
	kfree(ide_mtd);
}
module_exit(ide_cleanup);
#endif

MODULE_LICENSE("GPL");
MODULE_AUTHOR("William J Beksi <wjbeksi@users.sourceforge.net>");
MODULE_DESCRIPTION("Glue layer for NAND flash through an IDE interface");

--------------020002020106010103000105
Content-Type: text/x-patch;
 name="nand_io_instr.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nand_io_instr.patch"

Index: Kconfig
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/Kconfig,v
retrieving revision 1.35
diff -u -r1.35 Kconfig
--- Kconfig	7 Nov 2005 11:14:30 -0000	1.35
+++ Kconfig	19 Nov 2005 14:44:37 -0000
@@ -268,4 +268,26 @@
 	help
 	  For 16 bit devices word is 2 bytes, for 8 bit devices - 1 byte
 
+config MTD_NAND_IDE
+        tristate "Support for NAND Flash through an IDE interface"
+        depends on MTD_NAND && MTD_PARTITIONS
+        help
+          Enables the driver for accessing NAND Flash from the IDE 
+          interface of a PC. If you say Y, you will be asked 
+          if you want access through the I/O ports.
+
+config MTD_NAND_USE_IO_INSTR
+        bool "Support for accessing NAND flash through the I/O ports"
+        depends on MTD_NAND_IDE
+        help
+          Allows for accessing NAND Flash through the I/O ports. 
+          If you say Y, you will be asked to select your architecture 
+          below.
+
+config MTD_NAND_X86_IO_INSTR
+        bool "Support for x86 architecture I/O instructions"
+        depends on MTD_NAND_USE_IO_INSTR
+        help
+          Port numbers are of type unsigned int.        
+
 endmenu
Index: Makefile.common
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/Makefile.common,v
retrieving revision 1.16
diff -u -r1.16 Makefile.common
--- Makefile.common	6 Jul 2005 09:33:28 -0000	1.16
+++ Makefile.common	19 Nov 2005 14:44:37 -0000
@@ -18,5 +18,6 @@
 obj-$(CONFIG_MTD_NAND_RTC_FROM4)	+= rtc_from4.o
 obj-$(CONFIG_MTD_NAND_SHARPSL)		+= sharpsl.o
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
+obj-$(CONFIG_MTD_NAND_IDE)		+= ide.o
 
 nand-objs = nand_base.o nand_bbt.o

--------------020002020106010103000105--
