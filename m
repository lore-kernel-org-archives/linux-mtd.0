Date: Mon, 18 Apr 2016 00:17:51 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Message-ID: <20160418001751.286edf83@bbrezillon>
In-Reply-To: <1460393772-26910-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1460393772-26910-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
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

Hi Jorge,

On Mon, 11 Apr 2016 12:56:12 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> This patch adds support for mediatek's SDG1 NFC nand controller
> embedded in SoC 2701.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/mtd/nand/Kconfig    |    7 +
>  drivers/mtd/nand/Makefile   |    1 +
>  drivers/mtd/nand/mtk_ecc.c  |  449 +++++++++++++++
>  drivers/mtd/nand/mtk_ecc.h  |   56 ++
>  drivers/mtd/nand/mtk_nand.c | 1266 +++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 1779 insertions(+)
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
> index 0000000..627f0a7
> --- /dev/null
> +++ b/drivers/mtd/nand/mtk_ecc.c
> @@ -0,0 +1,449 @@
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
> +
> +#include "mtk_ecc.h"
> +
> +#define ECC_ENCCON		(0x00)
> +#define		ENC_EN			(1)
> +#define		ENC_DE			(0)
> +#define ECC_ENCCNFG		(0x04)
> +#define		ECC_CNFG_4BIT		(0)
> +#define		ECC_CNFG_12BIT		(4)
> +#define		ECC_CNFG_24BIT		(10)
> +#define		ECC_NFI_MODE		BIT(5)
> +#define		ECC_DMA_MODE		(0)
> +#define		ECC_ENC_MODE_MASK	(0x3 << 5)
> +#define		ECC_MS_SHIFT		(16)
> +#define ECC_ENCDIADDR		(0x08)
> +#define ECC_ENCIDLE		(0x0C)
> +#define		ENC_IDLE		BIT(0)
> +#define ECC_ENCPAR0		(0x10)
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
> +#define ECC_PARITY_BITS		(14)
> +
> +struct mtk_ecc {
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct mutex lock;

You defined this lock, but don't use it. See below for a suggestion of
where it should be used...

> +	struct clk *clk;
> +
> +	struct completion done;
> +	u32 sec_mask;
> +};
> +
> +static inline void mtk_ecc_encoder_idle(struct mtk_ecc *ecc)

Just a detail, but the function does not exactly reflect that you're
waiting for the encoder to be idle. How about renaming it
mtk_ecc_encoder_wait_idle() ?

> +{
> +	struct device *dev = ecc->dev;
> +	u32 val;
> +	int ret;
> +
> +	ret = readl_poll_timeout_atomic(ecc->regs + ECC_ENCIDLE, val,
> +					val & ENC_IDLE, 10, ECC_TIMEOUT);
> +	if (ret)
> +		dev_warn(dev, "encoder NOT idle\n");
> +}
> +
> +static inline void mtk_ecc_decoder_idle(struct mtk_ecc *ecc)

Ditto.

> +{
> +	struct device *dev = ecc->dev;
> +	u32 val;
> +	int ret;
> +
> +	ret = readl_poll_timeout_atomic(ecc->regs + ECC_DECIDLE, val,
> +					val & DEC_IDLE, 10, ECC_TIMEOUT);
> +	if (ret)
> +		dev_warn(dev, "decoder NOT idle\n");
> +}
> +
> +static irqreturn_t mtk_ecc_irq(int irq, void *id)
> +{
> +	struct mtk_ecc *ecc = id;
> +	u32 dec, enc;
> +
> +	dec = readw(ecc->regs + ECC_DECIRQ_STA) & DEC_IRQEN;
> +	enc = readl(ecc->regs + ECC_ENCIRQ_STA) & ENC_IRQEN;
> +
> +	if (!(dec || enc))
> +		return IRQ_NONE;
> +
> +	if (dec) {
> +		dec = readw(ecc->regs + ECC_DECDONE);
> +		if (dec & ecc->sec_mask) {
> +			ecc->sec_mask = 0;
> +			complete(&ecc->done);

If you can really do enc and dec in parallel, then you should have two
waitqueues.

> +			writew(0, ecc->regs + ECC_DECIRQ_EN);
> +		}
> +	} else {
> +		complete(&ecc->done);
> +		writel(0, ecc->regs + ECC_ENCIRQ_EN);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +

[...]

> +
> +void mtk_ecc_enable_encode(struct mtk_ecc *ecc)

_enable_encode*r*()?

> +{

Not sure this is needed right now, since the NAND driver is the only
user of the ECC engine (not even sure you can use the ECC engine
independently), and we do not support accessing chips in parallel, but
it may be more future proof to take a lock before using the ECC
encoder/decoder, and release it when the operation is finished.

This your controller seems capable of doing ECC encoding/decoding in
parallel, it might be worth having 2 different locks.

If you decide to not use any lock, please add something in the
documentation, stating that it's the ECC engine user responsibility to
ensure serialization, and forbid several mtk_ecc_get() on the same
device.

> +	mtk_ecc_encoder_idle(ecc);
> +	writew(ENC_EN, ecc->regs + ECC_ENCCON);
> +}
> +EXPORT_SYMBOL(mtk_ecc_enable_encode);
> +
> +void mtk_ecc_disable_encode(struct mtk_ecc *ecc)

_disable_encode*r*()?

> +{
> +	writew(0, ecc->regs + ECC_ENCIRQ_EN);
> +	mtk_ecc_encoder_idle(ecc);
> +	writew(ENC_DE, ecc->regs + ECC_ENCCON);

Release the lock here, if any.

> +}
> +EXPORT_SYMBOL(mtk_ecc_disable_encode);
> +
> +void mtk_ecc_enable_decode(struct mtk_ecc *ecc)

_decode*r*()

> +{
> +	mtk_ecc_decoder_idle(ecc);
> +	writel(DEC_EN, ecc->regs + ECC_DECCON);
> +}
> +EXPORT_SYMBOL(mtk_ecc_enable_decode);
> +
> +void mtk_ecc_disable_decode(struct mtk_ecc *ecc)

Ditto.

> +{
> +	writew(0, ecc->regs + ECC_DECIRQ_EN);
> +	mtk_ecc_decoder_idle(ecc);
> +	writel(DEC_DE, ecc->regs + ECC_DECCON);
> +}
> +EXPORT_SYMBOL(mtk_ecc_disable_decode);
> +
> +void mtk_ecc_start_decode(struct mtk_ecc *ecc, int sectors)

AFAIS, you're not really starting the decoding here. It's triggered by
the NAND engine when it forwards data to the ECC engine.
Can we make this clearer by rename the function into
mtk_ecc_prepare_decoding(). I know I'm quite picky on those function
names, but I like when names are reflecting what's really done :).

> +{
> +	ecc->sec_mask = 1 << (sectors - 1);
> +	init_completion(&ecc->done);
> +	writew(DEC_IRQEN, ecc->regs + ECC_DECIRQ_EN);
> +}
> +EXPORT_SYMBOL(mtk_ecc_start_decode);
> +
> +int mtk_ecc_wait_decode(struct mtk_ecc *ecc)
> +{
> +	int ret;
> +
> +	ret = wait_for_completion_timeout(&ecc->done, msecs_to_jiffies(500));
> +	if (!ret) {
> +		dev_err(ecc->dev, "decode timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(mtk_ecc_wait_decode);
> +
> +int mtk_ecc_start_encode(struct mtk_ecc *ecc, struct mtk_ecc_enc_data *d)

And here you're doing more than just preparing the encoding request,
you're actually encoding data. So, how about mtd_ecc_encode()?

> +{
> +	dma_addr_t addr;
> +	u32 *p, len;
> +	u32 reg, i;
> +	int rc, ret = 0;
> +
> +	addr = dma_map_single(ecc->dev, d->data, d->len, DMA_TO_DEVICE);
> +	rc = dma_mapping_error(ecc->dev, addr);
> +	if (rc) {
> +		dev_err(ecc->dev, "dma mapping error\n");
> +		return -EINVAL;
> +	}
> +
> +	/* enable the encoder in DMA mode to calculate the ECC bytes  */
> +	reg = readl(ecc->regs + ECC_ENCCNFG) & ~ECC_ENC_MODE_MASK;
> +	reg |= ECC_DMA_MODE;

When I compare the start_encode() to the start_decode() function I see
one big difference: the former is clearly operating in non-pipeline
mode (the data are retrieved using DMA and returned values are kept in
PARX registers), while, IFAICS, the latter is operating in pipeline
mode (data are directly retrieved from the NAND engine stream).

I'm perfectly fine supporting those 2 modes (at least it gives an
answer to one of my question: the ECC engine can be used independently
of the NAND engine), but the function names should reflect this.

> +	writel(reg, ecc->regs + ECC_ENCCNFG);
> +
> +	writel(ENC_IRQEN, ecc->regs + ECC_ENCIRQ_EN);
> +	writel(lower_32_bits(addr), ecc->regs + ECC_ENCDIADDR);
> +
> +	init_completion(&ecc->done);
> +	writew(ENC_EN, ecc->regs + ECC_ENCCON);
> +
> +	rc = wait_for_completion_timeout(&ecc->done, msecs_to_jiffies(500));
> +	if (!rc) {
> +		dev_err(ecc->dev, "encode timeout\n");
> +		writel(0, ecc->regs + ECC_ENCIRQ_EN);
> +		ret = -ETIMEDOUT;
> +		goto timeout;
> +	}
> +
> +	mtk_ecc_encoder_idle(ecc);
> +
> +	/* Program ECC bytes to OOB: per sector oob = FDM + ECC + SPARE */
> +	len = (d->strength * ECC_PARITY_BITS + 7) >> 3;
> +	p = (u32 *) (d->data + d->len);
> +
> +	/* write the parity bytes generated by the ECC back to the OOB region */
> +	for (i = 0; i < len; i++)
> +		p[i] = readl(ecc->regs + ECC_ENCPAR0 + i * sizeof(u32));

Please define an ECC_ENCPAR(x) macro, where X is the parity word index.

> +
> +timeout:
> +
> +	dma_unmap_single(ecc->dev, addr, d->len, DMA_TO_DEVICE);
> +
> +	writew(0, ecc->regs + ECC_ENCCON);
> +	reg = readl(ecc->regs + ECC_ENCCNFG) & ~ECC_ENC_MODE_MASK;
> +	reg |= ECC_NFI_MODE;
> +	writel(reg, ecc->regs + ECC_ENCCNFG);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(mtk_ecc_start_encode);
> +

[...]

> diff --git a/drivers/mtd/nand/mtk_ecc.h b/drivers/mtd/nand/mtk_ecc.h
> new file mode 100644
> index 0000000..d12bc5f
> --- /dev/null
> +++ b/drivers/mtd/nand/mtk_ecc.h
> @@ -0,0 +1,56 @@
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
> +struct device_node;
> +struct mtk_ecc;
> +
> +/**
> + * @len: number of bytes in the data buffer
> + * @data: pointer to memory holding the data
> + * @strength: number of correctable bits
> + */
> +struct mtk_ecc_enc_data {

Should probably not be suffixed with _enc_, since the same structure
could be used for decoding ops.

> +	unsigned int len;
> +	int strength;

You should already have this information (either stored in a copy of
the config passed to mtk_ecc_config() or retrieved from the registers
values).

> +	u8 *data;
> +};

This being said, I wonder if we really need a struct for that. Passing
those two parameters to mtd_ecc_start_encode() is acceptable.

> +
> +struct mtk_ecc_stats {
> +	u32 corrected;
> +	u32 bitflips;
> +	u32 failed;
> +};
> +
> +struct mtk_ecc_config {
> +	u32 strength;
> +	u32 step_len;
> +};
> +
> +void mtk_ecc_enable_decode(struct mtk_ecc *);
> +void mtk_ecc_disable_decode(struct mtk_ecc *);
> +
> +int mtk_ecc_wait_decode(struct mtk_ecc *);
> +void mtk_ecc_enable_encode(struct mtk_ecc *);
> +void mtk_ecc_disable_encode(struct mtk_ecc *);
> +int mtk_ecc_start_encode(struct mtk_ecc *, struct mtk_ecc_enc_data *);
> +void mtk_ecc_hw_init(struct mtk_ecc *);
> +int mtk_ecc_config(struct mtk_ecc *, struct mtk_ecc_config *);
> +void mtk_ecc_release(struct mtk_ecc *);
> +struct mtk_ecc *of_mtk_ecc_get(struct device_node *);
> +
> +void mtk_ecc_start_decode(struct mtk_ecc *, int sectors);
> +void mtk_ecc_get_stats(struct mtk_ecc *, struct mtk_ecc_stats *, int sectors);
> +#endif
> diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
> new file mode 100644
> index 0000000..048024f
> --- /dev/null
> +++ b/drivers/mtd/nand/mtk_nand.c
> @@ -0,0 +1,1266 @@
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
> +
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
> +
> +#define NFI_PAGEFMT		(0x04)
> +#define		PAGEFMT_FDM_ECC_SHIFT	(12)
> +#define		PAGEFMT_FDM_SHIFT	(8)
> +#define		PAGEFMT_SPARE_16	(0)
> +#define		PAGEFMT_SPARE_28	(3)
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
> +
> +/* Timming control register */
> +#define NFI_ACCCON		(0x0C)
> +
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
> +#define NFI_FDM_REG_SIZE	(8)
> +#define NFI_FDM0L		(0xA0)
> +#define NFI_FDM0M		(0xA4)
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
> +struct mtk_nfc_clk {
> +	struct clk *nfi_clk;
> +	struct clk *pad_clk;
> +};
> +
> +struct mtk_nfc_nand_chip {
> +	struct list_head node;
> +	struct nand_chip nand;
> +	u32 spare_per_sector;

We already discussed that on IRC, and I don't think you really need
this field. AFAICT, all it's encoding is the number of ECC + free bytes
you have per data chunk (ECC step size). This can all be described
using the ecc->{pre,post}pad and ecc->bytes fields.

> +	int nsels;
> +	u8 sels[0];
> +};

[...]

> +
> +static int mtk_nfc_send_address(struct mtk_nfc *nfc, int addr)
> +{
> +	struct device *dev = nfc->dev;
> +	u32 val;
> +	int ret;
> +
> +	nfi_writel(nfc, addr, NFI_COLADDR);
> +	nfi_writel(nfc, 0, NFI_ROWADDR);
> +	nfi_writew(nfc, 1, NFI_ADDRNOB);
> +
> +	ret = readl_poll_timeout_atomic(nfc->regs + NFI_STA, val,
> +					!(val & STA_ADDR), 10, MTK_TIMEOUT);
> +	if (ret) {
> +		dev_warn(dev, "nfi core timed out entering address mode\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	u32 fmt, spare = mtk_nand->spare_per_sector;
> +	struct mtk_ecc_config config;
> +
> +	/* skip configuration when recognize NAND Flash */
> +	if (!mtd->writesize)
> +		return 0;
> +
> +	switch (mtd->writesize) {
> +	case 512:
> +		fmt = PAGEFMT_512_2K | PAGEFMT_SEC_SEL_512;
> +		break;
> +	case KB(2):
> +		fmt = PAGEFMT_512_2K;
> +		break;
> +	case KB(4):
> +		fmt = PAGEFMT_2K_4K;
> +		break;
> +	case KB(8):
> +		fmt = PAGEFMT_4K_8K;
> +		break;
> +	default:
> +		dev_err(nfc->dev, "invalid page len: %d\n", mtd->writesize);
> +		return -EINVAL;
> +	}
> +
> +	if (mtd->writesize > 512)
> +		spare >>= 1;
> +
> +	switch (spare) {
> +	case 16:
> +		fmt |= (PAGEFMT_SPARE_16 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	case 28:
> +		fmt |= (PAGEFMT_SPARE_28 << PAGEFMT_SPARE_SHIFT);
> +		break;
> +	default:
> +		break;
> +	}
> +	fmt |= NFI_FDM_REG_SIZE << PAGEFMT_FDM_SHIFT;
> +	fmt |= NFI_FDM_REG_SIZE << PAGEFMT_FDM_ECC_SHIFT;
> +	nfi_writew(nfc, fmt, NFI_PAGEFMT);
> +
> +	config.step_len = mtk_step_len(chip);
> +	config.strength = chip->ecc.strength;
> +	mtk_ecc_config(nfc->ecc, &config);

If you follow my suggestion to add a lock to the ECC engine, then
mtk_ecc_config() should only be called after you've acquired this lock
(i.e. after calling mtk_ecc_enable_{encoder/decoder}()), and thus
should be moved in your ecc->{read,write}_page() implementations.

If you want to avoid those conversions on each NAND operations, just
store a copy of mtk_ecc_config into your mtk_nfc_nand_chip struct.

> +
> +	return 0;
> +}
> +

[...]

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
> +		nfi_writel(nfc, reg, NFI_CON);
> +
> +		/* trigger to fetch data */
> +		nfi_writew(nfc, STAR_EN, NFI_STRDATA);
> +
> +		/* hardware issue work around:
> +		 * The first byte of data may be wrong right after the trigger.
> +		 * (The controller fetches data until the internal FIFO is full)

If this is an erratum and is clearly identified in the datasheet, then
you should mention the reference and quote the datasheet.
It looks like a bad timing configuration to me, but I might be wrong.

> +		 */
> +		udelay(10);
> +	}
> +
> +	mtk_nfc_wait_ioready(nfc);
> +
> +	return nfi_readb(nfc, NFI_DATAR);
> +}
> +

[...]

> +
> +static int mtk_nfc_block_markbad(struct mtd_info *mtd, loff_t ofs)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	u8 *buf = chip->buffers->databuf;
> +	int page, rc, i;
> +
> +	memset(buf, 0x00, mtd->writesize + mtd->oobsize);
> +
> +	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
> +		ofs += mtd->erasesize - mtd->writesize;
> +
> +	i = 0;
> +	do {
> +		page = (int)(ofs >> chip->page_shift);
> +		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
> +		rc = mtk_nfc_write_page(mtd, chip, buf, 0, page, 1);
> +		if (rc < 0)
> +			return rc;
> +
> +		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +		rc = chip->waitfunc(mtd, chip);
> +		rc = rc & NAND_STATUS_FAIL ? -EIO : 0;
> +		if (rc < 0)
> +			return rc;
> +
> +		ofs += mtd->writesize;
> +		i++;
> +
> +	} while ((chip->bbt_options & NAND_BBT_SCAN2NDPAGE) && i < 2);
> +
> +	return 0;
> +}

Why do you need this custom implementation?

[...]

> +
> +static int mtk_nfc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
> +				int page)
> +{
> +	u8 *buf = chip->buffers->databuf;
> +	struct mtd_ecc_stats stats;
> +	int ret;
> +
> +	stats = mtd->ecc_stats;
> +
> +	memset(buf, 0xff, mtd->writesize);
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> +
> +	ret = mtk_nfc_read_page_hwecc(mtd, chip, buf, 1, page);
> +
> +	/* mark as invalid data 0x00 if UECC happens */
> +	if ((mtd->ecc_stats.failed - stats.failed) > 0)
> +		memset(chip->oob_poi, 0, mtd->oobsize);

No, please leave the data as is. That's really useful to debug things.

> +
> +	if (ret < mtd->bitflip_threshold)
> +		mtd->ecc_stats.corrected = stats.corrected;

Hm, ->corrected has already been updated by mtk_nfc_read_page_hwecc(),
or am I missing something?
Moreover, you should have mtd->ecc_stats.corrected += stats.corrected.

> +
> +	return ret;
> +}
> +

[...]


> +
> +static int mtk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
> +				struct mtd_oob_region *oob_region)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	oob_region->length = NFI_FDM_REG_SIZE * chip->ecc.steps;

Is NFI_FDM_REG_SIZE really fixed to 8, or does it depend on the
spare_per_sector and ecc->bytes information?

> +	oob_region->offset = 0;
> +
> +	return 0;
> +}
> +

[...]

> +static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
> +				struct device_node *np)
> +{
> +	struct mtk_nfc_nand_chip *chip;
> +	struct nand_chip *nand;
> +	struct mtd_info *mtd;
> +	int nsels, len;
> +	u32 tmp;
> +	int ret;
> +	int i;
> +
> +	if (!of_get_property(np, "reg", &nsels))
> +		return -ENODEV;
> +
> +	nsels /= sizeof(u32);
> +	if (!nsels || nsels > MTK_NAND_MAX_NSELS) {
> +		dev_err(dev, "invalid reg property size %d\n", nsels);
> +		return -EINVAL;
> +	}
> +
> +	chip = devm_kzalloc(dev,
> +			sizeof(*chip) + nsels * sizeof(u8), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->nsels = nsels;
> +	for (i = 0; i < nsels; i++) {
> +		ret = of_property_read_u32_index(np, "reg", i, &tmp);
> +		if (ret) {
> +			dev_err(dev, "reg property failure : %d\n", ret);
> +			return ret;
> +		}
> +		chip->sels[i] = tmp;
> +	}
> +
> +	if (of_property_read_u32(np, "spare_per_sector",
> +						&chip->spare_per_sector)) {

As already discussed on IRC, this should be deduced from the NAND page
info retrieved in nand_scan_ident().

> +		dev_err(dev, "missing spare_per_sector property in DT\n");
> +		return -ENODEV;
> +
> +	}
> +
> +	nand = &chip->nand;
> +	nand->controller = &nfc->controller;
> +
> +	nand_set_flash_node(nand, np);
> +	nand_set_controller_data(nand, nfc);
> +
> +	nand->options |= NAND_USE_BOUNCE_BUFFER | NAND_SUBPAGE_READ;
> +	nand->block_markbad = mtk_nfc_block_markbad;
> +	nand->dev_ready = mtk_nfc_dev_ready;
> +	nand->select_chip = mtk_nfc_select_chip;
> +	nand->write_byte = mtk_nfc_write_byte;
> +	nand->write_buf = mtk_nfc_write_buf;
> +	nand->read_byte = mtk_nfc_read_byte;
> +	nand->read_buf = mtk_nfc_read_buf;
> +	nand->cmd_ctrl = mtk_nfc_cmd_ctrl;
> +
> +	/* set default mode in case dt entry is missing */
> +	nand->ecc.mode = NAND_ECC_HW;
> +
> +	nand->ecc.write_subpage = mtk_nfc_write_subpage_hwecc;
> +	nand->ecc.write_page_raw = mtk_nfc_write_page_raw;
> +	nand->ecc.write_page = mtk_nfc_write_page_hwecc;
> +	nand->ecc.write_oob_raw = mtk_nfc_write_oob_raw;
> +	nand->ecc.write_oob = mtk_nfc_write_oob;
> +
> +	nand->ecc.read_subpage = mtk_nfc_read_subpage_hwecc;
> +	nand->ecc.read_page_raw = mtk_nfc_read_page_raw;
> +	nand->ecc.read_oob_raw = mtk_nfc_read_oob_raw;
> +	nand->ecc.read_page = mtk_nfc_read_page_hwecc;
> +	nand->ecc.read_oob = mtk_nfc_read_oob;
> +
> +	mtd = nand_to_mtd(nand);
> +	mtd->owner = THIS_MODULE;
> +	mtd->dev.parent = dev;
> +	mtd->name = MTK_NAME;
> +	mtd_set_ooblayout(mtd, &mtk_nfc_ooblayout_ops);
> +
> +	mtk_nfc_hw_init(nfc);
> +
> +	ret = nand_scan_ident(mtd, nsels, NULL);
> +	if (ret)
> +		return -ENODEV;
> +
> +	/* TODO: add NAND_ECC_SOFT */
> +	if (nand->ecc.mode != NAND_ECC_HW) {
> +		dev_err(dev, "driver only supports NAND_ECC_HW\n");
> +		return -ENODEV;
> +	}

Do you really support all kind of NANDs (even small and very large pages
NANDs). IMHO, it's safer to do a check after nand_scan_ident(), to
verify that your implementation support the chip requirements...

> +
> +	ret = nand_scan_tail(mtd);
> +	if (ret)
> +		return -ENODEV;
> +
> +	len = mtd->writesize + mtd->oobsize;
> +	nfc->buffer = devm_kzalloc(dev, len, GFP_KERNEL);
> +	if (!nfc->buffer)
> +		return  -ENOMEM;
> +
> +	ret = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
> +	if (ret) {
> +		dev_err(dev, "mtd parse partition error\n");
> +		nand_release(mtd);
> +		return ret;
> +	}
> +
> +	list_add_tail(&chip->node, &nfc->chips);
> +
> +	return 0;
> +}
> +

I tried to carefully review most of the driver, but I may have missed a
few things. Richard, Brian, if you have some time, could you please
have look?

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
