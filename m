Received: from [211.21.46.12] (helo=pluto.setabox.com.tw)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CevPh-00017a-38
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 08:11:27 -0500
Received: from setabox.com (miller.setabox.com.tw [192.168.1.45])
	(authenticated bits=0)
	by pluto.setabox.com.tw (8.12.8/8.12.8) with ESMTP id iBGDBBha013581
	for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2004 21:11:15 +0800
Message-ID: <41C1896F.9000107@setabox.com>
Date: Thu, 16 Dec 2004 21:11:11 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------070508030906080304030808"
Subject: [PATCH] command function for nand flash through IDE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070508030906080304030808
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
This driver includes command and select chip functions specifically for  
accessing nand flash through an IDE port. Should be useful for anyone 
developing and testing on a PC. It works with the latest MTD snapshot.

-- 
William

--------------070508030906080304030808
Content-Type: text/x-c;
 name="ide.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ide.c"

/*
 *  drivers/mtd/nand/ide.c
 *
 *  Copyright (C) 2004 William J Beksi <wjbeksi@users.sourceforge.net> 
 *
 *  Derived from drivers/mtd/nand/spia.c
 *   Copyright (C) 2000 Steven J. Hill <sjhill@realitydiluted.com>
 *
 *  $Id: ide.c,v 1.18 2004/12/07 05:17:46 wjbeksi Exp $
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License version 2 as
 *  published by the Free Software Foundation.
 *
 *  Overview:
 *   This device driver allows a NAND flash device to be accessed from
 *   an IDE interface.  
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
 * IDE MTD structure
 */
static struct mtd_info *ide_mtd = NULL;

/*
 * Values specific to the IDE
 */
#define BASEPORT1 0x1F0		/* IDE1 NAND flash I/O base address */
#define BASEPORT2 0x170		/* IDE2 NAND flash I/O base address */

#define IDE_IO_BASE	BASEPORT1

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

/*
 * IDE specific command function
 */
static void nand_command(struct mtd_info *mtd, unsigned command, int column, int page_addr)
{
	register struct nand_chip *this = mtd->priv;
	unsigned int    ide_io_addr_1    = (unsigned int) this->IO_ADDR_R+1;
	unsigned int    ide_io_addr_2    = (unsigned int) this->IO_ADDR_R+2;

	/*
	 * Write out the command to the device
	 */
	if (command == NAND_CMD_SEQIN) {
		int readcmd;

		if (column >= mtd->oobblock) {
			/* OOB area */
			column -= mtd->oobblock;
			readcmd = NAND_CMD_READOOB;
		} else if (column < 256) {
			/* First 256 bytes --> READ0 */
			readcmd = NAND_CMD_READ0;
		} else {
			column -= 256;
			readcmd = NAND_CMD_READ1;
		}
		outb(readcmd, ide_io_addr_1);
	}
	outb(command, ide_io_addr_1);

	if (column != -1 || page_addr != -1) {
		/* Serially input address */
		if (column != -1) {
			/* Adjust columns for 16 bit buswidth */
			if (this->options & NAND_BUSWIDTH_16)
				column >>= 1;
			outb(column, ide_io_addr_2);
		}
		if (page_addr != -1) {
			outb((unsigned char) (page_addr & 0xff), ide_io_addr_2);
			outb((unsigned char) ((page_addr >> 8) & 0xff), ide_io_addr_2);
			/* One more address cycle for devices > 32MiB */
			if (this->chipsize > (32 << 20))
				outb((unsigned char) ((page_addr >> 16) & 0x0f),
						ide_io_addr_2);
		}
	}
	
	/* 
	 * Program and erase have their own busy handlers status and sequential 
	 * in needs no delay
	 */
	switch (command) {
			
	case NAND_CMD_PAGEPROG:
	case NAND_CMD_ERASE1:
	case NAND_CMD_ERASE2:
	case NAND_CMD_SEQIN:
	case NAND_CMD_STATUS:
		return;

	case NAND_CMD_RESET:
		if (this->dev_ready)	
			break;
		udelay(this->chip_delay);
		outb(NAND_CMD_STATUS, ide_io_addr_1);
		while (!(this->read_byte(mtd) & 0x40));
		return;

	/* This applies to read commands */	
	default:
		/* 
		 * If we don't have access to the busy pin, we apply the given
		 * command delay
		 */
		if (!this->dev_ready) {
			udelay(this->chip_delay);
			return;
		}	
	}
	
	/* 
	 * Apply this short delay always to ensure that we do wait tWB in
	 * any case on any machine
	 */
	ndelay(100);
	/* Wait until command is processed */
	while (!this->dev_ready(mtd));
}

static void nand_select_chip(struct mtd_info *mtd, int chip)
{
	nand_command(mtd, NAND_CMD_RESET, -1, -1);
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

	/* Get pointer to private data */
	this = (struct nand_chip *) (&ide_mtd[1]);

	/* Initialize structures */
	memset((char *) ide_mtd, 0, sizeof(struct mtd_info));
	memset((char *) this, 0, sizeof(struct nand_chip));

	/* Link the private data with the MTD structure */
	ide_mtd->priv = this;

	/* Set address of NAND IO lines */
	this->IO_ADDR_R  = (void __iomem *) IDE_IO_BASE;
	this->IO_ADDR_W  = (void __iomem *) IDE_IO_BASE;

	/* Set command function for IDE */
	this->cmdfunc = nand_command;
	/* Set select chip function for IDE */
	this->select_chip = nand_select_chip;
	/* 20 us command delay time */
	this->chip_delay = 20;
	/* Set the ECC generator mode */
	this->eccmode = NAND_ECC_SOFT;

	/* Scan to find existance of the device */
	if (nand_scan(ide_mtd, 1)) {
		kfree(ide_mtd);
		return -ENXIO;
	}

	/* Register the partitions */
	add_mtd_partitions(ide_mtd, partition_info, NUM_PARTITIONS);

	/* Return happy */
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

--------------070508030906080304030808--
