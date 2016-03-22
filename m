Date: Tue, 22 Mar 2016 17:58:50 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [RFCv2: PATCH 2/2] mtd: mediatek: driver for MTK Smart Device
 Gen1 NAND
Message-ID: <20160322175850.2722c389@bbrezillon>
In-Reply-To: <1458653560-2679-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1458653560-2679-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1458653560-2679-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
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

On Tue, 22 Mar 2016 09:32:40 -0400
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> This patch adds support for mediatek's SDG1 NFC nand controller
> embedded in SoC 2701.
> 
> UBIFS support has been successfully tested.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/mtd/nand/Kconfig            |    7 +
>  drivers/mtd/nand/Makefile           |    1 +
>  drivers/mtd/nand/mtksdg1_ecc.c      |  446 +++++++++++++
>  drivers/mtd/nand/mtksdg1_ecc.h      |   62 ++
>  drivers/mtd/nand/mtksdg1_ecc_regs.h |   76 +++
>  drivers/mtd/nand/mtksdg1_nand.c     | 1225 +++++++++++++++++++++++++++++++++++
>  drivers/mtd/nand/mtksdg1_nfi_regs.h |  121 ++++
>  7 files changed, 1938 insertions(+)
>  create mode 100644 drivers/mtd/nand/mtksdg1_ecc.c
>  create mode 100644 drivers/mtd/nand/mtksdg1_ecc.h
>  create mode 100644 drivers/mtd/nand/mtksdg1_ecc_regs.h
>  create mode 100644 drivers/mtd/nand/mtksdg1_nand.c
>  create mode 100644 drivers/mtd/nand/mtksdg1_nfi_regs.h

Please put the definitions in xxx_reg.h directly into the relevant .c
files (unless you need to access them from somewhere else).

> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index f05e0e9..4ab9d1e 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -563,4 +563,11 @@ config MTD_NAND_QCOM
>  	  Enables support for NAND flash chips on SoCs containing the EBI2 NAND
>  	  controller. This controller is found on IPQ806x SoC.
>  
> +config MTD_NAND_MTKSDG1
> +	tristate "Support for NAND controller on MTK Smart Device SoCs"
> +	depends on HAS_DMA
> +	help
> +	  Enables support for NAND controller on MTK Smart Device SoCs. This
> +	  controller is found on MTK 2701SoC.
> +
>  endif # MTD_NAND
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index f553353..33aa52f 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -57,5 +57,6 @@ obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
>  obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
>  obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
>  obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
> +obj-$(CONFIG_MTD_NAND_MTKSDG1)          += mtksdg1_nand.o mtksdg1_ecc.o
>  
>  nand-objs := nand_base.o nand_bbt.o nand_timings.o
> diff --git a/drivers/mtd/nand/mtksdg1_ecc.c b/drivers/mtd/nand/mtksdg1_ecc.c
> new file mode 100644
> index 0000000..d6de088
> --- /dev/null
> +++ b/drivers/mtd/nand/mtksdg1_ecc.c
> @@ -0,0 +1,446 @@
> +/*
> + * MTK smart device ECC  controller driver.
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
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/module.h>
> +#include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +
> +#include "mtksdg1_ecc_regs.h"
> +#include "mtksdg1_ecc.h"
> +
> +#define ECC_TIMEOUT		(500000)
> +#define MTK_ECC_PARITY_BITS	(14)
> +
> +struct sdg1_pm_regs {
> +	u32 enccnfg;
> +	u32 deccnfg;
> +};
> +
> +struct sdg1_ecc {
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct mutex lock;
> +	struct clk *clk;
> +
> +	struct completion done;
> +	u32 sec_mask;
> +
> +	struct sdg1_ecc_if intf;

As explained later, you can completely drop this field.

> +
> +#ifdef CONFIG_PM_SLEEP
> +	struct sdg1_pm_regs pm_regs;
> +#endif
> +
> +};
> +
> +static inline void sdg1_ecc_encoder_idle(struct sdg1_ecc *ecc)
> +{
> +	struct device *dev = ecc->dev;
> +	u32 val;
> +	int ret;
> +
> +	ret = readl_poll_timeout_atomic(ecc->regs + MTKSDG1_ECC_ENCIDLE, val,
> +					val & ENC_IDLE, 10, ECC_TIMEOUT);
> +	if (ret)
> +		dev_warn(dev, "encoder NOT idle\n");
> +}
> +
> +static inline void sdg1_ecc_decoder_idle(struct sdg1_ecc *ecc)
> +{
> +	struct device *dev = ecc->dev;
> +	u32 val;
> +	int ret;
> +
> +	ret = readl_poll_timeout_atomic(ecc->regs + MTKSDG1_ECC_DECIDLE, val,
> +					val & DEC_IDLE, 10, ECC_TIMEOUT);
> +	if (ret)
> +		dev_warn(dev, "decoder NOT idle\n");
> +}
> +
> +static irqreturn_t sdg1_ecc_irq(int irq, void *id)
> +{
> +	struct sdg1_ecc *ecc = id;
> +	u32 dec, enc;
> +
> +	dec = readw(ecc->regs + MTKSDG1_ECC_DECIRQ_STA) & DEC_IRQEN;
> +	enc = readl(ecc->regs + MTKSDG1_ECC_ENCIRQ_STA) & ENC_IRQEN;
> +
> +	if (!(dec || enc))
> +		return IRQ_NONE;
> +
> +	if (dec) {
> +		dec = readw(ecc->regs + MTKSDG1_ECC_DECDONE);
> +		if (dec & ecc->sec_mask) {
> +			ecc->sec_mask = 0;
> +			complete(&ecc->done);
> +			writew(0, ecc->regs + MTKSDG1_ECC_DECIRQ_EN);
> +		}
> +	} else {
> +		complete(&ecc->done);
> +		writel(0, ecc->regs + MTKSDG1_ECC_ENCIRQ_EN);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +

Extra blank line (checkpatch should complain about that).

> +static int sdg1_ecc_check(struct sdg1_ecc_if *ecc_if, struct mtd_info *mtd,
> +			u32 sectors)
> +{
> +	struct sdg1_ecc *ecc = container_of(ecc_if, struct sdg1_ecc, intf);
> +	u32 offset, i, err;
> +	u32 bitflips = 0;
> +
> +	for (i = 0; i < sectors; i++) {
> +		offset = (i >> 2) << 2;
> +		err = readl(ecc->regs + MTKSDG1_ECC_DECENUM0 + offset);
> +		err = err >> ((i % 4) * 8);
> +		err &= ERR_MASK;
> +		if (err == ERR_MASK) {
> +			/* uncorrectable errors */
> +			mtd->ecc_stats.failed++;
> +			continue;
> +		}
> +
> +		mtd->ecc_stats.corrected += err;
> +		bitflips = max_t(u32, bitflips, err);
> +	}
> +
> +	return bitflips;
> +}

This should be done in your NAND driver. The engine is just here to
fix some bitflips in a buffer, and report the number of fixed bits (or
an error if it's uncorrectable).

> +
> +static void sdg1_ecc_release(struct sdg1_ecc_if *ecc_if)
> +{
> +	struct sdg1_ecc *ecc = container_of(ecc_if, struct sdg1_ecc, intf);
> +
> +	clk_disable_unprepare(ecc->clk);
> +	put_device(ecc->dev);
> +}
> +
> +static struct sdg1_ecc_if *sdg1_ecc_get(struct device_node *np)
> +{
> +	struct platform_device *pdev;
> +	struct sdg1_ecc *ecc;
> +
> +	pdev = of_find_device_by_node(np);
> +	if (!pdev || !platform_get_drvdata(pdev))
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	get_device(&pdev->dev);
> +	ecc = platform_get_drvdata(pdev);
> +
> +	clk_prepare_enable(ecc->clk);
> +	ecc->dev = &pdev->dev;

ecc->dev should be assigned in ->probe().

> +
> +	return &ecc->intf;
> +}
> +
> +struct sdg1_ecc_if *of_sdg1_ecc_get(struct device_node *of_node)
> +{
> +	struct sdg1_ecc_if *ecc_if = NULL;
> +	struct device_node *np;
> +
> +	np = of_parse_phandle(of_node, "mediatek,ecc-controller", 0);
> +	if (np) {
> +		ecc_if = sdg1_ecc_get(np);
> +		of_node_put(np);
> +	}
> +
> +	return ecc_if;
> +}
> +EXPORT_SYMBOL(of_sdg1_ecc_get);
> +
> +static void sdg1_ecc_control(struct sdg1_ecc_if *ecc_if,
> +				enum sdg1_ecc_ctrl ctrl, int arg)
> +{
> +	struct sdg1_ecc *ecc = container_of(ecc_if, struct sdg1_ecc, intf);
> +	int sectors;
> +
> +	switch (ctrl) {
> +	case enable_encoder:
> +		sdg1_ecc_encoder_idle(ecc);
> +		writew(ENC_EN, ecc->regs + MTKSDG1_ECC_ENCCON);
> +		break;
> +	case disable_encoder:
> +		writew(0, ecc->regs + MTKSDG1_ECC_ENCIRQ_EN);
> +		sdg1_ecc_encoder_idle(ecc);
> +		writew(ENC_DE, ecc->regs + MTKSDG1_ECC_ENCCON);
> +		break;
> +	case enable_decoder:
> +		sdg1_ecc_decoder_idle(ecc);
> +		writel(DEC_EN, ecc->regs + MTKSDG1_ECC_DECCON);
> +		break;
> +	case disable_decoder:
> +		writew(0, ecc->regs + MTKSDG1_ECC_DECIRQ_EN);
> +		sdg1_ecc_decoder_idle(ecc);
> +		writel(DEC_DE, ecc->regs + MTKSDG1_ECC_DECCON);
> +		break;
> +	case start_decoder:
> +		sectors = arg;
> +		ecc->sec_mask = 1 << (sectors - 1);
> +		init_completion(&ecc->done);
> +		writew(DEC_IRQEN, ecc->regs + MTKSDG1_ECC_DECIRQ_EN);
> +		break;
> +	}
> +}

Since there's nothing common to these different modes, I think you
should get rid of this function and expose a set of functions instead
(enable/disable_encoder/decoder(), ...).

> +
> +static int sdg1_ecc_decode(struct sdg1_ecc_if *ecc_if)
> +{
> +	struct sdg1_ecc *ecc = container_of(ecc_if, struct sdg1_ecc, intf);
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
> +
> +static int sdg1_ecc_encode(struct sdg1_ecc_if *ecc_if, struct sdg1_enc_data *d)
> +{
> +	struct sdg1_ecc *ecc = container_of(ecc_if, struct sdg1_ecc, intf);
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
> +	reg = readl(ecc->regs + MTKSDG1_ECC_ENCCNFG) & ~ECC_ENC_MODE_MASK;
> +	reg |= ECC_DMA_MODE;
> +	writel(reg, ecc->regs + MTKSDG1_ECC_ENCCNFG);
> +
> +	writel(ENC_IRQEN, ecc->regs + MTKSDG1_ECC_ENCIRQ_EN);
> +	writel(lower_32_bits(addr), ecc->regs + MTKSDG1_ECC_ENCDIADDR);
> +
> +	init_completion(&ecc->done);
> +	writew(ENC_EN, ecc->regs + MTKSDG1_ECC_ENCCON);
> +
> +	rc = wait_for_completion_timeout(&ecc->done, msecs_to_jiffies(500));
> +	if (!rc) {
> +		dev_err(ecc->dev, "encode timeout\n");
> +		writel(0, ecc->regs + MTKSDG1_ECC_ENCIRQ_EN);
> +		ret = -ETIMEDOUT;
> +		goto timeout;
> +	}
> +
> +	sdg1_ecc_encoder_idle(ecc);
> +
> +	/* Program ECC bytes to OOB: per sector oob = FDM + ECC + SPARE */
> +	len = (d->strength * MTK_ECC_PARITY_BITS + 7) >> 3;
> +	p = (u32 *) (d->data + d->len);
> +
> +	/* write the parity bytes generated by the ECC back to the OOB region */
> +	for (i = 0; i < len; i++)
> +		p[i] = readl(ecc->regs + MTKSDG1_ECC_ENCPAR0 + i * sizeof(u32));
> +
> +timeout:
> +
> +	dma_unmap_single(ecc->dev, addr, d->len, DMA_TO_DEVICE);
> +
> +	writew(0, ecc->regs + MTKSDG1_ECC_ENCCON);
> +	reg = readl(ecc->regs + MTKSDG1_ECC_ENCCNFG) & ~ECC_ENC_MODE_MASK;
> +	reg |= ECC_NFI_MODE;
> +	writel(reg, ecc->regs + MTKSDG1_ECC_ENCCNFG);
> +
> +	return ret;
> +}
> +
> +static void sdg1_ecc_hw_init(struct sdg1_ecc_if *ecc_if)
> +{
> +	struct sdg1_ecc *ecc = container_of(ecc_if, struct sdg1_ecc, intf);
> +
> +	sdg1_ecc_encoder_idle(ecc);
> +	writew(ENC_DE, ecc->regs + MTKSDG1_ECC_ENCCON);
> +
> +	sdg1_ecc_decoder_idle(ecc);
> +	writel(DEC_DE, ecc->regs + MTKSDG1_ECC_DECCON);
> +}

Not sure you need to export this function. It can be part of the
sdg1_ecc_get() function.

> +
> +static int sdg1_ecc_config(struct sdg1_ecc_if *ecc_if, struct mtd_info *mtd,
> +				unsigned len)

Please rename len into something more meaningful, like ecc_step_size.

> +{
> +	struct sdg1_ecc *ecc = container_of(ecc_if, struct sdg1_ecc, intf);
> +	struct nand_chip *chip = mtd_to_nand(mtd);

Nope, ecc_strength should be passed through a driver specific struct,
instead of passing mtd_info.

> +	u32 ecc_bit, dec_sz, enc_sz;
> +	u32 reg;
> +
> +	switch (chip->ecc.strength) {
> +	case 4:
> +		ecc_bit = ECC_CNFG_4BIT;
> +		break;
> +	case 12:
> +		ecc_bit = ECC_CNFG_12BIT;
> +		break;
> +	case 24:
> +		ecc_bit = ECC_CNFG_24BIT;
> +		break;
> +	default:
> +		dev_err(ecc->dev, "invalid spare len per sector\n");
> +		return -EINVAL;
> +	}
> +
> +	/* configure ECC encoder (in bits) */
> +	enc_sz = len << 3;
> +	reg = ecc_bit | ECC_NFI_MODE | (enc_sz << ECC_MS_SHIFT);
> +	writel(reg, ecc->regs + MTKSDG1_ECC_ENCCNFG);
> +
> +	/* configure ECC decoder (in bits) */
> +	dec_sz = enc_sz + chip->ecc.strength * MTK_ECC_PARITY_BITS;
> +	reg = ecc_bit | ECC_NFI_MODE | (dec_sz << ECC_MS_SHIFT);
> +	reg |= DEC_CNFG_CORRECT | DEC_EMPTY_EN;
> +	writel(reg, ecc->regs + MTKSDG1_ECC_DECCNFG);
> +
> +	return 0;
> +}
> +
> +static int sdg1_ecc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sdg1_ecc *ecc;
> +	struct resource *res;
> +	int irq, ret;
> +
> +	ecc = devm_kzalloc(dev, sizeof(*ecc), GFP_KERNEL);
> +	if (!ecc)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	ecc->regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(ecc->regs)) {
> +		dev_err(dev, "failed to map regs: %ld\n", PTR_ERR(ecc->regs));
> +		return PTR_ERR(ecc->regs);
> +	}
> +
> +	ecc->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(ecc->clk)) {
> +		dev_err(dev, "failed to get clock: %ld\n", PTR_ERR(ecc->clk));
> +		return PTR_ERR(ecc->clk);
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(dev, "failed to get irq\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = dma_set_mask(dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(dev, "failed to set DMA mask\n");
> +		return ret;
> +	}
> +
> +	ret = devm_request_irq(dev, irq, sdg1_ecc_irq, 0x0, "sdg1-ecc", ecc);
> +	if (ret) {
> +		dev_err(dev, "failed to request irq\n");
> +		return -EINVAL;
> +	}
> +
> +	mutex_init(&ecc->lock);
> +
> +	ecc->dev = dev;
> +
> +	ecc->intf.control = sdg1_ecc_control;
> +	ecc->intf.release = sdg1_ecc_release;
> +	ecc->intf.config = sdg1_ecc_config;
> +	ecc->intf.decode = sdg1_ecc_decode;
> +	ecc->intf.encode = sdg1_ecc_encode;
> +	ecc->intf.init = sdg1_ecc_hw_init;
> +	ecc->intf.check = sdg1_ecc_check;
> +
> +	platform_set_drvdata(pdev, ecc);
> +
> +	dev_info(dev, "driver probed\n");
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int sdg1_ecc_suspend(struct device *dev)
> +{
> +	struct sdg1_ecc *ecc = dev_get_drvdata(dev);
> +	struct sdg1_pm_regs *regs = &ecc->pm_regs;
> +
> +	regs->enccnfg = readl(ecc->regs + MTKSDG1_ECC_ENCCNFG);
> +	regs->deccnfg = readl(ecc->regs + MTKSDG1_ECC_DECCNFG);
> +
> +	clk_disable_unprepare(ecc->clk);
> +
> +	return 0;
> +}
> +
> +static int sdg1_ecc_resume(struct device *dev)
> +{
> +	struct sdg1_ecc *ecc = dev_get_drvdata(dev);
> +	struct sdg1_pm_regs *regs = &ecc->pm_regs;
> +	int ret;
> +
> +	ret = clk_prepare_enable(ecc->clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clk\n");
> +		return ret;
> +	}
> +
> +	writel(regs->enccnfg, ecc->regs + MTKSDG1_ECC_ENCCNFG);
> +	writel(regs->deccnfg, ecc->regs + MTKSDG1_ECC_DECCNFG);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(sdg1_ecc_pm_ops, sdg1_ecc_suspend, sdg1_ecc_resume);
> +#endif
> +
> +static const struct of_device_id sdg1_ecc_dt_match[] = {
> +	{ .compatible = "mediatek,mt2701-ecc" },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, sdg1_ecc_dt_match);
> +
> +static struct platform_driver sdg1_ecc_driver = {
> +	.probe  = sdg1_ecc_probe,
> +	.driver = {
> +		.name  = "mtksdg1-ecc",
> +		.of_match_table = of_match_ptr(sdg1_ecc_dt_match),
> +#ifdef CONFIG_PM_SLEEP
> +		.pm = &sdg1_ecc_pm_ops,
> +#endif
> +
> +	},
> +};
> +
> +module_platform_driver(sdg1_ecc_driver);
> +
> +MODULE_AUTHOR("Xiaolei Li <xiaolei.li@mediatek.com>");
> +MODULE_AUTHOR("Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>");
> +MODULE_DESCRIPTION("MTK Nand ECC Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mtd/nand/mtksdg1_ecc.h b/drivers/mtd/nand/mtksdg1_ecc.h
> new file mode 100644
> index 0000000..4261b35
> --- /dev/null
> +++ b/drivers/mtd/nand/mtksdg1_ecc.h
> @@ -0,0 +1,62 @@
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
> +#ifndef __DRIVERS_MTD_NAND_MTKSDG1_ECC_H__
> +#define __DRIVERS_MTD_NAND_MTKSDG1_ECC_H__
> +
> +#include <linux/types.h>
> +
> +struct sdg1_ecc_if;
> +struct device_node;
> +struct nand_chip;
> +struct mtd_info;
> +struct device;
> +
> +enum sdg1_ecc_ctrl {
> +	disable_encoder,
> +	disable_decoder,
> +	enable_encoder,
> +	enable_decoder,
> +	start_decoder
> +};

Enum values are usually defined in upper case.

> +
> +/**
> + * @len: number of bytes in the data buffer
> + * @data: pointer to memory holding the data
> + * @strength: number of correctable bits
> + */
> +struct sdg1_enc_data {
> +	unsigned len;
> +	int strength;
> +	u8 *data;
> +};
> +
> +typedef int (*config) (struct sdg1_ecc_if *, struct mtd_info *, unsigned);
> +typedef int (*encode)(struct sdg1_ecc_if *, struct sdg1_enc_data *);
> +typedef void (*control)(struct sdg1_ecc_if *, enum sdg1_ecc_ctrl, int);
> +typedef int (*check)(struct sdg1_ecc_if *, struct mtd_info *, u32);

Try to keep ECC engine functions MTD/NAND agnostic. If they need some
NAND related info, then put them into engine specific struct (sdg1_data
?).

> +typedef void (*release)(struct sdg1_ecc_if *);
> +typedef int (*decode)(struct sdg1_ecc_if *);
> +typedef void (*init) (struct sdg1_ecc_if *);
> +
> +struct sdg1_ecc_if {
> +	release	release;
> +	control control;
> +	config config;
> +	encode encode;
> +	decode decode;
> +	check check;
> +	init init;
> +};
> +
> +struct sdg1_ecc_if *of_sdg1_ecc_get(struct device_node *);

I think you should directly return a pointer to the sdg1_ecc instance
here.
AFAICS, the "interface" appraoch is useless, all you need is a set of
exported functions, which all takes the sdg1_ecc pointer as a first
argument and a set of extra arguments depending on the function.
See what's done in the jz4780_bch.c driver.

> +
> +#endif
> diff --git a/drivers/mtd/nand/mtksdg1_ecc_regs.h b/drivers/mtd/nand/mtksdg1_ecc_regs.h
> new file mode 100644
> index 0000000..65ccd05
> --- /dev/null
> +++ b/drivers/mtd/nand/mtksdg1_ecc_regs.h
> @@ -0,0 +1,76 @@
> +/*
> + * MTK smart device ECC engine register.
> + * Copyright (C) 2015-2016 MediaTek Inc.
> + * Author: Xiaolei.Li <xiaolei.li@mediatek.com>
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
> +#ifndef MTKSDG1_ECC_REGS_H
> +#define MTKSDG1_ECC_REGS_H
> +
> +/* ECC engine register definition */
> +#define MTKSDG1_ECC_ENCCON		(0x00)
> +#define		ENC_EN			(1)
> +#define		ENC_DE			(0)
> +
> +#define MTKSDG1_ECC_ENCCNFG		(0x04)
> +#define		ECC_CNFG_4BIT		(0)
> +#define		ECC_CNFG_12BIT		(4)
> +#define		ECC_CNFG_24BIT		(10)
> +#define		ECC_NFI_MODE		BIT(5)
> +#define		ECC_DMA_MODE		(0)
> +#define		ECC_ENC_MODE_MASK	(0x3 << 5)
> +#define		ECC_MS_SHIFT		(16)
> +
> +#define MTKSDG1_ECC_ENCDIADDR		(0x08)
> +
> +#define MTKSDG1_ECC_ENCIDLE		(0x0C)
> +#define		ENC_IDLE		BIT(0)
> +
> +#define MTKSDG1_ECC_ENCPAR0		(0x10)
> +#define MTKSDG1_ECC_ENCSTA		(0x7C)
> +
> +#define MTKSDG1_ECC_ENCIRQ_EN		(0x80)
> +#define		ENC_IRQEN		BIT(0)
> +
> +#define MTKSDG1_ECC_ENCIRQ_STA		(0x84)
> +
> +#define MTKSDG1_ECC_DECCON		(0x100)
> +#define		DEC_EN			(1)
> +#define		DEC_DE			(0)
> +
> +#define MTKSDG1_ECC_DECCNFG		(0x104)
> +#define		DEC_EMPTY_EN		BIT(31)
> +#define		DEC_CNFG_FER		(0x1 << 12)
> +#define		DEC_CNFG_EL		(0x2 << 12)
> +#define		DEC_CNFG_CORRECT	(0x3 << 12)
> +
> +#define MTKSDG1_ECC_DECIDLE		(0x10C)
> +#define		DEC_IDLE		BIT(0)
> +
> +#define MTKSDG1_ECC_DECFER		(0x110)
> +
> +#define MTKSDG1_ECC_DECENUM0		(0x114)
> +#define		ERR_MASK		(0x3f)
> +
> +#define MTKSDG1_ECC_DECDONE		(0x124)
> +
> +#define MTKSDG1_ECC_DECEL0		(0x128)
> +
> +#define MTKSDG1_ECC_DECIRQ_EN		(0x200)
> +#define		DEC_IRQEN		BIT(0)
> +
> +#define MTKSDG1_ECC_DECIRQ_STA		(0x204)
> +
> +#define MTKSDG1_ECC_DECFSM		(0x208)
> +#define		DECFSM_MASK		(0x7f0f0f0f)
> +#define		DECFSM_IDLE		(0x01010101)
> +#endif
> diff --git a/drivers/mtd/nand/mtksdg1_nand.c b/drivers/mtd/nand/mtksdg1_nand.c
> new file mode 100644
> index 0000000..3f50c29
> --- /dev/null
> +++ b/drivers/mtd/nand/mtksdg1_nand.c
> @@ -0,0 +1,1225 @@
> +/*
> + * MTK smart device NAND Flash controller driver.
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
> +#include <linux/of_mtd.h>
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/module.h>
> +#include <linux/iopoll.h>
> +
> +#include "mtksdg1_nfi_regs.h"
> +#include "mtksdg1_ecc.h"
> +
> +#define MTK_NAME		"mtksdg1-nand"
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
> +struct mtk_nfc_saved_reg {
> +	u32 emp_thresh;
> +	u16 pagefmt;
> +	u32 acccon;
> +	u16 cnrnb;
> +	u16 csel;
> +};
> +
> +struct mtk_nfc_nand_chip {
> +	struct list_head node;
> +	struct nand_chip nand;
> +	int nsels;
> +	u8 sels[0];

Woh, that's not correct. When you define a field like that it has to be
at the end of the struct, otherwise ->sels just points to ->sparesize,
and you'll end-up with a memory corruption.

> +	u32 sparesize;
> +};
> +
> +struct mtk_nfc {
> +	struct nand_hw_control controller;
> +	struct sdg1_ecc_if *ecc;
> +	struct mtk_nfc_clk clk;
> +
> +	struct device *dev;
> +	void __iomem *regs;
> +
> +	struct completion done;
> +	struct list_head chips;
> +
> +	bool switch_oob;
> +	u8 *buffer;
> +
> +#ifdef CONFIG_PM_SLEEP
> +	struct mtk_nfc_saved_reg saved_reg;
> +#endif
> +};
> +
> +static inline struct mtk_nfc_nand_chip *to_mtk_nand(struct nand_chip *nand)
> +{
> +	return container_of(nand, struct mtk_nfc_nand_chip, nand);
> +}
> +
> +static inline int data_len(struct nand_chip *chip)
> +{
> +	return chip->ecc.size;
> +}
> +
> +static inline int sdg1_oob_len(void)

Hm, the name of this function is not really representing what it
returns.
AFAIU, MTKSDG1_NFI_FDM_REG_SIZE represents the number of free OOB bytes
you have per data chunk.
If that's the case, then sdg1_oob_bytes_per_chunk() would be more
appropriate.

> +{
> +	return MTKSDG1_NFI_FDM_REG_SIZE;
> +}
> +
> +static inline uint8_t *data_ptr(struct nand_chip *chip, const uint8_t *p, int i)
> +{
> +	return (uint8_t *) p + i * data_len(chip);
> +}
> +
> +static inline uint8_t *oob_ptr(struct nand_chip *chip, int i)
> +{
> +	return chip->oob_poi + i * sdg1_oob_len();
> +}
> +
> +static inline int sdg1_data_len(struct nand_chip *chip)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +
> +	return data_len(chip) + mtd->oobsize / chip->ecc.steps;

That looks risky to assume ->oobsize will always be a multiple of
ecc->steps.
AFAIU, you have 1k of data + 8 free oob bytes per chunk, so if you're
trying to return the sum of those 2 elements here it should be:

ecc->size + MTKSDG1_NFI_FDM_REG_SIZE.

And IIUC, this function should be renamed too.

> +}
> +
> +static inline uint8_t *sdg1_data_ptr(struct nand_chip *chip,  int i)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +
> +	return nfc->buffer + i * sdg1_data_len(chip);
> +}
> +
> +static inline uint8_t *sdg1_oob_ptr(struct nand_chip *chip, int i)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +
> +	return nfc->buffer + i * sdg1_data_len(chip) + data_len(chip);
> +}
> +
> +static inline int sdg1_step_len(struct nand_chip *chip)
> +{
> +	/* CRC protected per step */
> +	return data_len(chip) + sdg1_oob_len();

And according to this function, I was wrong about sdg1_data_len(). So,
in the end sdg1_data_len() should just return ecc->size (and you'll
have to set ecc->size to the appropriate value).

> +}
> +
> +/* NFI register access */
> +static inline void sdg1_writel(struct mtk_nfc *nfc, u32 val, u32 reg)
> +{
> +	writel(val, nfc->regs + reg);
> +}
> +static inline void sdg1_writew(struct mtk_nfc *nfc, u16 val, u32 reg)
> +{
> +	writew(val, nfc->regs + reg);
> +}

Missing blank lines.

> +static inline void sdg1_writeb(struct mtk_nfc *nfc, u8 val, u32 reg)
> +{
> +	writeb(val, nfc->regs + reg);
> +}
> +static inline u32 sdg1_readl(struct mtk_nfc *nfc, u32 reg)
> +{
> +	return readl_relaxed(nfc->regs + reg);
> +}
> +static inline u16 sdg1_readw(struct mtk_nfc *nfc, u32 reg)
> +{
> +	return readw_relaxed(nfc->regs + reg);
> +}
> +static inline u8 sdg1_readb(struct mtk_nfc *nfc, u32 reg)
> +{
> +	return readb_relaxed(nfc->regs + reg);
> +}
> +
> +static void mtk_nfc_hw_reset(struct mtk_nfc *nfc)
> +{
> +	struct device *dev = nfc->dev;
> +	u32 val;
> +	int ret;
> +
> +	sdg1_writel(nfc, CON_FIFO_FLUSH | CON_NFI_RST, MTKSDG1_NFI_CON);
> +
> +	ret = readl_poll_timeout(nfc->regs + MTKSDG1_NFI_MASTER_STA, val,
> +			!(val & MASTER_STA_MASK), 50, MTK_RESET_TIMEOUT);
> +	if (ret)
> +		dev_warn(dev, "master active in reset [0x%x] = 0x%x\n",
> +			MTKSDG1_NFI_MASTER_STA, val);
> +
> +	sdg1_writew(nfc, 0, MTKSDG1_NFI_STRDATA);
> +}
> +
> +static int mtk_nfc_set_command(struct mtk_nfc *nfc, u8 command)

Or mtk_nfc_send_command() (AFAIU, it's not only setting the command in
the register, it's also sending it on the bus)?

> +{
> +	struct device *dev = nfc->dev;
> +	u32 val;
> +	int ret;
> +
> +	sdg1_writel(nfc, command, MTKSDG1_NFI_CMD);
> +
> +	ret = readl_poll_timeout_atomic(nfc->regs + MTKSDG1_NFI_STA, val,
> +					!(val & STA_CMD), 10,  MTK_TIMEOUT);
> +	if (ret) {
> +		dev_warn(dev, "nfi core timed out entering command mode\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_nfc_set_address(struct mtk_nfc *nfc, int addr)

mtk_nfc_send_address() ?

> +{
> +	struct device *dev = nfc->dev;
> +	u32 val;
> +	int ret;
> +
> +	sdg1_writel(nfc, addr, MTKSDG1_NFI_COLADDR);
> +	sdg1_writel(nfc, 0, MTKSDG1_NFI_ROWADDR);
> +	sdg1_writew(nfc, 1, MTKSDG1_NFI_ADDRNOB);
> +
> +	ret = readl_poll_timeout_atomic(nfc->regs + MTKSDG1_NFI_STA, val,
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
> +	u32 fmt, spare = mtk_nand->sparesize;
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
> +	mtd->oobsize = mtk_nand->sparesize * (mtd->writesize / data_len(chip));

Woh again :). ->oobsize is the total number of OOB bytes in the NAND
page, and is automatically set by the core. You should not mess with
this value.

The free bytes position in the OOB area are automatically retrieved
through mtd_ooblayout_ops.

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
> +	fmt |= MTKSDG1_NFI_FDM_REG_SIZE << PAGEFMT_FDM_SHIFT;
> +	fmt |= MTKSDG1_NFI_FDM_REG_SIZE << PAGEFMT_FDM_ECC_SHIFT;
> +	sdg1_writew(nfc, fmt, MTKSDG1_NFI_PAGEFMT);
> +
> +	nfc->ecc->config(nfc->ecc, mtd, sdg1_step_len(chip));

mtk_nfc_hw_runtime_config() is called when registering the NAND
devices. So if you ever want to support multiple chips, you don't want
your ECC engine and NAND controller configuration to take place here.
These sdg1_writew() and nfc->ecc->config() should be moved to your
->select_chip() function.

> +
> +	return 0;
> +}
> +
> +static void mtk_nfc_select_chip(struct mtd_info *mtd, int chip)
> +{
> +	struct nand_chip *nand = mtd_to_nand(mtd);
> +	struct mtk_nfc *nfc = nand_get_controller_data(nand);
> +	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(nand);
> +
> +	if (chip < 0)
> +		return;
> +
> +	sdg1_writel(nfc, mtk_nand->sels[chip], MTKSDG1_NFI_CSEL);
> +}
> +
> +static int mtk_nfc_dev_ready(struct mtd_info *mtd)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nand(mtd));
> +
> +	if (sdg1_readl(nfc, MTKSDG1_NFI_STA) & STA_BUSY)
> +		return 0;
> +
> +	return 1;
> +}
> +
> +static void mtk_nfc_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nand(mtd));
> +
> +	if (ctrl & NAND_ALE) {
> +		mtk_nfc_set_address(nfc, dat);
> +	} else if (ctrl & NAND_CLE) {
> +		mtk_nfc_hw_reset(nfc);
> +
> +		sdg1_writew(nfc, CNFG_OP_CUST, MTKSDG1_NFI_CNFG);
> +		mtk_nfc_set_command(nfc, dat);
> +	}
> +}
> +
> +static inline void mtk_nfc_wait_ioready(struct mtk_nfc *nfc)
> +{
> +	int rc;
> +	u8 val;
> +
> +	rc = readb_poll_timeout_atomic(nfc->regs + MTKSDG1_NFI_PIO_DIRDY, val,
> +					val & PIO_DI_RDY, 10, MTK_TIMEOUT);
> +	if (rc < 0)
> +		dev_err(nfc->dev, "data not ready\n");
> +}
> +
> +static inline uint8_t mtk_nfc_read_byte(struct mtd_info *mtd)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	u32 reg;
> +
> +	reg = sdg1_readl(nfc, MTKSDG1_NFI_STA) & NFI_FSM_MASK;
> +	if (reg != NFI_FSM_CUSTDATA) {
> +		reg = sdg1_readw(nfc, MTKSDG1_NFI_CNFG);
> +		reg |= CNFG_BYTE_RW | CNFG_READ_EN;
> +		sdg1_writew(nfc, reg, MTKSDG1_NFI_CNFG);
> +
> +		reg = (MTK_MAX_SECTOR << CON_SEC_SHIFT) | CON_BRD;
> +		sdg1_writel(nfc, reg, MTKSDG1_NFI_CON);
> +
> +		sdg1_writew(nfc, 1, MTKSDG1_NFI_STRDATA);
> +		udelay(10);

Could you add a comment explaining why you need this udelay()?

> +	}
> +
> +	mtk_nfc_wait_ioready(nfc);
> +
> +	return sdg1_readb(nfc, MTKSDG1_NFI_DATAR);
> +}
> +
> +static void mtk_nfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
> +{
> +	int i;
> +
> +	for (i = 0; i < len; i++)
> +		buf[i] = mtk_nfc_read_byte(mtd);

Maybe this should be optimized. A simple solution would be to make
read_byte() as a wrapper on ->read_buf() with len = 1.
This way you could replace

sdg1_writew(nfc, 1, MTKSDG1_NFI_STRDATA);

by

sdg1_writew(nfc, len, MTKSDG1_NFI_STRDATA);

and you would be done.

> +}
> +
> +static void mtk_nfc_write_byte(struct mtd_info *mtd, uint8_t byte)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nand(mtd));
> +	u32 reg;
> +
> +	reg = sdg1_readl(nfc, MTKSDG1_NFI_STA) & NFI_FSM_MASK;
> +
> +	if (reg != NFI_FSM_CUSTDATA) {
> +		reg = sdg1_readw(nfc, MTKSDG1_NFI_CNFG) | CNFG_BYTE_RW;
> +		sdg1_writew(nfc, reg, MTKSDG1_NFI_CNFG);
> +
> +		reg = MTK_MAX_SECTOR << CON_SEC_SHIFT | CON_BWR;
> +		sdg1_writel(nfc, reg, MTKSDG1_NFI_CON);
> +
> +		sdg1_writew(nfc, 1, MTKSDG1_NFI_STRDATA);
> +	}
> +
> +	mtk_nfc_wait_ioready(nfc);
> +	sdg1_writeb(nfc, byte, MTKSDG1_NFI_DATAW);
> +}

No write_buf() implementation?

> +
> +static int mtk_nfc_sector_encode(struct nand_chip *chip, u8 *data)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	struct sdg1_enc_data enc_data = {
> +		.strength = chip->ecc.strength,
> +		.len = sdg1_step_len(chip),
> +		.data = data,
> +	};
> +
> +	return nfc->ecc->encode(nfc->ecc, &enc_data);
> +}
> +
> +static int mtk_nfc_format_subpage(struct mtd_info *mtd, uint32_t offset,
> +			uint32_t len, const uint8_t *buf, int oob_on)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	u32 start, end;
> +	int i, ret;
> +
> +	start = offset / data_len(chip);
> +	end = DIV_ROUND_UP(offset + len, data_len(chip));
> +
> +	memset(nfc->buffer, 0xff, mtd->writesize + mtd->oobsize);
> +	for (i = 0; i < chip->ecc.steps; i++) {
> +
> +		memcpy(sdg1_data_ptr(chip, i), data_ptr(chip, buf, i),
> +			data_len(chip));
> +
> +		if (i < start || i >= end)
> +			continue;
> +
> +		if (oob_on)
> +			memcpy(sdg1_oob_ptr(chip, i), oob_ptr(chip, i),
> +				sdg1_oob_len());
> +
> +		/* program the CRC back to the OOB */
> +		ret = mtk_nfc_sector_encode(chip, sdg1_data_ptr(chip, i));
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_nfc_format_page(struct mtd_info *mtd, const uint8_t *buf,
> +				int oob_on)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	u32 i;
> +
> +	memset(nfc->buffer, 0xff, mtd->writesize + mtd->oobsize);
> +	for (i = 0; i < chip->ecc.steps; i++) {
> +		if (buf)
> +			memcpy(sdg1_data_ptr(chip, i), data_ptr(chip, buf, i),
> +				data_len(chip));
> +		if (oob_on)
> +			memcpy(sdg1_oob_ptr(chip, i), oob_ptr(chip, i),
> +				sdg1_oob_len());
> +	}
> +}
> +
> +static inline void mtk_nfc_read_fdm(struct nand_chip *chip, u32 sectors)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	u32 *p;
> +	int i;
> +
> +	for (i = 0; i < sectors; i++) {
> +		p = (u32 *) oob_ptr(chip, i);
> +		p[0] = sdg1_readl(nfc, MTKSDG1_NFI_FDM0L + i * sdg1_oob_len());
> +		p[1] = sdg1_readl(nfc, MTKSDG1_NFI_FDM0M + i * sdg1_oob_len());
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
> +		sdg1_writel(nfc, p[0], MTKSDG1_NFI_FDM0L + i * sdg1_oob_len());
> +		sdg1_writel(nfc, p[1], MTKSDG1_NFI_FDM0M + i * sdg1_oob_len());
> +	}
> +}
> +
> +static int mtk_nfc_do_write_page(struct mtd_info *mtd, struct nand_chip *chip,
> +	const uint8_t *buf, int page, int len)
> +{
> +
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	struct device *dev = nfc->dev;
> +	dma_addr_t addr;
> +	u32 reg;
> +	int ret;
> +
> +	addr = dma_map_single(dev, (void *) buf, len, DMA_TO_DEVICE);
> +	ret = dma_mapping_error(nfc->dev, addr);
> +	if (ret) {
> +		dev_err(nfc->dev, "dma mapping error\n");
> +		return -EINVAL;
> +	}
> +
> +	reg = sdg1_readw(nfc, MTKSDG1_NFI_CNFG) | CNFG_AHB | CNFG_DMA_BURST_EN;
> +	sdg1_writew(nfc, reg, MTKSDG1_NFI_CNFG);
> +
> +	sdg1_writel(nfc, chip->ecc.steps << CON_SEC_SHIFT, MTKSDG1_NFI_CON);
> +	sdg1_writel(nfc, lower_32_bits(addr), MTKSDG1_NFI_STRADDR);
> +	sdg1_writew(nfc, INTR_AHB_DONE_EN, MTKSDG1_NFI_INTR_EN);
> +
> +	init_completion(&nfc->done);
> +
> +	reg = sdg1_readl(nfc, MTKSDG1_NFI_CON) | CON_BWR;
> +	sdg1_writel(nfc, reg, MTKSDG1_NFI_CON);
> +	sdg1_writew(nfc, 1, MTKSDG1_NFI_STRDATA);
> +
> +	ret = wait_for_completion_timeout(&nfc->done, msecs_to_jiffies(500));
> +	if (!ret) {
> +		dev_err(dev, "program ahb done timeout\n");
> +		sdg1_writew(nfc, 0, MTKSDG1_NFI_INTR_EN);
> +		ret = -ETIMEDOUT;
> +		goto timeout;
> +	}
> +
> +	ret = readl_poll_timeout_atomic(nfc->regs + MTKSDG1_NFI_ADDRCNTR, reg,
> +			(reg & CNTR_MASK) >= chip->ecc.steps, 10, MTK_TIMEOUT);
> +	if (ret)
> +		dev_err(dev, "hwecc write timeout\n");
> +
> +timeout:
> +
> +	dma_unmap_single(nfc->dev, addr, len, DMA_TO_DEVICE);
> +	sdg1_writel(nfc, 0, MTKSDG1_NFI_CON);
> +
> +	return ret;
> +}
> +
> +static int mtk_nfc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
> +			const uint8_t *buf, int oob_on, int page, int raw)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	size_t len;
> +	u32 reg;
> +	int ret;
> +
> +	if (!raw) {
> +		/* OOB => FDM: from register,  ECC: from HW */
> +		reg = sdg1_readw(nfc, MTKSDG1_NFI_CNFG) | CNFG_AUTO_FMT_EN;
> +		sdg1_writew(nfc, reg | CNFG_HW_ECC_EN, MTKSDG1_NFI_CNFG);
> +
> +		nfc->ecc->control(nfc->ecc, enable_encoder, 0);
> +
> +		/* write OOB into the FDM registers (OOB area in MTK NAND) */
> +		if (oob_on)
> +			mtk_nfc_write_fdm(chip);
> +	}
> +
> +	len = mtd->writesize + (raw ? mtd->oobsize : 0);
> +	ret = mtk_nfc_do_write_page(mtd, chip, buf, page, len);
> +
> +	if (!raw)
> +		nfc->ecc->control(nfc->ecc, disable_encoder, 0);
> +
> +	return ret;
> +}
> +
> +static int mtk_nfc_write_page_hwecc(struct mtd_info *mtd,
> +			struct nand_chip *chip, const uint8_t *buf,
> +			int oob_on, int page)
> +{
> +	return mtk_nfc_write_page(mtd, chip, buf, oob_on, page, 0);
> +}
> +
> +static int mtk_nfc_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> +					const uint8_t *buf, int oob_on, int pg)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +
> +	mtk_nfc_format_page(mtd, buf, oob_on);
> +	return mtk_nfc_write_page(mtd, chip, nfc->buffer, 0, pg, 1);
> +}
> +
> +static int mtk_nfc_write_subpage_hwecc(struct mtd_info *mtd,
> +		struct nand_chip *chip, uint32_t offset, uint32_t data_len,
> +		const uint8_t *buf, int oob_on, int page)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	int ret;
> +
> +	ret = mtk_nfc_format_subpage(mtd, offset, data_len, buf, oob_on);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* use the data in the private buffer (now with FDM and CRC) */
> +	return mtk_nfc_write_page(mtd, chip, nfc->buffer, 0, page, 1);
> +}
> +
> +static int mtk_nfc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
> +				int page)
> +{
> +	u8 *data = chip->buffers->databuf;
> +	int ret;
> +
> +	memset(data, 0xff, mtd->writesize);
> +
> +	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
> +
> +	ret = mtk_nfc_write_page_hwecc(mtd, chip, data, 1, page);
> +	if (ret < 0)
> +		return -EIO;
> +
> +	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +	ret = chip->waitfunc(mtd, chip);
> +
> +	return ret & NAND_STATUS_FAIL ? -EIO : 0;
> +}
> +
> +static int mtk_nfc_write_oob_raw(struct mtd_info *mtd, struct nand_chip *chip,
> +					int page)
> +{
> +	int ret;
> +
> +	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
> +	ret = mtk_nfc_write_page_raw(mtd, chip, NULL, 1, page);
> +	if (ret < 0)
> +		return -EIO;
> +
> +	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +	ret = chip->waitfunc(mtd, chip);
> +
> +	return ret & NAND_STATUS_FAIL ? -EIO : 0;
> +}
> +
> +static int mtk_nfc_update_oob(struct mtd_info *mtd, struct nand_chip *chip,
> +				u8 *buf, u32 sectors)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	int rc, i;
> +
> +	rc = sdg1_readl(nfc, MTKSDG1_NFI_STA) & STA_EMP_PAGE;
> +	if (rc) {
> +		memset(buf, 0xff, sectors * data_len(chip));
> +
> +		for (i = 0; i < sectors; i++)
> +			memset(oob_ptr(chip, i), 0xff, sdg1_oob_len());
> +
> +		return 0;
> +	}
> +
> +	mtk_nfc_read_fdm(chip, sectors);
> +
> +	return nfc->ecc->check(nfc->ecc, mtd, sectors);
> +}
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
> +
> +static int mtk_nfc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
> +		uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi,
> +		int page, int raw)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	u32 column, spare, sectors, start, end, reg;
> +	dma_addr_t addr;
> +	int bitflips;
> +	size_t len;
> +	u8 *buf;
> +	int rc;
> +
> +	start = data_offs / data_len(chip);
> +	end = DIV_ROUND_UP(data_offs + readlen, data_len(chip));
> +
> +	sectors = end - start;
> +	spare = mtd->oobsize / chip->ecc.steps;
> +	column =  start * (data_len(chip) + spare);
> +
> +	len = sectors * data_len(chip) + (raw ? sectors * spare : 0);
> +	buf = bufpoi + start * data_len(chip);
> +
> +	if (column != 0)
> +		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, column, -1);
> +
> +	addr = dma_map_single(nfc->dev, buf, len, DMA_FROM_DEVICE);
> +	rc = dma_mapping_error(nfc->dev, addr);
> +	if (rc) {
> +		dev_err(nfc->dev, "dma mapping error\n");
> +		return -EINVAL;
> +	}
> +
> +	reg = sdg1_readw(nfc, MTKSDG1_NFI_CNFG);
> +	reg |= CNFG_READ_EN | CNFG_DMA_BURST_EN | CNFG_AHB;
> +	if (!raw) {
> +		reg |= CNFG_AUTO_FMT_EN | CNFG_HW_ECC_EN;
> +		sdg1_writew(nfc, reg, MTKSDG1_NFI_CNFG);
> +
> +		nfc->ecc->control(nfc->ecc, enable_decoder, 0);
> +	} else
> +		sdg1_writew(nfc, reg, MTKSDG1_NFI_CNFG);
> +
> +	sdg1_writel(nfc, sectors << CON_SEC_SHIFT, MTKSDG1_NFI_CON);
> +	sdg1_writew(nfc, INTR_AHB_DONE_EN, MTKSDG1_NFI_INTR_EN);
> +	sdg1_writel(nfc, lower_32_bits(addr), MTKSDG1_NFI_STRADDR);
> +
> +	if (!raw)
> +		nfc->ecc->control(nfc->ecc, start_decoder, sectors);
> +
> +	init_completion(&nfc->done);
> +	reg = sdg1_readl(nfc, MTKSDG1_NFI_CON) | CON_BRD;
> +	sdg1_writel(nfc, reg, MTKSDG1_NFI_CON);
> +	sdg1_writew(nfc, 1, MTKSDG1_NFI_STRDATA);
> +
> +	rc = wait_for_completion_timeout(&nfc->done, msecs_to_jiffies(500));
> +	if (!rc)
> +		dev_warn(nfc->dev, "read ahb/dma done timeout\n");
> +
> +	rc = readl_poll_timeout_atomic(nfc->regs + MTKSDG1_NFI_BYTELEN, reg,
> +				(reg & CNTR_MASK) >= sectors, 10, MTK_TIMEOUT);
> +	if (rc < 0) {
> +		dev_err(nfc->dev, "subpage done timeout\n");
> +		bitflips = -EIO;
> +	} else {
> +		bitflips = 0;
> +		if (!raw) {
> +			rc = nfc->ecc->decode(nfc->ecc);
> +			bitflips = rc < 0 ? -ETIMEDOUT :
> +				mtk_nfc_update_oob(mtd, chip, buf, sectors);
> +		}
> +	}
> +
> +	dma_unmap_single(nfc->dev, addr, len, DMA_FROM_DEVICE);
> +
> +	if (!raw)
> +		nfc->ecc->control(nfc->ecc, disable_decoder, 0);
> +
> +	sdg1_writel(nfc, 0, MTKSDG1_NFI_CON);
> +
> +	return bitflips;
> +}
> +
> +static int mtk_nfc_read_subpage_hwecc(struct mtd_info *mtd,
> +	struct nand_chip *chip, uint32_t off, uint32_t len, uint8_t *p, int pg)
> +{
> +	return mtk_nfc_read_subpage(mtd, chip, off, len, p, pg, 0);
> +}
> +
> +static int mtk_nfc_read_page_hwecc(struct mtd_info *mtd,
> +	struct nand_chip *chip, uint8_t *p, int oob_on, int pg)
> +{
> +	return mtk_nfc_read_subpage_hwecc(mtd, chip, 0, mtd->writesize, p, pg);
> +}
> +
> +static int mtk_nfc_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> +				uint8_t *buf, int oob_on, int page)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
> +	int i, ret;
> +
> +	memset(nfc->buffer, 0xff, mtd->writesize + mtd->oobsize);
> +	ret = mtk_nfc_read_subpage(mtd, chip, 0, mtd->writesize, nfc->buffer,
> +					page, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < chip->ecc.steps; i++) {
> +		if (buf)
> +			memcpy(data_ptr(chip, buf, i), sdg1_data_ptr(chip, i),
> +							data_len(chip));
> +		if (oob_on)
> +			memcpy(oob_ptr(chip, i), sdg1_oob_ptr(chip, i),
> +							sdg1_oob_len());
> +	}
> +
> +	return ret;
> +}
> +
> +static void mtk_nfc_switch_oob(struct mtd_info *mtd, struct nand_chip *chip,
> +					uint8_t *buf)
> +{
> +	u32 *poi, *oob;
> +	size_t spare;
> +	u32 sectors;
> +	int i;
> +
> +	spare = mtd->oobsize / chip->ecc.steps;
> +	sectors = mtd->writesize / (data_len(chip) + spare);
> +
> +	poi = (u32 *) (buf + mtd->writesize - sectors * spare);
> +	oob = (u32 *) oob_ptr(chip, 0);
> +
> +	for (i = 0; i < sdg1_oob_len() / sizeof(u32); i++) {
> +		poi[i] = poi[i] ^ oob[i];
> +		oob[i] = poi[i] ^ oob[i];
> +		poi[i] = poi[i] ^ oob[i];
> +	}
> +
> +}
> +
> +static int mtk_nfc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
> +				int page)
> +{
> +	struct mtk_nfc *nfc = nand_get_controller_data(chip);
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
> +	if (nfc->switch_oob)
> +		mtk_nfc_switch_oob(mtd, chip, buf);

Can we always keep a valid bad block marker. You start corrupting it as
soon as the bad block table is created, but even the BBT can be
corrupted, and in this case, you want to be able to re-create it from
the BBMs.

Is there a strong reason not to switch this byte (both before write and
after reading a page)?

> +
> +	if (ret < mtd->bitflip_threshold)
> +		mtd->ecc_stats.corrected = stats.corrected;
> +
> +	return ret;
> +}
> +
> +static int mtk_nfc_read_oob_raw(struct mtd_info *mtd, struct nand_chip *chip,
> +				int page)
> +{
> +	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
> +
> +	return mtk_nfc_read_page_raw(mtd, chip, NULL, 1, page);
> +}
> +
> +
> +static inline void mtk_nfc_hw_init(struct mtk_nfc *nfc)
> +{
> +	sdg1_writel(nfc, 0x10804211, MTKSDG1_NFI_ACCCON);
> +	sdg1_writew(nfc, 0xf1, MTKSDG1_NFI_CNRNB);
> +	sdg1_writew(nfc, PAGEFMT_8K_16K, MTKSDG1_NFI_PAGEFMT);
> +
> +	mtk_nfc_hw_reset(nfc);
> +
> +	sdg1_readl(nfc, MTKSDG1_NFI_INTR_STA);
> +	sdg1_writel(nfc, 0, MTKSDG1_NFI_INTR_EN);
> +
> +	nfc->ecc->init(nfc->ecc);
> +}
> +
> +static irqreturn_t mtk_nfc_irq(int irq, void *id)
> +{
> +	struct mtk_nfc *nfc = id;
> +	u16 sta, ien;
> +
> +	sta = sdg1_readw(nfc, MTKSDG1_NFI_INTR_STA);
> +	ien = sdg1_readw(nfc, MTKSDG1_NFI_INTR_EN);
> +
> +	if (!(sta & ien))
> +		return IRQ_NONE;
> +
> +	sdg1_writew(nfc, ~sta & ien, MTKSDG1_NFI_INTR_EN);
> +	complete(&nfc->done);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mtk_nfc_enable_clk(struct device *dev, struct mtk_nfc_clk *clk)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(clk->nfi_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable nfi clk\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(clk->pad_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable pad clk\n");
> +		clk_disable_unprepare(clk->nfi_clk);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_nfc_disable_clk(struct mtk_nfc_clk *clk)
> +{
> +	clk_disable_unprepare(clk->nfi_clk);
> +	clk_disable_unprepare(clk->pad_clk);
> +}
> +
> +static int mtk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
> +				struct mtd_oob_region *oob_region)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	oob_region->length = sdg1_oob_len() * chip->ecc.steps;
> +	oob_region->offset = 0;

Okay, am I reading it correctly that you set all free OOB bytes at the
beginning of the ->oob_poi buffer. Is this also true when operating in
raw mode.

> +
> +	return 0;
> +}
> +
> +static int mtk_nfc_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				struct mtd_oob_region *oob_region)
> +{
> +	struct mtd_oob_region free_region;
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	mtk_nfc_ooblayout_free(mtd, 0, &free_region);
> +
> +	oob_region->length = mtd->oobsize - free_region.length;
> +	oob_region->offset = free_region.length;
> +
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops mtk_nfc_ooblayout_ops = {
> +	.free = mtk_nfc_ooblayout_free,
> +	.ecc = mtk_nfc_ooblayout_ecc,
> +};
> +
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
> +		return -EINVAL;
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
> +	of_property_read_u32(np, "spare_per_sector", &chip->sparesize);
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
> +	nand->read_byte = mtk_nfc_read_byte;
> +	nand->read_buf = mtk_nfc_read_buf;
> +	nand->cmd_ctrl = mtk_nfc_cmd_ctrl;
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
> +	ret = mtk_nfc_hw_runtime_config(mtd);
> +	if (ret < 0)
> +		return -ENODEV;
> +
> +	len = mtd->writesize + mtd->oobsize;
> +	nfc->buffer = devm_kzalloc(dev, len, GFP_KERNEL);
> +	if (!nfc->buffer)
> +		return  -ENOMEM;
> +
> +	/* create bbt table if not present */
> +	nfc->switch_oob = true;
> +	ret = nand_scan_tail(mtd);
> +	nfc->switch_oob = false;

As said above, I don't think this is a good idea...

> +	if (ret)
> +		return -ENODEV;
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
> +static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
> +{
> +	struct device_node *np = dev->of_node;
> +	struct device_node *nand_np;
> +	int ret;
> +
> +	for_each_child_of_node(np, nand_np) {
> +		ret = mtk_nfc_nand_chip_init(dev, nfc, nand_np);
> +		if (ret) {
> +			of_node_put(nand_np);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_nfc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct mtk_nfc *nfc;
> +	struct resource *res;
> +	int ret, irq;
> +
> +	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
> +	if (!nfc)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&nfc->controller.lock);
> +	init_waitqueue_head(&nfc->controller.wq);
> +	INIT_LIST_HEAD(&nfc->chips);
> +
> +	/* probe defer if not ready */
> +	nfc->ecc = of_sdg1_ecc_get(np);
> +	if (IS_ERR(nfc->ecc))
> +		return PTR_ERR(nfc->ecc);
> +	else if (!nfc->ecc)
> +		return -ENODEV;
> +
> +	nfc->dev = dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	nfc->regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(nfc->regs)) {
> +		ret = PTR_ERR(nfc->regs);
> +		dev_err(dev, "no nfi base\n");
> +		goto release_ecc;
> +	}
> +
> +	nfc->clk.nfi_clk = devm_clk_get(dev, "nfi_clk");
> +	if (IS_ERR(nfc->clk.nfi_clk)) {
> +		dev_err(dev, "no clk\n");
> +		ret = PTR_ERR(nfc->clk.nfi_clk);
> +		goto release_ecc;
> +	}
> +
> +	nfc->clk.pad_clk = devm_clk_get(dev, "pad_clk");
> +	if (IS_ERR(nfc->clk.pad_clk)) {
> +		dev_err(dev, "no pad clk\n");
> +		ret = PTR_ERR(nfc->clk.pad_clk);
> +		goto release_ecc;
> +	}
> +
> +	ret = mtk_nfc_enable_clk(dev, &nfc->clk);
> +	if (ret)
> +		goto release_ecc;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(dev, "no nfi irq resource\n");
> +		ret = -EINVAL;
> +		goto clk_disable;
> +	}
> +
> +	ret = devm_request_irq(dev, irq, mtk_nfc_irq, 0x0, "sdg1-nand", nfc);
> +	if (ret) {
> +		dev_err(dev, "failed to request nfi irq\n");
> +		goto clk_disable;
> +	}
> +
> +	ret = dma_set_mask(dev, DMA_BIT_MASK(32));
> +	if (ret) {
> +		dev_err(dev, "failed to set dma mask\n");
> +		goto clk_disable;
> +	}
> +
> +	platform_set_drvdata(pdev, nfc);
> +
> +	ret = mtk_nfc_nand_chips_init(dev, nfc);
> +	if (ret) {
> +		dev_err(dev, "failed to init nand chips\n");
> +		goto clk_disable;
> +	}
> +
> +	return 0;
> +
> +clk_disable:
> +	mtk_nfc_disable_clk(&nfc->clk);
> +
> +release_ecc:
> +	nfc->ecc->release(nfc->ecc);
> +
> +	return ret;
> +}
> +
> +static int mtk_nfc_remove(struct platform_device *pdev)
> +{
> +	struct mtk_nfc *nfc = platform_get_drvdata(pdev);
> +	struct mtk_nfc_nand_chip *chip;
> +
> +	while (!list_empty(&nfc->chips)) {
> +		chip = list_first_entry(&nfc->chips, struct mtk_nfc_nand_chip,
> +					node);
> +		nand_release(nand_to_mtd(&chip->nand));
> +		list_del(&chip->node);
> +	}
> +
> +	nfc->ecc->release(nfc->ecc);
> +	mtk_nfc_disable_clk(&nfc->clk);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int mtk_nfc_suspend(struct device *dev)
> +{
> +	struct mtk_nfc *nfc = dev_get_drvdata(dev);
> +	struct mtk_nfc_saved_reg *reg = &nfc->saved_reg;
> +
> +	reg->emp_thresh = sdg1_readl(nfc, MTKSDG1_NFI_EMPTY_THRESH);

You're never setting this MTKSDG1_NFI_EMPTY_THRESH register. It should
probably set to ecc->strength in chip->select_chip().


That's all I got for now.

Thanks for reworking the other aspects I mentioned in my previous
review.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
