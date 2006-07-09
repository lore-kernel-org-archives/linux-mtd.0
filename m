Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FzVW6-0003RB-JW
	for linux-mtd@lists.infradead.org; Sun, 09 Jul 2006 10:23:56 +0100
Subject: Re: [PATCH] CM-x2xx NAND flash support
From: Thomas Gleixner <tglx@linutronix.de>
To: Mike Rapoport <mike@compulab.co.il>
In-Reply-To: <44AD06B5.7060708@compulab.co.il>
References: <44AD06B5.7060708@compulab.co.il>
Content-Type: text/plain
Date: Sun, 09 Jul 2006 11:26:19 +0200
Message-Id: <1152437179.24611.376.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-07-06 at 14:48 +0200, Mike Rapoport wrote:
> This patch provides MTD support for NAND flash devices on CM-x2xx modules.
> 
> Signed-off-by: Mike Rapoport <mike@compulab.co.il>

> +static struct mtd_info *cmx255_nand_mtd = NULL;

static variables are initialized to 0 by default

> +/*
> + * Module stuff
> + */

Comment without context

> +#define DRAIN_WB() \
> +       do { \
> +               unsigned char dummy; \
> +               asm volatile ("mcr p15, 0, r0, c7, c10, 4":::"r0"); \
> +               dummy=*((unsigned char*)UNCACHED_ADDR); \
> +       } while(0);

stray semicolon ----^

I bet xscale has this functionality somewhere as a macro / inline already

> +/*
> + *     hardware specific access to control-lines
> + */
> +static void cmx255_hwcontrol(struct mtd_info *mtd, int dat,
> +                            unsigned int ctrl)
> +{
> +       struct nand_chip* this = (struct nand_chip *) (mtd->priv);

	no type cast for void* necessary

> +       unsigned int nandaddr = (unsigned int)this->IO_ADDR_W;

what the hell is this type cast for ?

	void __iomem *nandaddr = 

> +       DRAIN_WB();
> +
> +       if ( ctrl & NAND_CTRL_CHANGE ) {
> +               if ( ctrl & NAND_NCE ) /* CE should be changed */

	if (ctrl & N...) {

	also the comment is wrong for all three if()s. The given value is
static and does not necessarily change from one call to the next. e.g.
nCE is kept low across a complete access cycle

> +                       nand_cs_on();
> +               else
> +                       nand_cs_off();
> +               if ( ctrl & NAND_ALE ) /* ALE should be changed */
> +                       nand_ale_on();
> +               else
> +                       nand_ale_off();
> +               if ( ctrl & NAND_CLE ) /* CLE should be changed */
> +                       nand_cle_on();
> +               else 
> +                       nand_cle_off();
> +       }
> +       this->IO_ADDR_W = (void*)nandaddr;

	nandaddr = this->IO_ADDR_W;
	this->IO_ADDR_W = nandaddr;

	?????

> +       DRAIN_WB();
> +
> +       if ( dat != NAND_CMD_NONE )
> +               writel(dat, this->IO_ADDR_W);
> +}
> +
> +/*
> + *     read device ready pin
> + */
> +static int cmx255_device_ready(struct mtd_info *mtd)
> +{
> +       DRAIN_WB();
> +       return GPLR(GPIO_NAND_RB) & GPIO_bit(GPIO_NAND_RB);
> +}
> +
> +/*
> + * Main initialization routine
> + */
> +static int __init cmx255_init (void)
> +{
> +       struct nand_chip *this;
> +       const char *part_type = 0;

	= NULL

> +       int mtd_parts_nb = 0;
> +       struct mtd_partition *mtd_parts = 0;

	dito

> +       static unsigned int nandaddr = 0;

	why static ? also:

	void __iomem *nandaddr;
	
> +       int retval = 0;

	Please do not initialize local variables, when there is no need to.

> +       /* Allocate memory for MTD device structure and private data */
> +       cmx255_nand_mtd = kmalloc(sizeof(struct mtd_info) +
> +                                   sizeof(struct nand_chip),
> +                                   GFP_KERNEL);

	kzalloc

> 
> +       if (!cmx255_nand_mtd) {
> +               printk("Unable to allocate CM-X255 MTD device structure.\n");
> +               retval = -ENOMEM;
> +               goto out;
> +       }
> +
> +       nandaddr = (unsigned int)ioremap(PXA_CS1_PHYS, 0x100);

	See above, also convert to a platform device !

> +       if ( !nandaddr ) {

	if (!nandaddr)

> +               printk("Unable to ioremap NAND device");
> +               retval = -EINVAL;
> +               goto err1;
> +       }
> +
> +       /* Get pointer to private data */
> +       this = (struct nand_chip *) (&cmx255_nand_mtd[1]);
> +
> +       /* Initialize structures */
> +       memset((char *) cmx255_nand_mtd, 0, sizeof(struct mtd_info));
> +       memset((char *) this, 0, sizeof(struct nand_chip));

See above (kzalloc)

> +       /* Link the private data with the MTD structure */
> +       cmx255_nand_mtd->owner = THIS_MODULE;
> +       cmx255_nand_mtd->priv = this;
> +
> +       /* insert callbacks */
> +       this->IO_ADDR_R = (void __iomem *)nandaddr;
> +       this->IO_ADDR_W = (void __iomem *)nandaddr;

See above

> +       this->cmd_ctrl = cmx255_hwcontrol;
> +       this->dev_ready = cmx255_device_ready;
> +
> +       /* 20 us command delay time */
> +       this->chip_delay = 20;
> +       this->ecc.mode = NAND_ECC_SOFT;
> +
> +       /* Scan to find existence of the device */
> +       if (nand_scan (cmx255_nand_mtd, 1)) {

	if (nand_scan(
> 
> +               printk(KERN_NOTICE "No NAND device\n");
> +               retval = -ENXIO;
> +               goto err2;
> +       }
> +
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> +       mtd_parts_nb = parse_cmdline_partitions(cmx255_nand_mtd, &mtd_parts,
> +                                               "cmx255");
> +       if (mtd_parts_nb > 0)
> +               part_type = "command line";
> +       else
> +               mtd_parts_nb = 0;
> +#endif
> +       if (mtd_parts_nb == 0)
> +       {

	if (!mtd_parts_nb) {

> +               mtd_parts = partition_info;
> +               mtd_parts_nb = NUM_PARTITIONS;
> +               part_type = "static";
> +       }
> +
> +       /* Register the partitions */
> +       printk(KERN_NOTICE "Using %s partition definition\n", part_type);
> +       add_mtd_partitions(cmx255_nand_mtd, mtd_parts, mtd_parts_nb);

	add_mtd_partitions can fail !

also, when you do not intend to use this driver w/o partitions, then
please remove the #ifdef CONFIG_MTD_PARTITIONS around partition_info,
else you have to do a add_mtd_device(mtd) when partitions are disabled

	return 0; 

	otherwise you iounmap and free the mtd data structure 

	Please submit tested drivers. This one never ever worked !

> +  err2:
> +       iounmap((void*)nandaddr);

See above

> +  err1:
> +       kfree(cmx255_nand_mtd);
> +  out:
> +       /* Return happy */
> +       return retval;
> +}
> +module_init(cmx255_init);
> +
> +/*
> + * Clean up routine
> + */
> +static void __exit cmx255_cleanup (void)
> +{
> +       struct nand_chip *this;
> +
> +       this = (struct nand_chip *) (&cmx255_nand_mtd[1]);
> +       iounmap(this->IO_ADDR_R);

unmap after nand_release(). As long as the device is not released it can
be accessed !!!!

> +       /* Release resources, unregister device */
> +       nand_release (cmx255_nand_mtd);

	nand_release(
> +
> +       /* Free the MTD device structure */
> +       kfree (cmx255_nand_mtd);

	kfree(
> +}
> +module_exit(cmx255_cleanup);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Mike Rapoport <mike at compulab dot co dot il>");
> +MODULE_DESCRIPTION("NAND flash driver for Compulab CM-X255 Module");
> diff --git a/drivers/mtd/nand/cmx270-nand.c b/drivers/mtd/nand/cmx270-nand.c
> new file mode 100644
> index 0000000..ffedaec
> --- /dev/null
> +++ b/drivers/mtd/nand/cmx270-nand.c
> @@ -0,0 +1,273 @@
> +/*
> + *  linux/drivers/mtd/nand/cmx270-nand.c
> + *
> + *  Copyright (C) 2006 Compulab, Ltd.
> + *  Mike Rapoport <mike@compulab.co.il>
> + *
> + *  Derived from drivers/mtd/nand/h1910.c
> + *       Copyright (C) 2002 Marius Grger (mag@sysgo.de)
> + *       Copyright (c) 2001 Thomas Gleixner (gleixner@autronix.de)
> + *
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + *  Overview:
> + *   This is a device driver for the NAND flash device found on the
> + *   CM-X270 board.
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +
> +#include <asm/io.h>
> +#include <asm/irq.h>
> +
> +#include <asm/arch/hardware.h>
> +#include <asm/arch/pxa-regs.h>
> +
> +#define GPIO_NAND_CS   (11)
> +#define GPIO_NAND_RB   (89)
> +
> +#define DRAIN_WB() \
> +       do { \
> +               unsigned char dummy; \
> +               asm volatile ("mcr p15, 0, r0, c7, c10, 4":::"r0"); \
> +               dummy=*((unsigned char*)UNCACHED_ADDR); \
> +       } while(0);

I bet xscale has this functionality somewhere as a macro / inline already

> +/*
> + * MTD structure for CM-X270 board
> + */
> +static struct mtd_info *cmx270_nand_mtd = NULL;
> +
> +/*
> + * Module stuff
> + */
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +/*
> + * Define static partitions for flash device
> + */
> +static struct mtd_partition partition_info[] = {
> +       {
> +               .name   = "cmx270-0",
> +               .offset = 0,
> +               .size   = MTDPART_SIZ_FULL
> +       }
> +};
> +#define NUM_PARTITIONS (ARRAY_SIZE(partition_info))
> +
> +#endif
> +
> +
> +static         u_char cmx270_read_byte(struct mtd_info *mtd)

stray tab

> +{
> +       struct nand_chip *this = mtd->priv;

blank line between variable declaration and instructions

> +       return (readl(this->IO_ADDR_R) >> 16);
> +}
> +
> +static void cmx270_write_byte(struct mtd_info *mtd, u_char byte)
> +{
> +       struct nand_chip *this = mtd->priv;

dito

> +       writel((byte << 16), this->IO_ADDR_W);
> +}
> +
> +static void cmx270_write_buf(struct mtd_info *mtd, const u_char *buf, int len)
> +{
> +       int i;
> +       struct nand_chip *this = mtd->priv;
> +
> +       for (i=0; i<len; i++) {
> +               writel((*buf++ << 16), this->IO_ADDR_W);
> +       }

No brackets for oneliners

> +}
> +
> +static void cmx270_read_buf(struct mtd_info *mtd, u_char *buf, int len)
> +{
> +       int i;
> +       struct nand_chip *this = mtd->priv;
> +
> +       for (i=0; i<len; i++) {
> +               *buf++ = readl(this->IO_ADDR_R) >> 16;
> +       }

dito

> +}
> +
> +static int cmx270_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
> +{
> +       int i;
> +       struct nand_chip *this = mtd->priv;
> +
> +       for (i=0; i<len; i++) {
> +               if ( buf[i] != (u_char)(readl(this->IO_ADDR_R) >> 16) )
> +                       return -EFAULT;

	no extra blanks after ( and before )
> +       }
> +
> +       return 0;
> +}
> +
> +static inline void nand_cs_on(void)
> +{
> +       GPCR(GPIO_NAND_CS) = GPIO_bit(GPIO_NAND_CS);
> +}
> +
> +static void nand_cs_off(void)
> +{
> +       DRAIN_WB();
> +
> +       GPSR(GPIO_NAND_CS) = GPIO_bit(GPIO_NAND_CS);
> +}
> +
> +/*
> + *     hardware specific access to control-lines
> + */
> +static void cmx270_hwcontrol(struct mtd_info *mtd, int dat,
> +                            unsigned int ctrl)
> +{
> +       struct nand_chip* this = (struct nand_chip *) (mtd->priv);

See above

> +       unsigned int nandaddr = (unsigned int)this->IO_ADDR_W;
> +
> +       DRAIN_WB();
> +
> +       if ( ctrl & NAND_CTRL_CHANGE ) {
> +               if ( ctrl & NAND_ALE ) /* ALE should be changed */
> +                       nandaddr |=  (1 << 3);
> +               else
> +                       nandaddr &= ~(1 << 3);
> +               if ( ctrl & NAND_CLE ) /* CLE should be changed */
> +                       nandaddr |=  (1 << 2);
> +               else 
> +                       nandaddr &= ~(1 << 2);
> +               if ( ctrl & NAND_NCE ) /* CE should be changed */
> +                       nand_cs_on();
> +               else
> +                       nand_cs_off();
> +       }
> +       this->IO_ADDR_W = (void*)nandaddr;

	dito	

> +       DRAIN_WB();
> +       if ( dat != NAND_CMD_NONE )
> +               cmx270_write_byte(mtd, dat);
> +       DRAIN_WB();
> +}
> +
> +/*
> + *     read device ready pin
> + */
> +static int cmx270_device_ready(struct mtd_info *mtd)
> +{
> +       DRAIN_WB();
> +       return ( GPLR(GPIO_NAND_RB) & GPIO_bit(GPIO_NAND_RB) );
> +}
> +
> +/*
> + * Main initialization routine
> + */
> +static int __init cmx270_init (void)
> +{
> +       struct nand_chip *this;
> +       const char *part_type = 0;
> +       int mtd_parts_nb = 0;
> +       struct mtd_partition *mtd_parts = 0;
> +       unsigned int nandaddr = 0;

	See above

> +       /* Allocate memory for MTD device structure and private data */
> +       cmx270_nand_mtd = kmalloc(sizeof(struct mtd_info) +
> +                                 sizeof(struct nand_chip),
> +                                 GFP_KERNEL);
> +       mb();

	Why do you beed a memory barrier here ?

> +       if (!cmx270_nand_mtd) {
> +               printk("Unable to allocate CM-X270 NAND MTD device structure.\n");
> +               return -ENOMEM;
> +       }
> +
> +       nandaddr = (unsigned int)ioremap(PXA_CS1_PHYS, 12);
> +       if ( !nandaddr ) {
> +               printk("Unable to ioremap NAND device");
> +               return -EINVAL;
> +       }
> +
> +       /* Get pointer to private data */
> +       this = (struct nand_chip *) (&cmx270_nand_mtd[1]);
> +
> +       /* Initialize structures */
> +       memset((char *) cmx270_nand_mtd, 0, sizeof(struct mtd_info));
> +       memset((char *) this, 0, sizeof(struct nand_chip));

	See above

> +       /* Link the private data with the MTD structure */
> +       cmx270_nand_mtd->owner = THIS_MODULE;
> +       cmx270_nand_mtd->priv = this;
> +
> +       /* insert callbacks */
> +       this->IO_ADDR_R = (void __iomem *)nandaddr;
> +       this->IO_ADDR_W = (void __iomem *)nandaddr;
> +       this->cmd_ctrl = cmx270_hwcontrol;
> +       this->dev_ready = cmx270_device_ready;  /* unknown whether that was correct or not so we will just do it like this */
> +
> +       /* 15 us command delay time */
> +       this->chip_delay = 20;
> +       this->ecc.mode = NAND_ECC_SOFT;
> +
> +       /* read/write functions */
> +       this->read_byte = cmx270_read_byte;
> +       this->read_buf = cmx270_read_buf;
> +       this->write_buf = cmx270_write_buf;
> +       this->verify_buf = cmx270_verify_buf;
> +
> +       /* Scan to find existence of the device */
> +       if (nand_scan (cmx270_nand_mtd, 1)) {
> +               printk(KERN_NOTICE "No NAND device\n");
> +               iounmap((void*)nandaddr);
> +               kfree (cmx270_nand_mtd);
> +               return -ENXIO;
> +       }
> +
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> +       mtd_parts_nb = parse_cmdline_partitions(cmx270_nand_mtd, &mtd_parts,
> +                                               "cmx270");
> +       if (mtd_parts_nb > 0)
> +               part_type = "command line";
> +       else
> +               mtd_parts_nb = 0;
> +#endif
> +       if (mtd_parts_nb == 0)
> +       {
> +               mtd_parts = partition_info;
> +               mtd_parts_nb = NUM_PARTITIONS;
> +               part_type = "static";
> +       }
> +
> +       /* Register the partitions */
> +       printk(KERN_NOTICE "Using %s partition definition\n", part_type);
> +       add_mtd_partitions(cmx270_nand_mtd, mtd_parts, mtd_parts_nb);

See above

> +       /* Return happy */
> +       return 0;
> +}
> +module_init(cmx270_init);
> +
> +/*
> + * Clean up routine
> + */
> +static void __exit cmx270_cleanup (void)

	_cleanup(

> +{
> +       struct nand_chip *this;
> +
> +       this = (struct nand_chip *) (&cmx270_nand_mtd[1]);
> +       iounmap(this->IO_ADDR_R);

See above

> +       /* Release resources, unregister device */
> +       nand_release (cmx270_nand_mtd);
> +
> +       /* Free the MTD device structure */
> +       kfree (cmx270_nand_mtd);
> +}
> +module_exit(cmx270_cleanup);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Mike Rapoport <mike at compulab dot co dot il>");
> +MODULE_DESCRIPTION("NAND flash driver for Compulab CM-X270 Module");

Can you please combine both drivers into one and make it a platform
device. There is no need to keep lots of duplicate functionality around.

	tglx
