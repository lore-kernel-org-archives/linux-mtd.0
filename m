Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ztv9Z-0003E4-9Z
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 10:18:56 +0000
Date: Wed, 4 Nov 2015 11:18:18 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: <linux-mtd@lists.infradead.org>, Zubair Lutfullah Kakakhel
 <Zubair.Kakakhel@imgtec.com>, linux-kernel@vger.kernel.org, Alex Smith
 <alex.smith@imgtec.com>, Alex Smith <alex@alex-smith.me.uk>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v7, 2/3] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
Message-ID: <20151104111818.4e292921@bbrezillon>
In-Reply-To: <1444148837-10770-3-git-send-email-harvey.hunt@imgtec.com>
References: <1444148837-10770-1-git-send-email-harvey.hunt@imgtec.com>
 <1444148837-10770-3-git-send-email-harvey.hunt@imgtec.com>
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

Sorry for the late review :-/.

On Tue, 6 Oct 2015 17:27:16 +0100
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
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Alex Smith <alex@alex-smith.me.uk>
> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
> ---
> v6 -> v7:
>  - Include linux/bitops.h.
>  - Default ECC mode to hw.
>  - Only check BCH if we're using hw ECC mode.
>  - Return -ENODEV if we're using hw ECC mode and can't find BCH.
>  - Return -ENODEV if we can't find any banks.
>  - Use set nand_chip->dn so we can use nand_dt_init() to read DT.
> 
> v5 -> v6:
>  - Remove another printk made useless by changes in v5 (due to
>    devm_ioremap_resource() printing errors itself).
> 
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
> 
>  drivers/mtd/nand/Kconfig       |   7 +
>  drivers/mtd/nand/Makefile      |   1 +
>  drivers/mtd/nand/jz4780_bch.c  | 349 +++++++++++++++++++++++++++++++++++++
>  drivers/mtd/nand/jz4780_bch.h  |  42 +++++
>  drivers/mtd/nand/jz4780_nand.c | 384 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 783 insertions(+)
>  create mode 100644 drivers/mtd/nand/jz4780_bch.c
>  create mode 100644 drivers/mtd/nand/jz4780_bch.h
>  create mode 100644 drivers/mtd/nand/jz4780_nand.c
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 3324281..8ffd5cd 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -508,6 +508,13 @@ config MTD_NAND_JZ4740
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
> index 075a027..604b166 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -48,6 +48,7 @@ obj-$(CONFIG_MTD_NAND_NUC900)		+= nuc900_nand.o
>  obj-$(CONFIG_MTD_NAND_MPC5121_NFC)	+= mpc5121_nfc.o
>  obj-$(CONFIG_MTD_NAND_RICOH)		+= r852.o
>  obj-$(CONFIG_MTD_NAND_JZ4740)		+= jz4740_nand.o
> +obj-$(CONFIG_MTD_NAND_JZ4780)		+= jz4780_nand.o jz4780_bch.o
>  obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
>  obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
>  obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
> diff --git a/drivers/mtd/nand/jz4780_bch.c b/drivers/mtd/nand/jz4780_bch.c
> new file mode 100644
> index 0000000..047d351
> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_bch.c
> @@ -0,0 +1,349 @@
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

You can use GENMASK for these things.

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
> +/* Timeout for BCH calculation/correction in microseconds. */
> +#define BCH_TIMEOUT			100000

Suffixing the macro name with _MS would make it clearer.

> +
> +struct jz4780_bch {
> +	void __iomem *base;
> +	struct clk *clk;
> +};

You seem to rely on the sequencing mechanism provided by the NAND
controller struct to sequence accesses to the BCH controller.
That's fine as long as the jz4780 NAND controller is the only user of
this BCH engine, which is no longer true as soon as you define two nand
chips in your system (each of these chip is exposing its own
nand_controller, and you end up with a concurrency problem).

You have two different solutions to address that:
1/ provide a sequencing mechanism at the BCH engine level
2/ rework the NAND controller driver architecture to expose a single
NAND controller (the NAND controller can attach to several CS of the
nemc bus), and then define NAND chips as children nodes of the NAND
controller node.

Solution #1 is more future-proof, and allows you to use the BCH engine
for other purpose than just NAND controller.
Solution #2 has the benefit of making the NAND controller / NAND chip
separation clearer, which is a good thing too.

So I would recommend doing both :-).

[...]
> diff --git a/drivers/mtd/nand/jz4780_bch.h b/drivers/mtd/nand/jz4780_bch.h
> new file mode 100644
> index 0000000..a5dfde5
> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_bch.h
> @@ -0,0 +1,42 @@
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
> +extern int jz4780_bch_calculate(struct device *dev,
> +				struct jz4780_bch_params *params,
> +				const uint8_t *buf, uint8_t *ecc_code);
> +extern int jz4780_bch_correct(struct device *dev,
> +			      struct jz4780_bch_params *params, uint8_t *buf,
> +			      uint8_t *ecc_code);
> +
> +extern int jz4780_bch_get(struct device_node *np, struct device **dev);
> +extern void jz4780_bch_release(struct device *dev);
> +
> +#endif /* __DRIVERS_MTD_NAND_JZ4780_BCH_H__ */
> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
> new file mode 100644
> index 0000000..4100ddc9
> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -0,0 +1,384 @@
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
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_mtd.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
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
> +/* Command delay when there is no R/B pin (in microseconds). */
> +#define RB_DELAY	100

_US suffix?

> +
> +struct jz4780_nand_chip {
> +	unsigned int bank;
> +	void __iomem *base;
> +};
> +
> +struct jz4780_nand {
> +	struct mtd_info mtd;
> +	struct nand_chip chip;
> +
> +	struct device *dev;
> +	struct device *bch;
> +
> +	struct nand_ecclayout ecclayout;
> +
> +	int busy_gpio;
> +	int wp_gpio;

Any reason why you're not using gpio_desc here instead of integer ids?

> +	unsigned int busy_gpio_active_low: 1;
> +	unsigned int wp_gpio_active_low: 1;
> +	unsigned int reading: 1;
> +
> +	unsigned int num_banks;
> +	int selected;
> +	struct jz4780_nand_chip chips[];
> +};

As explained earlier, I would prefer to see a clean separation between
the nand_chip and the nand_controller definition. Something like:

struct jz4780_nand_cs {
	unsigned int bank;
	void __iomem *base;
};

struct jz4780_nand_controller {
	struct nand_hw_control controller;
	struct device *dev;
	struct device *bch;
	unsigned int num_banks;
	struct jz4780_nand_cs cs[];
}

static inline to_jz4780_nand_controller(struct nand_hw_control *ctrl)
{
	return container_of(ctrl, struct jz4780_nand_controller,
			    controller);
}

struct jz4780_nand {
	struct mtd_info mtd;
	struct nand_chip chip;

	struct nand_ecclayout ecclayout;

	/*
	 * Number of CS lines attached to this chip. Each CS line
	 * controls a specific die in the chip.
	*/
	unsigned int num_cs;
	/* Should point the definitions in struct nand_controller */
	struct jz4780_nand_chip **cs;

	/* RB pins definition, there can be one RB pin per die. */
	int *busy_gpios;

	/* RB pins definition, there can be one RB pin per die. */
	int *wp_gpios;

	unsigned int busy_gpio_active_low: 1;
	unsigned int wp_gpio_active_low: 1;
	unsigned int reading: 1;
};

Note that the jz4780_nand_controller pointer can be retrieved from the
nand_chip struct by doing the following:

	to_jz4780_nand_controller(chip->controller);

> +
> +static inline struct jz4780_nand *to_jz4780_nand(struct mtd_info *mtd)
> +{
> +	return container_of(mtd, struct jz4780_nand, mtd);
> +}
> +
> +static void jz4780_nand_select_chip(struct mtd_info *mtd, int chipnr)
> +{
> +	struct jz4780_nand *nand = to_jz4780_nand(mtd);
> +	struct jz4780_nand_chip *chip;
> +
> +	if (chipnr == -1) {
> +		/* Ensure the currently selected chip is deasserted. */
> +		if (nand->selected >= 0) {
> +			chip = &nand->chips[nand->selected];
> +			jz4780_nemc_assert(nand->dev, chip->bank, false);
> +		}
> +	} else {
> +		chip = &nand->chips[chipnr];
> +		nand->chip.IO_ADDR_R = chip->base + OFFSET_DATA;
> +		nand->chip.IO_ADDR_W = chip->base + OFFSET_DATA;

How about providing helper functions that would use the nand->selected
+ chips information to access the correct set of registers instead of
adapting IO_ADDR_R/IO_ADDR_W values?

> +	}
> +
> +	nand->selected = chipnr;
> +}
> +
> +static void jz4780_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
> +				 unsigned int ctrl)
> +{
> +	struct jz4780_nand *nand = to_jz4780_nand(mtd);
> +	struct jz4780_nand_chip *chip;
> +
> +	if (WARN_ON(nand->selected < 0))
> +		return;
> +
> +	chip = &nand->chips[nand->selected];
> +
> +	if (ctrl & NAND_CTRL_CHANGE) {
> +		if (ctrl & NAND_ALE)
> +			nand->chip.IO_ADDR_W = chip->base + OFFSET_ADDR;
> +		else if (ctrl & NAND_CLE)
> +			nand->chip.IO_ADDR_W = chip->base + OFFSET_CMD;
> +		else
> +			nand->chip.IO_ADDR_W = chip->base + OFFSET_DATA;

Ditto.

> +
> +		jz4780_nemc_assert(nand->dev, chip->bank, ctrl & NAND_NCE);
> +	}
> +
> +	if (cmd != NAND_CMD_NONE)
> +		writeb(cmd, nand->chip.IO_ADDR_W);
> +}
> +
> +static int jz4780_nand_dev_ready(struct mtd_info *mtd)
> +{
> +	struct jz4780_nand *nand = to_jz4780_nand(mtd);
> +
> +	return !(gpio_get_value(nand->busy_gpio) ^ nand->busy_gpio_active_low);
> +}
> +
> +static void jz4780_nand_ecc_hwctl(struct mtd_info *mtd, int mode)
> +{
> +	struct jz4780_nand *nand = to_jz4780_nand(mtd);
> +
> +	nand->reading = (mode == NAND_ECC_READ);
> +}
> +
> +static int jz4780_nand_ecc_calculate(struct mtd_info *mtd, const uint8_t *dat,
> +				     uint8_t *ecc_code)
> +{
> +	struct jz4780_nand *nand = to_jz4780_nand(mtd);
> +	struct jz4780_bch_params params;
> +
> +	/*
> +	 * Don't need to generate the ECC when reading, BCH does it for us as
> +	 * part of decoding/correction.
> +	 */
> +	if (nand->reading)
> +		return 0;
> +
> +	params.size = nand->chip.ecc.size;
> +	params.bytes = nand->chip.ecc.bytes;
> +	params.strength = nand->chip.ecc.strength;
> +
> +	return jz4780_bch_calculate(nand->bch, &params, dat, ecc_code);
> +}
> +
> +static int jz4780_nand_ecc_correct(struct mtd_info *mtd, uint8_t *dat,
> +				   uint8_t *read_ecc, uint8_t *calc_ecc)
> +{
> +	struct jz4780_nand *nand = to_jz4780_nand(mtd);
> +	struct jz4780_bch_params params;
> +
> +	params.size = nand->chip.ecc.size;
> +	params.bytes = nand->chip.ecc.bytes;
> +	params.strength = nand->chip.ecc.strength;
> +
> +	return jz4780_bch_correct(nand->bch, &params, dat, read_ecc);
> +}
> +
> +static int jz4780_nand_init_ecc(struct jz4780_nand *nand, struct device *dev)
> +{
> +	struct mtd_info *mtd = &nand->mtd;
> +	struct nand_chip *chip = &nand->chip;
> +	struct nand_ecclayout *layout = &nand->ecclayout;
> +	struct device_node *bch_np;
> +	int ret = 0;
> +	uint32_t start, i;
> +
> +	if (!chip->ecc.size)
> +		chip->ecc.size = 1024;
> +
> +	if (!chip->ecc.strength)
> +		chip->ecc.strength = 24;

Is there a strong reason to define a random default ECC config. I mean,
if this is not provided then there is a problem somewhere, or the NAND
does not require ECC, in which case mode should be set to NAND_ECC_NONE.

At least, if you want to automatically choose an ECC config when it's
not provided, choose it according to the NAND layout (it has to fit into
the OOB area).

> +
> +	chip->ecc.bytes = fls(1 + 8 * chip->ecc.size) * chip->ecc.strength / 8;
> +
> +	dev_info(dev, "using %s BCH (strength %d, size %d, bytes %d)\n",
> +		 (nand->bch) ? "hardware" : "software", chip->ecc.strength,
> +		 chip->ecc.size, chip->ecc.bytes);
> +
> +	if (chip->ecc.mode == NAND_ECC_HW) {
> +		bch_np = of_parse_phandle(dev->of_node,
> +					"ingenic,bch-controller", 0);
> +		if (bch_np) {
> +			ret = jz4780_bch_get(bch_np, &nand->bch);
> +			of_node_put(bch_np);
> +			if (ret)
> +				return ret;
> +		} else {
> +			dev_err(dev, "no bch controller in DT\n");
> +			return -ENODEV;
> +		}
> +
> +		chip->ecc.hwctl = jz4780_nand_ecc_hwctl;
> +		chip->ecc.calculate = jz4780_nand_ecc_calculate;
> +		chip->ecc.correct = jz4780_nand_ecc_correct;

You should probably check that
(ecc->bytes * (mtd->writesize / ecc->size)) <= mtd->oobsize - 2
and fail if it's not the case.

> +	}
> +
> +	/* Generate ECC layout. ECC codes are right aligned in the OOB area. */
> +	layout->eccbytes = mtd->writesize / chip->ecc.size * chip->ecc.bytes;
> +	start = mtd->oobsize - layout->eccbytes;
> +	for (i = 0; i < layout->eccbytes; i++)
> +		layout->eccpos[i] = start + i;
> +
> +	layout->oobfree[0].offset = 2;
> +	layout->oobfree[0].length = mtd->oobsize - layout->eccbytes - 2;

Not sure you want to fill that if mode == NAND_ECC_SOFT of
NAND_ECC_SOFT_BCH, because those fields are automatically create/filled
for you.

> +
> +	chip->ecc.layout = layout;
> +
> +	return 0;
> +}
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
> +		if (IS_ERR(chip->base))
> +			return PTR_ERR(chip->base);
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
> +	struct jz4780_nand *nand;
> +	struct mtd_info *mtd;
> +	struct nand_chip *chip;
> +	enum of_gpio_flags flags;
> +	struct mtd_part_parser_data ppdata;
> +	int ret;
> +
> +	num_banks = jz4780_nemc_num_banks(dev);
> +	if (num_banks == 0) {
> +		dev_err(dev, "no banks found\n");
> +		return -ENODEV;
> +	}
> +
> +	nand = devm_kzalloc(dev,
> +			sizeof(*nand) + (sizeof(nand->chips[0]) * num_banks),
> +			GFP_KERNEL);
> +	if (!nand)
> +		return -ENOMEM;
> +
> +	nand->dev = dev;
> +	nand->num_banks = num_banks;
> +	nand->selected = -1;
> +
> +	mtd = &nand->mtd;
> +	chip = &nand->chip;
> +	mtd->priv = chip;
> +	mtd->owner = THIS_MODULE;
> +	mtd->name = DRV_NAME;
> +	mtd->dev.parent = dev;
> +
> +	chip->dn = dev->of_node;

chip->dn has recently been renamed to chip->flash_node.

BTW, If you go for the nand_controller + nand_chip approach, you'll have
to initialize the nand_controller struct and link it with your
nand_chip by doing:

	spin_lock_init(&jz4780_ctrl->controller.lock);
	init_waitqueue_head(&jz4780_ctrl->controller.wq);
	chip->controller = &jz4780_ctrl->controller;

That's all I see for now.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
