Received: from [211.21.46.12] (helo=pluto.setabox.com.tw)
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CynDq-0002vE-KR
	for linux-mtd@lists.infradead.org; Wed, 09 Feb 2005 08:29:23 +0000
Message-ID: <4209C985.3020902@setabox.com>
Date: Wed, 09 Feb 2005 16:27:49 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: multipart/mixed; boundary="------------050908070200090109070408"
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] accessing NAND flash through an IDE interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050908070200090109070408
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thomas,
I am not sure if you received the patch I sent you last month for 
accessing nand flash through an IDE interface so I am sending it again.

I think some people may find it useful.

Thank you.

-- 
William J Beksi                          <wjbeksi@users.sourceforge.net>
GPG Key Fingerprint = ED4B 32C3 69E6 C2B7 705C  263F CB2F 3253 E7E1 DB3B


--------------050908070200090109070408
Content-Type: text/x-c;
 name="ide.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ide.c"

/* drivers/mtd/nand/ide.c
 *
 * Copyright (C) 2004  William J Beksi <wjbeksi@users.sourceforge.net> 
 *
 * Overview:
 *  This device driver allows a NAND flash device to be accessed from
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
#define IDE_IO_BASE_1 0x1F0		/* IDE1 NAND flash I/O base address */
#define IDE_IO_BASE_2 0x170		/* IDE2 NAND flash I/O base address */

#define IDE_IO_BASE IDE_IO_BASE_1

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
		.size   = 3*1024*1024 
	},
	{
		.name   = "IDE flash partition 2",
		.offset = 3*1024*1024,
		.size   = 3*1024*1024
	}
};
#define NUM_PARTITIONS  2 

static void ide_hwcontrol(struct mtd_info *mtd, int cmd) 
{
	struct nand_chip *this = (struct nand_chip *) mtd->priv;

	switch (cmd) {
		case NAND_CTL_SETCLE: this->IO_ADDR_W = (unsigned char *) IDE_IO_BASE+1; break;
		case NAND_CTL_CLRCLE: this->IO_ADDR_W = (unsigned char *) IDE_IO_BASE;   break;
		case NAND_CTL_SETALE: this->IO_ADDR_W = (unsigned char *) IDE_IO_BASE+2; break;	
		case NAND_CTL_CLRALE: this->IO_ADDR_W = (unsigned char *) IDE_IO_BASE;   break;
	}
}

/*
 * Main initialization routine
 */
int __init ide_init(void)
{
	struct nand_chip *this;
	int err = 0;

	/* Allocate memory for MTD device structure and private data */
	ide_mtd = kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip), GFP_KERNEL);
	if (!ide_mtd) {
		printk("Unable to allocate IDE NAND MTD structure\n");
		err = -ENOMEM; 
		goto out;
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
	/* Set command delay time */
	this->chip_delay = 20;
	/* Assign the device ready function */
	this->dev_ready = NULL;
	/* Set the ECC generator mode */
	this->eccmode = NAND_ECC_SOFT;

	/* Scan to find existance of the device */
	if (nand_scan(ide_mtd, 1)) {
		err = -ENXIO;
		goto out_mtd;
	}

	/* Register the partitions */
	add_mtd_partitions(ide_mtd, partition_info, NUM_PARTITIONS);
	goto out;

out_mtd:
	kfree(ide_mtd);
out:
	return err;
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

--------------050908070200090109070408
Content-Type: text/x-patch;
 name="mtd-ide-patch.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-ide-patch.diff"

Index: drivers/mtd/nand/Kconfig
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/Kconfig,v
retrieving revision 1.26
diff -u -r1.26 Kconfig
--- drivers/mtd/nand/Kconfig	5 Jan 2005 12:42:24 -0000	1.26
+++ drivers/mtd/nand/Kconfig	9 Feb 2005 08:17:20 -0000
@@ -204,4 +204,11 @@
 	  The simulator may simulate verious NAND flash chips for the
 	  MTD nand layer.
  
+config MTD_NAND_IDE
+	tristate "Support for NAND Flash through a PC's IDE interface"
+	depends on MTD_NAND && MTD_PARTITIONS
+	help
+	  This enables the driver for accessing NAND Flash through the
+	  IDE interface of a PC.
+	
 endmenu
Index: drivers/mtd/nand/Makefile.common
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/Makefile.common,v
retrieving revision 1.15
diff -u -r1.15 Makefile.common
--- drivers/mtd/nand/Makefile.common	26 Nov 2004 12:28:22 -0000	1.15
+++ drivers/mtd/nand/Makefile.common	9 Feb 2005 08:17:20 -0000
@@ -20,5 +20,6 @@
 obj-$(CONFIG_MTD_NAND_RTC_FROM4)	+= rtc_from4.o
 obj-$(CONFIG_MTD_NAND_SHARPSL)		+= sharpsl.o
 obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
+obj-$(CONFIG_MTD_NAND_IDE)		+= ide.o
 
 nand-objs = nand_base.o nand_bbt.o
Index: drivers/mtd/nand/nand_base.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
retrieving revision 1.130
diff -u -r1.130 nand_base.c
--- drivers/mtd/nand/nand_base.c	24 Jan 2005 03:07:43 -0000	1.130
+++ drivers/mtd/nand/nand_base.c	9 Feb 2005 08:17:24 -0000
@@ -84,6 +84,8 @@
 #include <linux/mtd/partitions.h>
 #endif
 
+#define NAND_USE_IO_INSTR	0
+
 /* Define default oob placement schemes for large and small page devices */
 static struct nand_oobinfo nand_oob_8 = {
 	.useecc = MTD_NANDECC_AUTOPLACE,
@@ -189,7 +191,13 @@
 static u_char nand_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
-	return readb(this->IO_ADDR_R);
+
+	switch(NAND_USE_IO_INSTR) {
+		case 0:
+			return readb(this->IO_ADDR_R);
+		case 1:
+			return inb((unsigned int) this->IO_ADDR_R);
+	}
 }
 
 /**
@@ -202,7 +210,15 @@
 static void nand_write_byte(struct mtd_info *mtd, u_char byte)
 {
 	struct nand_chip *this = mtd->priv;
-	writeb(byte, this->IO_ADDR_W);
+
+	switch(NAND_USE_IO_INSTR) {
+		case 0:
+			writeb(byte, this->IO_ADDR_W);
+			break;
+		case 1:
+			outb(byte, (unsigned int) this->IO_ADDR_W);
+			break;
+	}
 }
 
 /**
@@ -295,8 +311,16 @@
 	int i;
 	struct nand_chip *this = mtd->priv;
 
-	for (i=0; i<len; i++)
-		writeb(buf[i], this->IO_ADDR_W);
+	switch(NAND_USE_IO_INSTR) {
+		case 0:
+			for (i=0; i<len; i++)
+				writeb(buf[i], this->IO_ADDR_W);
+			break;
+		case 1:
+			for (i=0; i<len; i++)
+				outb(buf[i], (unsigned int) this->IO_ADDR_W);
+			break;
+	}
 }
 
 /**
@@ -312,8 +336,16 @@
 	int i;
 	struct nand_chip *this = mtd->priv;
 
-	for (i=0; i<len; i++)
-		buf[i] = readb(this->IO_ADDR_R);
+	switch(NAND_USE_IO_INSTR) {
+		case 0:
+			for (i=0; i<len; i++)
+				buf[i] = readb(this->IO_ADDR_R);
+			break;
+		case 1:
+			for (i=0; i<len; i++)
+				buf[i] = inb((unsigned int) this->IO_ADDR_R);
+			break;
+	}
 }
 
 /**
@@ -329,10 +361,18 @@
 	int i;
 	struct nand_chip *this = mtd->priv;
 
-	for (i=0; i<len; i++)
-		if (buf[i] != readb(this->IO_ADDR_R))
-			return -EFAULT;
-
+	switch(NAND_USE_IO_INSTR) {
+		case 0:
+			for (i=0; i<len; i++)
+				if (buf[i] != readb(this->IO_ADDR_R))
+					return -EFAULT;
+			break;
+		case 1:
+			for (i=0; i<len; i++)
+				if (buf[i] != inb((unsigned int) this->IO_ADDR_R))
+					return -EFAULT;
+			break;
+	}
 	return 0;
 }
 

--------------050908070200090109070408--
