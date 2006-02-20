Received: from host-84-9-200-52.bulldogdsl.com ([84.9.200.52]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBDGZ-0000nR-HB
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 10:48:13 -0500
Date: Mon, 20 Feb 2006 15:35:36 +0000
From: Ben Dooks <ben-mtd@fluff.org>
To: Andrew Victor <andrew@sanpeople.com>
Message-ID: <20060220153536.GD7092@home.fluff.org>
References: <1140447277.1638.63.camel@fuzzie.sanpeople.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1140447277.1638.63.camel@fuzzie.sanpeople.com>
Sender: Ben Dooks <ben@fluff.org.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND driver for AT91RM9200
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 20, 2006 at 04:54:37PM +0200, Andrew Victor wrote:
> hi,
> 
> This patch adds support for the NAND (SmartMedia) controller on the
> Atmel AT91RM9200 processor.
> 
> Could it please be reviewed for addition to the MTD CVS / mainline
> kernels.  Thanks.
> 
> 
> Regards,
>   Andrew Victor
> 
> 
> diff -urN linux-2.6.16-rc4.orig/drivers/mtd/nand/Kconfig linux-2.6.16-rc4/drivers/mtd/nand/Kconfig
> --- linux-2.6.16-rc4.orig/drivers/mtd/nand/Kconfig	Mon Feb 20 14:40:22 2006
> +++ linux-2.6.16-rc4/drivers/mtd/nand/Kconfig	Mon Feb 20 14:47:11 2006
> @@ -190,5 +190,11 @@
>  	help
>  	  The simulator may simulate verious NAND flash chips for the
>  	  MTD nand layer.
> - 
> +
> +config MTD_NAND_AT91
> +	bool "AT91 NAND Access (Smart Media)"
> +	depends on MTD_NAND && ARCH_AT91RM9200 && EXPERIMENTAL
> +	help
> +	  Enables access to the Smart Media Card interface on the AT91RM9200
> +
>  endmenu
> diff -urN linux-2.6.16-rc4.orig/drivers/mtd/nand/Makefile linux-2.6.16-rc4/drivers/mtd/nand/Makefile
> --- linux-2.6.16-rc4.orig/drivers/mtd/nand/Makefile	Mon Feb 20 14:35:48 2006
> +++ linux-2.6.16-rc4/drivers/mtd/nand/Makefile	Mon Feb 20 14:47:11 2006
> @@ -18,5 +18,6 @@
>  obj-$(CONFIG_MTD_NAND_RTC_FROM4)	+= rtc_from4.o
>  obj-$(CONFIG_MTD_NAND_SHARPSL)		+= sharpsl.o
>  obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
> +obj-$(CONFIG_MTD_NAND_AT91)		+= at91_nand.o
>  
>  nand-objs = nand_base.o nand_bbt.o
> diff -urN linux-2.6.16-rc4.orig/drivers/mtd/nand/at91_nand.c linux-2.6.16-rc4/drivers/mtd/nand/at91_nand.c
> --- linux-2.6.16-rc4.orig/drivers/mtd/nand/at91_nand.c	Thu Jan  1 02:00:00 1970
> +++ linux-2.6.16-rc4/drivers/mtd/nand/at91_nand.c	Mon Feb 20 16:29:51 2006
> @@ -0,0 +1,361 @@
> +/*
> + * drivers/mtd/nand/at91_nand.c
> + *
> + *  Copyright (C) 2003 Rick Bronson
> + *
> + *  Derived from drivers/mtd/nand/autcpu12.c
> + *	 Copyright (c) 2001 Thomas Gleixner (gleixner@autronix.de)
> + *
> + *  Derived from drivers/mtd/spia.c
> + *	 Copyright (C) 2000 Steven J. Hill (sjhill@cotw.com)
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +
> +#include <asm/io.h>
> +#include <asm/sizes.h>
> +
> +#include <asm/arch/hardware.h>
> +#include <asm/arch/board.h>
> +#include <asm/arch/gpio.h>
> +
> +struct at91_nand_host {
> +	struct nand_chip	nand_chip;
> +	struct mtd_info		mtd;
> +	void __iomem		*io_base;
> +	struct at91_nand_data	*board;
> +};
> +
> +/*
> + * Hardware specific access to control-lines
> + */
> +static void at91_nand_hwcontrol(struct mtd_info *mtd, int cmd)
> +{
> +	struct nand_chip *nand_chip = mtd->priv;
> +	struct at91_nand_host *host = nand_chip->priv;
> +
> +	switch(cmd) {
> +		case NAND_CTL_SETCLE:
> +			nand_chip->IO_ADDR_W = (void __iomem *)(host->io_base + (1 << host->board->cle));
> +			break;
> +		case NAND_CTL_CLRCLE:
> +			nand_chip->IO_ADDR_W = (void __iomem *)(host->io_base);
> +			break;
> +		case NAND_CTL_SETALE:
> +			nand_chip->IO_ADDR_W = (void __iomem *)(host->io_base + (1 << host->board->ale));
> +			break;
> +		case NAND_CTL_CLRALE:
> +			nand_chip->IO_ADDR_W = (void __iomem *)(host->io_base);

hmm, you already have host->io_base above as `void __iomem *`, so 
you really shouldn't need to be re-casting here.

> +			break;
> +		case NAND_CTL_SETNCE:
> +			break;
> +		case NAND_CTL_CLRNCE:
> +			break;
> +	}
> +}
> +
> +static void at91_nand_command_largepage(struct mtd_info *mtd, unsigned command, int column, int page_addr)
> +{
> +	struct nand_chip *nand_chip = mtd->priv;
> +	struct at91_nand_host *host = nand_chip->priv;
> +
> +	/* Begin command latch cycle */
> +	unsigned long NAND_IO_ADDR = (unsigned long)(nand_chip->IO_ADDR_W + (1 << host->board->cle));

this can be `void __iomem *` as well. readb and writeb should be
taking this instead of unsigned long.

> +	/*
> +	 * Write out the command to the device.
> +	 */
> +	if (command == NAND_CMD_READ1) {
> +		command = NAND_CMD_READ0;
> +		column += 256;
> +	} else if (command == NAND_CMD_READOOB) {
> +		command = NAND_CMD_READ0;
> +		column += 2048;
> +	}
> +	writeb (command, NAND_IO_ADDR);
> +
> +	/* Set ALE and clear CLE to start address cycle */
> +	NAND_IO_ADDR = (unsigned long) host->io_base;
> +
> +	if (column != -1 || page_addr != -1)
> +		NAND_IO_ADDR += (1 << host->board->ale);
> +
> +	/* Serially input address */
> +	if (column != -1) {
> +		writeb (column, NAND_IO_ADDR);
> +		writeb ((unsigned char) ((column >> 8) & 0x0f), NAND_IO_ADDR);
> +	}
> +	if (page_addr != -1) {
> +		writeb ((unsigned char) (page_addr & 0xff), NAND_IO_ADDR);
> +		writeb ((unsigned char) ((page_addr >> 8) & 0xff), NAND_IO_ADDR);
> +	}

don't need to and with 0xff before calling writeb

> +	if (command == NAND_CMD_READ0) {
> +		NAND_IO_ADDR = (unsigned long)(nand_chip->IO_ADDR_W + (1 << host->board->cle));
> +		writeb (0x30, NAND_IO_ADDR);
> +	}
> +
> +	/* wait until command is processed */
> +	while (!nand_chip->dev_ready(mtd)) {}
> +}
> +
> +/*
> + * Send command to NAND device
> + */
> +static void at91_nand_command(struct mtd_info *mtd, unsigned command, int column, int page_addr)
> +{
> +	struct nand_chip *nand_chip = mtd->priv;
> +	struct at91_nand_host *host = nand_chip->priv;
> +
> +	/* Begin command latch cycle */
> +	unsigned long NAND_IO_ADDR = (unsigned long)(nand_chip->IO_ADDR_W + (1 << host->board->cle));
> +
> +	if (mtd->oobblock > 512 && command != NAND_CMD_READID) {
> +		at91_nand_command_largepage(mtd, command, column, page_addr);
> +		return;
> +	}
> +
> +	/*
> +	 * Write out the command to the device.
> +	 */
> +	if (command != NAND_CMD_SEQIN)
> +		writeb (command, NAND_IO_ADDR);
> +	else {
> +		if (mtd->oobblock == 256 && column >= 256) {
> +			column -= 256;
> +			writeb (NAND_CMD_RESET, NAND_IO_ADDR);
> +			writeb (NAND_CMD_READOOB, NAND_IO_ADDR);
> +			writeb (NAND_CMD_SEQIN, NAND_IO_ADDR);
> +		}
> +		else
> +			if (mtd->oobblock == 512 && column >= 256) {
> +				if (column < 512) {
> +					column -= 256;
> +					writeb (NAND_CMD_READ1, NAND_IO_ADDR);
> +					writeb (NAND_CMD_SEQIN, NAND_IO_ADDR);
> +				} else {
> +					column -= 512;
> +					writeb (NAND_CMD_READOOB, NAND_IO_ADDR);
> +					writeb (NAND_CMD_SEQIN, NAND_IO_ADDR);
> +				}
> +			} else {
> +				writeb (NAND_CMD_READ0, NAND_IO_ADDR);
> +				writeb (NAND_CMD_SEQIN, NAND_IO_ADDR);
> +			}
> +	}
> +
> +	/* Set ALE and clear CLE to start address cycle */
> +	NAND_IO_ADDR = (unsigned long) host->io_base;
> +
> +	if (column != -1 || page_addr != -1)
> +		NAND_IO_ADDR += (1 << host->board->ale);
> +
> +	/* Serially input address */
> +	if (column != -1)
> +		writeb (column, NAND_IO_ADDR);
> +	if (page_addr != -1) {
> +		writeb ((unsigned char) (page_addr & 0xff), NAND_IO_ADDR);
> +		writeb ((unsigned char) ((page_addr >> 8) & 0xff), NAND_IO_ADDR);
> +		/* One more address cycle for higher density devices */
> +		if (mtd->size & 0x0c000000) {
> +			writeb ((unsigned char) ((page_addr >> 16) & 0x0f), NAND_IO_ADDR);
> +		}
> +	}
> +
> +	/* wait until command is processed */
> +	while (!nand_chip->dev_ready(mtd)) {}
> +}

I'm interested in why you feel necessary to over-ride the extant
small page read/write code here, it should be ok to use the command
code to move the IO address that the nand core code uses
(see the s3c2410 nand driver, and others).

Maybe it would be worth fixing the core code handling for large
page devices?

> +/*
> + * Read the Device Ready pin.
> + */
> +static int at91_nand_device_ready(struct mtd_info *mtd)
> +{
> +	struct nand_chip *nand_chip = mtd->priv;
> +	struct at91_nand_host *host = nand_chip->priv;
> +
> +	return at91_get_gpio_value(host->board->rdy_pin);
> +}
> +
> +
> +/*
> + * Enable NAND and detect card.
> + */
> +static void at91_nand_enable(struct at91_nand_host *host)
> +{
> +	unsigned int csa;
> +
> +	/* Setup Smart Media, first enable the address range of CS3 */
> +	csa = at91_sys_read(AT91_EBI_CSA);
> +	at91_sys_write(AT91_EBI_CSA, csa | AT91_EBI_CS3A_SMC_SMARTMEDIA);
> +
> +	/* set the bus interface characteristics */
> +	at91_sys_write(AT91_SMC_CSR(3), AT91_SMC_ACSS_STD | AT91_SMC_DBW_8 | AT91_SMC_WSEN
> +				| AT91_SMC_NWS_(5)
> +				| AT91_SMC_TDF_(1)
> +				| AT91_SMC_RWSETUP_(0)	/* tDS Data Set up Time 30 - ns */
> +				| AT91_SMC_RWHOLD_(1)	/* tDH Data Hold Time 20 - ns */
> +	);
> +
> +	if (host->board->enable_pin)
> +		at91_set_gpio_value(host->board->enable_pin, 0);
> +}
> +
> +/*
> + * Disable NAND.
> + */
> +static void at91_nand_disable(struct at91_nand_host *host)
> +{
> +	if (host->board->enable_pin)
> +		at91_set_gpio_value(host->board->enable_pin, 1);
> +}
> +
> +/*
> + * Probe for the NAND device.
> + */
> +static int __init at91_nand_probe(struct platform_device *pdev)
> +{
> +	struct at91_nand_host *host;
> +	struct mtd_info *mtd;
> +	struct nand_chip *nand_chip;
> +	int res;
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +	struct mtd_partition *partitions = NULL;
> +	int num_partitions = 0;
> +#endif
> +
> +	/* Allocate memory for the device structure */
> +	host = kmalloc(sizeof(struct at91_nand_host), GFP_KERNEL);
> +	if (!host) {
> +		printk(KERN_ERR "at91_nand: failed to allocate device structure.\n");
> +		return -ENOMEM;
> +	}
> +	memset(host, 0, sizeof(struct at91_nand_host));
> +
> +	host->io_base = ioremap(pdev->resource[0].start,
> +				pdev->resource[0].end - pdev->resource[0].start + 1);
> +	if (host->io_base == NULL) {
> +		printk(KERN_ERR "at91_nand: ioremap failed\n");
> +		kfree(host);
> +		return -EIO;
> +	}
> +
> +	mtd = &host->mtd;
> +	nand_chip = &host->nand_chip;
> +	host->board = pdev->dev.platform_data;
> +
> +	nand_chip->priv = host;		/* link the private data structures */
> +	mtd->priv = nand_chip;
> +
> +	/* Set address of NAND IO lines */
> +	nand_chip->IO_ADDR_R = host->io_base;
> +	nand_chip->IO_ADDR_W = host->io_base;
> +	nand_chip->hwcontrol = at91_nand_hwcontrol;
> +	nand_chip->dev_ready = at91_nand_device_ready;
> +	nand_chip->cmdfunc = at91_nand_command;	/* we need our own */
> +	nand_chip->eccmode = NAND_ECC_SOFT;	/* enable ECC */
> +	/* 20 us command delay time */
> +	nand_chip->chip_delay = 20;
> +
> +	platform_set_drvdata(pdev, host);
> +
> +	at91_nand_enable(host);
> +
> +	if (host->board->det_pin) {
> +		if (at91_get_gpio_value(host->board->det_pin)) {
> +			printk ("No SmartMedia card inserted.\n");
> +			res = ENXIO;
> +			goto out;
> +		}
> +	}
> +
> +	/* Scan to find existance of the device */
> +	if (nand_scan(mtd, 1)) {
> +		res = -ENXIO;
> +		goto out;
> +	}
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +	if (host->board->partition_info)
> +		partitions = host->board->partition_info(mtd->size, &num_partitions);
> +
> +	if ((!partitions) || (num_partitions == 0)) {
> +		printk(KERN_ERR "at91_nand: No parititions defined, or unsupported device.\n");
> +		res = ENXIO;
> +		goto out;
> +	}
> +
> +	res = add_mtd_partitions(mtd, partitions, num_partitions);
> +#else
> +	res = add_mtd_device(mtd);
> +#endif
> +
> +out:
> +	at91_nand_disable(host);
> +	platform_set_drvdata(pdev, NULL);
> +
> +	if (res) {
> +		iounmap(host->io_base);
> +		kfree(host);
> +	}
> +
> +	return res;
> +}
> +
> +/*
> + * Remove a NAND device.
> + */
> +static int __devexit at91_nand_remove(struct platform_device *pdev)
> +{
> +	struct at91_nand_host *host = platform_get_drvdata(pdev);
> +	struct mtd_info *mtd = &host->mtd;
> +
> +	del_mtd_partitions(mtd);
> +	del_mtd_device(mtd);
> +
> +	at91_nand_disable(host);
> +
> +	iounmap(host->io_base);
> +	kfree(host);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver at91_nand_driver = {
> +	.probe		= at91_nand_probe,
> +	.remove		= at91_nand_remove,
> +	.driver		= {
> +		.name	= "at91_nand",
> +		.owner	= THIS_MODULE,
> +	},
> +};
> +
> +static int __init at91_nand_init(void)
> +{
> +	return platform_driver_register(&at91_nand_driver);
> +}
> +
> +
> +static void __exit at91_nand_exit(void)
> +{
> +	platform_driver_unregister(&at91_nand_driver);
> +}
> +
> +
> +module_init(at91_nand_init);
> +module_exit(at91_nand_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Rick Bronson");
> +MODULE_DESCRIPTION("Glue layer for SmartMediaCard on ATMEL AT91RM9200");
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
