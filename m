Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apf8n-0008P4-Fc
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2016 16:56:56 +0000
Received: by mail-qg0-x233.google.com with SMTP id c6so149393137qga.1
 for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2016 09:56:24 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To: jorge.ramirez-ortiz@linaro.org, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org
Cc: linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/2] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
Date: Mon, 11 Apr 2016 12:56:12 -0400
Message-Id: <1460393772-26910-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
In-Reply-To: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support for mediatek's SDG1 NFC nand controller
embedded in SoC 2701.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/mtd/nand/Kconfig    |    7 +
 drivers/mtd/nand/Makefile   |    1 +
 drivers/mtd/nand/mtk_ecc.c  |  449 +++++++++++++++
 drivers/mtd/nand/mtk_ecc.h  |   56 ++
 drivers/mtd/nand/mtk_nand.c | 1266 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 1779 insertions(+)
 create mode 100644 drivers/mtd/nand/mtk_ecc.c
 create mode 100644 drivers/mtd/nand/mtk_ecc.h
 create mode 100644 drivers/mtd/nand/mtk_nand.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f05e0e9..3c26e89 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -563,4 +563,11 @@ config MTD_NAND_QCOM
 	  Enables support for NAND flash chips on SoCs containing the EBI2 NAND
 	  controller. This controller is found on IPQ806x SoC.
 
+config MTD_NAND_MTK
+	tristate "Support for NAND controller on MTK SoCs"
+	depends on HAS_DMA
+	help
+	  Enables support for NAND controller on MTK SoCs.
+	  This controller is found on mt27xx, mt81xx, mt65xx SoCs.
+
 endif # MTD_NAND
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index f553353..cafde6f 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -57,5 +57,6 @@ obj-$(CONFIG_MTD_NAND_SUNXI)		+= sunxi_nand.o
 obj-$(CONFIG_MTD_NAND_HISI504)	        += hisi504_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand/
 obj-$(CONFIG_MTD_NAND_QCOM)		+= qcom_nandc.o
+obj-$(CONFIG_MTD_NAND_MTK)		+= mtk_nand.o mtk_ecc.o
 
 nand-objs := nand_base.o nand_bbt.o nand_timings.o
diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
new file mode 100644
index 0000000..627f0a7
--- /dev/null
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -0,0 +1,449 @@
+/*
+ * MTK ECC controller driver.
+ * Copyright (C) 2016  MediaTek Inc.
+ * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
+ *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/iopoll.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+
+#include "mtk_ecc.h"
+
+#define ECC_ENCCON		(0x00)
+#define		ENC_EN			(1)
+#define		ENC_DE			(0)
+#define ECC_ENCCNFG		(0x04)
+#define		ECC_CNFG_4BIT		(0)
+#define		ECC_CNFG_12BIT		(4)
+#define		ECC_CNFG_24BIT		(10)
+#define		ECC_NFI_MODE		BIT(5)
+#define		ECC_DMA_MODE		(0)
+#define		ECC_ENC_MODE_MASK	(0x3 << 5)
+#define		ECC_MS_SHIFT		(16)
+#define ECC_ENCDIADDR		(0x08)
+#define ECC_ENCIDLE		(0x0C)
+#define		ENC_IDLE		BIT(0)
+#define ECC_ENCPAR0		(0x10)
+#define ECC_ENCIRQ_EN		(0x80)
+#define		ENC_IRQEN		BIT(0)
+#define ECC_ENCIRQ_STA		(0x84)
+#define ECC_DECCON		(0x100)
+#define		DEC_EN			(1)
+#define		DEC_DE			(0)
+#define ECC_DECCNFG		(0x104)
+#define		DEC_EMPTY_EN		BIT(31)
+#define		DEC_CNFG_CORRECT	(0x3 << 12)
+#define ECC_DECIDLE		(0x10C)
+#define		DEC_IDLE		BIT(0)
+#define ECC_DECENUM0		(0x114)
+#define		ERR_MASK		(0x3f)
+#define ECC_DECDONE		(0x124)
+#define ECC_DECIRQ_EN		(0x200)
+#define		DEC_IRQEN		BIT(0)
+#define ECC_DECIRQ_STA		(0x204)
+
+#define ECC_TIMEOUT		(500000)
+#define ECC_PARITY_BITS		(14)
+
+struct mtk_ecc {
+	struct device *dev;
+	void __iomem *regs;
+	struct mutex lock;
+	struct clk *clk;
+
+	struct completion done;
+	u32 sec_mask;
+};
+
+static inline void mtk_ecc_encoder_idle(struct mtk_ecc *ecc)
+{
+	struct device *dev = ecc->dev;
+	u32 val;
+	int ret;
+
+	ret = readl_poll_timeout_atomic(ecc->regs + ECC_ENCIDLE, val,
+					val & ENC_IDLE, 10, ECC_TIMEOUT);
+	if (ret)
+		dev_warn(dev, "encoder NOT idle\n");
+}
+
+static inline void mtk_ecc_decoder_idle(struct mtk_ecc *ecc)
+{
+	struct device *dev = ecc->dev;
+	u32 val;
+	int ret;
+
+	ret = readl_poll_timeout_atomic(ecc->regs + ECC_DECIDLE, val,
+					val & DEC_IDLE, 10, ECC_TIMEOUT);
+	if (ret)
+		dev_warn(dev, "decoder NOT idle\n");
+}
+
+static irqreturn_t mtk_ecc_irq(int irq, void *id)
+{
+	struct mtk_ecc *ecc = id;
+	u32 dec, enc;
+
+	dec = readw(ecc->regs + ECC_DECIRQ_STA) & DEC_IRQEN;
+	enc = readl(ecc->regs + ECC_ENCIRQ_STA) & ENC_IRQEN;
+
+	if (!(dec || enc))
+		return IRQ_NONE;
+
+	if (dec) {
+		dec = readw(ecc->regs + ECC_DECDONE);
+		if (dec & ecc->sec_mask) {
+			ecc->sec_mask = 0;
+			complete(&ecc->done);
+			writew(0, ecc->regs + ECC_DECIRQ_EN);
+		}
+	} else {
+		complete(&ecc->done);
+		writel(0, ecc->regs + ECC_ENCIRQ_EN);
+	}
+
+	return IRQ_HANDLED;
+}
+
+void mtk_ecc_get_stats(struct mtk_ecc *ecc, struct mtk_ecc_stats *stats,
+			int sectors)
+{
+	u32 offset, i, err;
+	u32 bitflips = 0;
+
+	stats->corrected = 0;
+	stats->failed = 0;
+
+	for (i = 0; i < sectors; i++) {
+		offset = (i >> 2) << 2;
+		err = readl(ecc->regs + ECC_DECENUM0 + offset);
+		err = err >> ((i % 4) * 8);
+		err &= ERR_MASK;
+		if (err == ERR_MASK) {
+			/* uncorrectable errors */
+			stats->failed++;
+			continue;
+		}
+
+		stats->corrected += err;
+		bitflips = max_t(u32, bitflips, err);
+	}
+
+	stats->bitflips = bitflips;
+}
+EXPORT_SYMBOL(mtk_ecc_get_stats);
+
+void mtk_ecc_release(struct mtk_ecc *ecc)
+{
+	clk_disable_unprepare(ecc->clk);
+	put_device(ecc->dev);
+}
+EXPORT_SYMBOL(mtk_ecc_release);
+
+static struct mtk_ecc *mtk_ecc_get(struct device_node *np)
+{
+	struct platform_device *pdev;
+	struct mtk_ecc *ecc;
+
+	pdev = of_find_device_by_node(np);
+	if (!pdev || !platform_get_drvdata(pdev))
+		return ERR_PTR(-EPROBE_DEFER);
+
+	get_device(&pdev->dev);
+	ecc = platform_get_drvdata(pdev);
+	clk_prepare_enable(ecc->clk);
+	mtk_ecc_hw_init(ecc);
+
+	return ecc;
+}
+
+struct mtk_ecc *of_mtk_ecc_get(struct device_node *of_node)
+{
+	struct mtk_ecc *ecc = NULL;
+	struct device_node *np;
+
+	np = of_parse_phandle(of_node, "ecc-engine", 0);
+	if (np) {
+		ecc = mtk_ecc_get(np);
+		of_node_put(np);
+	}
+
+	return ecc;
+}
+EXPORT_SYMBOL(of_mtk_ecc_get);
+
+void mtk_ecc_enable_encode(struct mtk_ecc *ecc)
+{
+	mtk_ecc_encoder_idle(ecc);
+	writew(ENC_EN, ecc->regs + ECC_ENCCON);
+}
+EXPORT_SYMBOL(mtk_ecc_enable_encode);
+
+void mtk_ecc_disable_encode(struct mtk_ecc *ecc)
+{
+	writew(0, ecc->regs + ECC_ENCIRQ_EN);
+	mtk_ecc_encoder_idle(ecc);
+	writew(ENC_DE, ecc->regs + ECC_ENCCON);
+}
+EXPORT_SYMBOL(mtk_ecc_disable_encode);
+
+void mtk_ecc_enable_decode(struct mtk_ecc *ecc)
+{
+	mtk_ecc_decoder_idle(ecc);
+	writel(DEC_EN, ecc->regs + ECC_DECCON);
+}
+EXPORT_SYMBOL(mtk_ecc_enable_decode);
+
+void mtk_ecc_disable_decode(struct mtk_ecc *ecc)
+{
+	writew(0, ecc->regs + ECC_DECIRQ_EN);
+	mtk_ecc_decoder_idle(ecc);
+	writel(DEC_DE, ecc->regs + ECC_DECCON);
+}
+EXPORT_SYMBOL(mtk_ecc_disable_decode);
+
+void mtk_ecc_start_decode(struct mtk_ecc *ecc, int sectors)
+{
+	ecc->sec_mask = 1 << (sectors - 1);
+	init_completion(&ecc->done);
+	writew(DEC_IRQEN, ecc->regs + ECC_DECIRQ_EN);
+}
+EXPORT_SYMBOL(mtk_ecc_start_decode);
+
+int mtk_ecc_wait_decode(struct mtk_ecc *ecc)
+{
+	int ret;
+
+	ret = wait_for_completion_timeout(&ecc->done, msecs_to_jiffies(500));
+	if (!ret) {
+		dev_err(ecc->dev, "decode timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(mtk_ecc_wait_decode);
+
+int mtk_ecc_start_encode(struct mtk_ecc *ecc, struct mtk_ecc_enc_data *d)
+{
+	dma_addr_t addr;
+	u32 *p, len;
+	u32 reg, i;
+	int rc, ret = 0;
+
+	addr = dma_map_single(ecc->dev, d->data, d->len, DMA_TO_DEVICE);
+	rc = dma_mapping_error(ecc->dev, addr);
+	if (rc) {
+		dev_err(ecc->dev, "dma mapping error\n");
+		return -EINVAL;
+	}
+
+	/* enable the encoder in DMA mode to calculate the ECC bytes  */
+	reg = readl(ecc->regs + ECC_ENCCNFG) & ~ECC_ENC_MODE_MASK;
+	reg |= ECC_DMA_MODE;
+	writel(reg, ecc->regs + ECC_ENCCNFG);
+
+	writel(ENC_IRQEN, ecc->regs + ECC_ENCIRQ_EN);
+	writel(lower_32_bits(addr), ecc->regs + ECC_ENCDIADDR);
+
+	init_completion(&ecc->done);
+	writew(ENC_EN, ecc->regs + ECC_ENCCON);
+
+	rc = wait_for_completion_timeout(&ecc->done, msecs_to_jiffies(500));
+	if (!rc) {
+		dev_err(ecc->dev, "encode timeout\n");
+		writel(0, ecc->regs + ECC_ENCIRQ_EN);
+		ret = -ETIMEDOUT;
+		goto timeout;
+	}
+
+	mtk_ecc_encoder_idle(ecc);
+
+	/* Program ECC bytes to OOB: per sector oob = FDM + ECC + SPARE */
+	len = (d->strength * ECC_PARITY_BITS + 7) >> 3;
+	p = (u32 *) (d->data + d->len);
+
+	/* write the parity bytes generated by the ECC back to the OOB region */
+	for (i = 0; i < len; i++)
+		p[i] = readl(ecc->regs + ECC_ENCPAR0 + i * sizeof(u32));
+
+timeout:
+
+	dma_unmap_single(ecc->dev, addr, d->len, DMA_TO_DEVICE);
+
+	writew(0, ecc->regs + ECC_ENCCON);
+	reg = readl(ecc->regs + ECC_ENCCNFG) & ~ECC_ENC_MODE_MASK;
+	reg |= ECC_NFI_MODE;
+	writel(reg, ecc->regs + ECC_ENCCNFG);
+
+	return ret;
+}
+EXPORT_SYMBOL(mtk_ecc_start_encode);
+
+void mtk_ecc_hw_init(struct mtk_ecc *ecc)
+{
+	mtk_ecc_encoder_idle(ecc);
+	writew(ENC_DE, ecc->regs + ECC_ENCCON);
+
+	mtk_ecc_decoder_idle(ecc);
+	writel(DEC_DE, ecc->regs + ECC_DECCON);
+}
+
+int mtk_ecc_config(struct mtk_ecc *ecc, struct mtk_ecc_config *config)
+{
+	u32 ecc_bit, dec_sz, enc_sz;
+	u32 reg;
+
+	switch (config->strength) {
+	case 4:
+		ecc_bit = ECC_CNFG_4BIT;
+		break;
+	case 12:
+		ecc_bit = ECC_CNFG_12BIT;
+		break;
+	case 24:
+		ecc_bit = ECC_CNFG_24BIT;
+		break;
+	default:
+		dev_err(ecc->dev, "invalid spare len per sector\n");
+		return -EINVAL;
+	}
+
+	/* configure ECC encoder (in bits) */
+	enc_sz = config->step_len << 3;
+	reg = ecc_bit | ECC_NFI_MODE | (enc_sz << ECC_MS_SHIFT);
+	writel(reg, ecc->regs + ECC_ENCCNFG);
+
+	/* configure ECC decoder (in bits) */
+	dec_sz = enc_sz + config->strength * ECC_PARITY_BITS;
+	reg = ecc_bit | ECC_NFI_MODE | (dec_sz << ECC_MS_SHIFT);
+	reg |= DEC_CNFG_CORRECT | DEC_EMPTY_EN;
+	writel(reg, ecc->regs + ECC_DECCNFG);
+
+	return 0;
+}
+EXPORT_SYMBOL(mtk_ecc_config);
+
+static int mtk_ecc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_ecc *ecc;
+	struct resource *res;
+	int irq, ret;
+
+	ecc = devm_kzalloc(dev, sizeof(*ecc), GFP_KERNEL);
+	if (!ecc)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	ecc->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(ecc->regs)) {
+		dev_err(dev, "failed to map regs: %ld\n", PTR_ERR(ecc->regs));
+		return PTR_ERR(ecc->regs);
+	}
+
+	ecc->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(ecc->clk)) {
+		dev_err(dev, "failed to get clock: %ld\n", PTR_ERR(ecc->clk));
+		return PTR_ERR(ecc->clk);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "failed to get irq\n");
+		return -EINVAL;
+	}
+
+	ret = dma_set_mask(dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(dev, "failed to set DMA mask\n");
+		return ret;
+	}
+
+	ret = devm_request_irq(dev, irq, mtk_ecc_irq, 0x0, "mtk-ecc", ecc);
+	if (ret) {
+		dev_err(dev, "failed to request irq\n");
+		return -EINVAL;
+	}
+
+	mutex_init(&ecc->lock);
+
+	ecc->dev = dev;
+
+	platform_set_drvdata(pdev, ecc);
+
+	dev_info(dev, "driver probed\n");
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int mtk_ecc_suspend(struct device *dev)
+{
+	struct mtk_ecc *ecc = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(ecc->clk);
+
+	return 0;
+}
+
+static int mtk_ecc_resume(struct device *dev)
+{
+	struct mtk_ecc *ecc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(ecc->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clk\n");
+		return ret;
+	}
+
+	mtk_ecc_hw_init(ecc);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(mtk_ecc_pm_ops, mtk_ecc_suspend, mtk_ecc_resume);
+#endif
+
+static const struct of_device_id mtk_ecc_dt_match[] = {
+	{ .compatible = "mediatek,mt2701-ecc" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_ecc_dt_match);
+
+static struct platform_driver mtk_ecc_driver = {
+	.probe  = mtk_ecc_probe,
+	.driver = {
+		.name  = "mtk-ecc",
+		.of_match_table = of_match_ptr(mtk_ecc_dt_match),
+#ifdef CONFIG_PM_SLEEP
+		.pm = &mtk_ecc_pm_ops,
+#endif
+
+	},
+};
+
+module_platform_driver(mtk_ecc_driver);
+
+MODULE_AUTHOR("Xiaolei Li <xiaolei.li@mediatek.com>");
+MODULE_AUTHOR("Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>");
+MODULE_DESCRIPTION("MTK Nand ECC Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mtd/nand/mtk_ecc.h b/drivers/mtd/nand/mtk_ecc.h
new file mode 100644
index 0000000..d12bc5f
--- /dev/null
+++ b/drivers/mtd/nand/mtk_ecc.h
@@ -0,0 +1,56 @@
+/*
+ * MTK SDG1 ECC controller
+ *
+ * Copyright (c) 2016 Mediatek
+ * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
+ *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation.
+ */
+
+#ifndef __DRIVERS_MTD_NAND_MTK_ECC_H__
+#define __DRIVERS_MTD_NAND_MTK_ECC_H__
+
+#include <linux/types.h>
+
+struct device_node;
+struct mtk_ecc;
+
+/**
+ * @len: number of bytes in the data buffer
+ * @data: pointer to memory holding the data
+ * @strength: number of correctable bits
+ */
+struct mtk_ecc_enc_data {
+	unsigned int len;
+	int strength;
+	u8 *data;
+};
+
+struct mtk_ecc_stats {
+	u32 corrected;
+	u32 bitflips;
+	u32 failed;
+};
+
+struct mtk_ecc_config {
+	u32 strength;
+	u32 step_len;
+};
+
+void mtk_ecc_enable_decode(struct mtk_ecc *);
+void mtk_ecc_disable_decode(struct mtk_ecc *);
+
+int mtk_ecc_wait_decode(struct mtk_ecc *);
+void mtk_ecc_enable_encode(struct mtk_ecc *);
+void mtk_ecc_disable_encode(struct mtk_ecc *);
+int mtk_ecc_start_encode(struct mtk_ecc *, struct mtk_ecc_enc_data *);
+void mtk_ecc_hw_init(struct mtk_ecc *);
+int mtk_ecc_config(struct mtk_ecc *, struct mtk_ecc_config *);
+void mtk_ecc_release(struct mtk_ecc *);
+struct mtk_ecc *of_mtk_ecc_get(struct device_node *);
+
+void mtk_ecc_start_decode(struct mtk_ecc *, int sectors);
+void mtk_ecc_get_stats(struct mtk_ecc *, struct mtk_ecc_stats *, int sectors);
+#endif
diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
new file mode 100644
index 0000000..048024f
--- /dev/null
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -0,0 +1,1266 @@
+/*
+ * MTK NAND Flash controller driver.
+ * Copyright (C) 2016 MediaTek Inc.
+ * Authors:	Xiaolei Li		<xiaolei.li@mediatek.com>
+ *		Jorge Ramirez-Ortiz	<jorge.ramirez-ortiz@linaro.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/mtd.h>
+#include <linux/module.h>
+#include <linux/iopoll.h>
+#include <linux/of.h>
+
+#include "mtk_ecc.h"
+
+/* NAND controller register definition */
+#define NFI_CNFG		(0x00)
+#define		CNFG_AHB		BIT(0)
+#define		CNFG_READ_EN		BIT(1)
+#define		CNFG_DMA_BURST_EN	BIT(2)
+#define		CNFG_BYTE_RW		BIT(6)
+#define		CNFG_HW_ECC_EN		BIT(8)
+#define		CNFG_AUTO_FMT_EN	BIT(9)
+#define		CNFG_OP_CUST		(6 << 12)
+
+#define NFI_PAGEFMT		(0x04)
+#define		PAGEFMT_FDM_ECC_SHIFT	(12)
+#define		PAGEFMT_FDM_SHIFT	(8)
+#define		PAGEFMT_SPARE_16	(0)
+#define		PAGEFMT_SPARE_28	(3)
+#define		PAGEFMT_SPARE_SHIFT	(4)
+#define		PAGEFMT_SEC_SEL_512	BIT(2)
+#define		PAGEFMT_512_2K		(0)
+#define		PAGEFMT_2K_4K		(1)
+#define		PAGEFMT_4K_8K		(2)
+#define		PAGEFMT_8K_16K		(3)
+/* NFI control */
+#define NFI_CON			(0x08)
+#define		CON_FIFO_FLUSH		BIT(0)
+#define		CON_NFI_RST		BIT(1)
+#define		CON_BRD			BIT(8)  /* burst  read */
+#define		CON_BWR			BIT(9)	/* burst  write */
+#define		CON_SEC_SHIFT		(12)
+
+/* Timming control register */
+#define NFI_ACCCON		(0x0C)
+
+#define NFI_INTR_EN		(0x10)
+#define		INTR_AHB_DONE_EN	BIT(6)
+#define NFI_INTR_STA		(0x14)
+#define NFI_CMD			(0x20)
+#define NFI_ADDRNOB		(0x30)
+#define NFI_COLADDR		(0x34)
+#define NFI_ROWADDR		(0x38)
+#define NFI_STRDATA		(0x40)
+#define		STAR_EN			(1)
+#define		STAR_DE			(0)
+#define NFI_CNRNB		(0x44)
+#define NFI_DATAW		(0x50)
+#define NFI_DATAR		(0x54)
+#define NFI_PIO_DIRDY		(0x58)
+#define		PIO_DI_RDY		(0x01)
+#define NFI_STA			(0x60)
+#define		STA_CMD			BIT(0)
+#define		STA_ADDR		BIT(1)
+#define		STA_BUSY		BIT(8)
+#define		STA_EMP_PAGE		BIT(12)
+#define		NFI_FSM_CUSTDATA	(0xe << 16)
+#define		NFI_FSM_MASK		(0xf << 16)
+#define NFI_ADDRCNTR		(0x70)
+#define		CNTR_MASK		GENMASK(16, 12)
+#define NFI_STRADDR		(0x80)
+#define NFI_BYTELEN		(0x84)
+#define NFI_CSEL		(0x90)
+#define NFI_FDM_REG_SIZE	(8)
+#define NFI_FDM0L		(0xA0)
+#define NFI_FDM0M		(0xA4)
+#define NFI_MASTER_STA		(0x224)
+#define		MASTER_STA_MASK		(0x0FFF)
+#define NFI_EMPTY_THRESH	(0x23C)
+
+#define MTK_NAME		"mtk-nand"
+#define KB(x)			((x) * 1024UL)
+#define MB(x)			(KB(x) * 1024UL)
+
+#define MTK_TIMEOUT		(500000)
+#define MTK_RESET_TIMEOUT	(1000000)
+#define MTK_MAX_SECTOR		(16)
+#define MTK_NAND_MAX_NSELS	(2)
+
+struct mtk_nfc_clk {
+	struct clk *nfi_clk;
+	struct clk *pad_clk;
+};
+
+struct mtk_nfc_nand_chip {
+	struct list_head node;
+	struct nand_chip nand;
+	u32 spare_per_sector;
+	int nsels;
+	u8 sels[0];
+};
+
+struct mtk_nfc {
+	struct nand_hw_control controller;
+	struct mtk_nfc_clk clk;
+	struct mtk_ecc *ecc;
+
+	struct device *dev;
+	void __iomem *regs;
+
+	struct completion done;
+	struct list_head chips;
+
+	u8 *buffer;
+};
+
+static inline struct mtk_nfc_nand_chip *to_mtk_nand(struct nand_chip *nand)
+{
+	return container_of(nand, struct mtk_nfc_nand_chip, nand);
+}
+
+static inline uint8_t *data_ptr(struct nand_chip *chip, const uint8_t *p, int i)
+{
+	return (uint8_t *) p + i * chip->ecc.size;
+}
+
+static inline uint8_t *oob_ptr(struct nand_chip *chip, int i)
+{
+	return chip->oob_poi + i * NFI_FDM_REG_SIZE;
+}
+
+static inline int mtk_data_len(struct nand_chip *chip)
+{
+	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
+
+	return chip->ecc.size + mtk_nand->spare_per_sector;
+}
+
+static inline uint8_t *mtk_data_ptr(struct nand_chip *chip,  int i)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+
+	return nfc->buffer + i * mtk_data_len(chip);
+}
+
+static inline uint8_t *mtk_oob_ptr(struct nand_chip *chip, int i)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+
+	return nfc->buffer + i * mtk_data_len(chip) + chip->ecc.size;
+}
+
+static inline int mtk_step_len(struct nand_chip *chip)
+{
+	return chip->ecc.size + NFI_FDM_REG_SIZE;
+}
+
+/* NFI register access */
+static inline void nfi_writel(struct mtk_nfc *nfc, u32 val, u32 reg)
+{
+	writel(val, nfc->regs + reg);
+}
+
+static inline void nfi_writew(struct mtk_nfc *nfc, u16 val, u32 reg)
+{
+	writew(val, nfc->regs + reg);
+}
+
+static inline void nfi_writeb(struct mtk_nfc *nfc, u8 val, u32 reg)
+{
+	writeb(val, nfc->regs + reg);
+}
+
+static inline u32 nfi_readl(struct mtk_nfc *nfc, u32 reg)
+{
+	return readl_relaxed(nfc->regs + reg);
+}
+
+static inline u16 nfi_readw(struct mtk_nfc *nfc, u32 reg)
+{
+	return readw_relaxed(nfc->regs + reg);
+}
+
+static inline u8 nfi_readb(struct mtk_nfc *nfc, u32 reg)
+{
+	return readb_relaxed(nfc->regs + reg);
+}
+
+static void mtk_nfc_hw_reset(struct mtk_nfc *nfc)
+{
+	struct device *dev = nfc->dev;
+	u32 val;
+	int ret;
+
+	nfi_writel(nfc, CON_FIFO_FLUSH | CON_NFI_RST, NFI_CON);
+
+	ret = readl_poll_timeout(nfc->regs + NFI_MASTER_STA, val,
+			!(val & MASTER_STA_MASK), 50, MTK_RESET_TIMEOUT);
+	if (ret)
+		dev_warn(dev, "master active in reset [0x%x] = 0x%x\n",
+			NFI_MASTER_STA, val);
+
+	nfi_writew(nfc, STAR_DE, NFI_STRDATA);
+}
+
+static int mtk_nfc_send_command(struct mtk_nfc *nfc, u8 command)
+{
+	struct device *dev = nfc->dev;
+	u32 val;
+	int ret;
+
+	nfi_writel(nfc, command, NFI_CMD);
+
+	ret = readl_poll_timeout_atomic(nfc->regs + NFI_STA, val,
+					!(val & STA_CMD), 10,  MTK_TIMEOUT);
+	if (ret) {
+		dev_warn(dev, "nfi core timed out entering command mode\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int mtk_nfc_send_address(struct mtk_nfc *nfc, int addr)
+{
+	struct device *dev = nfc->dev;
+	u32 val;
+	int ret;
+
+	nfi_writel(nfc, addr, NFI_COLADDR);
+	nfi_writel(nfc, 0, NFI_ROWADDR);
+	nfi_writew(nfc, 1, NFI_ADDRNOB);
+
+	ret = readl_poll_timeout_atomic(nfc->regs + NFI_STA, val,
+					!(val & STA_ADDR), 10, MTK_TIMEOUT);
+	if (ret) {
+		dev_warn(dev, "nfi core timed out entering address mode\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int mtk_nfc_hw_runtime_config(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	u32 fmt, spare = mtk_nand->spare_per_sector;
+	struct mtk_ecc_config config;
+
+	/* skip configuration when recognize NAND Flash */
+	if (!mtd->writesize)
+		return 0;
+
+	switch (mtd->writesize) {
+	case 512:
+		fmt = PAGEFMT_512_2K | PAGEFMT_SEC_SEL_512;
+		break;
+	case KB(2):
+		fmt = PAGEFMT_512_2K;
+		break;
+	case KB(4):
+		fmt = PAGEFMT_2K_4K;
+		break;
+	case KB(8):
+		fmt = PAGEFMT_4K_8K;
+		break;
+	default:
+		dev_err(nfc->dev, "invalid page len: %d\n", mtd->writesize);
+		return -EINVAL;
+	}
+
+	if (mtd->writesize > 512)
+		spare >>= 1;
+
+	switch (spare) {
+	case 16:
+		fmt |= (PAGEFMT_SPARE_16 << PAGEFMT_SPARE_SHIFT);
+		break;
+	case 28:
+		fmt |= (PAGEFMT_SPARE_28 << PAGEFMT_SPARE_SHIFT);
+		break;
+	default:
+		break;
+	}
+	fmt |= NFI_FDM_REG_SIZE << PAGEFMT_FDM_SHIFT;
+	fmt |= NFI_FDM_REG_SIZE << PAGEFMT_FDM_ECC_SHIFT;
+	nfi_writew(nfc, fmt, NFI_PAGEFMT);
+
+	config.step_len = mtk_step_len(chip);
+	config.strength = chip->ecc.strength;
+	mtk_ecc_config(nfc->ecc, &config);
+
+	return 0;
+}
+
+static void mtk_nfc_select_chip(struct mtd_info *mtd, int chip)
+{
+	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct mtk_nfc *nfc = nand_get_controller_data(nand);
+	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(nand);
+
+	if (chip < 0)
+		return;
+
+	mtk_nfc_hw_runtime_config(mtd);
+
+	nfi_writel(nfc, mtk_nand->sels[chip], NFI_CSEL);
+}
+
+static int mtk_nfc_dev_ready(struct mtd_info *mtd)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nand(mtd));
+
+	if (nfi_readl(nfc, NFI_STA) & STA_BUSY)
+		return 0;
+
+	return 1;
+}
+
+static void mtk_nfc_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nand(mtd));
+
+	if (ctrl & NAND_ALE) {
+		mtk_nfc_send_address(nfc, dat);
+	} else if (ctrl & NAND_CLE) {
+		mtk_nfc_hw_reset(nfc);
+
+		nfi_writew(nfc, CNFG_OP_CUST, NFI_CNFG);
+		mtk_nfc_send_command(nfc, dat);
+	}
+}
+
+static inline void mtk_nfc_wait_ioready(struct mtk_nfc *nfc)
+{
+	int rc;
+	u8 val;
+
+	rc = readb_poll_timeout_atomic(nfc->regs + NFI_PIO_DIRDY, val,
+					val & PIO_DI_RDY, 10, MTK_TIMEOUT);
+	if (rc < 0)
+		dev_err(nfc->dev, "data not ready\n");
+}
+
+static inline uint8_t mtk_nfc_read_byte(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	u32 reg;
+
+	reg = nfi_readl(nfc, NFI_STA) & NFI_FSM_MASK;
+	if (reg != NFI_FSM_CUSTDATA) {
+		reg = nfi_readw(nfc, NFI_CNFG);
+		reg |= CNFG_BYTE_RW | CNFG_READ_EN;
+		nfi_writew(nfc, reg, NFI_CNFG);
+
+		reg = (MTK_MAX_SECTOR << CON_SEC_SHIFT) | CON_BRD;
+		nfi_writel(nfc, reg, NFI_CON);
+
+		/* trigger to fetch data */
+		nfi_writew(nfc, STAR_EN, NFI_STRDATA);
+
+		/* hardware issue work around:
+		 * The first byte of data may be wrong right after the trigger.
+		 * (The controller fetches data until the internal FIFO is full)
+		 */
+		udelay(10);
+	}
+
+	mtk_nfc_wait_ioready(nfc);
+
+	return nfi_readb(nfc, NFI_DATAR);
+}
+
+static void mtk_nfc_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		buf[i] = mtk_nfc_read_byte(mtd);
+}
+
+static void mtk_nfc_write_byte(struct mtd_info *mtd, uint8_t byte)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nand(mtd));
+	u32 reg;
+
+	reg = nfi_readl(nfc, NFI_STA) & NFI_FSM_MASK;
+
+	if (reg != NFI_FSM_CUSTDATA) {
+		reg = nfi_readw(nfc, NFI_CNFG) | CNFG_BYTE_RW;
+		nfi_writew(nfc, reg, NFI_CNFG);
+
+		reg = MTK_MAX_SECTOR << CON_SEC_SHIFT | CON_BWR;
+		nfi_writel(nfc, reg, NFI_CON);
+
+		nfi_writew(nfc, STAR_EN, NFI_STRDATA);
+	}
+
+	mtk_nfc_wait_ioready(nfc);
+	nfi_writeb(nfc, byte, NFI_DATAW);
+}
+
+static void mtk_nfc_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
+{
+	int i;
+
+	for (i = 0; i < len; i++)
+		mtk_nfc_write_byte(mtd, buf[i]);
+}
+
+static int mtk_nfc_sector_encode(struct nand_chip *chip, u8 *data)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	struct mtk_ecc_enc_data enc_data = {
+		.strength = chip->ecc.strength,
+		.len = mtk_step_len(chip),
+		.data = data,
+	};
+
+	return mtk_ecc_start_encode(nfc->ecc, &enc_data);
+}
+
+static int mtk_nfc_format_subpage(struct mtd_info *mtd, uint32_t offset,
+			uint32_t len, const uint8_t *buf, int oob_on)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	u32 start, end;
+	int i, ret;
+
+	start = offset / chip->ecc.size;
+	end = DIV_ROUND_UP(offset + len, chip->ecc.size);
+
+	memset(nfc->buffer, 0xff, mtd->writesize + mtd->oobsize);
+	for (i = 0; i < chip->ecc.steps; i++) {
+
+		memcpy(mtk_data_ptr(chip, i), data_ptr(chip, buf, i),
+			chip->ecc.size);
+
+		if (i < start || i >= end)
+			continue;
+
+		if (oob_on)
+			memcpy(mtk_oob_ptr(chip, i), oob_ptr(chip, i),
+				NFI_FDM_REG_SIZE);
+
+		/* program the CRC back to the OOB */
+		ret = mtk_nfc_sector_encode(chip, mtk_data_ptr(chip, i));
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_nfc_format_page(struct mtd_info *mtd, const uint8_t *buf,
+				int oob_on)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	u32 i;
+
+	memset(nfc->buffer, 0xff, mtd->writesize + mtd->oobsize);
+	for (i = 0; i < chip->ecc.steps; i++) {
+		if (buf)
+			memcpy(mtk_data_ptr(chip, i), data_ptr(chip, buf, i),
+				chip->ecc.size);
+		if (oob_on)
+			memcpy(mtk_oob_ptr(chip, i), oob_ptr(chip, i),
+				NFI_FDM_REG_SIZE);
+	}
+}
+
+static inline void mtk_nfc_read_fdm(struct nand_chip *chip, u32 sectors)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	u32 *p;
+	int i;
+
+	for (i = 0; i < sectors; i++) {
+		p = (u32 *) oob_ptr(chip, i);
+		p[0] = nfi_readl(nfc, NFI_FDM0L + i * NFI_FDM_REG_SIZE);
+		p[1] = nfi_readl(nfc, NFI_FDM0M + i * NFI_FDM_REG_SIZE);
+	}
+}
+
+static inline void mtk_nfc_write_fdm(struct nand_chip *chip)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	u32 *p;
+	int i;
+
+	for (i = 0; i < chip->ecc.steps ; i++) {
+		p = (u32 *) oob_ptr(chip, i);
+		nfi_writel(nfc, p[0], NFI_FDM0L + i * NFI_FDM_REG_SIZE);
+		nfi_writel(nfc, p[1], NFI_FDM0M + i * NFI_FDM_REG_SIZE);
+	}
+}
+
+static int mtk_nfc_do_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+	const uint8_t *buf, int page, int len)
+{
+
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	struct device *dev = nfc->dev;
+	dma_addr_t addr;
+	u32 reg;
+	int ret;
+
+	addr = dma_map_single(dev, (void *) buf, len, DMA_TO_DEVICE);
+	ret = dma_mapping_error(nfc->dev, addr);
+	if (ret) {
+		dev_err(nfc->dev, "dma mapping error\n");
+		return -EINVAL;
+	}
+
+	reg = nfi_readw(nfc, NFI_CNFG) | CNFG_AHB | CNFG_DMA_BURST_EN;
+	nfi_writew(nfc, reg, NFI_CNFG);
+
+	nfi_writel(nfc, chip->ecc.steps << CON_SEC_SHIFT, NFI_CON);
+	nfi_writel(nfc, lower_32_bits(addr), NFI_STRADDR);
+	nfi_writew(nfc, INTR_AHB_DONE_EN, NFI_INTR_EN);
+
+	init_completion(&nfc->done);
+
+	reg = nfi_readl(nfc, NFI_CON) | CON_BWR;
+	nfi_writel(nfc, reg, NFI_CON);
+	nfi_writew(nfc, STAR_EN, NFI_STRDATA);
+
+	ret = wait_for_completion_timeout(&nfc->done, msecs_to_jiffies(500));
+	if (!ret) {
+		dev_err(dev, "program ahb done timeout\n");
+		nfi_writew(nfc, 0, NFI_INTR_EN);
+		ret = -ETIMEDOUT;
+		goto timeout;
+	}
+
+	ret = readl_poll_timeout_atomic(nfc->regs + NFI_ADDRCNTR, reg,
+			(reg & CNTR_MASK) >= chip->ecc.steps, 10, MTK_TIMEOUT);
+	if (ret)
+		dev_err(dev, "hwecc write timeout\n");
+
+timeout:
+
+	dma_unmap_single(nfc->dev, addr, len, DMA_TO_DEVICE);
+	nfi_writel(nfc, 0, NFI_CON);
+
+	return ret;
+}
+
+static int mtk_nfc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+			const uint8_t *buf, int oob_on, int page, int raw)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	size_t len;
+	u32 reg;
+	int ret;
+
+	if (!raw) {
+		/* OOB => FDM: from register,  ECC: from HW */
+		reg = nfi_readw(nfc, NFI_CNFG) | CNFG_AUTO_FMT_EN;
+		nfi_writew(nfc, reg | CNFG_HW_ECC_EN, NFI_CNFG);
+
+		mtk_ecc_enable_encode(nfc->ecc);
+
+		/* write OOB into the FDM registers (OOB area in MTK NAND) */
+		if (oob_on)
+			mtk_nfc_write_fdm(chip);
+	}
+
+	len = mtd->writesize + (raw ? mtd->oobsize : 0);
+	ret = mtk_nfc_do_write_page(mtd, chip, buf, page, len);
+
+	if (!raw)
+		mtk_ecc_disable_encode(nfc->ecc);
+
+	return ret;
+}
+
+static int mtk_nfc_write_page_hwecc(struct mtd_info *mtd,
+			struct nand_chip *chip, const uint8_t *buf,
+			int oob_on, int page)
+{
+	return mtk_nfc_write_page(mtd, chip, buf, oob_on, page, 0);
+}
+
+static int mtk_nfc_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+					const uint8_t *buf, int oob_on, int pg)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+
+	mtk_nfc_format_page(mtd, buf, oob_on);
+	return mtk_nfc_write_page(mtd, chip, nfc->buffer, 0, pg, 1);
+}
+
+static int mtk_nfc_write_subpage_hwecc(struct mtd_info *mtd,
+		struct nand_chip *chip, uint32_t offset, uint32_t data_len,
+		const uint8_t *buf, int oob_on, int page)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	int ret;
+
+	ret = mtk_nfc_format_subpage(mtd, offset, data_len, buf, oob_on);
+	if (ret < 0)
+		return ret;
+
+	/* use the data in the private buffer (now with FDM and CRC) */
+	return mtk_nfc_write_page(mtd, chip, nfc->buffer, 0, page, 1);
+}
+
+static int mtk_nfc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
+				int page)
+{
+	u8 *data = chip->buffers->databuf;
+	int ret;
+
+	memset(data, 0xff, mtd->writesize);
+
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
+
+	ret = mtk_nfc_write_page_hwecc(mtd, chip, data, 1, page);
+	if (ret < 0)
+		return -EIO;
+
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	ret = chip->waitfunc(mtd, chip);
+
+	return ret & NAND_STATUS_FAIL ? -EIO : 0;
+}
+
+static int mtk_nfc_write_oob_raw(struct mtd_info *mtd, struct nand_chip *chip,
+					int page)
+{
+	int ret;
+
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
+	ret = mtk_nfc_write_page_raw(mtd, chip, NULL, 1, page);
+	if (ret < 0)
+		return -EIO;
+
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	ret = chip->waitfunc(mtd, chip);
+
+	return ret & NAND_STATUS_FAIL ? -EIO : 0;
+}
+
+static int mtk_nfc_update_oob(struct mtd_info *mtd, struct nand_chip *chip,
+				u8 *buf, u32 sectors)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	struct mtk_ecc_stats stats;
+	int rc, i;
+
+	rc = nfi_readl(nfc, NFI_STA) & STA_EMP_PAGE;
+	if (rc) {
+		memset(buf, 0xff, sectors * chip->ecc.size);
+
+		for (i = 0; i < sectors; i++)
+			memset(oob_ptr(chip, i), 0xff, NFI_FDM_REG_SIZE);
+
+		return 0;
+	}
+
+	mtk_nfc_read_fdm(chip, sectors);
+
+	mtk_ecc_get_stats(nfc->ecc, &stats, sectors);
+	mtd->ecc_stats.corrected += stats.corrected;
+	mtd->ecc_stats.failed += stats.failed;
+
+	return stats.bitflips;
+}
+
+static int mtk_nfc_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	u8 *buf = chip->buffers->databuf;
+	int page, rc, i;
+
+	memset(buf, 0x00, mtd->writesize + mtd->oobsize);
+
+	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
+		ofs += mtd->erasesize - mtd->writesize;
+
+	i = 0;
+	do {
+		page = (int)(ofs >> chip->page_shift);
+		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
+		rc = mtk_nfc_write_page(mtd, chip, buf, 0, page, 1);
+		if (rc < 0)
+			return rc;
+
+		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+		rc = chip->waitfunc(mtd, chip);
+		rc = rc & NAND_STATUS_FAIL ? -EIO : 0;
+		if (rc < 0)
+			return rc;
+
+		ofs += mtd->writesize;
+		i++;
+
+	} while ((chip->bbt_options & NAND_BBT_SCAN2NDPAGE) && i < 2);
+
+	return 0;
+}
+
+static int mtk_nfc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
+		uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi,
+		int page, int raw)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	struct mtk_nfc_nand_chip *mtk_nand = to_mtk_nand(chip);
+	u32 column, sectors, start, end, reg;
+	u32 spare = mtk_nand->spare_per_sector;
+	dma_addr_t addr;
+	int bitflips;
+	size_t len;
+	u8 *buf;
+	int rc;
+
+	start = data_offs / chip->ecc.size;
+	end = DIV_ROUND_UP(data_offs + readlen, chip->ecc.size);
+
+	sectors = end - start;
+	column = start * (chip->ecc.size + spare);
+
+	len = sectors * chip->ecc.size + (raw ? sectors * spare : 0);
+	buf = bufpoi + start * chip->ecc.size;
+
+	if (column != 0)
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, column, -1);
+
+	addr = dma_map_single(nfc->dev, buf, len, DMA_FROM_DEVICE);
+	rc = dma_mapping_error(nfc->dev, addr);
+	if (rc) {
+		dev_err(nfc->dev, "dma mapping error\n");
+		return -EINVAL;
+	}
+
+	reg = nfi_readw(nfc, NFI_CNFG);
+	reg |= CNFG_READ_EN | CNFG_DMA_BURST_EN | CNFG_AHB;
+	if (!raw) {
+		reg |= CNFG_AUTO_FMT_EN | CNFG_HW_ECC_EN;
+		nfi_writew(nfc, reg, NFI_CNFG);
+
+		mtk_ecc_enable_decode(nfc->ecc);
+	} else
+		nfi_writew(nfc, reg, NFI_CNFG);
+
+	nfi_writel(nfc, sectors << CON_SEC_SHIFT, NFI_CON);
+	nfi_writew(nfc, INTR_AHB_DONE_EN, NFI_INTR_EN);
+	nfi_writel(nfc, lower_32_bits(addr), NFI_STRADDR);
+
+	if (!raw)
+		mtk_ecc_start_decode(nfc->ecc, sectors);
+
+	init_completion(&nfc->done);
+	reg = nfi_readl(nfc, NFI_CON) | CON_BRD;
+	nfi_writel(nfc, reg, NFI_CON);
+	nfi_writew(nfc, STAR_EN, NFI_STRDATA);
+
+	rc = wait_for_completion_timeout(&nfc->done, msecs_to_jiffies(500));
+	if (!rc)
+		dev_warn(nfc->dev, "read ahb/dma done timeout\n");
+
+	rc = readl_poll_timeout_atomic(nfc->regs + NFI_BYTELEN, reg,
+				(reg & CNTR_MASK) >= sectors, 10, MTK_TIMEOUT);
+	if (rc < 0) {
+		dev_err(nfc->dev, "subpage done timeout\n");
+		bitflips = -EIO;
+	} else {
+		bitflips = 0;
+		if (!raw) {
+			rc = mtk_ecc_wait_decode(nfc->ecc);
+			bitflips = rc < 0 ? -ETIMEDOUT :
+				mtk_nfc_update_oob(mtd, chip, buf, sectors);
+		}
+	}
+
+	dma_unmap_single(nfc->dev, addr, len, DMA_FROM_DEVICE);
+
+	if (!raw)
+		mtk_ecc_disable_decode(nfc->ecc);
+
+	nfi_writel(nfc, 0, NFI_CON);
+
+	return bitflips;
+}
+
+static int mtk_nfc_read_subpage_hwecc(struct mtd_info *mtd,
+	struct nand_chip *chip, uint32_t off, uint32_t len, uint8_t *p, int pg)
+{
+	return mtk_nfc_read_subpage(mtd, chip, off, len, p, pg, 0);
+}
+
+static int mtk_nfc_read_page_hwecc(struct mtd_info *mtd,
+	struct nand_chip *chip, uint8_t *p, int oob_on, int pg)
+{
+	return mtk_nfc_read_subpage_hwecc(mtd, chip, 0, mtd->writesize, p, pg);
+}
+
+static int mtk_nfc_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+				uint8_t *buf, int oob_on, int page)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(chip);
+	int i, ret;
+
+	memset(nfc->buffer, 0xff, mtd->writesize + mtd->oobsize);
+	ret = mtk_nfc_read_subpage(mtd, chip, 0, mtd->writesize, nfc->buffer,
+					page, 1);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < chip->ecc.steps; i++) {
+		if (buf)
+			memcpy(data_ptr(chip, buf, i), mtk_data_ptr(chip, i),
+							chip->ecc.size);
+		if (oob_on)
+			memcpy(oob_ptr(chip, i), mtk_oob_ptr(chip, i),
+							NFI_FDM_REG_SIZE);
+	}
+
+	return ret;
+}
+
+static int mtk_nfc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
+				int page)
+{
+	u8 *buf = chip->buffers->databuf;
+	struct mtd_ecc_stats stats;
+	int ret;
+
+	stats = mtd->ecc_stats;
+
+	memset(buf, 0xff, mtd->writesize);
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
+
+	ret = mtk_nfc_read_page_hwecc(mtd, chip, buf, 1, page);
+
+	/* mark as invalid data 0x00 if UECC happens */
+	if ((mtd->ecc_stats.failed - stats.failed) > 0)
+		memset(chip->oob_poi, 0, mtd->oobsize);
+
+	if (ret < mtd->bitflip_threshold)
+		mtd->ecc_stats.corrected = stats.corrected;
+
+	return ret;
+}
+
+static int mtk_nfc_read_oob_raw(struct mtd_info *mtd, struct nand_chip *chip,
+				int page)
+{
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
+
+	return mtk_nfc_read_page_raw(mtd, chip, NULL, 1, page);
+}
+
+
+static inline void mtk_nfc_hw_init(struct mtk_nfc *nfc)
+{
+	nfi_writel(nfc, 0x10804211, NFI_ACCCON);
+	nfi_writew(nfc, 0xf1, NFI_CNRNB);
+	nfi_writew(nfc, PAGEFMT_8K_16K, NFI_PAGEFMT);
+
+	mtk_nfc_hw_reset(nfc);
+
+	nfi_readl(nfc, NFI_INTR_STA);
+	nfi_writel(nfc, 0, NFI_INTR_EN);
+}
+
+static irqreturn_t mtk_nfc_irq(int irq, void *id)
+{
+	struct mtk_nfc *nfc = id;
+	u16 sta, ien;
+
+	sta = nfi_readw(nfc, NFI_INTR_STA);
+	ien = nfi_readw(nfc, NFI_INTR_EN);
+
+	if (!(sta & ien))
+		return IRQ_NONE;
+
+	nfi_writew(nfc, ~sta & ien, NFI_INTR_EN);
+	complete(&nfc->done);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_nfc_enable_clk(struct device *dev, struct mtk_nfc_clk *clk)
+{
+	int ret;
+
+	ret = clk_prepare_enable(clk->nfi_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable nfi clk\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(clk->pad_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable pad clk\n");
+		clk_disable_unprepare(clk->nfi_clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_nfc_disable_clk(struct mtk_nfc_clk *clk)
+{
+	clk_disable_unprepare(clk->nfi_clk);
+	clk_disable_unprepare(clk->pad_clk);
+}
+
+static int mtk_nfc_ooblayout_free(struct mtd_info *mtd, int section,
+				struct mtd_oob_region *oob_region)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	if (section)
+		return -ERANGE;
+
+	oob_region->length = NFI_FDM_REG_SIZE * chip->ecc.steps;
+	oob_region->offset = 0;
+
+	return 0;
+}
+
+static int mtk_nfc_ooblayout_ecc(struct mtd_info *mtd, int section,
+				struct mtd_oob_region *oob_region)
+{
+	struct mtd_oob_region free_region;
+
+	if (section)
+		return -ERANGE;
+
+	mtk_nfc_ooblayout_free(mtd, 0, &free_region);
+
+	oob_region->length = mtd->oobsize - free_region.length;
+	oob_region->offset = free_region.length;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops mtk_nfc_ooblayout_ops = {
+	.free = mtk_nfc_ooblayout_free,
+	.ecc = mtk_nfc_ooblayout_ecc,
+};
+
+static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
+				struct device_node *np)
+{
+	struct mtk_nfc_nand_chip *chip;
+	struct nand_chip *nand;
+	struct mtd_info *mtd;
+	int nsels, len;
+	u32 tmp;
+	int ret;
+	int i;
+
+	if (!of_get_property(np, "reg", &nsels))
+		return -ENODEV;
+
+	nsels /= sizeof(u32);
+	if (!nsels || nsels > MTK_NAND_MAX_NSELS) {
+		dev_err(dev, "invalid reg property size %d\n", nsels);
+		return -EINVAL;
+	}
+
+	chip = devm_kzalloc(dev,
+			sizeof(*chip) + nsels * sizeof(u8), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->nsels = nsels;
+	for (i = 0; i < nsels; i++) {
+		ret = of_property_read_u32_index(np, "reg", i, &tmp);
+		if (ret) {
+			dev_err(dev, "reg property failure : %d\n", ret);
+			return ret;
+		}
+		chip->sels[i] = tmp;
+	}
+
+	if (of_property_read_u32(np, "spare_per_sector",
+						&chip->spare_per_sector)) {
+		dev_err(dev, "missing spare_per_sector property in DT\n");
+		return -ENODEV;
+
+	}
+
+	nand = &chip->nand;
+	nand->controller = &nfc->controller;
+
+	nand_set_flash_node(nand, np);
+	nand_set_controller_data(nand, nfc);
+
+	nand->options |= NAND_USE_BOUNCE_BUFFER | NAND_SUBPAGE_READ;
+	nand->block_markbad = mtk_nfc_block_markbad;
+	nand->dev_ready = mtk_nfc_dev_ready;
+	nand->select_chip = mtk_nfc_select_chip;
+	nand->write_byte = mtk_nfc_write_byte;
+	nand->write_buf = mtk_nfc_write_buf;
+	nand->read_byte = mtk_nfc_read_byte;
+	nand->read_buf = mtk_nfc_read_buf;
+	nand->cmd_ctrl = mtk_nfc_cmd_ctrl;
+
+	/* set default mode in case dt entry is missing */
+	nand->ecc.mode = NAND_ECC_HW;
+
+	nand->ecc.write_subpage = mtk_nfc_write_subpage_hwecc;
+	nand->ecc.write_page_raw = mtk_nfc_write_page_raw;
+	nand->ecc.write_page = mtk_nfc_write_page_hwecc;
+	nand->ecc.write_oob_raw = mtk_nfc_write_oob_raw;
+	nand->ecc.write_oob = mtk_nfc_write_oob;
+
+	nand->ecc.read_subpage = mtk_nfc_read_subpage_hwecc;
+	nand->ecc.read_page_raw = mtk_nfc_read_page_raw;
+	nand->ecc.read_oob_raw = mtk_nfc_read_oob_raw;
+	nand->ecc.read_page = mtk_nfc_read_page_hwecc;
+	nand->ecc.read_oob = mtk_nfc_read_oob;
+
+	mtd = nand_to_mtd(nand);
+	mtd->owner = THIS_MODULE;
+	mtd->dev.parent = dev;
+	mtd->name = MTK_NAME;
+	mtd_set_ooblayout(mtd, &mtk_nfc_ooblayout_ops);
+
+	mtk_nfc_hw_init(nfc);
+
+	ret = nand_scan_ident(mtd, nsels, NULL);
+	if (ret)
+		return -ENODEV;
+
+	/* TODO: add NAND_ECC_SOFT */
+	if (nand->ecc.mode != NAND_ECC_HW) {
+		dev_err(dev, "driver only supports NAND_ECC_HW\n");
+		return -ENODEV;
+	}
+
+	ret = nand_scan_tail(mtd);
+	if (ret)
+		return -ENODEV;
+
+	len = mtd->writesize + mtd->oobsize;
+	nfc->buffer = devm_kzalloc(dev, len, GFP_KERNEL);
+	if (!nfc->buffer)
+		return  -ENOMEM;
+
+	ret = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	if (ret) {
+		dev_err(dev, "mtd parse partition error\n");
+		nand_release(mtd);
+		return ret;
+	}
+
+	list_add_tail(&chip->node, &nfc->chips);
+
+	return 0;
+}
+
+static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
+{
+	struct device_node *np = dev->of_node;
+	struct device_node *nand_np;
+	int ret;
+
+	for_each_child_of_node(np, nand_np) {
+		ret = mtk_nfc_nand_chip_init(dev, nfc, nand_np);
+		if (ret) {
+			of_node_put(nand_np);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int mtk_nfc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct mtk_nfc *nfc;
+	struct resource *res;
+	int ret, irq;
+
+	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	if (!nfc)
+		return -ENOMEM;
+
+	spin_lock_init(&nfc->controller.lock);
+	init_waitqueue_head(&nfc->controller.wq);
+	INIT_LIST_HEAD(&nfc->chips);
+
+	/* probe defer if not ready */
+	nfc->ecc = of_mtk_ecc_get(np);
+	if (IS_ERR(nfc->ecc))
+		return PTR_ERR(nfc->ecc);
+	else if (!nfc->ecc)
+		return -ENODEV;
+
+	nfc->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	nfc->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(nfc->regs)) {
+		ret = PTR_ERR(nfc->regs);
+		dev_err(dev, "no nfi base\n");
+		goto release_ecc;
+	}
+
+	nfc->clk.nfi_clk = devm_clk_get(dev, "nfi_clk");
+	if (IS_ERR(nfc->clk.nfi_clk)) {
+		dev_err(dev, "no clk\n");
+		ret = PTR_ERR(nfc->clk.nfi_clk);
+		goto release_ecc;
+	}
+
+	nfc->clk.pad_clk = devm_clk_get(dev, "pad_clk");
+	if (IS_ERR(nfc->clk.pad_clk)) {
+		dev_err(dev, "no pad clk\n");
+		ret = PTR_ERR(nfc->clk.pad_clk);
+		goto release_ecc;
+	}
+
+	ret = mtk_nfc_enable_clk(dev, &nfc->clk);
+	if (ret)
+		goto release_ecc;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "no nfi irq resource\n");
+		ret = -EINVAL;
+		goto clk_disable;
+	}
+
+	ret = devm_request_irq(dev, irq, mtk_nfc_irq, 0x0, "mtk-nand", nfc);
+	if (ret) {
+		dev_err(dev, "failed to request nfi irq\n");
+		goto clk_disable;
+	}
+
+	ret = dma_set_mask(dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(dev, "failed to set dma mask\n");
+		goto clk_disable;
+	}
+
+	platform_set_drvdata(pdev, nfc);
+
+	ret = mtk_nfc_nand_chips_init(dev, nfc);
+	if (ret) {
+		dev_err(dev, "failed to init nand chips\n");
+		goto clk_disable;
+	}
+
+	return 0;
+
+clk_disable:
+	mtk_nfc_disable_clk(&nfc->clk);
+
+release_ecc:
+	mtk_ecc_release(nfc->ecc);
+
+	return ret;
+}
+
+static int mtk_nfc_remove(struct platform_device *pdev)
+{
+	struct mtk_nfc *nfc = platform_get_drvdata(pdev);
+	struct mtk_nfc_nand_chip *chip;
+
+	while (!list_empty(&nfc->chips)) {
+		chip = list_first_entry(&nfc->chips, struct mtk_nfc_nand_chip,
+					node);
+		nand_release(nand_to_mtd(&chip->nand));
+		list_del(&chip->node);
+	}
+
+	mtk_ecc_release(nfc->ecc);
+	mtk_nfc_disable_clk(&nfc->clk);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int mtk_nfc_suspend(struct device *dev)
+{
+	struct mtk_nfc *nfc = dev_get_drvdata(dev);
+
+	mtk_nfc_disable_clk(&nfc->clk);
+
+	return 0;
+}
+
+static int mtk_nfc_resume(struct device *dev)
+{
+	struct mtk_nfc *nfc = dev_get_drvdata(dev);
+	struct mtk_nfc_nand_chip *chip;
+	struct nand_chip *nand;
+	struct mtd_info *mtd;
+	int ret;
+	u32 i;
+
+	udelay(200);
+
+	ret = mtk_nfc_enable_clk(dev, &nfc->clk);
+	if (ret)
+		return ret;
+
+	mtk_nfc_hw_init(nfc);
+
+	list_for_each_entry(chip, &nfc->chips, node) {
+		nand = &chip->nand;
+		mtd = nand_to_mtd(nand);
+		for (i = 0; i < chip->nsels; i++) {
+			nand->select_chip(mtd, i);
+			nand->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+		}
+	}
+
+	return 0;
+}
+static SIMPLE_DEV_PM_OPS(mtk_nfc_pm_ops, mtk_nfc_suspend, mtk_nfc_resume);
+#endif
+
+static const struct of_device_id mtk_nfc_id_table[] = {
+	{ .compatible = "mediatek,mt2701-nfc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
+
+static struct platform_driver mtk_nfc_driver = {
+	.probe  = mtk_nfc_probe,
+	.remove = mtk_nfc_remove,
+	.driver = {
+		.name  = MTK_NAME,
+		.of_match_table = mtk_nfc_id_table,
+#ifdef CONFIG_PM_SLEEP
+		.pm = &mtk_nfc_pm_ops,
+#endif
+	},
+};
+
+module_platform_driver(mtk_nfc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Xiaolei Li <xiaolei.li@mediatek.com>");
+MODULE_AUTHOR("Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>");
+MODULE_DESCRIPTION("MTK Nand Flash Controller Driver");
-- 
2.5.0
