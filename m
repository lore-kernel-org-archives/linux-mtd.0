Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACQqv-0007SO-KP
	for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2003 22:49:13 +0100
Received: from mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id OAA07054
	for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2003 14:48:02 -0700
Sender: ahennessy@mvista.com
Message-ID: <3F96FA57.470FECC7@mvista.com>
Date: Wed, 22 Oct 2003 14:44:56 -0700
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed;
 boundary="------------E5AD5A332FFACDEC4987F076"
Subject: TX49 NAND supported?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is a multi-part message in MIME format.
--------------E5AD5A332FFACDEC4987F076
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

I have the 2 files ready that support nand on
the TX4938 and TX4925 boards.  I sent them previously but they got hung
up on the way to the mailing list
(too big?)   Anyway,  I've made some improvements.  There is also a
small change in nand.c to add
a missing case statement.

Alice

--------------E5AD5A332FFACDEC4987F076
Content-Type: text/plain; charset=us-ascii;
 name="nand.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nand.patch"

--- drivers/mtd/nand/nand.c	Wed Jul 23 07:23:15 2003
+++ /home/ahennessy/build/mvl-humboldt-tx4938/linux/drivers/mtd/nand/nand.c	Wed Oct 22 14:24:21 2003
@@ -1414,6 +1414,7 @@
 	switch (this->eccmode) {
 
 	case NAND_ECC_HW3_512: 
+	case NAND_ECC_HW6_512: 
 		if (mtd->oobblock == 256) {
 			printk (KERN_WARNING "512 byte HW ECC not possible on 256 Byte pagesize, fallback to SW ECC \n");
 			this->eccmode = NAND_ECC_SOFT;

--------------E5AD5A332FFACDEC4987F076
Content-Type: text/plain; charset=us-ascii;
 name="tx4925ndfmc.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="tx4925ndfmc.c"

/*
 *  drivers/mtd/tx4925ndfmc.c
 *
 *  Overview:
 *   This is a device driver for the NAND flash device found on the
 *   Toshiba RBTX4925 reference board, which is a SmartMediaCard. It supports 
 *   16MB, 32MB and 64MB cards.
 *
 * Author: MontaVista Software, Inc.  source@mvista.com
 *
 * Derived from drivers/mtd/autcpu12.c
 *       Copyright (c) 2001 Thomas Gleixner (gleixner@autronix.de)
 *
 * Copyright (C) 2001 Toshiba Corporation 
 * 
 * 2003 (c) MontaVista Software, Inc. This file is licensed under
 * the terms of the GNU General Public License version 2. This program
 * is licensed "as is" without any warranty of any kind, whether express
 * or implied.
 *
 */

#include <linux/slab.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <linux/delay.h>
#include <asm/io.h>
#include <asm/tx4925/tx4925_nand.h>

extern struct nand_oobinfo jffs2_oobinfo;

/*
 * MTD structure for RBTX4925 board
 */
static struct mtd_info *tx4925ndfmc_mtd = NULL;

/*
 * Module stuff
 */
#if LINUX_VERSION_CODE < 0x20212 && defined(MODULE)
#define tx4925ndfmc_init init_module
#define tx4925ndfmc_cleanup cleanup_module
#endif

/*
 * Define partitions for flash devices
 */

static struct mtd_partition partition_info16k[] = {
	{ name: "RBTX4925 flash partition 1",
	  offset:  0,
	  size:    8 * 0x00100000 },
	{ name: "RBTX4925 flash partition 2",
	  offset:  8 * 0x00100000,
	  size:    8 * 0x00100000 },
};

static struct mtd_partition partition_info32k[] = {
	{ name: "RBTX4925 flash partition 1",
	  offset:  0,
	  size:    8 * 0x00100000 },
	{ name: "RBTX4925 flash partition 2",
	  offset:  8 * 0x00100000,
	  size:   24 * 0x00100000 },
};

static struct mtd_partition partition_info64k[] = {
	{ name: "User FS",
	  offset:  0,
	  size:   16 * 0x00100000 },
	{ name: "RBTX4925 flash partition 2",
	  offset: 16 * 0x00100000,
	  size:   48 * 0x00100000},
};

static struct mtd_partition partition_info128k[] = {
	{ name: "Skip bad section",
	  offset:  0,
	  size:   16 * 0x00100000 },
	{ name: "User FS",
	  offset: 16 * 0x00100000,
	  size:   112 * 0x00100000 },
};
#define NUM_PARTITIONS16K  2
#define NUM_PARTITIONS32K  2
#define NUM_PARTITIONS64K  2
#define NUM_PARTITIONS128K 2

/* 
 *	hardware specific access to control-lines
*/
static void tx4925ndfmc_hwcontrol(struct mtd_info *mtd, int cmd)
{

	switch(cmd){

		case NAND_CTL_SETCLE: 
			tx4925_ndfmcptr->mcr |= TX4925_NDFMCR_CLE;
			break;
		case NAND_CTL_CLRCLE:
			tx4925_ndfmcptr->mcr &= ~TX4925_NDFMCR_CLE;
			break;
		case NAND_CTL_SETALE:
			tx4925_ndfmcptr->mcr |= TX4925_NDFMCR_ALE;
			break;
		case NAND_CTL_CLRALE: 
			tx4925_ndfmcptr->mcr &= ~TX4925_NDFMCR_ALE;
			break;
		case NAND_CTL_SETNCE:
			tx4925_ndfmcptr->mcr |= TX4925_NDFMCR_CE;
			break;
		case NAND_CTL_CLRNCE:
			tx4925_ndfmcptr->mcr &= ~TX4925_NDFMCR_CE;
			break;
		case NAND_CTL_SETWP:
			tx4925_ndfmcptr->mcr |= TX4925_NDFMCR_WE;
			break;
		case NAND_CTL_CLRWP:
			tx4925_ndfmcptr->mcr &= ~TX4925_NDFMCR_WE;
			break;
	}
}

/*
*	read device ready pin
*/
static int tx4925ndfmc_device_ready(struct mtd_info *mtd)
{
	int ready;
	ready = (tx4925_ndfmcptr->sr & TX4925_NDSFR_BUSY) ? 0 : 1;
	return ready;
}
void tx4925ndfmc_enable_hwecc(struct mtd_info *mtd, int mode)
{
	/* reset first */
	tx4925_ndfmcptr->mcr |= TX4925_NDFMCR_ECC_CNTL_MASK;
	tx4925_ndfmcptr->mcr &= ~TX4925_NDFMCR_ECC_CNTL_MASK;
	tx4925_ndfmcptr->mcr |= TX4925_NDFMCR_ECC_CNTL_ENAB;
}
static void tx4925ndfmc_disable_ecc(void)
{
	tx4925_ndfmcptr->mcr &= ~TX4925_NDFMCR_ECC_CNTL_MASK;
}
static void tx4925ndfmc_enable_read_ecc(void)
{
	tx4925_ndfmcptr->mcr &= ~TX4925_NDFMCR_ECC_CNTL_MASK;
	tx4925_ndfmcptr->mcr |= TX4925_NDFMCR_ECC_CNTL_READ;
}
void tx4925ndfmc_readecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code){
	int i;
	u_char *ecc = ecc_code;
        tx4925ndfmc_enable_read_ecc();
	for (i = 0;i < 6;i++,ecc++)
		*ecc = tx4925_read_nfmc(&(tx4925_ndfmcptr->dtr));
        tx4925ndfmc_disable_ecc();
}
void tx4925ndfmc_device_setup(void)
{

	*(unsigned char *)0xbb005000 &= ~0x08;

        /* reset NDFMC */
        tx4925_ndfmcptr->rstr |= TX4925_NDFRSTR_RST;
	while (tx4925_ndfmcptr->rstr & TX4925_NDFRSTR_RST);       

	/* setup BusSeparete, Hold Time, Strobe Pulse Width */
	tx4925_ndfmcptr->mcr = TX4925_BSPRT ? TX4925_NDFMCR_BSPRT : 0;
	tx4925_ndfmcptr->spr = TX4925_HOLD << 4 | TX4925_SPW;             
}
static u_char tx4925ndfmc_nand_read_byte(struct mtd_info *mtd)
{
        struct nand_chip *this = mtd->priv;
        return tx4925_read_nfmc(this->IO_ADDR_R);
}

static void tx4925ndfmc_nand_write_byte(struct mtd_info *mtd, u_char byte)
{
        struct nand_chip *this = mtd->priv;
        tx4925_write_nfmc(byte, this->IO_ADDR_W);
}

static void tx4925ndfmc_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
{
	int i;
	struct nand_chip *this = mtd->priv;

	for (i=0; i<len; i++)
		tx4925_write_nfmc(buf[i], this->IO_ADDR_W);
}

static void tx4925ndfmc_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
{
	int i;
	struct nand_chip *this = mtd->priv;

	for (i=0; i<len; i++)
		buf[i] = tx4925_read_nfmc(this->IO_ADDR_R);
}

static int tx4925ndfmc_nand_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
{
	int i;
	struct nand_chip *this = mtd->priv;

	for (i=0; i<len; i++)
		if (buf[i] != tx4925_read_nfmc(this->IO_ADDR_R))
			return i;

	return 0;
}

/*
 * Send command to NAND device
 */
static void tx4925ndfmc_nand_command (struct mtd_info *mtd, unsigned command, int column, int page_addr)
{
	register struct nand_chip *this = mtd->priv;

	/* Begin command latch cycle */
	this->hwcontrol(mtd, NAND_CTL_SETCLE);
	/*
	 * Write out the command to the device.
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
		this->write_byte(mtd, readcmd);
	}
	this->write_byte(mtd, command);

	/* Set ALE and clear CLE to start address cycle */
	this->hwcontrol(mtd, NAND_CTL_CLRCLE);

	if (column != -1 || page_addr != -1) {
		this->hwcontrol(mtd, NAND_CTL_SETALE);

		/* Serially input address */
		if (column != -1)
			this->write_byte(mtd, column);
		if (page_addr != -1) {
			this->write_byte(mtd, (unsigned char) (page_addr & 0xff));
			this->write_byte(mtd, (unsigned char) ((page_addr >> 8) & 0xff));
			/* One more address cycle for higher density devices */
			if (mtd->size & 0x0c000000) 
				this->write_byte(mtd, (unsigned char) ((page_addr >> 16) & 0x0f));
		}
		/* Latch in address */
		this->hwcontrol(mtd, NAND_CTL_CLRALE);
	}
	
	/* 
	 * program and erase have their own busy handlers 
	 * status and sequential in needs no delay
	*/
	switch (command) {
			
	case NAND_CMD_PAGEPROG:
		/* Turn off WE */
		this->hwcontrol (mtd, NAND_CTL_CLRWP);
                return;

	case NAND_CMD_SEQIN:
		/* Turn on WE */
		this->hwcontrol (mtd, NAND_CTL_SETWP);
                return;

	case NAND_CMD_ERASE1:
	case NAND_CMD_ERASE2:
	case NAND_CMD_STATUS:
		return;

	case NAND_CMD_RESET:
		if (this->dev_ready)	
			break;
		this->hwcontrol(mtd, NAND_CTL_SETCLE);
		this->write_byte(mtd, NAND_CMD_STATUS);
		this->hwcontrol(mtd, NAND_CTL_CLRCLE);
		while ( !(this->read_byte(mtd) & 0x40));
		return;

	/* This applies to read commands */	
	default:
		/* 
		 * If we don't have access to the busy pin, we apply the given
		 * command delay
		*/
		if (!this->dev_ready) {
			udelay (this->chip_delay);
			return;
		}	
	}
	
	/* wait until command is processed */
	while (!this->dev_ready(mtd));
}

#ifdef CONFIG_MTD_CMDLINE_PARTS
extern int parse_cmdline_partitions(struct mtd_info *master, struct mtd_partitio
n **pparts, char *);
#endif

/*
 * Main initialization routine
 */
extern int nand_correct_data(struct mtd_info *mtd, u_char *dat, u_char *read_ecc, u_char *calc_ecc);
int __init tx4925ndfmc_init (void)
{
	struct nand_chip *this;
	int err = 0;

	/* Allocate memory for MTD device structure and private data */
	tx4925ndfmc_mtd = kmalloc (sizeof(struct mtd_info) + sizeof (struct nand_chip),
				GFP_KERNEL);
	if (!tx4925ndfmc_mtd) {
		printk ("Unable to allocate RBTX4925 NAND MTD device structure.\n");
		err = -ENOMEM;
		goto out;
	}

        tx4925ndfmc_device_setup();

	/* io is indirect via a register so don't need to ioremap address */

	/* Get pointer to private data */
	this = (struct nand_chip *) (&tx4925ndfmc_mtd[1]);

	/* Initialize structures */
	memset((char *) tx4925ndfmc_mtd, 0, sizeof(struct mtd_info));
	memset((char *) this, 0, sizeof(struct nand_chip));

	/* Link the private data with the MTD structure */
	tx4925ndfmc_mtd->priv = this;

	/* Set address of NAND IO lines */
	this->IO_ADDR_R = (unsigned long)&(tx4925_ndfmcptr->dtr);
	this->IO_ADDR_W = (unsigned long)&(tx4925_ndfmcptr->dtr);
	this->hwcontrol = tx4925ndfmc_hwcontrol;
#define USE_HW_ECC 
//#undef USE_HW_ECC 
#ifdef USE_HW_ECC
	this->enable_hwecc = tx4925ndfmc_enable_hwecc;
	this->calculate_ecc = tx4925ndfmc_readecc;
	this->correct_data = nand_correct_data;
	this->eccmode = NAND_ECC_HW6_512;	
#else
	this->eccmode = NAND_ECC_SOFT;	
#endif
	this->dev_ready = tx4925ndfmc_device_ready;
	/* 20 us command delay time */
	this->chip_delay = 20;		
        this->read_byte = tx4925ndfmc_nand_read_byte;
        this->write_byte = tx4925ndfmc_nand_write_byte;
	this->cmdfunc = tx4925ndfmc_nand_command;
	this->write_buf = tx4925ndfmc_nand_write_buf;
	this->read_buf = tx4925ndfmc_nand_read_buf;
	this->verify_buf = tx4925ndfmc_nand_verify_buf;

	/* Scan to find existance of the device */
	if (nand_scan (tx4925ndfmc_mtd, 1)) {
		err = -ENXIO;
		goto out_ior;
	}

	/* Allocate memory for internal data buffer */
	this->data_buf = kmalloc (sizeof(u_char) * (tx4925ndfmc_mtd->oobblock + tx4925ndfmc_mtd->oobsize), GFP_KERNEL);
	if (!this->data_buf) {
		printk ("Unable to allocate NAND data buffer for RBTX4925.\n");
		err = -ENOMEM;
		goto out_ior;
	}

	/* Register the partitions */
#ifdef CONFIG_MTD_CMDLINE_PARTS
        {
                int mtd_parts_nb = 0;
                struct mtd_partition *mtd_parts = 0;
                mtd_parts_nb = parse_cmdline_partitions(tx4925ndfmc_mtd, &mtd_parts, "tx4925ndfmc");
                if (mtd_parts_nb > 0)
                        add_mtd_partitions(tx4925ndfmc_mtd, mtd_parts, mtd_parts_nb);
                else
                        add_mtd_device(tx4925ndfmc_mtd);
        }
#else /* ifdef CONFIG_MTD_CMDLINE_PARTS */
	switch(tx4925ndfmc_mtd->size){
		case 0x01000000: add_mtd_partitions(tx4925ndfmc_mtd, partition_info16k, NUM_PARTITIONS16K); break;
		case 0x02000000: add_mtd_partitions(tx4925ndfmc_mtd, partition_info32k, NUM_PARTITIONS32K); break;
		case 0x04000000: add_mtd_partitions(tx4925ndfmc_mtd, partition_info64k, NUM_PARTITIONS64K); break; 
		case 0x08000000: add_mtd_partitions(tx4925ndfmc_mtd, partition_info128k, NUM_PARTITIONS128K); break; 
		default: {
			printk ("Unsupported SmartMedia device\n"); 
			err = -ENXIO;
			goto out_buf;
		}
	}
#endif /* ifdef CONFIG_MTD_CMDLINE_PARTS */
	goto out;

out_buf:
	kfree (this->data_buf);    
out_ior:
out:
	return err;
}

module_init(tx4925ndfmc_init);

/*
 * Clean up routine
 */
#ifdef MODULE
static void __exit tx4925ndfmc_cleanup (void)
{
	struct nand_chip *this = (struct nand_chip *) &tx4925ndfmc_mtd[1];

	/* Unregister partitions */
	del_mtd_partitions(tx4925ndfmc_mtd);
	
	/* Unregister the device */
	del_mtd_device (tx4925ndfmc_mtd);

	/* Free internal data buffers */
	kfree (this->data_buf);

	/* Free the MTD device structure */
	kfree (tx4925ndfmc_mtd);
}
module_exit(tx4925ndfmc_cleanup);
#endif

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Glue layer for SmartMediaCard on Toshiba RBTX4925");

--------------E5AD5A332FFACDEC4987F076
Content-Type: text/plain; charset=us-ascii;
 name="tx4938ndfmc.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="tx4938ndfmc.c"

/*
 * drivers/mtd/nand/tx4938ndfmc.c
 *
 *  Overview:
 *   This is a device driver for the NAND flash device connected to
 *   TX4938 internal NAND Memory Controller.
 *   TX4938 NDFMC is almost same as TX4925 NDFMC, but register size are 64 bit.
 *
 * Author: source@mvista.com
 *
 * Based on spia.c by Steven J. Hill
 *
 * Copyright (C) 2000-2001 Toshiba Corporation 
 *
 * 2003 (c) MontaVista Software, Inc. This file is licensed under the
 * terms of the GNU General Public License version 2. This program is
 * licensed "as is" without any warranty of any kind, whether express
 * or implied.
 */
#include <linux/config.h>
#include <linux/slab.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/nand_ecc.h>
#include <linux/mtd/partitions.h>
#include <asm/io.h>
#include <asm/bootinfo.h>
#include <linux/delay.h>
#include <asm/tx4938/rbtx4938.h>

extern struct nand_oobinfo jffs2_oobinfo;

/*
 * MTD structure for TX4938 NDFMC
 */
static struct mtd_info *tx4938ndfmc_mtd;

/*
 * Define partitions for flash device
 */
#define flush_wb()	(void)tx4938_ndfmcptr->mcr;

#define NUM_PARTITIONS  3
#ifndef CONFIG_MTD_CMDLINE_PARTS
static struct mtd_partition partition_info[NUM_PARTITIONS] = {
	{
		name: "RBTX4938 CIS Area",
 		offset:  0,
 		size:    24 * 0x00004000,
 		mask_flags : MTD_WRITEABLE	/* This partition is not writable */
 	},
 	{
 		name: "RBTX4938 kernel image",
 		offset:  MTDPART_OFS_APPEND,
 		size:    8 * 0x00100000,	/* 8MB */
 		mask_flags : MTD_WRITEABLE	/* This partition is not writable */
 	},
 	{
 		name: "Root FS (JFFS2)",
 		offset:  MTDPART_OFS_APPEND,
 		size:    MTDPART_SIZ_FULL
 	},
};
#endif

static void tx4938ndfmc_hwcontrol(struct mtd_info *mtd, int cmd)
{
	switch (cmd) {
		case NAND_CTL_SETCLE:
			tx4938_ndfmcptr->mcr |= TX4938_NDFMCR_CLE;
			break;
		case NAND_CTL_CLRCLE:
			tx4938_ndfmcptr->mcr &= ~TX4938_NDFMCR_CLE;
			break;
		case NAND_CTL_SETALE:
			tx4938_ndfmcptr->mcr |= TX4938_NDFMCR_ALE;
			break;
		case NAND_CTL_CLRALE:
			tx4938_ndfmcptr->mcr &= ~TX4938_NDFMCR_ALE;
			break;
		/* TX4938_NDFMCR_CE bit is 0:high 1:low */
		case NAND_CTL_SETNCE:
			tx4938_ndfmcptr->mcr |= TX4938_NDFMCR_CE;
			break;
		case NAND_CTL_CLRNCE:
			tx4938_ndfmcptr->mcr &= ~TX4938_NDFMCR_CE;
			break;
		case NAND_CTL_SETWP:
			tx4938_ndfmcptr->mcr |= TX4938_NDFMCR_WE;
			break;
		case NAND_CTL_CLRWP:
			tx4938_ndfmcptr->mcr &= ~TX4938_NDFMCR_WE;
			break;
	}
}
static int tx4938ndfmc_dev_ready(struct mtd_info *mtd)
{
	flush_wb();
	return !(tx4938_ndfmcptr->sr & TX4938_NDFSR_BUSY);
}
static void tx4938ndfmc_calculate_ecc(struct mtd_info *mtd, const u_char *dat, u_char *ecc_code)
{
	u32 mcr = tx4938_ndfmcptr->mcr;
	mcr &= ~TX4938_NDFMCR_ECC_ALL;
	tx4938_ndfmcptr->mcr = mcr | TX4938_NDFMCR_ECC_OFF;
	tx4938_ndfmcptr->mcr = mcr | TX4938_NDFMCR_ECC_READ;
	ecc_code[1] = tx4938_ndfmcptr->dtr;
	ecc_code[0] = tx4938_ndfmcptr->dtr;
	ecc_code[2] = tx4938_ndfmcptr->dtr;
	tx4938_ndfmcptr->mcr = mcr | TX4938_NDFMCR_ECC_OFF;
}
static void tx4938ndfmc_enable_hwecc(struct mtd_info *mtd, int mode)
{
	u32 mcr = tx4938_ndfmcptr->mcr;
	mcr &= ~TX4938_NDFMCR_ECC_ALL;
	tx4938_ndfmcptr->mcr = mcr | TX4938_NDFMCR_ECC_RESET;
	tx4938_ndfmcptr->mcr = mcr | TX4938_NDFMCR_ECC_OFF;
	tx4938_ndfmcptr->mcr = mcr | TX4938_NDFMCR_ECC_ON;
}

static u_char tx4938ndfmc_nand_read_byte(struct mtd_info *mtd)
{
	struct nand_chip *this = mtd->priv;
	return tx4938_read_nfmc(this->IO_ADDR_R);
}

static void tx4938ndfmc_nand_write_byte(struct mtd_info *mtd, u_char byte)
{
	struct nand_chip *this = mtd->priv;
	tx4938_write_nfmc(byte, this->IO_ADDR_W);
}

static void tx4938ndfmc_nand_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
{
	int i;
	struct nand_chip *this = mtd->priv;

	for (i=0; i<len; i++)
		tx4938_write_nfmc(buf[i], this->IO_ADDR_W);
}

static void tx4938ndfmc_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
{
	int i;
	struct nand_chip *this = mtd->priv;

	for (i=0; i<len; i++)
		buf[i] = tx4938_read_nfmc(this->IO_ADDR_R);
}

static int tx4938ndfmc_nand_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
{
	int i;
	struct nand_chip *this = mtd->priv;

	for (i=0; i<len; i++)
		if (buf[i] != tx4938_read_nfmc(this->IO_ADDR_R))
			return i;

	return 0;
}

/*
 * Send command to NAND device
 */
static void tx4938ndfmc_nand_command (struct mtd_info *mtd, unsigned command, int column, int page_addr)
{
	register struct nand_chip *this = mtd->priv;

	/* Begin command latch cycle */
	this->hwcontrol(mtd, NAND_CTL_SETCLE);
	/*
	 * Write out the command to the device.
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
		this->write_byte(mtd, readcmd);
	}
	this->write_byte(mtd, command);

	/* Set ALE and clear CLE to start address cycle */
	this->hwcontrol(mtd, NAND_CTL_CLRCLE);

	if (column != -1 || page_addr != -1) {
		this->hwcontrol(mtd, NAND_CTL_SETALE);

		/* Serially input address */
		if (column != -1)
			this->write_byte(mtd, column);
		if (page_addr != -1) {
			this->write_byte(mtd, (unsigned char) (page_addr & 0xff));
			this->write_byte(mtd, (unsigned char) ((page_addr >> 8) & 0xff));
			/* One more address cycle for higher density devices */
			if (mtd->size & 0x0c000000) 
				this->write_byte(mtd, (unsigned char) ((page_addr >> 16) & 0x0f));
		}
		/* Latch in address */
		this->hwcontrol(mtd, NAND_CTL_CLRALE);
	}
	
	/* 
	 * program and erase have their own busy handlers 
	 * status and sequential in needs no delay
	*/
	switch (command) {
			
	case NAND_CMD_PAGEPROG:
		/* Turn off WE */
		this->hwcontrol (mtd, NAND_CTL_CLRWP);
                return;

	case NAND_CMD_SEQIN:
		/* Turn on WE */
		this->hwcontrol (mtd, NAND_CTL_SETWP);
                return;

	case NAND_CMD_ERASE1:
	case NAND_CMD_ERASE2:
	case NAND_CMD_STATUS:
		return;

	case NAND_CMD_RESET:
		if (this->dev_ready)	
			break;
		this->hwcontrol(mtd, NAND_CTL_SETCLE);
		this->write_byte(mtd, NAND_CMD_STATUS);
		this->hwcontrol(mtd, NAND_CTL_CLRCLE);
		while ( !(this->read_byte(mtd) & 0x40));
		return;

	/* This applies to read commands */	
	default:
		/* 
		 * If we don't have access to the busy pin, we apply the given
		 * command delay
		*/
		if (!this->dev_ready) {
			udelay (this->chip_delay);
			return;
		}	
	}
	
	/* wait until command is processed */
	while (!this->dev_ready(mtd));
}

#ifdef CONFIG_MTD_CMDLINE_PARTS
extern int parse_cmdline_partitions(struct mtd_info *master, struct mtd_partition **pparts, char *);
#endif
/*
 * Main initialization routine
 */
int __init tx4938ndfmc_init (void)
{
	struct nand_chip *this;
	int bsprt = 0, hold = 0xf, spw = 0xf;
	int protected = 0;

	if ((*rbtx4938_piosel_ptr & 0x0c) != 0x08) {
		printk("TX4938 NDFMC: disabled by IOC PIOSEL\n");
		return -ENODEV;
	}
	bsprt = 1;
	hold = 2;
	spw = 9 - 1;	/* 8 GBUSCLK = 80ns (@ GBUSCLK 100MHz) */

	if ((tx4938_ccfgptr->pcfg &
	     (TX4938_PCFG_ATA_SEL|TX4938_PCFG_ISA_SEL|TX4938_PCFG_NDF_SEL))
	    != TX4938_PCFG_NDF_SEL) {
		printk("TX4938 NDFMC: disabled by PCFG.\n");
		return -ENODEV;
	}

	/* reset NDFMC */
	tx4938_ndfmcptr->rstr |= TX4938_NDFRSTR_RST;
	while (tx4938_ndfmcptr->rstr & TX4938_NDFRSTR_RST)
		;
	/* setup BusSeparete, Hold Time, Strobe Pulse Width */
	tx4938_ndfmcptr->mcr = bsprt ? TX4938_NDFMCR_BSPRT : 0;
	tx4938_ndfmcptr->spr = hold << 4 | spw;

	/* Allocate memory for MTD device structure and private data */
	tx4938ndfmc_mtd = kmalloc (sizeof(struct mtd_info) + sizeof (struct nand_chip),
				      GFP_KERNEL);
	if (!tx4938ndfmc_mtd) {
		printk ("Unable to allocate TX4938 NDFMC MTD device structure.\n");
		return -ENOMEM;
	}

	/* Get pointer to private data */
	this = (struct nand_chip *) (&tx4938ndfmc_mtd[1]);

	/* Initialize structures */
	memset((char *) tx4938ndfmc_mtd, 0, sizeof(struct mtd_info));
	memset((char *) this, 0, sizeof(struct nand_chip));

	/* Link the private data with the MTD structure */
	tx4938ndfmc_mtd->priv = this;

	/* Set address of NAND IO lines */
	this->IO_ADDR_R = (unsigned long)&tx4938_ndfmcptr->dtr;
	this->IO_ADDR_W = (unsigned long)&tx4938_ndfmcptr->dtr;
	this->hwcontrol = tx4938ndfmc_hwcontrol;
	this->dev_ready = tx4938ndfmc_dev_ready;
	this->calculate_ecc = tx4938ndfmc_calculate_ecc;
	this->correct_data = nand_correct_data;
	this->enable_hwecc = tx4938ndfmc_enable_hwecc;
	this->eccmode = NAND_ECC_HW3_256;
	this->chip_delay = 100;
	this->read_byte = tx4938ndfmc_nand_read_byte;
	this->write_byte = tx4938ndfmc_nand_write_byte;
	this->cmdfunc = tx4938ndfmc_nand_command;
	this->write_buf = tx4938ndfmc_nand_write_buf;
	this->read_buf = tx4938ndfmc_nand_read_buf;
	this->verify_buf = tx4938ndfmc_nand_verify_buf;

	/* Scan to find existance of the device */
	if (nand_scan (tx4938ndfmc_mtd, 1)) {
		kfree (tx4938ndfmc_mtd);
		return -ENXIO;
	}

	/* Allocate memory for internal data buffer */
	this->data_buf = kmalloc (sizeof(u_char) * (tx4938ndfmc_mtd->oobblock + tx4938ndfmc_mtd->oobsize), GFP_KERNEL);
	if (!this->data_buf) {
		printk ("Unable to allocate NAND data buffer for TX4938.\n");
		kfree (tx4938ndfmc_mtd);
		return -ENOMEM;
	}

	if (protected) {
		printk(KERN_INFO "TX4938 NDFMC: write protected.\n");
		tx4938ndfmc_mtd->flags &= ~(MTD_WRITEABLE | MTD_ERASEABLE);
	}

#ifdef CONFIG_MTD_CMDLINE_PARTS
	{
		int mtd_parts_nb = 0;
		struct mtd_partition *mtd_parts = 0;
		mtd_parts_nb = parse_cmdline_partitions(tx4938ndfmc_mtd, &mtd_parts, "tx4938ndfmc");
		if (mtd_parts_nb > 0)
			add_mtd_partitions(tx4938ndfmc_mtd, mtd_parts, mtd_parts_nb);
		else
			add_mtd_device(tx4938ndfmc_mtd);
	}
#else
	add_mtd_partitions(tx4938ndfmc_mtd, partition_info, NUM_PARTITIONS );
#endif

	return 0;
}
module_init(tx4938ndfmc_init);

/*
 * Clean up routine
 */
static void __exit tx4938ndfmc_cleanup (void)
{
	struct nand_chip *this = (struct nand_chip *) tx4938ndfmc_mtd->priv;

	/* Unregister the device */
#ifdef CONFIG_MTD_CMDLINE_PARTS
	del_mtd_partitions(tx4938ndfmc_mtd);
#endif
	del_mtd_device (tx4938ndfmc_mtd);

	/* Free the MTD device structure */
	kfree (tx4938ndfmc_mtd);

	/* Free internal data buffer */
	kfree (this->data_buf);
}
module_exit(tx4938ndfmc_cleanup);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Board-specific glue layer for NAND flash on TX4938 NDFMC");

--------------E5AD5A332FFACDEC4987F076--
