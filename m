Received: from sunloan.doit.wisc.edu ([144.92.197.155]
	helo=smtp99.wiscmail.wisc.edu)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BeVHT-0004rK-Nz
	for linux-mtd@lists.infradead.org; Sun, 27 Jun 2004 04:44:57 -0400
Received: from conversion-daemon.smtp99.wiscmail.wisc.edu by
	smtp99.wiscmail.wisc.edu
	(iPlanet Messaging Server 5.2 HotFix 1.25 (built Mar  3 2004))
	id <0HZY00D01KTYKE@smtp99.wiscmail.wisc.edu>
	(original mail from jelenz@students.wisc.edu)
	for linux-mtd@lists.infradead.org; Sun, 27 Jun 2004 03:44:06 -0500 (CDT)
Received: from hydra (tux15.cs.wisc.edu [128.105.111.115])
	by smtp99.wiscmail.wisc.edu
	(iPlanet Messaging Server 5.2 HotFix 1.25 (built Mar  3 2004))
	with ESMTP id <0HZY001J0LLEQF@smtp99.wiscmail.wisc.edu> for
	linux-mtd@lists.infradead.org; Sun, 27 Jun 2004 03:44:06 -0500 (CDT)
Date: Sun, 27 Jun 2004 03:46:06 -0500
From: John Lenz <jelenz@students.wisc.edu>
To: linux-mtd@lists.infradead.org
Message-id: <20040627084606.GO32509@hydra.mshome.net>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_A7Q3uH27xhgz/C6EwhshRQ)"
Subject: NAND buffer overflow
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary_(ID_A7Q3uH27xhgz/C6EwhshRQ)
Content-type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline

I was getting some wierd errors accessing NAND flash.  I eventually  
traced the problem back to a buffer overflow in nand_read_raw.  This is  
using the current mtd CVS linked into a 2.6.7 kernel.

Here is the senerio.

in nand_bbt.c:nand_memory_bbt function calls create_bbt with
mtd->data_buf.  mtd->data_buf is of size 528

in create_bbt it calls nand_read_raw with the same buffer pointer and a
readlen of 1024. Whups!

nand_read_raw drops into a loop and reads chuncks of pagesize into the  
buffer.  pagesize is 528, but the length to read is 1056, so it calls  
read_buf twice.  The problem is, the second call to read_buf will  
overflow and trash some memory since the buffer it is reading into is  
only 528 bytes.

I have attached the hardware driver I am using in case I am doing  
something wrong...

The actual flash device is a Toshiba NAND 64MiB 3v3, 8-bit.

John

--Boundary_(ID_A7Q3uH27xhgz/C6EwhshRQ)
Content-type: text/x-csrc; charset=unknown-8bit; NAME=sharp_sl.c
Content-transfer-encoding: 7BIT
Content-disposition: attachment; filename=sharp_sl.c

/*
 *  drivers/mtd/nand/sharp_sl.c
 *
 *  Copyright (C) 2004 John Lenz <jelenz@students.wisc.edu>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/nand_ecc.h>
#include <linux/mtd/partitions.h>
#include <asm/io.h>

/*
 * MTD structure for SHARP SL board
 */
static struct mtd_info *sharp_sl_mtd = NULL;

/*
 * Module stuff
 */

static int sharp_sl_io_base = 0;
static int sharp_sl_phys_base = 0;

module_param_named(phys_base, sharp_sl_phys_base, int, 0);

/* registers */
#define CPLD_REG(ofst)	(*(volatile unsigned char*)(sharp_sl_io_base+(ofst)))
#define ECCLPLB		0x00	/* line parity 7 - 0 bit */
#define ECCLPUB		0x04	/* line parity 15 - 8 bit */
#define ECCCP		0x08	/* column parity 5 - 0 bit */
#define ECCCNTR		0x0C	/* ECC byte counter */
#define ECCCLRR		0x10	/* cleare ECC */
#define FLASHIO		0x14	/* Flash I/O */
#define FLASHCTL	0x18	/* Flash Control */

/* Flash control bit */
#define FLRYBY		(1 << 5)
#define FLCE1		(1 << 4)
#define FLWP		(1 << 3)
#define FLALE		(1 << 2)
#define FLCLE		(1 << 1)
#define FLCE0		(1 << 0)

/*
 * Define partitions for flash device
 */
const static struct mtd_partition partition_info[] = {
	{
		.name = "NAND flash partition 0",
		.offset = 0,
		.size = 7 * 1024 * 1024,
	},
	{
		.name = "NAND flash partition 1",
		.offset = 7 * 1024 * 1024,
		.size = 30 * 1024 * 1024,
	},
	{
		.name = "NAND flash partition 2",
		.offset = 37 * 1024 * 1024,
		.size = (64 - 37) * 1024 * 1024,
	},
};

/* 
 *	hardware specific access to control-lines
*/
static void sharp_sl_hwcontrol(struct mtd_info *mtd, int cmd){
    switch (cmd) {
	case NAND_CTL_SETCLE: CPLD_REG(FLASHCTL) |= FLCLE; break;
	case NAND_CTL_CLRCLE: CPLD_REG(FLASHCTL) &= ~FLCLE; break;

	case NAND_CTL_SETALE: CPLD_REG(FLASHCTL) |= FLALE; break;
	case NAND_CTL_CLRALE: CPLD_REG(FLASHCTL) &= ~FLALE; break;

	case NAND_CTL_SETNCE: CPLD_REG(FLASHCTL) &= ~(FLCE0|FLCE1); break;
	case NAND_CTL_CLRNCE: CPLD_REG(FLASHCTL) |= (FLCE0|FLCE1); break;
    }
}


static void sharp_sl_nand_enable_hwecc(struct mtd_info *mtd, int cmd)
{
    CPLD_REG(ECCCLRR) = 0;
}


static int sharp_sl_nand_calculate_ecc(struct mtd_info *mtd, const u_char* dat, u_char* ecc_code)
{
    ecc_code[0] = ~CPLD_REG(ECCLPUB);
    ecc_code[1] = ~CPLD_REG(ECCLPLB);
    ecc_code[2] = (~CPLD_REG(ECCCP) << 2) | 0x03;
    return CPLD_REG(ECCCNTR) != 0;
}

int __init sharp_sl_init (void)
{
	struct nand_chip *this;
	int err = 0;

	/* Allocate memory for MTD device structure and private data */
	sharp_sl_mtd = kmalloc (sizeof(struct mtd_info) + sizeof (struct nand_chip), GFP_KERNEL);
	if (!sharp_sl_mtd) {
		printk ("Unable to allocate SHARP SL NAND MTD device structure.\n");
		err = -ENOMEM;
		goto out;
	}

	/* Initialize structures */
	memset ((char *) sharp_sl_mtd, 0, sizeof(struct mtd_info) + sizeof(struct nand_chip));

	/* map physical adress */
	sharp_sl_io_base = (unsigned long)ioremap(sharp_sl_phys_base, 0x1000);
	if(!sharp_sl_io_base){
		printk("Ioremap to access SHARP SL NAND chip failed\n");
		err = -EIO;
		goto out_mtd;
	}

	/* Get pointer to private data */
	this = (struct nand_chip *) (&sharp_sl_mtd[1]);
	/* Link the private data with the MTD structure */
	sharp_sl_mtd->priv = this;

	/* PXA Initialize */
	CPLD_REG(FLASHCTL) |= FLWP;

	/* Set address of NAND IO lines */
	this->IO_ADDR_R = sharp_sl_io_base + FLASHIO;
	this->IO_ADDR_W = sharp_sl_io_base + FLASHIO;
	/* Reference hardware control function */
	this->hwcontrol = sharp_sl_hwcontrol;
	/* Set command delay time, see datasheet for correct value */
	this->chip_delay = 15;
	/* Assign the device ready function, if available */
	//this->dev_ready = board_dev_ready;
	this->eccmode = NAND_ECC_HW3_256;
	this->enable_hwecc = sharp_sl_nand_enable_hwecc;
	this->calculate_ecc = sharp_sl_nand_calculate_ecc;
	this->correct_data = nand_correct_data;

	/* Scan to find existance of the device */
	if (nand_scan (sharp_sl_mtd, 1)) {
		err = -ENXIO;
		goto out_ior;
	}

	add_mtd_partitions(sharp_sl_mtd, partition_info, ARRAY_SIZE(partition_info));
	goto out;

out_ior:
	iounmap((void *)sharp_sl_io_base);
out_mtd:
	kfree (sharp_sl_mtd);
out:
	return err;
}
//module_init(sharp_sl_init);
late_initcall(sharp_sl_init);

#ifdef MODULE
static void __exit sharp_sl_cleanup (void)
{
	/* Release resources, unregister device */
	nand_release (sharp_sl_mtd);

	/* unmap physical adress */
	iounmap((void *)sharp_sl_io_base);
	
	/* Free the MTD device structure */
	kfree (sharp_sl_mtd);
}
module_exit(sharp_sl_cleanup);
#endif

MODULE_LICENSE("GPL");
MODULE_AUTHOR("John Lenz <jelenz@students.wisc.edu>");
MODULE_DESCRIPTION("Board-specific glue layer for NAND flash on SHARP SL");

--Boundary_(ID_A7Q3uH27xhgz/C6EwhshRQ)--
