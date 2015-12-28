Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDT8D-0002QF-23
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 08:26:20 +0000
Date: Mon, 28 Dec 2015 09:25:52 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>,
 <alex@alex-smith.me.uk>, Alex Smith <alex.smith@imgtec.com>, "Zubair
 Lutfullah Kakakhel" <Zubair.Kakakhel@imgtec.com>, David Woodhouse
 <dwmw2@infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 2/3] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
Message-ID: <20151228092552.66c88d9b@bbrezillon>
In-Reply-To: <1450959615-30246-3-git-send-email-harvey.hunt@imgtec.com>
References: <1450959615-30246-1-git-send-email-harvey.hunt@imgtec.com>
 <1450959615-30246-3-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Harvey,

I found a few remaining issues. Once fixed you can add my

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

On Thu, 24 Dec 2015 12:20:14 +0000
Harvey Hunt <harvey.hunt@imgtec.com> wrote:

> From: Alex Smith <alex.smith@imgtec.com>
> 
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
> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
> ---
> v9 -> v10:
>  - Replace uint{8,32}_t with u{8,32}.
>  - Only set IO_ADDR_{R,W} during chip init.
>  - Check that ECC layout fits into OOB area.
>  - Rebase onto l2-mtd/master and use its new functions.
>  - Remove mtd field from jz4780_nand_chip.
>  - Tidied up jz4780_nand_cmd_ctrl.
>  - Corrected ECC mode print statement.
>  - Refactor BCH code.
>  - Implement of_jz4780_bch_get.
>  - Update Authorship.
>  - Use a mutex to protect accesses to BCH controller.
>  - Update code documentation.
>  - Checkpatch cleanup.
> 
> v8 -> v9:
>  - No change.
> 
> v7 -> v8:
>  - Rebase to 4.4-rc3.
>  - Add _US suffixes to time constants.
>  - Add locking to BCH hardware accesses.
>  - Don't print ECC info if ECC is not being used.
>  - Default to No ECC.
>  - Let the NAND core handle ECC layout in certain cases.
>  - Use the gpio_desc consumer interface.
>  - Removed gpio active low flags.
>  - Check for the BCH controller before initialising a chip.
>  - Add a jz4780_nand_controller struct.
>  - Initialise chips by iterating over DT child nodes. 
> 
> v6 -> v7:
>  - Add nand-ecc-mode to DT bindings.
>  - Add nand-on-flash-bbt to DT bindings.
> 
> v5 -> v6:
>  - No change.
> 
> v4 -> v5:
>  - Rename ingenic,bch-device to ingenic,bch-controller to fit with
>    existing convention.
> 
> v3 -> v4:
>  - No change
> 
> v2 -> v3:
>  - Rebase to 4.0-rc6
>  - Changed ingenic,ecc-size to common nand-ecc-step-size
>  - Changed ingenic,ecc-strength to common nand-ecc-strength
>  - Changed ingenic,busy-gpio to common rb-gpios
>  - Changed ingenic,wp-gpio to common wp-gpios
> 
> v1 -> v2:
>  - Rebase to 4.0-rc3
> 
>  drivers/mtd/nand/Kconfig       |   7 +
>  drivers/mtd/nand/Makefile      |   1 +
>  drivers/mtd/nand/jz4780_bch.c  | 381 +++++++++++++++++++++++++++++++++++++
>  drivers/mtd/nand/jz4780_bch.h  |  44 +++++
>  drivers/mtd/nand/jz4780_nand.c | 416 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 849 insertions(+)
>  create mode 100644 drivers/mtd/nand/jz4780_bch.c
>  create mode 100644 drivers/mtd/nand/jz4780_bch.h
>  create mode 100644 drivers/mtd/nand/jz4780_nand.c
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 2896640..b742adc 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -519,6 +519,13 @@ config MTD_NAND_JZ4740
>  	help
>  		Enables support for NAND Flash on JZ4740 SoC based boards.
>  
> +config MTD_NAND_JZ4780
> +	tristate "Support for NAND on JZ4780 SoC"
> +	depends on MACH_JZ4780 && JZ4780_NEMC
> +	help
> +	  Enables support for NAND Flash connected to the NEMC on JZ4780 SoC
> +	  based boards, using the BCH controller for hardware error correction.
> +
>  config MTD_NAND_FSMC
>  	tristate "Support for NAND on ST Micros FSMC"
>  	depends on PLAT_SPEAR || ARCH_NOMADIK || ARCH_U8500 || MACH_U300
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 2c7f014..9e36233 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_MTD_NAND_MPC5121_NFC)	+= mpc5121_nfc.o
>  obj-$(CONFIG_MTD_NAND_VF610_NFC)	+= vf610_nfc.o
>  obj-$(CONFIG_MTD_NAND_RICOH)		+= r852.o
>  obj-$(CONFIG_MTD_NAND_JZ4740)		+= jz4740_nand.o
> +obj-$(CONFIG_MTD_NAND_JZ4780)		+= jz4780_nand.o jz4780_bch.o
>  obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
>  obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
>  obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
> diff --git a/drivers/mtd/nand/jz4780_bch.c b/drivers/mtd/nand/jz4780_bch.c
> new file mode 100644
> index 0000000..22d3729
> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_bch.c
> @@ -0,0 +1,381 @@
> +/*
> + * JZ4780 BCH controller
> + *
> + * Copyright (c) 2015 Imagination Technologies
> + * Author: Alex Smith <alex.smith@imgtec.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published
> + * by the Free Software Foundation.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +
> +#include "jz4780_bch.h"
> +
> +#define BCH_BHCR			0x0
> +#define BCH_BHCCR			0x8
> +#define BCH_BHCNT			0xc
> +#define BCH_BHDR			0x10
> +#define BCH_BHPAR0			0x14
> +#define BCH_BHERR0			0x84
> +#define BCH_BHINT			0x184
> +#define BCH_BHINTES			0x188
> +#define BCH_BHINTEC			0x18c
> +#define BCH_BHINTE			0x190
> +
> +#define BCH_BHCR_BSEL_SHIFT		4
> +#define BCH_BHCR_BSEL_MASK		(0x7f << BCH_BHCR_BSEL_SHIFT)
> +#define BCH_BHCR_ENCE			BIT(2)
> +#define BCH_BHCR_INIT			BIT(1)
> +#define BCH_BHCR_BCHE			BIT(0)
> +
> +#define BCH_BHCNT_PARITYSIZE_SHIFT	16
> +#define BCH_BHCNT_PARITYSIZE_MASK	(0x7f << BCH_BHCNT_PARITYSIZE_SHIFT)
> +#define BCH_BHCNT_BLOCKSIZE_SHIFT	0
> +#define BCH_BHCNT_BLOCKSIZE_MASK	(0x7ff << BCH_BHCNT_BLOCKSIZE_SHIFT)
> +
> +#define BCH_BHERR_MASK_SHIFT		16
> +#define BCH_BHERR_MASK_MASK		(0xffff << BCH_BHERR_MASK_SHIFT)
> +#define BCH_BHERR_INDEX_SHIFT		0
> +#define BCH_BHERR_INDEX_MASK		(0x7ff << BCH_BHERR_INDEX_SHIFT)
> +
> +#define BCH_BHINT_ERRC_SHIFT		24
> +#define BCH_BHINT_ERRC_MASK		(0x7f << BCH_BHINT_ERRC_SHIFT)
> +#define BCH_BHINT_TERRC_SHIFT		16
> +#define BCH_BHINT_TERRC_MASK		(0x7f << BCH_BHINT_TERRC_SHIFT)
> +#define BCH_BHINT_DECF			BIT(3)
> +#define BCH_BHINT_ENCF			BIT(2)
> +#define BCH_BHINT_UNCOR			BIT(1)
> +#define BCH_BHINT_ERR			BIT(0)
> +
> +#define BCH_CLK_RATE			(200 * 1000 * 1000)
> +
> +/* Timeout for BCH calculation/correction. */
> +#define BCH_TIMEOUT_US			100000
> +
> +struct jz4780_bch {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct clk *clk;
> +	struct mutex lock;
> +};
> +
> +static void jz4780_bch_init(struct jz4780_bch *bch,
> +			    struct jz4780_bch_params *params, bool encode)
> +{
> +	u32 reg;
> +
> +	/* Clear interrupt status. */
> +	writel(readl(bch->base + BCH_BHINT), bch->base + BCH_BHINT);
> +
> +	/* Set up BCH count register. */
> +	reg = params->size << BCH_BHCNT_BLOCKSIZE_SHIFT;
> +	reg |= params->bytes << BCH_BHCNT_PARITYSIZE_SHIFT;
> +	writel(reg, bch->base + BCH_BHCNT);
> +
> +	/* Initialise and enable BCH. */
> +	reg = BCH_BHCR_BCHE | BCH_BHCR_INIT;
> +	reg |= params->strength << BCH_BHCR_BSEL_SHIFT;
> +	if (encode)
> +		reg |= BCH_BHCR_ENCE;
> +	writel(reg, bch->base + BCH_BHCR);
> +}
> +
> +static void jz4780_bch_disable(struct jz4780_bch *bch)
> +{
> +	writel(readl(bch->base + BCH_BHINT), bch->base + BCH_BHINT);
> +	writel(BCH_BHCR_BCHE, bch->base + BCH_BHCCR);

Not sure what BCH_BHCR_BCHE means, but if BCHE stands for "BCH Enable",
do you really have to keep this bit set when disabling the engine?

> +}
> +

[...]

> +
> +/**
> + * jz4780_bch_calculate() - calculate ECC for a data buffer
> + * @bch: BCH device.
> + * @params: BCH parameters.
> + * @buf: input buffer with raw data.
> + * @ecc_code: output buffer with ECC.
> + *
> + * Return: 0 on success, -ETIMEDOUT if timed out while waiting for BCH
> + * controller.
> + */
> +int jz4780_bch_calculate(struct jz4780_bch *bch, struct jz4780_bch_params *params,
> +			 const u8 *buf, u8 *ecc_code)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&bch->lock);
> +	jz4780_bch_init(bch, params, true);
> +	jz4780_bch_write_data(bch, buf, params->size);
> +
> +	if (jz4780_bch_wait_complete(bch, BCH_BHINT_ENCF, NULL)) {
> +		jz4780_bch_read_parity(bch, ecc_code, params->bytes);
> +	} else {
> +		dev_err(bch->dev, "timed out while calculating ECC\n");
> +		ret = -ETIMEDOUT;
> +	}
> +
> +	mutex_unlock(&bch->lock);
> +	jz4780_bch_disable(bch);

Is there a good reason to put jz4780_bch_disable() out of the protected
section?

> +	return ret;
> +}
> +EXPORT_SYMBOL(jz4780_bch_calculate);
> +
> +/**
> + * jz4780_bch_correct() - detect and correct bit errors
> + * @bch: BCH device.
> + * @params: BCH parameters.
> + * @buf: raw data read from the chip.
> + * @ecc_code: ECC read from the chip.
> + *
> + * Given the raw data and the ECC read from the NAND device, detects and
> + * corrects errors in the data.
> + *
> + * Return: the number of bit errors corrected, or -1 if there are too many
> + * errors to correct or we timed out waiting for the controller.
> + */
> +int jz4780_bch_correct(struct jz4780_bch *bch, struct jz4780_bch_params *params,
> +		       u8 *buf, u8 *ecc_code)
> +{
> +	u32 reg, mask, index;
> +	int i, ret, count;
> +
> +	mutex_lock(&bch->lock);
> +
> +	jz4780_bch_init(bch, params, false);
> +	jz4780_bch_write_data(bch, buf, params->size);
> +	jz4780_bch_write_data(bch, ecc_code, params->bytes);
> +
> +	if (!jz4780_bch_wait_complete(bch, BCH_BHINT_DECF, &reg)) {
> +		dev_err(bch->dev, "timed out while correcting data\n");
> +		ret = -1;
> +		goto out;
> +	}
> +
> +	if (reg & BCH_BHINT_UNCOR) {
> +		dev_warn(bch->dev, "uncorrectable ECC error\n");
> +		ret = -1;
> +		goto out;
> +	}
> +
> +	/* Correct any detected errors. */
> +	if (reg & BCH_BHINT_ERR) {
> +		count = (reg & BCH_BHINT_ERRC_MASK) >> BCH_BHINT_ERRC_SHIFT;
> +		ret = (reg & BCH_BHINT_TERRC_MASK) >> BCH_BHINT_TERRC_SHIFT;
> +
> +		for (i = 0; i < count; i++) {
> +			reg = readl(bch->base + BCH_BHERR0 + (i * 4));
> +			mask = (reg & BCH_BHERR_MASK_MASK) >>
> +						BCH_BHERR_MASK_SHIFT;
> +			index = (reg & BCH_BHERR_INDEX_MASK) >>
> +						BCH_BHERR_INDEX_SHIFT;
> +			buf[(index * 2) + 0] ^= mask;
> +			buf[(index * 2) + 1] ^= mask >> 8;
> +		}
> +	} else {
> +		ret = 0;
> +	}
> +
> +out:
> +	mutex_unlock(&bch->lock);
> +	jz4780_bch_disable(bch);

Ditto.

> +	return ret;
> +}
> +EXPORT_SYMBOL(jz4780_bch_correct);
> +
> +/**
> + * jz4780_bch_get() - get the BCH controller device
> + * @np: BCH device tree node.
> + *
> + * Gets the BCH controller device from the specified device tree node. The
> + * device must be released with jz4780_bch_release() when it is no longer being
> + * used.
> + *
> + * Return: a pointer to jz4780_bch, errors are encoded into the pointer.
> + * PTR_ERR(-EPROBE_DEFER) if the device hasn't been initialised yet.
> + */
> +struct jz4780_bch *jz4780_bch_get(struct device_node *np)
> +{
> +	struct platform_device *pdev;
> +	struct jz4780_bch *bch;
> +
> +	pdev = of_find_device_by_node(np);
> +	if (!pdev || !platform_get_drvdata(pdev))
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	get_device(&pdev->dev);
> +
> +	bch = platform_get_drvdata(pdev);
> +	clk_prepare_enable(bch->clk);
> +
> +	bch->dev = &pdev->dev;
> +	return bch;
> +}
> +EXPORT_SYMBOL(jz4780_bch_get);

You can keep this function private until someone really needs it (IOW,
remove the EXPORT_SYMBOL line, the prototype definition in your header
and add a static qualifier).

[...]

> diff --git a/drivers/mtd/nand/jz4780_bch.h b/drivers/mtd/nand/jz4780_bch.h
> new file mode 100644
> index 0000000..6e9581f
> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_bch.h
> @@ -0,0 +1,44 @@
> +/*
> + * JZ4780 BCH controller
> + *
> + * Copyright (c) 2015 Imagination Technologies
> + * Author: Alex Smith <alex.smith@imgtec.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published
> + * by the Free Software Foundation.
> + */
> +
> +#ifndef __DRIVERS_MTD_NAND_JZ4780_BCH_H__
> +#define __DRIVERS_MTD_NAND_JZ4780_BCH_H__
> +
> +#include <linux/types.h>
> +
> +struct device;
> +struct device_node;
> +struct jz4780_bch;
> +
> +/**
> + * struct jz4780_bch_params - BCH parameters
> + * @size: data bytes per ECC step.
> + * @bytes: ECC bytes per step.
> + * @strength: number of correctable bits per ECC step.
> + */
> +struct jz4780_bch_params {
> +	int size;
> +	int bytes;
> +	int strength;
> +};
> +
> +extern int jz4780_bch_calculate(struct jz4780_bch *bch,
> +				struct jz4780_bch_params *params,
> +				const u8 *buf, u8 *ecc_code);
> +extern int jz4780_bch_correct(struct jz4780_bch *bch,
> +			      struct jz4780_bch_params *params, u8 *buf,
> +			      u8 *ecc_code);
> +
> +extern struct jz4780_bch *jz4780_bch_get(struct device_node *np);

As said above, you should drop this definition.

> +extern void jz4780_bch_release(struct jz4780_bch *bch);
> +extern struct jz4780_bch *of_jz4780_bch_get(struct device_node *np);

I'm nitpicking, but 'extern' is not needed for function prototype
definitions.

> +
> +#endif /* __DRIVERS_MTD_NAND_JZ4780_BCH_H__ */
> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
> new file mode 100644
> index 0000000..3708d50
> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -0,0 +1,416 @@
> +/*
> + * JZ4780 NAND driver
> + *
> + * Copyright (c) 2015 Imagination Technologies
> + * Author: Alex Smith <alex.smith@imgtec.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published
> + * by the Free Software Foundation.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/of_mtd.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +
> +#include <linux/jz4780-nemc.h>
> +
> +#include "jz4780_bch.h"
> +
> +#define DRV_NAME	"jz4780-nand"
> +
> +#define OFFSET_DATA	0x00000000
> +#define OFFSET_CMD	0x00400000
> +#define OFFSET_ADDR	0x00800000
> +
> +/* Command delay when there is no R/B pin. */
> +#define RB_DELAY_US	100
> +
> +struct jz4780_nand_cs {
> +	unsigned int bank;
> +	void __iomem *base;
> +};
> +
> +struct jz4780_nand_controller {
> +	struct device *dev;
> +	struct jz4780_bch *bch;
> +	struct nand_hw_control controller;
> +	unsigned int num_banks;
> +	struct list_head chips;
> +	int selected;
> +	struct jz4780_nand_cs cs[];
> +};
> +
> +struct jz4780_nand_chip {
> +	struct nand_chip chip;
> +	struct list_head chip_list;
> +
> +	struct nand_ecclayout ecclayout;
> +
> +	struct gpio_desc *busy_gpio;
> +	struct gpio_desc *wp_gpio;
> +	unsigned int reading: 1;
> +};
> +
> +static inline struct jz4780_nand_chip *to_jz4780_nand_chip(struct mtd_info *mtd)
> +{
> +	return container_of(mtd_to_nand(mtd), struct jz4780_nand_chip, chip);
> +}
> +
> +static inline struct jz4780_nand_controller *to_jz4780_nand_controller(struct nand_hw_control *ctrl)
> +{
> +	return container_of(ctrl, struct jz4780_nand_controller, controller);
> +}
> +
> +static void jz4780_nand_select_chip(struct mtd_info *mtd, int chipnr)
> +{
> +	struct jz4780_nand_chip *nand = to_jz4780_nand_chip(mtd);
> +	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(nand->chip.controller);
> +	struct jz4780_nand_cs *cs;
> +
> +	if (chipnr == -1) {
> +		/* Ensure the currently selected chip is deasserted. */
> +		if (nfc->selected >= 0) {
> +			cs = &nfc->cs[nfc->selected];
> +			jz4780_nemc_assert(nfc->dev, cs->bank, false);
> +		}
> +	} else {
> +		cs = &nfc->cs[chipnr];

This else statement seems useless to me.

> +	}
> +
> +	nfc->selected = chipnr;
> +}
> +

[...]

> +
> +static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *dev)
> +{
> +	struct nand_chip *chip = &nand->chip;
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(chip->controller);
> +	struct nand_ecclayout *layout = &nand->ecclayout;
> +	u32 start, i;
> +
> +	chip->ecc.bytes = fls((1 + 8) * chip->ecc.size)	*
> +				(chip->ecc.strength / 8);
> +
> +	if (nfc->bch && chip->ecc.mode == NAND_ECC_HW) {
> +		chip->ecc.hwctl = jz4780_nand_ecc_hwctl;
> +		chip->ecc.calculate = jz4780_nand_ecc_calculate;
> +		chip->ecc.correct = jz4780_nand_ecc_correct;
> +	} else if (!nfc->bch && chip->ecc.mode == NAND_ECC_HW) {
> +		dev_err(dev, "HW BCH selected, but BCH controller not found\n");
> +		return -ENODEV;
> +	}
> +
> +	if (chip->ecc.mode != NAND_ECC_NONE)
> +		dev_info(dev, "using %s (strength %d, size %d, bytes %d)\n",
> +			(nfc->bch) ? "hardware BCH" : "software hamming",

As said in my previous review, '!= NAND_ECC_HW' does not necessarily
imply '== NAND_ECC_SOFT' (i.e. hamming ECC), so I'd suggest printing
something like "software ECC".

> +			chip->ecc.strength, chip->ecc.size, chip->ecc.bytes);
> +	else
> +		dev_info(dev, "not using ECC\n");

You should probably complain about the invalid NAND_ECC_HW_SYNDROME
value and return -EINVAL in this case.

> +
> +	/* The NAND core will generate the ECC layout. */
> +	if (chip->ecc.mode == NAND_ECC_SOFT || chip->ecc.mode == NAND_ECC_SOFT_BCH)
> +		return 0;
> +
> +	/* Generate ECC layout. ECC codes are right aligned in the OOB area. */
> +	layout->eccbytes = mtd->writesize / chip->ecc.size * chip->ecc.bytes;
> +
> +	if (layout->eccbytes > mtd->oobsize - 2) {
> +		dev_err(dev,
> +			"invalid ECC config: required %d ECC bytes, but only %d are available",
> +			layout->eccbytes, mtd->oobsize - 2);
> +		return -EINVAL;
> +	}
> +
> +	start = mtd->oobsize - layout->eccbytes;
> +	for (i = 0; i < layout->eccbytes; i++)
> +		layout->eccpos[i] = start + i;
> +
> +	layout->oobfree[0].offset = 2;
> +	layout->oobfree[0].length = mtd->oobsize - layout->eccbytes - 2;
> +
> +	chip->ecc.layout = layout;
> +	return 0;
> +}
> +
> +static int jz4780_nand_init_chip(struct platform_device *pdev,
> +				struct jz4780_nand_controller *nfc,
> +				struct device_node *np,
> +				unsigned int chipnr)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct jz4780_nand_chip *nand;
> +	struct jz4780_nand_cs *cs;
> +	struct resource *res;
> +	struct nand_chip *chip;
> +	struct mtd_info *mtd;
> +	const __be32 *reg;
> +	int ret = 0;
> +
> +	cs = &nfc->cs[chipnr];
> +
> +	reg = of_get_property(np, "reg", NULL);
> +	if (!reg)
> +		return -EINVAL;
> +
> +	cs->bank = be32_to_cpu(*reg);
> +
> +	jz4780_nemc_set_type(nfc->dev, cs->bank, JZ4780_NEMC_BANK_NAND);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, chipnr);
> +	cs->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(cs->base))
> +		return PTR_ERR(cs->base);
> +
> +	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
> +	if (!nand)
> +		return -ENOMEM;
> +
> +	nand->busy_gpio = devm_gpiod_get_optional(dev, "rb", GPIOD_IN);
> +
> +	if (IS_ERR(nand->busy_gpio)) {
> +		ret = PTR_ERR(nand->busy_gpio);
> +		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
> +		return ret;
> +	} else if (nand->busy_gpio) {
> +		nand->chip.dev_ready = jz4780_nand_dev_ready;
> +	}
> +
> +	nand->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
> +
> +	if (IS_ERR(nand->wp_gpio)) {
> +		ret = PTR_ERR(nand->wp_gpio);
> +		dev_err(dev, "failed to request WP GPIO: %d\n", ret);
> +		return ret;
> +	}
> +
> +	chip = &nand->chip;
> +	mtd = nand_to_mtd(chip);
> +	mtd->priv = chip;
> +	mtd->owner = THIS_MODULE;
> +	mtd->name = DRV_NAME;
> +	mtd->dev.parent = dev;
> +
> +	chip->IO_ADDR_R = cs->base + OFFSET_DATA;
> +	chip->IO_ADDR_W = cs->base + OFFSET_DATA;
> +	chip->chip_delay = RB_DELAY_US;
> +	chip->options = NAND_NO_SUBPAGE_WRITE;
> +	chip->select_chip = jz4780_nand_select_chip;
> +	chip->cmd_ctrl = jz4780_nand_cmd_ctrl;
> +	chip->ecc.mode = NAND_ECC_HW;
> +	chip->controller = &nfc->controller;
> +	nand_set_flash_node(chip, np);
> +
> +	ret = nand_scan_ident(mtd, 1, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = jz4780_nand_init_ecc(nand, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = nand_scan_tail(mtd);
> +	if (ret)
> +		goto err_release_bch;
> +
> +	ret = mtd_device_register(mtd, NULL, 0);
> +	if (ret)
> +		goto err_release_nand;
> +

You probably miss a list_add_tail() call here (otherwise chips are
registered but not unregistered when ->remove() is called):

	list_add_tail(&nand->chip_list, &nfc->chips);

> +	return 0;
> +
> +err_release_nand:
> +	nand_release(mtd);
> +
> +err_release_bch:
> +	if (nfc->bch)
> +		jz4780_bch_release(nfc->bch);

Why are you releasing the BCH engine here, isn't it the role of the
NAND controller to do that? BTW, it's already done in
jz4780_nand_remove().

> +
> +	return ret;
> +}
> +
> +static int jz4780_nand_init_chips(struct jz4780_nand_controller *nfc,
> +				  struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np;
> +	int i = 0;
> +	int ret;
> +	int num_chips = of_get_child_count(dev->of_node);
> +
> +	if (num_chips > nfc->num_banks) {
> +		dev_err(dev, "found %d chips but only %d banks\n", num_chips, nfc->num_banks);
> +		return -EINVAL;
> +	}
> +
> +	for_each_child_of_node(dev->of_node, np) {
> +		ret = jz4780_nand_init_chip(pdev, nfc, np, i);
> +		if (ret)
> +			return ret;

You should unregister all the chips already registered in case of
failure. The same logic is already implemented in jz4780_nand_remove(),
so I suggest implementing a jz4780_nand_cleanup_chips() function:

static void jz4780_nand_cleanup_chips(struct jz4780_nand_controller
*nfc)
{
	struct jz4780_nand_chip *chip;

	while (!list_empty(&nfc->chips)) {
		chip = list_first_entry(&nfc->chips, struct
	jz4780_nand_chip, chip_list);
		nand_release(nand_to_mtd(&chip->chip));
		list_del(&chip->chip_list);
	}
}

> +
> +		i++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int jz4780_nand_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	unsigned int num_banks;
> +	struct jz4780_nand_controller *nfc;
> +	int ret;
> +
> +	num_banks = jz4780_nemc_num_banks(dev);
> +	if (num_banks == 0) {
> +		dev_err(dev, "no banks found\n");
> +		return -ENODEV;
> +	}
> +
> +	nfc = devm_kzalloc(dev, sizeof(*nfc) + (sizeof(nfc->cs[0]) * num_banks), GFP_KERNEL);
> +	if (!nfc)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Check for BCH HW before we call nand_scan_ident, to prevent us from
> +	 * having to call it again if the BCH driver returns -EPROBE_DEFER.
> +	 */
> +	nfc->bch = of_jz4780_bch_get(dev->of_node);
> +	if (IS_ERR(nfc->bch))
> +		return PTR_ERR(nfc->bch);
> +
> +	nfc->dev = dev;
> +	nfc->num_banks = num_banks;
> +
> +	spin_lock_init(&nfc->controller.lock);
> +	INIT_LIST_HEAD(&nfc->chips);
> +	init_waitqueue_head(&nfc->controller.wq);
> +
> +	ret = jz4780_nand_init_chips(nfc, pdev);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, nfc);
> +	return 0;
> +}
> +
> +static int jz4780_nand_remove(struct platform_device *pdev)
> +{
> +	struct jz4780_nand_chip *chip;
> +	struct jz4780_nand_controller *nfc = platform_get_drvdata(pdev);
> +
> +	while (!list_empty(&nfc->chips)) {
> +		chip = list_first_entry(&nfc->chips, struct jz4780_nand_chip, chip_list);
> +		nand_release(nand_to_mtd(&chip->chip));
> +		list_del(&chip->chip_list);
> +	}

Call jz4780_nand_cleanup_chips() here.

> +
> +	if (nfc->bch)
> +		jz4780_bch_release(nfc->bch);
> +
> +	return 0;
> +}
> +

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
