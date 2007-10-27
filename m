Received: from web404.biz.mail.mud.yahoo.com ([68.142.201.35])
	by pentafluge.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IlvHm-0002rm-F2
	for linux-mtd@lists.infradead.org; Sun, 28 Oct 2007 00:41:50 +0100
Date: Sat, 27 Oct 2007 16:41:39 -0700 (PDT)
From: z l <zql@glomationinc.com>
Subject: Re: MTD driver for MLC NAND chips
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1193489375.2533.25.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <17643.40443.qm@web404.biz.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Show your board driver. You did look carefully at
> the BUG() at line 174
> of nand_base.c, I hope? It hints quite heavily at
> where to look.
> 

I did try to trace things back back but didn't see
anything obvious.  

Below is the driver,

#include <linux/slab.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <asm/io.h>
#include <asm/arch/hardware.h>
#include <asm/sizes.h>

#define GESBC_NAND_FLASH_DATA 0x10000000

#define GPIO_PADR	EP93XX_GPIO_REG(0x0)
#define GPIO_PADDR	EP93XX_GPIO_REG(0x10)
#define SMCBCR1		(EP93XX_AHB_VIRT_BASE + 0x00082000 +
0x04)

/*
 * MTD structure for GESBC-93xx board
 */
static struct mtd_info *gesbc_mtd = NULL;


/*
 * Module stuff
 */
static unsigned long gesbc_fio_pbase =
GESBC_NAND_FLASH_DATA;

#ifdef CONFIG_MTD_PARTITIONS
/*
 * Define static partitions for flash device
 */
static struct mtd_partition partition_info32[] = {
	{ .name= "GESBC NAND FLASH",
		  .offset= 0,
		  .size= 128*1024*1024 },
};
/*
 * Define static partitions for flash device
 */
static struct mtd_partition partition_info128[] = {
	{ .name= "GESBC NAND FLASH",
		  .offset= 0,
		  .size= 128*1024*1024 },
};

/*
 * Define static partitions for flash device
 */
static struct mtd_partition partition_info256[] = {
	{ .name= "GESBC NAND FLASH",
		  .offset= 0,
		  .size= 256*1024*1024 },
};

/*
 * Define static partitions for flash device
 */
static struct mtd_partition partition_info512[] = {
	{ .name= "GESBC NAND FLASH",
		  .offset= 0,
		  .size= 512*1024*1024 },
};

#define NUM_PARTITIONS 1
#endif


/* 
 *	hardware specific access to control-lines
 *      NAND_NCE: bit 0 -> bit 3
 *      NAND_CLE: bit 1 -> bit 4
 *      NAND_ALE: bit 2 -> bit 6
 */
static void gesbc_hwcontrol(struct mtd_info *mtd, int
cmd, int ctrl) 
{
	unsigned long flags;
        struct nand_chip *chip = mtd->priv;

	/* Disbale interrupt to avoid race condition */
	local_irq_save(flags);

        if (ctrl & NAND_CTRL_CHANGE) {
                unsigned char bits;

                bits = (ctrl & NAND_CLE) << 3;
                bits |= (ctrl & NAND_ALE) << 4;
		if (ctrl & NAND_NCE)
			bits &= ~0x08;
		else
			bits |= 0x08;

		__raw_writel( (__raw_readl(GPIO_PADR) & ~0x58 )|
bits, GPIO_PADR);
        }
        if (cmd != NAND_CMD_NONE)
                writeb(cmd, chip->IO_ADDR_W);
	/* Restore interrupt state */
	local_irq_restore(flags);
}

/*
 *	read device ready pin
 */
static int gesbc_device_ready(struct mtd_info *mtd)
{
	return  (__raw_readl(GPIO_PADR) & 0x80) >> 7;
}

#define MTDID      "GESBC-nand"

static const char *probes[] = { "cmdlinepart", NULL };



/*
 * Main initialization routine
 */
static int __init gesbc_nand_init (void)
{
	struct nand_chip *this;
	const char *part_type = 0;
	int mtd_parts_nb = 0;
	struct mtd_partition *mtd_parts = 0;
	unsigned long flags;
	void * gesbc_fio_base;

	/* Allocate memory for MTD device structure and
private data */
	gesbc_mtd = kmalloc(sizeof(struct mtd_info) + 
			     sizeof(struct nand_chip),
			     GFP_KERNEL);
	if (!gesbc_mtd) {
		printk("Unable to allocate GESBC NAND MTD device
structure.\n");
		return -ENOMEM;
	}

	/* map physical adress */
	gesbc_fio_base = ioremap(gesbc_fio_pbase, SZ_1K);
	if(!gesbc_fio_base) {
		printk("ioremap GESBC-93xx NAND flash failed\n");
		kfree(gesbc_mtd);
		return -EIO;
	}

	
	/* Get pointer to private data */
	this = (struct nand_chip *) (&gesbc_mtd[1]);
	
	/* Initialize structures */
	memset((char *) gesbc_mtd, 0, sizeof(struct
mtd_info));
	memset((char *) this, 0, sizeof(struct nand_chip));

	/* Link the private data with the MTD structure */
	gesbc_mtd->priv = this;

	/* Disbale interrupt to avoid race condition */
	local_irq_save(flags);

	/*
	 * Set GPIO Port A control register so that the pins
are configured
	 * to be outputs for controlling the NAND flash.
	 */
	__raw_writel((__raw_readl(GPIO_PADDR) | 0x58) &
~0x80, GPIO_PADDR);
	/* Clear NCE, clear CLE, clear ALE */
	__raw_writel( (__raw_readl(GPIO_PADR) | 0x08 ) &
~0x50, GPIO_PADR);
	/* Set SRAM controller to 32 bit (8 bit just doesn't
work, don't know why) bus width and 7 CLK wait state
*/
	__raw_writel(0x10003ce0, SMCBCR1);
	local_irq_restore(flags);

	
	/* insert callbacks */
	this->IO_ADDR_R = (void *) gesbc_fio_base;
	this->IO_ADDR_W = (void *) gesbc_fio_base;
	this->cmd_ctrl = (void *) gesbc_hwcontrol;
	this->dev_ready = gesbc_device_ready;
	this->chip_delay = 25;
	this->ecc.mode = NAND_ECC_SOFT;
	
	__raw_writel(0xffffffff, gesbc_fio_base);
	printk("Searching for NAND flash...\n");
	/* Scan to find existence of the device */
	if (nand_scan (gesbc_mtd, 1)) {
		iounmap((void *)gesbc_fio_base);
		kfree (gesbc_mtd);
		return -ENXIO;
	}

#ifdef CONFIG_MTD_CMDLINE_PARTS
        gesbc_mtd->name="GESBC-NAND";
        mtd_parts_nb = parse_mtd_partitions(gesbc_mtd,
 probes, &mtd_parts, 0);
        if (mtd_parts_nb > 0)
                part_type = "command line";
        else
                mtd_parts_nb = 0;
#endif

	if (mtd_parts_nb == 0)
	{
		mtd_parts_nb = NUM_PARTITIONS;
		mtd_parts = partition_info32;
		if (gesbc_mtd->size >= (128 * 0x100000))
			mtd_parts = partition_info128;
		if (gesbc_mtd->size >= (256 * 0x100000))
			mtd_parts = partition_info256;
		if (gesbc_mtd->size >= (512 * 0x100000))
			mtd_parts = partition_info512;
		part_type = "static";
	}
	
	/* Register the partitions */
	printk(KERN_NOTICE "Using %s partition definition\n",
part_type);
	add_mtd_partitions(gesbc_mtd, mtd_parts,
mtd_parts_nb);
	
	/* Return happy */
	return 0;
}
module_init(gesbc_nand_init);

/*
 * Clean up routine
 */
static void __exit gesbc_nand_cleanup (void)
{
/*	struct nand_chip *this = (struct nand_chip *)
&gesbc_mtd[1]; */
	
	/* Unregister the device */
	del_mtd_device (gesbc_mtd);
	
	/* Free the MTD device structure */
	kfree (gesbc_mtd);
}
module_exit(gesbc_nand_cleanup);
