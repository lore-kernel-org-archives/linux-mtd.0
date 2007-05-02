Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjIX1-0007QT-5f
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 13:22:25 -0400
Subject: Re: [patch/respin] generic nand driver for SoCs
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vitalywool@gmail.com>
In-Reply-To: <20070502153859.00005173.vitalywool@gmail.com>
References: <20070502153859.00005173.vitalywool@gmail.com>
Content-Type: text/plain
Date: Wed, 02 May 2007 19:24:41 +0200
Message-Id: <1178126681.25504.30.camel@localhost.localdomain>
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

On Wed, 2007-05-02 at 15:38 +0400, Vitaly Wool wrote:

> +#ifdef CONFIG_MTD_PARTITIONS
> +	if (pdata->chip.part_probe_types) {
> +		res = parse_mtd_partitions(&data->mtd,
> +					pdata->chip.part_probe_types,
> +					&data->parts, 0);
> +		if (res > 0) {
> +			add_mtd_partitions(&data->mtd, data->parts, res);
> +			return 0;
> +		}
> +	} else if (pdata->chip.partitions) {
> +		data->parts = pdata->chip.partitions;
> +		res = add_mtd_partitions(&data->mtd, data->parts,
> +			pdata->chip.nr_partitions);
> +	}

Hmm, this looks wrong. When the probing fails, then you do not add
anything at all. You might at least add the device then.

> +config MTD_NAND_PLATFORM
> +	tristate "Support for generic NAND driver"

s/generic/generic platform /

> +	depends on MTD_NAND
> +	help
> +	  This driver enables support for common on-SoC NAND devices.
> +
>  endmenu
> Index: linux-2.6/drivers/mtd/nand/Makefile
> ===================================================================
> --- linux-2.6.orig/drivers/mtd/nand/Makefile
> +++ linux-2.6/drivers/mtd/nand/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x
>  obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
>  obj-$(CONFIG_MTD_NAND_AT91)		+= at91_nand.o
>  obj-$(CONFIG_MTD_NAND_BASLER_EXCITE)	+= excite_nandflash.o
> +obj-$(CONFIG_MTD_NAND_PLATFORM)		+= gen_nand.o

Can you please rename to plat_nand so we have am immidiate idea what it
is ?

>  nand-objs := nand_base.o nand_bbt.o
>  cafe_nand-objs := cafe.o cafe_ecc.o
> Index: linux-2.6/include/linux/mtd/nand.h
> ===================================================================
> --- linux-2.6.orig/include/linux/mtd/nand.h
> +++ linux-2.6/include/linux/mtd/nand.h
> @@ -559,6 +559,7 @@ extern int nand_do_read(struct mtd_info 
>   * @chip_delay:		R/B delay value in us
>   * @options:		Option flags, e.g. 16bit buswidth
>   * @ecclayout:		ecc layout info structure
> + * @part_probe_types:	NULL-terminated array of probe types
>   * @priv:		hardware controller specific settings
>   */
>  struct platform_nand_chip {
> @@ -569,6 +570,7 @@ struct platform_nand_chip {
>  	struct nand_ecclayout	*ecclayout;
>  	int			chip_delay;
>  	unsigned int		options;
> +	const char		**part_probe_types;
>  	void			*priv;
>  };

Please fold this into the other patch, which touches nand.h and add a
proper changelog.

Please add proper changelog description for the platform driver as well.

Thanks,

	tglx
