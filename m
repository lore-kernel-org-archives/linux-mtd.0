Received: from [211.21.46.12] (helo=pluto.setabox.com.tw)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cbugc-0005Q8-6l
	for linux-mtd@lists.infradead.org; Wed, 08 Dec 2004 00:48:31 -0500
Received: from setabox.com (miller.setabox.com.tw [192.168.1.45])
	(authenticated bits=0)
	by pluto.setabox.com.tw (8.12.8/8.12.8) with ESMTP id iB85mBha029918
	for <linux-mtd@lists.infradead.org>; Wed, 8 Dec 2004 13:48:11 +0800
Message-ID: <41B695A0.6040608@setabox.com>
Date: Wed, 08 Dec 2004 13:48:16 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <000b01c4dc0f$69fd88e0$8500a8c0@nit37>
In-Reply-To: <000b01c4dc0f$69fd88e0$8500a8c0@nit37>
Content-Type: multipart/mixed; boundary="------------050500060806000701020907"
Subject: [PATCH] nand flash through IDE interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------050500060806000701020907
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
I use the ide interface for testing nand flash. I think this driver 
would be useful for anyone else that does the same. It would save people 
the time of hacking another board specific driver to work with ide.

-- 
William

--------------050500060806000701020907
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
 *  Derived from drivers/mtd/spia.c
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
#include <asm/io.h>

/*
 * IDE MTD structure
 */
static struct mtd_info *ide_mtd = NULL;

/*
 * Values specific to the IDE
 */
#define BASEPORT1 0x1F0		/* IDE1 NAND Flash I/O Base Address */
#define BASEPORT2 0x170		/* IDE2 NAND Flash I/O Base Address */

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
 * Main initialization routine
 */
int __init ide_init(void)
{
	struct nand_chip *this;

	/* Allocate memory for MTD device structure and private data */
	ide_mtd = kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip), GFP_KERNEL);
	if (!ide_mtd) {
		printk("Unable to allocate IDE NAND MTD structure.\n");
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
	this->IO_ADDR_R  = IDE_IO_BASE;
	this->IO_ADDR_W  = IDE_IO_BASE;
	this->dev_ready  = NULL;
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

--------------050500060806000701020907--
