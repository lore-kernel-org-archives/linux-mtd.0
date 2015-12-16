Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a99pb-00059s-BC
 for linux-mtd@lists.infradead.org; Wed, 16 Dec 2015 11:01:16 +0000
Subject: Re: [PATCH v9 2/3] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1449144142-24004-1-git-send-email-harvey.hunt@imgtec.com>
 <1449144142-24004-3-git-send-email-harvey.hunt@imgtec.com>
 <20151214172518.3d472346@bbrezillon>
CC: <linux-mtd@lists.infradead.org>, Zubair Lutfullah Kakakhel
 <Zubair.Kakakhel@imgtec.com>, <linux-kernel@vger.kernel.org>, Alex Smith
 <alex.smith@imgtec.com>, Brian Norris <computersforpeace@gmail.com>, "David
 Woodhouse" <dwmw2@infradead.org>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <56714460.8070604@imgtec.com>
Date: Wed, 16 Dec 2015 11:00:48 +0000
MIME-Version: 1.0
In-Reply-To: <20151214172518.3d472346@bbrezillon>
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

Hi Boris,

That's fine - I hope to get a new version ready soon.

Thanks,

Harvey

On 14/12/15 16:25, Boris Brezillon wrote:
> Hi Harvey,
>
> I'm currently reworking the NAND subsystem to simplify NAND controller
> drivers (see this series [1]), and some of my patches have made it into
> Brian's tree.
> Would you mind adapting your driver as described below so that I don't
> have to do it when it gets applied into l2-mtd/master?
>
> On Thu, 3 Dec 2015 12:02:21 +0000
> Harvey Hunt <harvey.hunt@imgtec.com> wrote:
>
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
>> ---
>> v8 -> v9:
>>   - No change.
>>
>> v7 -> v8:
>>   - Rebase to 4.4-rc3.
>>   - Add _US suffixes to time constants.
>>   - Add locking to BCH hardware accesses.
>>   - Don't print ECC info if ECC is not being used.
>>   - Default to No ECC.
>>   - Let the NAND core handle ECC layout in certain cases.
>>   - Use the gpio_desc consumer interface.
>>   - Removed gpio active low flags.
>>   - Check for the BCH controller before initialising a chip.
>>   - Add a jz4780_nand_controller struct.
>>   - Initialise chips by iterating over DT child nodes.
>>
>> v6 -> v7:
>>   - Add nand-ecc-mode to DT bindings.
>>   - Add nand-on-flash-bbt to DT bindings.
>>
>> v5 -> v6:
>>   - No change.
>>
>> v4 -> v5:
>>   - Rename ingenic,bch-device to ingenic,bch-controller to fit with
>>     existing convention.
>>
>> v3 -> v4:
>>   - No change
>>
>> v2 -> v3:
>>   - Rebase to 4.0-rc6
>>   - Changed ingenic,ecc-size to common nand-ecc-step-size
>>   - Changed ingenic,ecc-strength to common nand-ecc-strength
>>   - Changed ingenic,busy-gpio to common rb-gpios
>>   - Changed ingenic,wp-gpio to common wp-gpios
>>
>> v1 -> v2:
>>   - Rebase to 4.0-rc3
>>
>>   drivers/mtd/nand/Kconfig       |   7 +
>>   drivers/mtd/nand/Makefile      |   1 +
>>   drivers/mtd/nand/jz4780_bch.c  | 361 +++++++++++++++++++++++++++++++++++
>>   drivers/mtd/nand/jz4780_bch.h  |  42 +++++
>>   drivers/mtd/nand/jz4780_nand.c | 420 +++++++++++++++++++++++++++++++++++++++++
>>   5 files changed, 831 insertions(+)
>>   create mode 100644 drivers/mtd/nand/jz4780_bch.c
>>   create mode 100644 drivers/mtd/nand/jz4780_bch.h
>>   create mode 100644 drivers/mtd/nand/jz4780_nand.c
>>
>
> [...]
>
>> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
>> new file mode 100644
>> index 0000000..b4d0acb
>> --- /dev/null
>> +++ b/drivers/mtd/nand/jz4780_nand.c
>> @@ -0,0 +1,420 @@
>> +/*
>> + * JZ4780 NAND driver
>> + *
>> + * Copyright (c) 2015 Imagination Technologies
>> + * Author: Alex Smith <alex.smith@imgtec.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms of the GNU General Public License version 2 as published
>> + * by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/init.h>
>> +#include <linux/io.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/of_mtd.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mtd/nand.h>
>> +#include <linux/mtd/partitions.h>
>> +
>> +#include <linux/jz4780-nemc.h>
>> +
>> +#include "jz4780_bch.h"
>> +
>> +#define DRV_NAME	"jz4780-nand"
>> +
>> +#define OFFSET_DATA	0x00000000
>> +#define OFFSET_CMD	0x00400000
>> +#define OFFSET_ADDR	0x00800000
>> +
>> +/* Command delay when there is no R/B pin. */
>> +#define RB_DELAY_US	100
>> +
>> +struct jz4780_nand_cs {
>> +	unsigned int bank;
>> +	void __iomem *base;
>> +};
>> +
>> +struct jz4780_nand_controller {
>> +	struct device *dev;
>> +	struct device *bch;
>> +	struct nand_hw_control controller;
>> +	unsigned int num_banks;
>> +	struct list_head chips;
>> +	int selected;
>> +	struct jz4780_nand_cs cs[];
>> +};
>> +
>> +struct jz4780_nand_chip {
>> +	struct mtd_info mtd;
>
> You can drop the mtd field, since nand_chip now embeds its own mtd
> instance. This implies doing the following changes...
>
>> +	struct nand_chip chip;
>> +	struct list_head chip_list;
>> +
>> +	struct nand_ecclayout ecclayout;
>> +
>> +	struct gpio_desc *busy_gpio;
>> +	struct gpio_desc *wp_gpio;
>> +	unsigned int reading: 1;
>> +};
>> +
>> +static inline struct jz4780_nand_chip *to_jz4780_nand_chip(struct mtd_info *mtd)
>> +{
>> +	return container_of(mtd, struct jz4780_nand_chip, mtd);
>
> 	return container_of(mtd_to_nand(mtd), struct jz4780_nand_chip,
> 			    chip);
>
>> +}
>> +
>
> [...]
>
>> +static int jz4780_nand_ecc_correct(struct mtd_info *mtd, uint8_t *dat,
>> +				   uint8_t *read_ecc, uint8_t *calc_ecc)
>> +{
>> +	struct jz4780_nand_chip *nand = to_jz4780_nand_chip(mtd);
>> +	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(nand->chip.controller);
>> +	struct jz4780_bch_params params;
>> +
>> +	params.size = nand->chip.ecc.size;
>> +	params.bytes = nand->chip.ecc.bytes;
>> +	params.strength = nand->chip.ecc.strength;
>> +
>> +	return jz4780_bch_correct(nfc->bch, &params, dat, read_ecc);
>> +}
>> +
>> +static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *dev)
>> +{
>> +	struct mtd_info *mtd = &nand->mtd;
>> +	struct nand_chip *chip = &nand->chip;
>> +	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(nand->chip.controller);
>
> You can reuse the local chip variable here:
> 	
> 	struct jz4780_nand_controller *nfc =
> 				to_jz4780_nand_controller(chip->controller);
>
>> +	struct nand_ecclayout *layout = &nand->ecclayout;
>> +	uint32_t start, i;
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
>> +	if (chip->ecc.mode != NAND_ECC_NONE)
>> +		dev_info(dev, "using %s BCH (strength %d, size %d, bytes %d)\n",
>> +			(nfc->bch) ? "hardware" : "software", chip->ecc.strength,
>> +			chip->ecc.size, chip->ecc.bytes);
>> +	else
>> +		dev_info(dev, "not using ECC\n");
>> +
>> +	/* The NAND core will generate the ECC layout. */
>> +	if (chip->ecc.mode == NAND_ECC_SOFT || chip->ecc.mode == NAND_ECC_SOFT_BCH)
>> +		return 0;
>> +
>> +	/* Generate ECC layout. ECC codes are right aligned in the OOB area. */
>> +	layout->eccbytes = mtd->writesize / chip->ecc.size * chip->ecc.bytes;
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
>> +	struct mtd_part_parser_data ppdata;
>> +	int ret = 0;
>> +
>> +	cs = &nfc->cs[chipnr];
>> +
>> +	reg = of_get_property(np, "reg", NULL);
>> +	if (reg == NULL)
>> +		return -EINVAL;
>> +
>> +	cs->bank = be32_to_cpu(*reg);
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
>> +	mtd = &nand->mtd;
>> +	chip = &nand->chip;
>
> Please replace the two lines above lines by:
>
> 	chip = &nand->chip;
> 	mtd = nand_to_mtd(chip);
>
>> +	mtd->priv = chip;
>> +	mtd->owner = THIS_MODULE;
>> +	mtd->name = DRV_NAME;
>> +	mtd->dev.parent = dev;
>> +
>> +	chip->flash_node = np;
>> +	chip->chip_delay = RB_DELAY_US;
>> +	chip->options = NAND_NO_SUBPAGE_WRITE;
>> +	chip->select_chip = jz4780_nand_select_chip;
>> +	chip->cmd_ctrl = jz4780_nand_cmd_ctrl;
>> +	chip->ecc.mode = NAND_ECC_HW;
>> +	chip->controller = &nfc->controller;
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
>> +		goto err_release_bch;
>> +
>> +	ppdata.of_node = np;
>> +	ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
>> +	if (ret)
>> +		goto err_release_nand;
>> +
>> +	return 0;
>> +
>> +err_release_nand:
>> +	nand_release(mtd);
>> +
>> +err_release_bch:
>> +	if (nfc->bch)
>> +		jz4780_bch_release(nfc->bch);
>> +
>> +	return ret;
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
>> +		if (ret)
>> +			return ret;
>> +
>> +		i++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +static int jz4780_nand_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	unsigned int num_banks;
>> +	struct jz4780_nand_controller *nfc;
>> +	struct device_node *bch_np;
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
>> +	bch_np = of_parse_phandle(dev->of_node,
>> +				"ingenic,bch-controller", 0);
>> +	if (bch_np) {
>> +		ret = jz4780_bch_get(bch_np, &nfc->bch);
>> +		of_node_put(bch_np);
>> +		if (ret)
>> +			return ret;
>> +	}
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
>> +		return ret;
>> +
>> +	platform_set_drvdata(pdev, nfc);
>> +	return 0;
>> +}
>> +
>> +static int jz4780_nand_remove(struct platform_device *pdev)
>> +{
>> +	struct jz4780_nand_chip *chip;
>> +	struct jz4780_nand_controller *nfc = platform_get_drvdata(pdev);
>> +
>> +	while (!list_empty(&nfc->chips)) {
>> +		chip = list_first_entry(&nfc->chips, struct jz4780_nand_chip, chip_list);
>> +		nand_release(&chip->mtd);
>
> 		nand_release(nand_to_mtd(&chip->chip));
>
>> +		list_del(&chip->chip_list);
>> +	}
>> +
>> +	if (nfc->bch)
>> +		jz4780_bch_release(nfc->bch);
>> +
>> +	return 0;
>> +}
>
> Thanks,
>
> Boris
>
> [1]https://lkml.org/lkml/2015/12/10/154
>
