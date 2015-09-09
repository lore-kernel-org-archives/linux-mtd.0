Received: from mail-qk0-f174.google.com ([209.85.220.174])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZgMq-0005m9-0D
 for linux-mtd@lists.infradead.org; Wed, 09 Sep 2015 14:28:57 +0000
Received: by qkap81 with SMTP id p81so4703053qka.2
 for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2015 07:28:32 -0700 (PDT)
Date: Wed, 9 Sep 2015 11:24:39 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Alex Smith <alex.smith@imgtec.com>
Cc: linux-mtd@lists.infradead.org,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 linux-kernel@vger.kernel.org, Alex Smith <alex@alex-smith.me.uk>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v5 3/4] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
Message-ID: <20150909142439.GA2371@laptop>
References: <1441703453-2838-1-git-send-email-alex.smith@imgtec.com>
 <1441703453-2838-4-git-send-email-alex.smith@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441703453-2838-4-git-send-email-alex.smith@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08 Sep 10:10 AM, Alex Smith wrote:
> Add a driver for NAND devices connected to the NEMC on JZ4780 SoCs, as
> well as the hardware BCH controller. DMA is not currently implemented.
> 
> While older 47xx SoCs also have a BCH controller, they are incompatible
> with the one in the 4780 due to differing register/bit positions, which
> would make implementing a common driver for them quite messy.
> 
> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> v4 -> v5:
>  - Bump RB_DELAY up to be sufficient for the driver to work without a
>    busy GPIO available.
>  - Use readl_poll_timeout instead of custom polling loop.
>  - Remove useless printks.
>  - Change a BUG_ON to WARN_ON.
>  - Remove use of of_translate_address(), use standard platform resource
>    APIs.
>  - Add DRV_NAME define to avoid duplication of the same string.
> 
> v3 -> v4:
>  - Rebase to 4.2-rc4
>  - Change ECC_HW_OOB_FIRST to ECC_HW, reading OOB first is not necessary.
>  - Fix argument to get_device() in jz4780_bch_get()
> 
> v2 -> v3:
>  - Rebase to 4.0-rc6
>  - Reflect binding changes
>  - get/put_device in bch get/release
>  - Removed empty .remove() callback
>  - Removed .owner
>  - Set mtd->dev.parent
> 
> v1 -> v2:
>  - Fixed module license macro
>  - Rebase to 4.0-rc3
> ---
>  drivers/mtd/nand/Kconfig       |   7 +
>  drivers/mtd/nand/Makefile      |   1 +
>  drivers/mtd/nand/jz4780_bch.c  | 348 +++++++++++++++++++++++++++++++++++++
>  drivers/mtd/nand/jz4780_bch.h  |  42 +++++
>  drivers/mtd/nand/jz4780_nand.c | 378 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 776 insertions(+)
>  create mode 100644 drivers/mtd/nand/jz4780_bch.c
>  create mode 100644 drivers/mtd/nand/jz4780_bch.h
>  create mode 100644 drivers/mtd/nand/jz4780_nand.c
> 
[..]
> +
> +static int jz4780_nand_init_chips(struct jz4780_nand *nand,
> +				  struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct jz4780_nand_chip *chip;
> +	const __be32 *prop;
> +	struct resource *res;
> +	int i = 0;
> +
> +	/*
> +	 * Iterate over each bank assigned to this device and request resources.
> +	 * The bank numbers may not be consecutive, but nand_scan_ident()
> +	 * expects chip numbers to be, so fill out a consecutive array of chips
> +	 * which map chip number to actual bank number.
> +	 */
> +	while ((prop = of_get_address(dev->of_node, i, NULL, NULL))) {
> +		chip = &nand->chips[i];
> +		chip->bank = of_read_number(prop, 1);
> +
> +		jz4780_nemc_set_type(nand->dev, chip->bank,
> +				     JZ4780_NEMC_BANK_NAND);
> +
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> +		chip->base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(chip->base)) {
> +			dev_err(dev, "failed to map bank %u: %ld\n",
> +				chip->bank, PTR_ERR(chip->base));

You don't need to print anything on devm_ioremap_resource errors.

The rest looks good:

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
