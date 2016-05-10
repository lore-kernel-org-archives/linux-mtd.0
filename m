Date: Tue, 10 May 2016 14:13:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 matthias.bgg@gmail.com, robh@kernel.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, linux-mediatek@lists.infradead.org,
 erin.lo@mediatek.com, daniel.thompson@linaro.org, blogic@openwrt.org
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Message-ID: <20160510141335.442d3d7b@bbrezillon>
In-Reply-To: <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
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

Jorge, Xiaolei,

On Fri, 29 Apr 2016 12:17:22 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> This patch adds support for mediatek's SDG1 NFC nand controller
> embedded in SoC 2701
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/mtd/nand/Kconfig    |    7 +
>  drivers/mtd/nand/Makefile   |    1 +
>  drivers/mtd/nand/mtk_ecc.c  |  527 ++++++++++++++++
>  drivers/mtd/nand/mtk_ecc.h  |   53 ++
>  drivers/mtd/nand/mtk_nand.c | 1432 +++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 2020 insertions(+)
>  create mode 100644 drivers/mtd/nand/mtk_ecc.c
>  create mode 100644 drivers/mtd/nand/mtk_ecc.h
>  create mode 100644 drivers/mtd/nand/mtk_nand.c
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index f05e0e9..3c26e89 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -563,4 +563,11 @@ config MTD_NAND_QCOM
>  	  Enables support for NAND flash chips on SoCs containing the EBI2 NAND
>  	  controller. This controller is found on IPQ806x SoC.
>  
> +config MTD_NAND_MTK
> +	tristate "Support for NAND controller on MTK SoCs"
> +	depends on HAS_DMA
> +	help
> +	  Enables support for NAND controller on MTK SoCs.
> +	  This controller is found on mt27xx, mt81xx, mt65xx SoCs.
> +
>  endif # MTD_NAND
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index f553353..cafde6f 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -57,5 +57,6 @@ obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
>  obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
>  obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
> +obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
>  
>  nand-objs := nand_base.o nand_bbt.o nand_timings.o
> diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
> new file mode 100644
> index 0000000..28769f1
> --- /dev/null
> +++ b/drivers/mtd/nand/mtk_ecc.c
> @@ -0,0 +1,527 @@
> +/*
> + * MTK ECC controller driver.
> + * Copyright (C) 2016  MediaTek Inc.
> + * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
> + *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/semaphore.h>
> +
> +#include "mtk_ecc.h"
> +
> +#define ECC_ENCCON		(0x00)
> +#define		ENC_EN			(1)
> +#define		ENC_DE			(0)
> +#define ECC_ENCCNFG		(0x04)
> +#define		ECC_CNFG_4BIT		(0)
> +#define		ECC_CNFG_6BIT		(1)
> +#define		ECC_CNFG_8BIT		(2)
> +#define		ECC_CNFG_10BIT		(3)
> +#define		ECC_CNFG_12BIT		(4)
> +#define		ECC_CNFG_14BIT		(5)
> +#define		ECC_CNFG_16BIT		(6)
> +#define		ECC_CNFG_18BIT		(7)
> +#define		ECC_CNFG_20BIT		(8)
> +#define		ECC_CNFG_22BIT		(9)
> +#define		ECC_CNFG_24BIT		(0xa)
> +#define		ECC_CNFG_28BIT		(0xb)
> +#define		ECC_CNFG_32BIT		(0xc)
> +#define		ECC_CNFG_36BIT		(0xd)
> +#define		ECC_CNFG_40BIT		(0xe)
> +#define		ECC_CNFG_44BIT		(0xf)
> +#define		ECC_CNFG_48BIT		(0x10)
> +#define		ECC_CNFG_52BIT		(0x11)
> +#define		ECC_CNFG_56BIT		(0x12)
> +#define		ECC_CNFG_60BIT		(0x13)
> +#define		ECC_MODE_SHIFT		(5)
> +#define		ECC_MS_SHIFT		(16)
> +#define ECC_ENCDIADDR		(0x08)
> +#define ECC_ENCIDLE		(0x0C)
> +#define		ENC_IDLE		BIT(0)
> +#define ECC_ENCPAR(x)		(0x10 + (x) * sizeof(u32))
> +#define ECC_ENCIRQ_EN		(0x80)
> +#define		ENC_IRQEN		BIT(0)
> +#define ECC_ENCIRQ_STA		(0x84)
> +#define ECC_DECCON		(0x100)
> +#define		DEC_EN			(1)
> +#define		DEC_DE			(0)
> +#define ECC_DECCNFG		(0x104)
> +#define		DEC_EMPTY_EN		BIT(31)
> +#define		DEC_CNFG_CORRECT	(0x3 << 12)
> +#define ECC_DECIDLE		(0x10C)
> +#define		DEC_IDLE		BIT(0)
> +#define ECC_DECENUM0		(0x114)
> +#define		ERR_MASK		(0x3f)
> +#define ECC_DECDONE		(0x124)
> +#define ECC_DECIRQ_EN		(0x200)
> +#define		DEC_IRQEN		BIT(0)
> +#define ECC_DECIRQ_STA		(0x204)
> +
> +#define ECC_TIMEOUT		(500000)
> +
> +#define ECC_IDLE_REG(x)		((x) == ECC_ENC ? ECC_ENCIDLE : ECC_DECIDLE)
> +#define ECC_IDLE_MASK(x)	((x) == ECC_ENC ? ENC_IDLE : DEC_IDLE)

No need for this macro, it's always bit0, so just define an ECC_IDLE
macro and use it for both decoder and encoder.

There seems to be some kind of pattern in your ENC/DEC registers.
ENC registers start at 0 and DEC ones at 0x100.
CNF register is always at 0x4 + mode/dir_offset (ie 0x100 for DEC and
0x0 for ENC), ...
Maybe you should define common macros for those registers, and choose
the base offset depending on the mode you're operating in (encoding or
decoding).

> +#define ECC_IRQ_REG(x)		((x) == ECC_ENC ? ECC_ENCIRQ_EN : ECC_DECIRQ_EN)
> +#define ECC_IRQ_EN(x)		((x) == ECC_ENC ? ENC_IRQEN : DEC_IRQEN)
> +#define ECC_CTL_REG(x)		((x) == ECC_ENC ? ECC_ENCCON : ECC_DECCON)
> +#define ECC_CODEC_ENABLE(x)	((x) == ECC_ENC ? ENC_EN : DEC_EN)
> +#define ECC_CODEC_DISABLE(x)	((x) == ECC_ENC ? ENC_DE : DEC_DE)
> +
> +struct mtk_ecc {
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct clk *clk;
> +
> +	struct completion done;
> +	struct semaphore sem;

You tried to explain me why you decided to go for a semaphore instead of
a mutex, but I don't remember. Could you explain it again?
If that's all about being interruptible, then you can use
mutex_lock_interruptible.

> +	u32 sec_mask;
> +};
> +
> +static inline void mtk_ecc_codec_wait_idle(struct mtk_ecc *ecc,
> +					enum mtk_ecc_codec codec)

Just nitpicking on the name again, but enum mtk_ecc_codec does not
describe what this enum really encode: the codec mode or direction.

How about renaming this enum into mtk_ecc_codec_dir or
mtd_ecc_codec_mode?

> +{
> +	struct device *dev = ecc->dev;
> +	u32 val;
> +	int ret;
> +
> +	ret = readl_poll_timeout_atomic(ecc->regs + ECC_IDLE_REG(codec), val,
> +					val & ECC_IDLE_MASK(codec),
> +					10, ECC_TIMEOUT);
> +	if (ret)
> +		dev_warn(dev, "%s NOT idle\n",
> +			codec == ECC_ENC ? "encoder" : "decoder");
> +}
> +
> +static irqreturn_t mtk_ecc_irq(int irq, void *id)
> +{
> +	struct mtk_ecc *ecc = id;
> +	enum mtk_ecc_codec codec;
> +	u32 dec, enc;
> +
> +	dec = readw(ecc->regs + ECC_DECIRQ_STA) & DEC_IRQEN;
> +	if (dec) {
> +		codec = ECC_DEC;
> +		dec = readw(ecc->regs + ECC_DECDONE);
> +		if (dec & ecc->sec_mask) {
> +			ecc->sec_mask = 0;
> +			complete(&ecc->done);
> +		} else
> +			return IRQ_HANDLED;
> +	} else {
> +		enc = readl(ecc->regs + ECC_ENCIRQ_STA) & ENC_IRQEN;
> +		if (enc) {
> +			codec = ECC_ENC;
> +			complete(&ecc->done);
> +		} else
> +			return IRQ_NONE;
> +	}
> +
> +	writel(0, ecc->regs + ECC_IRQ_REG(codec));
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void mtk_ecc_config(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
> +{
> +	u32 ecc_bit = ECC_CNFG_4BIT, dec_sz, enc_sz;
> +	u32 reg;
> +
> +	switch (config->strength) {
> +	case 4:
> +		ecc_bit = ECC_CNFG_4BIT;
> +		break;
> +	case 6:
> +		ecc_bit = ECC_CNFG_6BIT;
> +		break;
> +	case 8:
> +		ecc_bit = ECC_CNFG_8BIT;
> +		break;
> +	case 10:
> +		ecc_bit = ECC_CNFG_10BIT;
> +		break;
> +	case 12:
> +		ecc_bit = ECC_CNFG_12BIT;
> +		break;
> +	case 14:
> +		ecc_bit = ECC_CNFG_14BIT;
> +		break;
> +	case 16:
> +		ecc_bit = ECC_CNFG_16BIT;
> +		break;
> +	case 18:
> +		ecc_bit = ECC_CNFG_18BIT;
> +		break;
> +	case 20:
> +		ecc_bit = ECC_CNFG_20BIT;
> +		break;
> +	case 22:
> +		ecc_bit = ECC_CNFG_22BIT;
> +		break;
> +	case 24:
> +		ecc_bit = ECC_CNFG_24BIT;
> +		break;
> +	case 28:
> +		ecc_bit = ECC_CNFG_28BIT;
> +		break;
> +	case 32:
> +		ecc_bit = ECC_CNFG_32BIT;
> +		break;
> +	case 36:
> +		ecc_bit = ECC_CNFG_36BIT;
> +		break;
> +	case 40:
> +		ecc_bit = ECC_CNFG_40BIT;
> +		break;
> +	case 44:
> +		ecc_bit = ECC_CNFG_44BIT;
> +		break;
> +	case 48:
> +		ecc_bit = ECC_CNFG_48BIT;
> +		break;
> +	case 52:
> +		ecc_bit = ECC_CNFG_52BIT;
> +		break;
> +	case 56:
> +		ecc_bit = ECC_CNFG_56BIT;
> +		break;
> +	case 60:
> +		ecc_bit = ECC_CNFG_60BIT;
> +		break;
> +	default:
> +		dev_err(ecc->dev, "invalid strength %d\n", config->strength);
> +	}
> +
> +	if (config->codec == ECC_ENC) {
> +		/* configure ECC encoder (in bits) */
> +		enc_sz = config->enc_len << 3;
> +
> +		reg = ecc_bit | (config->ecc_mode << ECC_MODE_SHIFT);
> +		reg |= (enc_sz << ECC_MS_SHIFT);
> +		writel(reg, ecc->regs + ECC_ENCCNFG);
> +
> +		if (config->ecc_mode != ECC_NFI_MODE)
> +			writel(lower_32_bits(config->addr),
> +				ecc->regs + ECC_ENCDIADDR);
> +
> +	} else {
> +		/* configure ECC decoder (in bits) */
> +		dec_sz = config->dec_len;
> +
> +		reg = ecc_bit | (config->ecc_mode << ECC_MODE_SHIFT);
> +		reg |= (dec_sz << ECC_MS_SHIFT) | DEC_CNFG_CORRECT;
> +		reg |= DEC_EMPTY_EN;
> +		writel(reg, ecc->regs + ECC_DECCNFG);
> +
> +		if (config->sec_mask)
> +			ecc->sec_mask = 1 << (config->sec_mask - 1);
> +	}

I see that some of the logic could be shared between the ENC and DEC
cases.
BTW, why do you multiply enc_len by 8 (bits to byte conversion), but
don't do that for dec_len?

> +}
> +

[...]

> +
> +void mtk_ecc_disable(struct mtk_ecc *ecc, struct mtk_ecc_config *config)

If you save the mode somewhere in mtk_ecc (or just write in both ENC
and DEC registers), you won't need this extra config arg here.

> +{
> +	enum mtk_ecc_codec codec = config->codec;
> +
> +	mtk_ecc_codec_wait_idle(ecc, codec);
> +	writew(0, ecc->regs + ECC_IRQ_REG(codec));
> +	writew(ECC_CODEC_DISABLE(codec), ecc->regs + ECC_CTL_REG(codec));
> +	up(&ecc->sem);
> +}
> +EXPORT_SYMBOL(mtk_ecc_disable);

[...]

> +
> +void mtk_ecc_hw_init(struct mtk_ecc *ecc)

No need to expose this function. Make it static and remove the
prototype in your header.

> +{
> +	mtk_ecc_codec_wait_idle(ecc, ECC_ENC);
> +	writew(ENC_DE, ecc->regs + ECC_ENCCON);
> +
> +	mtk_ecc_codec_wait_idle(ecc, ECC_DEC);
> +	writel(DEC_DE, ecc->regs + ECC_DECCON);
> +}
> +
> +void mtk_ecc_update_strength(u32 *p)

Please rename it into mtd_ecc_adjust_strength().

> +{
> +	u32 ecc[] = {4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
> +			40, 44, 48, 52, 56, 60};
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ecc); i++) {
> +		if (*p <= ecc[i]) {
> +			if (!i)
> +				*p = ecc[i];
> +			else if (*p != ecc[i])
> +				*p = ecc[i - 1];
> +			return;
> +		}
> +	}
> +
> +	*p = ecc[ARRAY_SIZE(ecc) - 1];
> +}

[...]

> diff --git a/drivers/mtd/nand/mtk_ecc.h b/drivers/mtd/nand/mtk_ecc.h
> new file mode 100644
> index 0000000..434826f
> --- /dev/null
> +++ b/drivers/mtd/nand/mtk_ecc.h
> @@ -0,0 +1,53 @@
> +/*
> + * MTK SDG1 ECC controller
> + *
> + * Copyright (c) 2016 Mediatek
> + * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
> + *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published
> + * by the Free Software Foundation.
> + */
> +
> +#ifndef __DRIVERS_MTD_NAND_MTK_ECC_H__
> +#define __DRIVERS_MTD_NAND_MTK_ECC_H__
> +
> +#include <linux/types.h>
> +
> +#define ECC_PARITY_BITS		(14)
> +
> +enum mtk_ecc_mode {ECC_DMA_MODE = 0, ECC_NFI_MODE = 1};
> +enum mtk_ecc_codec {ECC_ENC, ECC_DEC};

As suggested, mtk_ecc_codec_dir or just mtk_ecc_dir would be more
appropriate IMHO.

> +
> +struct device_node;
> +struct mtk_ecc;
> +
> +struct mtk_ecc_stats {
> +	u32 corrected;
> +	u32 bitflips;
> +	u32 failed;
> +};
> +
> +struct mtk_ecc_config {
> +	enum mtk_ecc_mode ecc_mode;

s/ecc_mode/mode/ (the ecc_ prefix is implicit here).

> +	enum mtk_ecc_codec codec;
> +	dma_addr_t addr;
> +	u32 sec_mask;

It seems that sec_mask is actually encoding the number of sectors.
Maybe you should rename it sectors. BTW, why do you need both the
length and the number of sectors. It seems to me that given the length
an the sector size you could deduce the number of sectors, or
alternatively, you could specify the number of sectors and the sector
length and calculate the length from those fields.

BTW, I don't see where you configure the sector size. Don't you need it
to switch between 512bytes and 1k?

> +	u32 strength;
> +	u32 enc_len;
> +	u32 dec_len;

Why do you need 2 different fields for that? The ECC engine is either
working in encoding or decoding mode, so a single "len" field should be
enough.

Apparently you're mixing 2 different concepts: the information required
to configure the ECC engine (the fields in mtk_ecc_config), and how
they should be formatted to be written the the ECC engine registers
(that should probably be stored in the mtk_ecc struct or just
calculated on the fly by the driver).
You're driver should hide the internals of the ECC engine as much as
possible.

> +};
> +
> +int mtk_ecc_enable(struct mtk_ecc *, struct mtk_ecc_config *);
> +void mtk_ecc_disable(struct mtk_ecc *, struct mtk_ecc_config *);
> +int mtk_ecc_encode_non_nfi_mode(struct mtk_ecc *, struct mtk_ecc_config *,
> +				u8 *, u32);

mtk_ecc_encode() should be enough, since you dropped the other _encode()
functions.

> +void mtk_ecc_get_stats(struct mtk_ecc *, struct mtk_ecc_stats *, int);
> +int mtk_ecc_wait_irq_done(struct mtk_ecc *, enum mtk_ecc_codec);
> +void mtk_ecc_hw_init(struct mtk_ecc *);
> +void mtk_ecc_update_strength(u32 *);
> +
> +struct mtk_ecc *of_mtk_ecc_get(struct device_node *);
> +void mtk_ecc_release(struct mtk_ecc *);
> +
> +#endif
> diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
> new file mode 100644
> index 0000000..907b90c
> --- /dev/null
> +++ b/drivers/mtd/nand/mtk_nand.c
> @@ -0,0 +1,1432 @@
> +/*
> + * MTK NAND Flash controller driver.
> + * Copyright (C) 2016 MediaTek Inc.
> + * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
> + *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/module.h>
> +#include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include "mtk_ecc.h"
> +
> +/* NAND controller register definition */
> +#define NFI_CNFG		(0x00)
> +#define		CNFG_AHB		BIT(0)
> +#define		CNFG_READ_EN		BIT(1)
> +#define		CNFG_DMA_BURST_EN	BIT(2)
> +#define		CNFG_BYTE_RW		BIT(6)
> +#define		CNFG_HW_ECC_EN		BIT(8)
> +#define		CNFG_AUTO_FMT_EN	BIT(9)
> +#define		CNFG_OP_CUST		(6 << 12)
> +#define NFI_PAGEFMT		(0x04)
> +#define		PAGEFMT_FDM_ECC_SHIFT	(12)
> +#define		PAGEFMT_FDM_SHIFT	(8)
> +#define		PAGEFMT_SPARE_16	(0)
> +#define		PAGEFMT_SPARE_26	(1)
> +#define		PAGEFMT_SPARE_27	(2)
> +#define		PAGEFMT_SPARE_28	(3)
> +#define		PAGEFMT_SPARE_32	(4)
> +#define		PAGEFMT_SPARE_36	(5)
> +#define		PAGEFMT_SPARE_40	(6)
> +#define		PAGEFMT_SPARE_44	(7)
> +#define		PAGEFMT_SPARE_48	(8)
> +#define		PAGEFMT_SPARE_49	(9)
> +#define		PAGEFMT_SPARE_50	(0xa)
> +#define		PAGEFMT_SPARE_51	(0xb)
> +#define		PAGEFMT_SPARE_52	(0xc)
> +#define		PAGEFMT_SPARE_62	(0xd)
> +#define		PAGEFMT_SPARE_63	(0xe)
> +#define		PAGEFMT_SPARE_64	(0xf)
> +#define		PAGEFMT_SPARE_SHIFT	(4)
> +#define		PAGEFMT_SEC_SEL_512	BIT(2)
> +#define		PAGEFMT_512_2K		(0)
> +#define		PAGEFMT_2K_4K		(1)
> +#define		PAGEFMT_4K_8K		(2)
> +#define		PAGEFMT_8K_16K		(3)
> +/* NFI control */
> +#define NFI_CON			(0x08)
> +#define		CON_FIFO_FLUSH		BIT(0)
> +#define		CON_NFI_RST		BIT(1)
> +#define		CON_BRD			BIT(8)  /* burst  read */
> +#define		CON_BWR			BIT(9)	/* burst  write */
> +#define		CON_SEC_SHIFT		(12)
> +/* Timming control register */
> +#define NFI_ACCCON		(0x0C)
> +#define NFI_INTR_EN		(0x10)
> +#define		INTR_AHB_DONE_EN	BIT(6)
> +#define NFI_INTR_STA		(0x14)
> +#define NFI_CMD			(0x20)
> +#define NFI_ADDRNOB		(0x30)
> +#define NFI_COLADDR		(0x34)
> +#define NFI_ROWADDR		(0x38)
> +#define NFI_STRDATA		(0x40)
> +#define		STAR_EN			(1)
> +#define		STAR_DE			(0)
> +#define NFI_CNRNB		(0x44)
> +#define NFI_DATAW		(0x50)
> +#define NFI_DATAR		(0x54)
> +#define NFI_PIO_DIRDY		(0x58)
> +#define		PIO_DI_RDY		(0x01)
> +#define NFI_STA			(0x60)
> +#define		STA_CMD			BIT(0)
> +#define		STA_ADDR		BIT(1)
> +#define		STA_BUSY		BIT(8)
> +#define		STA_EMP_PAGE		BIT(12)
> +#define		NFI_FSM_CUSTDATA	(0xe << 16)
> +#define		NFI_FSM_MASK		(0xf << 16)
> +#define NFI_ADDRCNTR		(0x70)
> +#define		CNTR_MASK		GENMASK(16, 12)
> +#define NFI_STRADDR		(0x80)
> +#define NFI_BYTELEN		(0x84)
> +#define NFI_CSEL		(0x90)
> +#define NFI_FDML(x)		(0xA0 + (x) * sizeof(u32) * 2)
> +#define NFI_FDMM(x)		(0xA4 + (x) * sizeof(u32) * 2)
> +#define NFI_FDM_MAX_SIZE	(8)
> +#define NFI_MASTER_STA		(0x224)
> +#define		MASTER_STA_MASK		(0x0FFF)
> +#define NFI_EMPTY_THRESH	(0x23C)
> +
> +#define MTK_NAME		"mtk-nand"
> +#define KB(x)			((x) * 1024UL)
> +#define MB(x)			(KB(x) * 1024UL)
> +
> +#define MTK_TIMEOUT		(500000)
> +#define MTK_RESET_TIMEOUT	(1000000)
> +#define MTK_MAX_SECTOR		(16)
> +#define MTK_NAND_MAX_NSELS	(2)
> +
> +typedef void (*bad_mark_swap)(struct mtd_info *, uint8_t *buf, int raw);
> +struct mtk_nfc_bad_mark_ctl {
> +	bad_mark_swap bm_swap;

Just defined the function prototype directly here:

	void (*bm_swap)(struct mtd_info *, uint8_t *buf, int raw);

> +	u32 sec;
> +	u32 pos;
> +};

[...]

> +static inline uint8_t *oob_ptr(struct nand_chip *chip, int i)
> +{
> +	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
> +	uint8_t *poi;
> +
> +	if (i < mtk_nand->bad_mark.sec)
> +		poi = chip->oob_poi + (i + 1) * mtk_nand->fdm.reg_size;
> +	else if (i == mtk_nand->bad_mark.sec)
> +		poi = chip->oob_poi;
> +	else
> +		poi = chip->oob_poi + i * mtk_nand->fdm.reg_size;

Could you add some comments explaining what you're doing here, because
I don't get it :).

> +
> +	return poi;
> +}
> +

[...]

> +static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	u32 fmt, spare;
> +
> +	if (!mtd->writesize)
> +		return 0;
> +
> +	spare = mtk_nand->spare_per_sector;
> +
> +	switch (mtd->writesize) {
> +	case 512:
> +		fmt = PAGEFMT_512_2K | PAGEFMT_SEC_SEL_512;
> +		break;
> +	case KB(2):
> +		if (chip->ecc.size == 512)
> +			fmt = PAGEFMT_2K_4K | PAGEFMT_SEC_SEL_512;
> +		else
> +			fmt = PAGEFMT_512_2K;
> +		break;
> +	case KB(4):
> +		if (chip->ecc.size == 512)
> +			fmt = PAGEFMT_4K_8K | PAGEFMT_SEC_SEL_512;
> +		else
> +			fmt = PAGEFMT_2K_4K;
> +		break;
> +	case KB(8):
> +		if (chip->ecc.size == 512)
> +			fmt = PAGEFMT_8K_16K | PAGEFMT_SEC_SEL_512;
> +		else
> +			fmt = PAGEFMT_4K_8K;
> +		break;
> +	case KB(16):
> +		fmt = PAGEFMT_8K_16K;
> +		break;
> +	default:
> +		dev_err(nfc->dev, "invalid page len: %d\n", mtd->writesize);
> +		return -EINVAL;
> +	}
> +
> +	/* the hardware doubles the value for this eccsize so let's halve it */
> +	if (chip->ecc.size == 1024)
> +		spare >>= 1;
> +
> +	switch (spare) {
> +	case 16:
> +		fmt |= (PAGEFMT_SPARE_16 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 26:
> +		fmt |= (PAGEFMT_SPARE_26 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 27:
> +		fmt |= (PAGEFMT_SPARE_27 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 28:
> +		fmt |= (PAGEFMT_SPARE_28 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 32:
> +		fmt |= (PAGEFMT_SPARE_32 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 36:
> +		fmt |= (PAGEFMT_SPARE_36 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 40:
> +		fmt |= (PAGEFMT_SPARE_40 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 44:
> +		fmt |= (PAGEFMT_SPARE_44 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 48:
> +		fmt |= (PAGEFMT_SPARE_48 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 49:
> +		fmt |= (PAGEFMT_SPARE_49 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 50:
> +		fmt |= (PAGEFMT_SPARE_50 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 51:
> +		fmt |= (PAGEFMT_SPARE_51 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 52:
> +		fmt |= (PAGEFMT_SPARE_52 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 62:
> +		fmt |= (PAGEFMT_SPARE_62 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 63:
> +		fmt |= (PAGEFMT_SPARE_63 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 64:
> +		fmt |= (PAGEFMT_SPARE_64 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	default:
> +		dev_err(nfc->dev, "invalid spare per sector %d\n", spare);
> +		return -EINVAL;
> +	}
> +
> +	fmt |= mtk_nand->fdm.reg_size << PAGEFMT_FDM_SHIFT;
> +	fmt |= mtk_nand->fdm.ecc_size << PAGEFMT_FDM_ECC_SHIFT;
> +	nfi_writew(nfc, fmt, NFI_PAGEFMT);
> +
> +	nfc->ecc_cfg.strength = chip->ecc.strength;
> +	nfc->ecc_cfg.enc_len = chip->ecc.size + mtk_nand->fdm.ecc_size;
> +	nfc->ecc_cfg.dec_len = (nfc->ecc_cfg.enc_len << 3)
> +				+ chip->ecc.strength * ECC_PARITY_BITS;

And here is the explanation to the question I asked in my ECC engine
driver review :).

Please keep the len field consistent for both encoding and decoding
mode, and let the ECC engine driver adapt it to put the correct value
in the ECC engine registers.

> +
> +	return 0;
> +}
> +

[...]

> +
> +static inline uint8_t mtk_nfc_read_byte(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	u32 reg;
> +
> +	reg = nfi_readl(nfc, NFI_STA) & NFI_FSM_MASK;
> +	if (reg != NFI_FSM_CUSTDATA) {
> +		reg = nfi_readw(nfc, NFI_CNFG);
> +		reg |= CNFG_BYTE_RW | CNFG_READ_EN;
> +		nfi_writew(nfc, reg, NFI_CNFG);
> +
> +		reg = (MTK_MAX_SECTOR << CON_SEC_SHIFT) | CON_BRD;

What is CON_SEC field meaning in this case? The number of bytes to read
(maybe stored in a FIFO)? If that's the case, and the controller is able
to read several bytes at a time, then it would make more sense to
implement ->read_byte() as a wrapper around ->read_buf() and move this
code into ->read_buf().

> +		nfi_writel(nfc, reg, NFI_CON);
> +
> +		/* trigger to fetch data */
> +		nfi_writew(nfc, STAR_EN, NFI_STRDATA);
> +	}
> +
> +	mtk_nfc_wait_ioready(nfc);
> +
> +	return nfi_readb(nfc, NFI_DATAR);
> +}
> +

[...]

> +
> +static void mtk_nfc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
> +{
> +	int i;
> +
> +	for (i = 0; i < len; i++)
> +		mtk_nfc_write_byte(mtd, buf[i]);
> +}

Ditto.

> +
> +static int mtk_nfc_sector_encode(struct nand_chip *chip, u8 *data)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
> +	int size = chip->ecc.size + mtk_nand->fdm.reg_size;
> +
> +	nfc->ecc_cfg.ecc_mode = ECC_DMA_MODE;
> +	nfc->ecc_cfg.codec = ECC_ENC;
> +	return mtk_ecc_encode_non_nfi_mode(nfc->ecc, &nfc->ecc_cfg, data, size);
> +}
> +
> +static void mtk_nfc_no_bad_mark_swap(struct mtd_info *a, uint8_t *b, int c)
> +{
> +	/* nope */

I guess you meant NOP :).

> +}
> +
> +static void mtk_nfc_bad_mark_swap(struct mtd_info *mtd, uint8_t *buf, int raw)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct mtk_nfc_nand_chip *nand = to_mtk_nand(chip);
> +	u32 bad_pos = nand->bad_mark.pos;
> +
> +	if (raw)
> +		bad_pos += nand->bad_mark.sec * mtk_data_len(chip);
> +	else
> +		bad_pos += nand->bad_mark.sec * chip->ecc.size;
> +
> +	swap(chip->oob_poi[0], buf[bad_pos]);

Don't know if you support 16bits bus width, but if that's the case you
should swap 2 bytes (the bad block marker is 2 bytes wide).

> +}
> +

[...]

> +
> +static inline void mtk_nfc_read_fdm(struct nand_chip *chip, u32 start,
> +					u32 sectors)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	u32 *p;
> +	int i;
> +
> +	for (i = 0; i < sectors; i++) {
> +		p = (u32 *) oob_ptr(chip, start + i);
> +		p[0] = nfi_readl(nfc, NFI_FDML(i));
> +		p[1] = nfi_readl(nfc, NFI_FDMM(i));

Hm, this should work as long as you're in little-endian, otherwise you
might have to switch bytes.
Maybe you should convert this manually with something like:

		u8 *oobptr = oob_ptr(chip, start + i);
		u32 val = nfi_readl(nfc, NFI_FDML(i));
		oobptr[0] = val;
		oobptr[1] = val >> 8;
		...

> +	}
> +}
> +
> +static inline void mtk_nfc_write_fdm(struct nand_chip *chip)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	u32 *p;
> +	int i;
> +
> +	for (i = 0; i < chip->ecc.steps ; i++) {
> +		p = (u32 *) oob_ptr(chip, i);
> +		nfi_writel(nfc, p[0], NFI_FDML(i));
> +		nfi_writel(nfc, p[1], NFI_FDMM(i));

Ditto.

> +	}
> +}
> +

[...]

> +
> +static inline void mtk_nfc_hw_init(struct mtk_nfc *nfc)
> +{
> +	nfi_writel(nfc, 0x10804211, NFI_ACCCON);
> +	nfi_writew(nfc, 0xf1, NFI_CNRNB);

Could you explain those magic values?

> +	nfi_writew(nfc, PAGEFMT_8K_16K, NFI_PAGEFMT);
> +
> +	mtk_nfc_hw_reset(nfc);
> +
> +	nfi_readl(nfc, NFI_INTR_STA);
> +	nfi_writel(nfc, 0, NFI_INTR_EN);
> +}
> +

[...]

> +
> +#ifdef CONFIG_PM_SLEEP
> +static int mtk_nfc_suspend(struct device *dev)
> +{
> +	struct mtk_nfc *nfc = dev_get_drvdata(dev);
> +
> +	mtk_nfc_disable_clk(&nfc->clk);
> +
> +	return 0;
> +}
> +
> +static int mtk_nfc_resume(struct device *dev)
> +{
> +	struct mtk_nfc *nfc = dev_get_drvdata(dev);
> +	struct mtk_nfc_nand_chip *chip;
> +	struct nand_chip *nand;
> +	struct mtd_info *mtd;
> +	int ret;
> +	u32 i;
> +
> +	udelay(200);
> +
> +	ret = mtk_nfc_enable_clk(dev, &nfc->clk);
> +	if (ret)
> +		return ret;
> +
> +	mtk_nfc_hw_init(nfc);
> +
> +	list_for_each_entry(chip, &nfc->chips, node) {
> +		nand = &chip->nand;
> +		mtd = nand_to_mtd(nand);
> +		for (i = 0; i < chip->nsels; i++) {
> +			nand->select_chip(mtd, i);
> +			nand->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
> +		}

Interesting, you need to reset the NAND chips when you get out of
suspend. Probably something we should move in the core at some point.

Sorry, but I focused on a few specific aspects in this review (ECC
engine and basic nand_chip functions), which means I might have missed
other issues. I'll try to carefully review the remaining parts later.

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
