Received: from [211.21.46.12] (helo=pluto.setabox.com.tw)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CkEBq-0004SV-A4
	for linux-mtd@lists.infradead.org; Thu, 30 Dec 2004 23:15:04 -0500
Message-ID: <41D4D228.7060903@setabox.com>
Date: Fri, 31 Dec 2004 12:14:32 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <41C1896F.9000107@setabox.com>	
	<1103530184.27708.102.camel@tglx.tec.linutronix.de>	
	<41C7F8C7.8050607@setabox.com>
	<1103642836.27708.234.camel@tglx.tec.linutronix.de>
In-Reply-To: <1103642836.27708.234.camel@tglx.tec.linutronix.de>
Content-Type: multipart/mixed; boundary="------------030901020503030703060900"
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] command function for nand flash through IDE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------030901020503030703060900
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Thomas Gleixner wrote:

> Implement hwcontrol function
>
>case CLE: this->io_addr_w = IDE_IO_BASE+1; break;
>case nCLE: this->io_addr_w = IDE_IO_BASE; break;
>case ALE: this->io_addr_w = IDE_IO_BASE+2; break;
>case nALE: this->io_addr_w = IDE_IO_BASE; break;
>
>There is also an example in the NAND API documentation.
>  
>
Hi Thomas,
I've implemented the hwcontrol function as per the NAND API 
documentation. I did not use the ioremap because the i/o port addresses 
170-17F and 1F0-1FF are reserved for the IDE controller. I've spent the 
last week testing this driver and I hope it can be commited to the cvs 
if you find it useful.

Thank you for your help,
William

--------------030901020503030703060900
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
 *  an IDE controller.  
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
MODULE_DESCRIPTION("Glue layer for NAND flash through an IDE controller");

--------------030901020503030703060900--
