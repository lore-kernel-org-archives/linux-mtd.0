Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LcmvS-0003Sl-4q
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2009 20:33:49 +0000
Date: Thu, 26 Feb 2009 12:33:41 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: dbrownell@users.sourceforge.net
Subject: Re: [patch/RESEND 2.6.29-rc3-git] NAND: davinci_nand driver
Message-Id: <20090226123341.a2421733.akpm@linux-foundation.org>
In-Reply-To: <200902241509.54649.david-b@pacbell.net>
References: <200902241509.54649.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: david-b@pacbell.net, davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 24 Feb 2009 15:09:54 -0800
David Brownell <david-b@pacbell.net> wrote:

> From: David Brownell <dbrownell@users.sourceforge.net>
> 
> This is a device driver for the NAND flash controller found on the
> various DaVinci family chips.  It handles up to four SoC chipselects,
> and some flavors of secondary chipselect (e.g. based on upper bits
> of the address bus) as used with some multichip packages.  (Including
> the 2 GByte chips used on some TI devel boards.)
> 
> The 1-bit ECC hardware is supported (3 bytes ECC per 512 bytes data);
> but not yet the newer 4-bit ECC (10 bytes ECC per 512 bytes data), as
> available on chips like the DM355 or OMAP-L137 and needed with the
> more error-prone MLC NAND chips.
> 
> This is a cleaned-up version of code that's been in use for several
> years now; sanity checked with the new drivers/mtd/tests.
> 
> Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
>
> ...
>
> + * Copyright (C) 2006 Texas Instruments.
> + *
> + * Ported to 2.6.23 Copyright (C) 2008 by
> + *   Sander Huijsen <Shuijsen@optelecom-nkf.com>
> + *   Troy Kisky <troy.kisky@boundarydevices.com>
> + *   Dirk Behme <Dirk.Behme@gmail.com>

hm.  What's the story with authorship, attributions and signoffs here?

>
> ...
>
> +#ifdef CONFIG_MTD_PARTITIONS
> +static inline int mtd_has_partitions(void) { return 1; }
> +#else
> +static inline int mtd_has_partitions(void) { return 0; }
> +#endif
> +
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> +static inline int mtd_has_cmdlinepart(void) { return 1; }
> +#else
> +static inline int mtd_has_cmdlinepart(void) { return 0; }
> +#endif

These definitions shouldn't be buried in a .c file.

>
> ...
>
> +static void nand_davinci_hwctl_1bit(struct mtd_info *mtd, int mode)
> +{
> +	struct davinci_nand_info *info;
> +	u32 retval;

The identifier `retval' is usually used to identify the value which
this function will return.

> +	unsigned long flags;
> +
> +	info = to_davinci_nand(mtd);
> +
> +	/* Reset ECC hardware */
> +	nand_davinci_readecc_1bit(mtd);
> +
> +	spin_lock_irqsave(&davinci_nand_lock, flags);
> +
> +	/* Restart ECC hardware */
> +	retval = davinci_nand_readl(info, NANDFCR_OFFSET);
> +	retval |= BIT(8 + info->core_chipsel);
> +	davinci_nand_writel(info, NANDFCR_OFFSET, retval);
> +
> +	spin_unlock_irqrestore(&davinci_nand_lock, flags);
> +}
> +
> +/*
> + * Read hardware ECC value and pack into three bytes
> + */
> +static int nand_davinci_calculate_1bit(struct mtd_info *mtd,
> +				      const u_char *dat, u_char *ecc_code)
> +{
> +	unsigned int ecc_val = nand_davinci_readecc_1bit(mtd);
> +	unsigned int tmp = (ecc_val & 0x0fff) | ((ecc_val & 0x0fff0000) >> 4);

argh.

> +	/* invert so that erased block ecc is correct */
> +	tmp = ~tmp;
> +	ecc_code[0] = (u_char)(tmp);
> +	ecc_code[1] = (u_char)(tmp >> 8);
> +	ecc_code[2] = (u_char)(tmp >> 16);

Is there some library facility which is being open-coded here?

> +	return 0;
> +}
> +
>
> ...
>
> +static int __init nand_davinci_probe(struct platform_device *pdev)
> +{
> +	struct davinci_nand_pdata	*pdata = pdev->dev.platform_data;
> +	struct davinci_nand_info	*info;
> +	struct resource			*res1;
> +	struct resource			*res2;
> +	void __iomem			*vaddr;
> +	void __iomem			*base;
> +	int				ret;
> +	u32				val;
> +	nand_ecc_modes_t		ecc_mode;
> +
> +	/* which external chipselect will we be managing? */
> +	if (pdev->id < 0 || pdev->id > 3)
> +		return -ENODEV;
> +
> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info) {
> +		dev_err(&pdev->dev, "unable to allocate memory\n");
> +		ret = -ENOMEM;
> +		goto err_nomem;
> +	}
> +
> +	platform_set_drvdata(pdev, info);
> +
> +	res1 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	res2 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	if (!res1 || !res2) {
> +		dev_err(&pdev->dev, "resource missing\n");
> +		ret = -EINVAL;
> +		goto err_res;

This leaks `info'.

Please check all the error path unwinding here.

> +	}
> +
>
> ...
>
