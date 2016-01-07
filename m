Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aH781-0004O2-13
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 09:45:13 +0000
Subject: Re: [PATCH v11 2/3] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
To: Brian Norris <computersforpeace@gmail.com>
References: <1451910884-18710-1-git-send-email-harvey.hunt@imgtec.com>
 <1451910884-18710-3-git-send-email-harvey.hunt@imgtec.com>
 <20160107011546.GT109450@google.com>
CC: <linux-mtd@lists.infradead.org>, <boris.brezillon@free-electrons.com>,
 <alex@alex-smith.me.uk>, Alex Smith <alex.smith@imgtec.com>, "Zubair
 Lutfullah Kakakhel" <Zubair.Kakakhel@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, <linux-kernel@vger.kernel.org>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <568E338E.7000506@imgtec.com>
Date: Thu, 7 Jan 2016 09:44:46 +0000
MIME-Version: 1.0
In-Reply-To: <20160107011546.GT109450@google.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 07/01/16 01:15, Brian Norris wrote:
> Hi Harvey,
>
> On Mon, Jan 04, 2016 at 12:34:43PM +0000, Harvey Hunt wrote:
>> From: Alex Smith <alex.smith@imgtec.com>
>>
>> Add a driver for NAND devices connected to the NEMC on JZ4780 SoCs, as
>> well as the hardware BCH controller. DMA is not currently implemented.
>>
>> While older 47xx SoCs also have a BCH controller, they are incompatible
>> with the one in the 4780 due to differing register/bit positions, which
>> would make implementing a common driver for them quite messy.
>>
>> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
>> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: linux-mtd@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
>> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> ---
> [...]
>
>>   drivers/mtd/nand/Kconfig       |   7 +
>>   drivers/mtd/nand/Makefile      |   1 +
>>   drivers/mtd/nand/jz4780_bch.c  | 380 +++++++++++++++++++++++++++++++++++++
>>   drivers/mtd/nand/jz4780_bch.h  |  43 +++++
>>   drivers/mtd/nand/jz4780_nand.c | 422 +++++++++++++++++++++++++++++++++++++++++
>>   5 files changed, 853 insertions(+)
>>   create mode 100644 drivers/mtd/nand/jz4780_bch.c
>>   create mode 100644 drivers/mtd/nand/jz4780_bch.h
>>   create mode 100644 drivers/mtd/nand/jz4780_nand.c
>>
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 2896640..b742adc 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -519,6 +519,13 @@ config MTD_NAND_JZ4740
>>   	help
>>   		Enables support for NAND Flash on JZ4740 SoC based boards.
>>
>> +config MTD_NAND_JZ4780
>> +	tristate "Support for NAND on JZ4780 SoC"
>> +	depends on MACH_JZ4780 && JZ4780_NEMC
>> +	help
>> +	  Enables support for NAND Flash connected to the NEMC on JZ4780 SoC
>> +	  based boards, using the BCH controller for hardware error correction.
>> +
>>   config MTD_NAND_FSMC
>>   	tristate "Support for NAND on ST Micros FSMC"
>>   	depends on PLAT_SPEAR || ARCH_NOMADIK || ARCH_U8500 || MACH_U300
>> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
>> index 2c7f014..9e36233 100644
>> --- a/drivers/mtd/nand/Makefile
>> +++ b/drivers/mtd/nand/Makefile
>> @@ -49,6 +49,7 @@ obj-$(CONFIG_MTD_NAND_MPC5121_NFC)	+= mpc5121_nfc.o
>>   obj-$(CONFIG_MTD_NAND_VF610_NFC)	+= vf610_nfc.o
>>   obj-$(CONFIG_MTD_NAND_RICOH)		+= r852.o
>>   obj-$(CONFIG_MTD_NAND_JZ4740)		+= jz4740_nand.o
>> +obj-$(CONFIG_MTD_NAND_JZ4780)		+= jz4780_nand.o jz4780_bch.o
>>   obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
>>   obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
>>   obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
>> diff --git a/drivers/mtd/nand/jz4780_bch.c b/drivers/mtd/nand/jz4780_bch.c
>> new file mode 100644
>> index 0000000..53b2c06
>> --- /dev/null
>> +++ b/drivers/mtd/nand/jz4780_bch.c
>> @@ -0,0 +1,380 @@
>
> [...]
>
>> +/**
>> + * of_jz4780_bch_get() - get the BCH controller from a DT node
>> + * @of_node: the node that contains a bch-controller property.
>> + *
>> + * Get the bch-controller property from the given device tree
>> + * node and pass it to jz4780_bch_get to do the work.
>> + *
>> + * Return: a pointer to jz4780_bch, errors are encoded into the pointer.
>> + * PTR_ERR(-EPROBE_DEFER) if the device hasn't been initialised yet.
>> + */
>> +struct jz4780_bch *of_jz4780_bch_get(struct device_node *of_node)
>> +{
>> +	struct jz4780_bch *bch = NULL;
>> +	struct device_node *np;
>> +
>> +	np = of_parse_phandle(of_node, "ingenic,bch-controller", 0);
>> +
>> +	if (np) {
>> +		bch = jz4780_bch_get(np);
>> +		of_node_put(np);
>> +	}
>> +	return bch;
>> +}
>
> Don't you need to EXPORT_SYMBOL() this one?
>
> [...]

Correct, I missed that.

>
>> diff --git a/drivers/mtd/nand/jz4780_bch.h b/drivers/mtd/nand/jz4780_bch.h
>> new file mode 100644
>> index 0000000..bf471808
>> --- /dev/null
>> +++ b/drivers/mtd/nand/jz4780_bch.h
>> @@ -0,0 +1,43 @@
>> +/*
>> + * JZ4780 BCH controller
>> + *
>> + * Copyright (c) 2015 Imagination Technologies
>> + * Author: Alex Smith <alex.smith@imgtec.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms of the GNU General Public License version 2 as published
>> + * by the Free Software Foundation.
>> + */
>> +
>> +#ifndef __DRIVERS_MTD_NAND_JZ4780_BCH_H__
>> +#define __DRIVERS_MTD_NAND_JZ4780_BCH_H__
>> +
>> +#include <linux/types.h>
>> +
>> +struct device;
>> +struct device_node;
>> +struct jz4780_bch;
>> +
>> +/**
>> + * struct jz4780_bch_params - BCH parameters
>> + * @size: data bytes per ECC step.
>> + * @bytes: ECC bytes per step.
>> + * @strength: number of correctable bits per ECC step.
>> + */
>> +struct jz4780_bch_params {
>> +	int size;
>> +	int bytes;
>> +	int strength;
>> +};
>> +
>> +int jz4780_bch_calculate(struct jz4780_bch *bch,
>> +				struct jz4780_bch_params *params,
>> +				const u8 *buf, u8 *ecc_code);
>> +int jz4780_bch_correct(struct jz4780_bch *bch,
>> +			      struct jz4780_bch_params *params, u8 *buf,
>> +			      u8 *ecc_code);
>> +
>> +void jz4780_bch_release(struct jz4780_bch *bch);
>> +struct jz4780_bch *of_jz4780_bch_get(struct device_node *np);
>> +
>> +#endif /* __DRIVERS_MTD_NAND_JZ4780_BCH_H__ */
>> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
>> new file mode 100644
>> index 0000000..d8ea35e
>> --- /dev/null
>> +++ b/drivers/mtd/nand/jz4780_nand.c
>> @@ -0,0 +1,422 @@
>
> [...]
>
>> +static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *dev)
>> +{
>> +	struct nand_chip *chip = &nand->chip;
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(chip->controller);
>> +	struct nand_ecclayout *layout = &nand->ecclayout;
>> +	u32 start, i;
>> +
>> +	chip->ecc.bytes = fls((1 + 8) * chip->ecc.size)	*
>> +				(chip->ecc.strength / 8);
>> +
>> +	if (nfc->bch && chip->ecc.mode == NAND_ECC_HW) {
>> +		chip->ecc.hwctl = jz4780_nand_ecc_hwctl;
>> +		chip->ecc.calculate = jz4780_nand_ecc_calculate;
>> +		chip->ecc.correct = jz4780_nand_ecc_correct;
>> +	} else if (!nfc->bch && chip->ecc.mode == NAND_ECC_HW) {
>> +		dev_err(dev, "HW BCH selected, but BCH controller not found\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (chip->ecc.mode == NAND_ECC_HW_SYNDROME) {
>> +		dev_err(dev, "ECC HW syndrome not supported\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (chip->ecc.mode != NAND_ECC_NONE)
>> +		dev_info(dev, "using %s (strength %d, size %d, bytes %d)\n",
>> +			(nfc->bch) ? "hardware BCH" : "software ECC",
>> +			chip->ecc.strength, chip->ecc.size, chip->ecc.bytes);
>> +	else
>> +		dev_info(dev, "not using ECC\n");
>
> Almost seems like all the above would be clearer as a switch/case
> statement.

I agree.

>
>> +
>> +	/* The NAND core will generate the ECC layout. */
>> +	if (chip->ecc.mode == NAND_ECC_SOFT || chip->ecc.mode == NAND_ECC_SOFT_BCH)
>> +		return 0;
>> +
>> +	/* Generate ECC layout. ECC codes are right aligned in the OOB area. */
>> +	layout->eccbytes = mtd->writesize / chip->ecc.size * chip->ecc.bytes;
>> +
>> +	if (layout->eccbytes > mtd->oobsize - 2) {
>> +		dev_err(dev,
>> +			"invalid ECC config: required %d ECC bytes, but only %d are available",
>> +			layout->eccbytes, mtd->oobsize - 2);
>> +		return -EINVAL;
>> +	}
>> +
>> +	start = mtd->oobsize - layout->eccbytes;
>> +	for (i = 0; i < layout->eccbytes; i++)
>> +		layout->eccpos[i] = start + i;
>> +
>> +	layout->oobfree[0].offset = 2;
>> +	layout->oobfree[0].length = mtd->oobsize - layout->eccbytes - 2;
>> +
>> +	chip->ecc.layout = layout;
>> +	return 0;
>> +}
>> +
>> +static int jz4780_nand_init_chip(struct platform_device *pdev,
>> +				struct jz4780_nand_controller *nfc,
>> +				struct device_node *np,
>> +				unsigned int chipnr)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct jz4780_nand_chip *nand;
>> +	struct jz4780_nand_cs *cs;
>> +	struct resource *res;
>> +	struct nand_chip *chip;
>> +	struct mtd_info *mtd;
>> +	const __be32 *reg;
>> +	int ret = 0;
>> +
>> +	cs = &nfc->cs[chipnr];
>> +
>> +	reg = of_get_property(np, "reg", NULL);
>> +	if (!reg)
>> +		return -EINVAL;
>> +
>> +	cs->bank = be32_to_cpu(*reg);
>
> Seems like you could use of_property_read_u32(). Not a big deal though.

Ack.

>> +
>> +	jz4780_nemc_set_type(nfc->dev, cs->bank, JZ4780_NEMC_BANK_NAND);
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, chipnr);
>> +	cs->base = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(cs->base))
>> +		return PTR_ERR(cs->base);
>> +
>> +	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
>> +	if (!nand)
>> +		return -ENOMEM;
>> +
>> +	nand->busy_gpio = devm_gpiod_get_optional(dev, "rb", GPIOD_IN);
>> +
>> +	if (IS_ERR(nand->busy_gpio)) {
>> +		ret = PTR_ERR(nand->busy_gpio);
>> +		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
>> +		return ret;
>> +	} else if (nand->busy_gpio) {
>> +		nand->chip.dev_ready = jz4780_nand_dev_ready;
>> +	}
>> +
>> +	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
>> +
>> +	if (IS_ERR(nand->wp_gpio)) {
>> +		ret = PTR_ERR(nand->wp_gpio);
>> +		dev_err(dev, "failed to request WP GPIO: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	chip = &nand->chip;
>> +	mtd = nand_to_mtd(chip);
>> +	mtd->priv = chip;
>> +	mtd->owner = THIS_MODULE;
>
> You don't need this line any more.

Okay.

>
>> +	mtd->name = DRV_NAME;
>
> Looks like you have made some effort to support multiple chips. It'd be
> a shame to name them all the same... Maybe use devm_kasprintf() to
> construct a unique name for each chip?

You're right.

>
>> +	mtd->dev.parent = dev;
>> +
>> +	chip->IO_ADDR_R = cs->base + OFFSET_DATA;
>> +	chip->IO_ADDR_W = cs->base + OFFSET_DATA;
>> +	chip->chip_delay = RB_DELAY_US;
>> +	chip->options = NAND_NO_SUBPAGE_WRITE;
>> +	chip->select_chip = jz4780_nand_select_chip;
>> +	chip->cmd_ctrl = jz4780_nand_cmd_ctrl;
>> +	chip->ecc.mode = NAND_ECC_HW;
>> +	chip->controller = &nfc->controller;
>> +	nand_set_flash_node(chip, np);
>> +
>> +	ret = nand_scan_ident(mtd, 1, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = jz4780_nand_init_ecc(nand, dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = nand_scan_tail(mtd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = mtd_device_register(mtd, NULL, 0);
>> +	if (ret) {
>> +		nand_release(mtd);
>> +		return ret;
>> +	}
>> +
>> +	list_add_tail(&nand->chip_list, &nfc->chips);
>> +
>> +	return 0;
>> +}
>> +
>> +static void jz4780_nand_cleanup_chips(struct jz4780_nand_controller *nfc)
>> +{
>> +	struct jz4780_nand_chip *chip;
>> +
>> +	while (!list_empty(&nfc->chips)) {
>> +		chip = list_first_entry(&nfc->chips, struct jz4780_nand_chip, chip_list);
>> +		nand_release(nand_to_mtd(&chip->chip));
>> +		list_del(&chip->chip_list);
>> +	}
>> +}
>> +
>> +static int jz4780_nand_init_chips(struct jz4780_nand_controller *nfc,
>> +				  struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np;
>> +	int i = 0;
>> +	int ret;
>> +	int num_chips = of_get_child_count(dev->of_node);
>> +
>> +	if (num_chips > nfc->num_banks) {
>> +		dev_err(dev, "found %d chips but only %d banks\n", num_chips, nfc->num_banks);
>> +		return -EINVAL;
>> +	}
>> +
>> +	for_each_child_of_node(dev->of_node, np) {
>> +		ret = jz4780_nand_init_chip(pdev, nfc, np, i);
>> +		if (ret) {
>> +			jz4780_nand_cleanup_chips(nfc);
>> +			return ret;
>> +		}
>> +
>> +		i++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int jz4780_nand_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	unsigned int num_banks;
>> +	struct jz4780_nand_controller *nfc;
>> +	int ret;
>> +
>> +	num_banks = jz4780_nemc_num_banks(dev);
>> +	if (num_banks == 0) {
>> +		dev_err(dev, "no banks found\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	nfc = devm_kzalloc(dev, sizeof(*nfc) + (sizeof(nfc->cs[0]) * num_banks), GFP_KERNEL);
>> +	if (!nfc)
>> +		return -ENOMEM;
>> +
>> +	/*
>> +	 * Check for BCH HW before we call nand_scan_ident, to prevent us from
>> +	 * having to call it again if the BCH driver returns -EPROBE_DEFER.
>> +	 */
>> +	nfc->bch = of_jz4780_bch_get(dev->of_node);
>> +	if (IS_ERR(nfc->bch))
>> +		return PTR_ERR(nfc->bch);
>> +
>> +	nfc->dev = dev;
>> +	nfc->num_banks = num_banks;
>> +
>> +	spin_lock_init(&nfc->controller.lock);
>> +	INIT_LIST_HEAD(&nfc->chips);
>> +	init_waitqueue_head(&nfc->controller.wq);
>> +
>> +	ret = jz4780_nand_init_chips(nfc, pdev);
>> +	if (ret)
>> +		if (nfc->bch)
>> +			jz4780_bch_release(nfc->bch);
>> +		return ret;
>
> coccinelle and smatch notice that you got the bracing wrong here,
> causing the rest of this function to be unreachable:
>
> drivers/mtd/nand/jz4780_nand.c:383:2-32: code aligned with following code on line 385 [coccinelle]
> drivers/mtd/nand/jz4780_nand.c:385 jz4780_nand_probe() warn: curly braces intended? [smatch]
> drivers/mtd/nand/jz4780_nand.c:387 jz4780_nand_probe() info: ignoring unreachable code. [smatch]
> drivers/mtd/nand/jz4780_nand.c:387 jz4780_nand_probe() warn: inconsistent indenting [smatch]
>
> You'd only notice that when you remove the device though.

I forgot to run coccinelle on this version of the patchset - I was still 
in Christmas holiday mode ;-)

>
>> +
>> +	platform_set_drvdata(pdev, nfc);
>> +	return 0;
>> +}
>> +
>> +static int jz4780_nand_remove(struct platform_device *pdev)
>> +{
>> +	struct jz4780_nand_controller *nfc = platform_get_drvdata(pdev);
>> +
>> +	if (nfc->bch)
>> +		jz4780_bch_release(nfc->bch);
>> +
>> +	jz4780_nand_cleanup_chips(nfc);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id jz4780_nand_dt_match[] = {
>> +	{ .compatible = "ingenic,jz4780-nand" },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, jz4780_nand_dt_match);
>> +
>> +static struct platform_driver jz4780_nand_driver = {
>> +	.probe		= jz4780_nand_probe,
>> +	.remove		= jz4780_nand_remove,
>> +	.driver	= {
>> +		.name	= DRV_NAME,
>> +		.of_match_table = of_match_ptr(jz4780_nand_dt_match),
>> +	},
>> +};
>> +module_platform_driver(jz4780_nand_driver);
>> +
>> +MODULE_AUTHOR("Alex Smith <alex@alex-smith.me.uk>");
>> +MODULE_AUTHOR("Harvey Hunt <harvey.hunt@imgtec.com>");
>> +MODULE_DESCRIPTION("Ingenic JZ4780 NAND driver");
>> +MODULE_LICENSE("GPL v2");
>
> I'd be OK taking this patch with the following appended diff squashed
> in. Thoughts?

It'd be great if you could do that.

Thanks,

Harvey

>
> Brian
>
> diff --git a/drivers/mtd/nand/jz4780_bch.c b/drivers/mtd/nand/jz4780_bch.c
> index 53b2c06af5dc..5954fbfa29e9 100644
> --- a/drivers/mtd/nand/jz4780_bch.c
> +++ b/drivers/mtd/nand/jz4780_bch.c
> @@ -314,6 +314,7 @@ struct jz4780_bch *of_jz4780_bch_get(struct device_node *of_node)
>   	}
>   	return bch;
>   }
> +EXPORT_SYMBOL(of_jz4780_bch_get);
>
>   /**
>    * jz4780_bch_release() - release the BCH controller device
> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
> index d8ea35ed1007..17eb9f264187 100644
> --- a/drivers/mtd/nand/jz4780_nand.c
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -271,8 +271,10 @@ static int jz4780_nand_init_chip(struct platform_device *pdev,
>   	chip = &nand->chip;
>   	mtd = nand_to_mtd(chip);
>   	mtd->priv = chip;
> -	mtd->owner = THIS_MODULE;
> -	mtd->name = DRV_NAME;
> +	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%s.%d", dev_name(dev),
> +				   cs->bank);
> +	if (!mtd->name)
> +		return -ENOMEM;
>   	mtd->dev.parent = dev;
>
>   	chip->IO_ADDR_R = cs->base + OFFSET_DATA;
> @@ -379,10 +381,11 @@ static int jz4780_nand_probe(struct platform_device *pdev)
>   	init_waitqueue_head(&nfc->controller.wq);
>
>   	ret = jz4780_nand_init_chips(nfc, pdev);
> -	if (ret)
> +	if (ret) {
>   		if (nfc->bch)
>   			jz4780_bch_release(nfc->bch);
>   		return ret;
> +	}
>
>   	platform_set_drvdata(pdev, nfc);
>   	return 0;
>
