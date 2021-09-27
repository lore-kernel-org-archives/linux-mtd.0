Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C152C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 05:42:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D84F760EB6
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 05:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D84F760EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXYnRdGi4YVPKC6caY/YkVXRzC9EdjrX+2tyUyxuX+s=; b=zNG6RSzv4rb0Pp
	RFHu+tWNtG2fLyF8kPYaOGzfAnfOBJHUv/GsY/rIuj3pf6WkLyi9JNpp4HRrz+DZJdeE42qdETq+V
	uY2R+h81ZzAZy7+Dzh09w2NjZ4h8hq7zmHkXcAfykcEhHrec590A2B7Z//Uv3SBr4JWwdzVLUdCwR
	RtFG11LOagsBx+QvreB46Mqeu0xdkv/55FQBWLrjKSZdCMX2kw2ta7JIwPb3BhFfW3NhFrCL6fXgP
	MYeUG5Zli3s39GOY+JDg/2phaHWo5P8fdkD9e6kfrpHtRyjxzLtL38AvEmT6sIxbQ18imd+y2wXgC
	OHmCd4zhOyQ1VEJ9NqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUjOj-001bFH-JY; Mon, 27 Sep 2021 05:41:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUjOS-001bAw-EI; Mon, 27 Sep 2021 05:41:39 +0000
X-UUID: fcf67711b40e451e89b25ea4f2626304-20210926
X-UUID: fcf67711b40e451e89b25ea4f2626304-20210926
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1088492150; Sun, 26 Sep 2021 22:41:31 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Sep 2021 22:36:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Sep 2021 13:36:53 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Sep 2021 13:36:51 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <xiangsheng.hou@mediatek.com>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <info@bootlin.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [RFC,v1 3/4] spi: add Mediatek SPI Nand controller driver
Date: Mon, 27 Sep 2021 13:36:28 +0800
Message-ID: <20210927053629.17847-4-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927053629.17847-1-xiangsheng.hou@mediatek.com>
References: <20210927053629.17847-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_224136_538105_0BBC192F 
X-CRM114-Status: GOOD (  24.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This version parse nand parameter and ecc status from
nfi reg, which have been config at ecc driver due to
the snfi driver can not get these information.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 drivers/spi/Kconfig        |   11 +
 drivers/spi/Makefile       |    1 +
 drivers/spi/spi-mtk-snfi.c | 1043 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1055 insertions(+)
 create mode 100644 drivers/spi/spi-mtk-snfi.c

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 83e352b0c8f9..6768cd510f77 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -514,6 +514,17 @@ config SPI_MT65XX
 	  say Y or M here.If you are not sure, say N.
 	  SPI drivers for Mediatek MT65XX and MT81XX series ARM SoCs.
 
+config SPI_MTK_SNFI
+	tristate "MediaTek SPI NAND interface"
+	depends on MTD
+	select MTD_SPI_NAND
+	select MTD_NAND_ECC_MTK
+	help
+	  This selects the SPI NAND FLASH interface(SNFI),
+	  which could be found on MediaTek Soc.
+	  Say Y or M here.If you are not sure, say N.
+	  Note Parallel Nand and SPI NAND is alternative on MediaTek SoCs.
+
 config SPI_MT7621
 	tristate "MediaTek MT7621 SPI Controller"
 	depends on RALINK || COMPILE_TEST
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 699db95c8441..0435624905d9 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_SPI_MPC512x_PSC)		+= spi-mpc512x-psc.o
 obj-$(CONFIG_SPI_MPC52xx_PSC)		+= spi-mpc52xx-psc.o
 obj-$(CONFIG_SPI_MPC52xx)		+= spi-mpc52xx.o
 obj-$(CONFIG_SPI_MT65XX)                += spi-mt65xx.o
+obj-$(CONFIG_SPI_MTK_SNFI)              += spi-mtk-snfi.o
 obj-$(CONFIG_SPI_MT7621)		+= spi-mt7621.o
 obj-$(CONFIG_SPI_MTK_NOR)		+= spi-mtk-nor.o
 obj-$(CONFIG_SPI_MXIC)			+= spi-mxic.o
diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
new file mode 100644
index 000000000000..afc93410975e
--- /dev/null
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -0,0 +1,1043 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for MediaTek SPI Nand interface
+ *
+ * Copyright (C) 2021 MediaTek Inc.
+ * Authors:	Xiangsheng Hou	<xiangsheng.hou@mediatek.com>
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
+
+/* Registers used by the driver */
+#define NFI_CNFG		0x00
+#define		CNFG_DMA			BIT(0)
+#define		CNFG_READ_EN		BIT(1)
+#define		CNFG_DMA_BURST_EN	BIT(2)
+#define		CNFG_HW_ECC_EN		BIT(8)
+#define		CNFG_AUTO_FMT_EN	BIT(9)
+#define		CNFG_OP_CUST		GENMASK(14, 13)
+#define NFI_PAGEFMT		(0x04)
+#define		PAGEFMT_SPARE_MASK	GENMASK(21, 16)
+#define		PAGEFMT_SPARE_SHIFT		(16)
+#define		PAGEFMT_FDM_ECC_SHIFT	(12)
+#define		PAGEFMT_FDM_SHIFT	(8)
+#define		PAGEFMT_FDM_MASK	GENMASK(11, 8)
+#define		PAGEFMT_SEC_SEL_512	BIT(2)
+#define		PAGEFMT_512_2K		(0)
+#define		PAGEFMT_2K_4K		(1)
+#define		PAGEFMT_4K_8K		(2)
+#define		PAGEFMT_8K_16K		(3)
+#define		PAGEFMT_PAGE_MASK	GENMASK(1, 0)
+#define NFI_CON			0x08
+#define		CON_FIFO_FLUSH		BIT(0)
+#define		CON_NFI_RST			BIT(1)
+#define		CON_BRD				BIT(8)
+#define		CON_BWR				BIT(9)
+#define		CON_SEC_SHIFT		12
+#define		CON_SEC_MASK		GENMASK(16, 12)
+#define NFI_INTR_EN		0x10
+#define		INTR_CUS_PROG_EN	BIT(7)
+#define		INTR_CUS_READ_EN	BIT(8)
+#define		INTR_IRQ_EN			BIT(31)
+#define NFI_INTR_STA	0x14
+#define NFI_CMD			0x20
+#define NFI_STRDATA		0x40
+#define		STAR_EN				BIT(0)
+#define NFI_STA			0x60
+#define		NFI_FSM_MASK		GENMASK(19, 16)
+#define		STA_EMP_PAGE		BIT(12)
+#define NFI_ADDRCNTR	0x70
+#define		CNTR_MASK			GENMASK(16, 12)
+#define		ADDRCNTR_SEC_SHIFT	12
+#define		ADDRCNTR_SEC(val) \
+		(((val) & CNTR_MASK) >> ADDRCNTR_SEC_SHIFT)
+#define NFI_STRADDR		0x80
+#define NFI_BYTELEN		0x84
+#define NFI_FDML(x)		(0xA0 + (x) * sizeof(u32) * 2)
+#define NFI_FDMM(x)		(0xA4 + (x) * sizeof(u32) * 2)
+#define NFI_MASTERSTA	0x224
+#define		AHB_BUS_BUSY		BIT(1)
+#define		BUS_BUSY			BIT(0)
+#define SNFI_MAC_OUTL	0x504
+#define SNFI_MAC_INL	0x508
+#define SNFI_RD_CTL2	0x510
+#define		RD_CMD_MASK			0x00ff
+#define		RD_DUMMY_SHIFT		8
+#define SNFI_RD_CTL3			0x514
+#define		RD_ADDR_MASK		0xffff
+#define SNFI_MISC_CTL	0x538
+#define		RD_MODE_MASK		GENMASK(18, 16)
+#define		LATCH_LAT_MASK		GENMASK(9, 8)
+#define		LATCH_LAT_SHIFT		8
+#define		RD_MODE_X2			BIT(16)
+#define		RD_MODE_X4			BIT(17)
+#define		RD_MODE_DQUAL		BIT(18)
+#define		RD_CUSTOM_EN		BIT(6)
+#define		WR_CUSTOM_EN		BIT(7)
+#define		WR_X4_EN			BIT(20)
+#define		SW_RST				BIT(28)
+#define SNFI_MISC_CTL2	0x53c
+#define		WR_LEN_SHIFT		16
+#define SNFI_PG_CTL1	0x524
+#define		WR_LOAD_CMD_MASK	GENMASK(15, 8)
+#define		WR_LOAD_CMD_SHIFT	8
+#define SNFI_PG_CTL2	0x528
+#define		WR_LOAD_ADDR_MASK	GENMASK(15, 0)
+#define SNFI_MAC_CTL	0x500
+#define		MAC_WIP				BIT(0)
+#define		MAC_WIP_READY		BIT(1)
+#define		MAC_TRIG			BIT(2)
+#define		MAC_EN				BIT(3)
+#define		MAC_SIO_SEL			BIT(4)
+#define SNFI_DLY_CTL3	0x548
+#define		SAM_DLY_MASK		GENMASK(5, 0)
+#define SNFI_STA_CTL1	0x550
+#define		CUS_PROG_DONE		BIT(28)
+#define		CUS_READ_DONE		BIT(27)
+#define		SPI_STATE			GENMASK(3, 0)
+#define SNFI_CNFG		0x55c
+#define		SNFI_MODE_EN		BIT(0)
+#define SNFI_GPRAM_DATA	0x800
+#define		SNFI_GPRAM_MAX_LEN	160
+
+#define MTK_SNFI_TIMEOUT			500000
+#define MTK_SNFI_RESET_TIMEOUT		1000000
+#define MTK_SNFI_AUTOSUSPEND_DELAY	1000
+#define KB(x)			((x) * 1024UL)
+
+/* supported spare size of each IP */
+static const u8 spare_size_mt7622[] = {
+	16, 26, 27, 28
+};
+
+struct mtk_snfi_caps {
+	const u8 *spare_size;
+	u8 num_spare_size;
+	u8 pageformat_spare_shift;
+};
+
+struct mtk_snfi {
+	struct clk *nfi_clk;
+	struct clk *snfi_clk;
+	struct clk *hclk;
+	struct device *dev;
+	struct completion done;
+
+	const struct mtk_snfi_caps *caps;
+
+	bool ecc_en;
+	u32 page_size;
+	u32 fdm_size;
+	u32 spare_size;
+	u32 sectors;
+	u32 sector_size;
+
+	u32 sample_delay;
+	u32 read_latency;
+
+	void *tx_buf;
+	dma_addr_t dma_addr;
+	void __iomem *regs;
+};
+
+static void mtk_snfi_mac_enable(struct mtk_snfi *snfi)
+{
+	u32 val;
+
+	val = readl(snfi->regs + SNFI_MAC_CTL);
+	val &= ~MAC_SIO_SEL;
+	val |= MAC_EN;
+
+	writel(val, snfi->regs + SNFI_MAC_CTL);
+}
+
+static int mtk_snfi_mac_trigger(struct mtk_snfi *snfi)
+{
+	u32 val;
+	int ret = 0;
+
+	val = readl(snfi->regs + SNFI_MAC_CTL);
+	val |= MAC_TRIG;
+	writel(val, snfi->regs + SNFI_MAC_CTL);
+
+	ret = readl_poll_timeout_atomic(snfi->regs + SNFI_MAC_CTL, val,
+					val & MAC_WIP_READY, 0,
+					MTK_SNFI_TIMEOUT);
+	if (ret < 0) {
+		dev_err(snfi->dev, "wait for wip ready timeout\n");
+		return -EIO;
+	}
+
+	ret = readl_poll_timeout_atomic(snfi->regs + SNFI_MAC_CTL, val,
+					!(val & MAC_WIP), 0,
+					MTK_SNFI_TIMEOUT);
+	if (ret < 0) {
+		dev_err(snfi->dev, "wait for flash update finish timeout\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void mtk_snfi_mac_disable(struct mtk_snfi *snfi)
+{
+	u32 val;
+
+	val = readl(snfi->regs + SNFI_MAC_CTL);
+	val &= ~(MAC_TRIG | MAC_EN);
+	writel(val, snfi->regs + SNFI_MAC_CTL);
+}
+
+static int mtk_snfi_mac_op(struct mtk_snfi *snfi)
+{
+	int ret = 0;
+
+	mtk_snfi_mac_enable(snfi);
+	ret = mtk_snfi_mac_trigger(snfi);
+	mtk_snfi_mac_disable(snfi);
+
+	return ret;
+}
+
+static inline void mtk_snfi_read_fdm(struct mtk_snfi *snfi,
+			const struct spi_mem_op *op)
+{
+	u32 vall, valm;
+	u8 *oobptr = op->data.buf.in;
+	int i, j;
+
+	oobptr += snfi->page_size;
+	for (i = 0; i < snfi->sectors; i++) {
+		vall = readl(snfi->regs + NFI_FDML(i));
+		valm = readl(snfi->regs + NFI_FDMM(i));
+
+		for (j = 0; j < snfi->fdm_size; j++)
+			oobptr[j] = (j >= 4 ? valm : vall) >> ((j % 4) * 8);
+
+		oobptr += snfi->fdm_size;
+	}
+}
+
+static inline void mtk_snfi_write_fdm(struct mtk_snfi *snfi,
+			const struct spi_mem_op *op)
+{
+	const u8 *oobptr = op->data.buf.out;
+	u32 vall, valm;
+	int i, j;
+
+	oobptr += snfi->page_size;
+	for (i = 0; i < snfi->sectors; i++) {
+		vall = 0;
+		valm = 0;
+		for (j = 0; j < 8; j++) {
+			if (j < 4)
+				vall |= (j < snfi->fdm_size ? oobptr[j] : 0xff)
+						<< (j * 8);
+			else
+				valm |= (j < snfi->fdm_size ? oobptr[j] : 0xff)
+						<< ((j - 4) * 8);
+		}
+		writel(vall, snfi->regs + NFI_FDML(i));
+		writel(valm, snfi->regs + NFI_FDMM(i));
+
+		oobptr += snfi->fdm_size;
+	}
+}
+
+static irqreturn_t mtk_snfi_irq(int irq, void *id)
+{
+	struct mtk_snfi *snfi = id;
+	u32 sta, ien;
+
+	sta = readl(snfi->regs + NFI_INTR_STA);
+	ien = readl(snfi->regs + NFI_INTR_EN);
+
+	if (!(sta & ien))
+		return IRQ_NONE;
+
+	writel(0, snfi->regs + NFI_INTR_EN);
+	complete(&snfi->done);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_snfi_enable_clk(struct device *dev, struct mtk_snfi *snfi)
+{
+	int ret;
+
+	ret = clk_prepare_enable(snfi->nfi_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable nfi clk\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(snfi->snfi_clk);
+	if (ret) {
+		dev_err(dev, "failed to enable snfi clk\n");
+		clk_disable_unprepare(snfi->nfi_clk);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(snfi->hclk);
+	if (ret) {
+		dev_err(dev, "failed to enable hclk\n");
+		clk_disable_unprepare(snfi->nfi_clk);
+		clk_disable_unprepare(snfi->snfi_clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_snfi_disable_clk(struct mtk_snfi *snfi)
+{
+	clk_disable_unprepare(snfi->nfi_clk);
+	clk_disable_unprepare(snfi->snfi_clk);
+	clk_disable_unprepare(snfi->hclk);
+}
+
+static int mtk_snfi_reset(struct mtk_snfi *snfi)
+{
+	u32 val;
+	int ret;
+
+	val = readl(snfi->regs + SNFI_MISC_CTL) | SW_RST;
+	writel(val, snfi->regs + SNFI_MISC_CTL);
+
+	ret = readw_poll_timeout(snfi->regs + SNFI_STA_CTL1, val,
+				 !(val & SPI_STATE), 0,
+				 MTK_SNFI_RESET_TIMEOUT);
+	if (ret) {
+		dev_warn(snfi->dev, "spi state not idle 0x%x\n", val);
+		return ret;
+	}
+
+	val = readl(snfi->regs + SNFI_MISC_CTL);
+	val &= ~SW_RST;
+	writel(val, snfi->regs + SNFI_MISC_CTL);
+
+	writew(CON_FIFO_FLUSH | CON_NFI_RST, snfi->regs + NFI_CON);
+	ret = readw_poll_timeout(snfi->regs + NFI_STA, val,
+				 !(val & NFI_FSM_MASK), 0,
+				 MTK_SNFI_RESET_TIMEOUT);
+	if (ret) {
+		dev_warn(snfi->dev, "nfi fsm not idle 0x%x\n", val);
+		return ret;
+	}
+
+	val = readl(snfi->regs + NFI_STRDATA);
+	val &= ~STAR_EN;
+	writew(val, snfi->regs + NFI_STRDATA);
+
+	return 0;
+}
+
+/*
+ * Due to the snfi driver at spi subsystem can not get nand parameter.
+ * Therefore, parse nand parameter from nfi register which have been
+ * config at ecc driver.
+ */
+static int mtk_snfi_config(struct mtk_snfi *snfi)
+{
+	u32 val, config;
+
+	writel(SNFI_MODE_EN, snfi->regs + SNFI_CNFG);
+
+	if (snfi->sample_delay) {
+		val = readl(snfi->regs + SNFI_DLY_CTL3);
+		val &= ~SAM_DLY_MASK;
+		val |= snfi->sample_delay;
+		writel(val, snfi->regs + SNFI_DLY_CTL3);
+	}
+
+	if (snfi->read_latency) {
+		val = readl(snfi->regs + SNFI_MISC_CTL);
+		val &= ~LATCH_LAT_MASK;
+		val |= (snfi->read_latency << LATCH_LAT_SHIFT);
+		writel(val, snfi->regs + SNFI_MISC_CTL);
+	}
+
+	val = readl(snfi->regs + NFI_CNFG);
+	if (val & CNFG_HW_ECC_EN)
+		snfi->ecc_en = true;
+
+	val = readl(snfi->regs + NFI_PAGEFMT);
+	if (val & PAGEFMT_SEC_SEL_512)
+		snfi->sector_size = 512;
+	else
+		snfi->sector_size = 1024;
+
+	config = val & PAGEFMT_PAGE_MASK;
+	switch (config) {
+	case PAGEFMT_512_2K:
+		snfi->page_size = KB(2);
+		if (val & PAGEFMT_SEC_SEL_512)	
+			snfi->page_size = 512;
+		break;
+	case PAGEFMT_2K_4K:
+		snfi->page_size = KB(4);
+		if (val & PAGEFMT_SEC_SEL_512)	
+			snfi->page_size = KB(2);
+		break;
+	case PAGEFMT_4K_8K:
+		snfi->page_size = KB(8);
+		if (val & PAGEFMT_SEC_SEL_512)	
+			snfi->page_size = KB(4);
+		break;
+	case PAGEFMT_8K_16K:
+		snfi->page_size = KB(16);
+		break;
+	}
+
+	config = val & PAGEFMT_SPARE_MASK;
+	config >>= snfi->caps->pageformat_spare_shift;
+	snfi->spare_size = snfi->caps->spare_size[config];
+
+	config = val & PAGEFMT_FDM_MASK;
+	snfi->fdm_size = config >> PAGEFMT_FDM_SHIFT;
+
+	if (!(val & PAGEFMT_SEC_SEL_512))
+		snfi->spare_size <<= 1;
+
+	snfi->sectors = snfi->page_size / snfi->sector_size;
+	
+	return 0;
+}
+
+static int mtk_snfi_init(struct mtk_snfi *snfi)
+{
+	int ret;
+
+	ret = mtk_snfi_reset(snfi);
+	if (ret)
+		return ret;
+
+	ret = mtk_snfi_config(snfi);
+
+	return ret;
+}
+
+static void mtk_snfi_prepare_for_tx(struct mtk_snfi *snfi,
+			   const struct spi_mem_op *op)
+{
+	u32 val;
+
+	writel(0x80, snfi->regs + NFI_CMD);
+	val = readl(snfi->regs + SNFI_PG_CTL1);
+	val &= ~WR_LOAD_CMD_MASK;
+	val |= op->cmd.opcode << WR_LOAD_CMD_SHIFT;
+	writel(val, snfi->regs + SNFI_PG_CTL1);
+
+	writel(op->addr.val & WR_LOAD_ADDR_MASK,
+		   snfi->regs + SNFI_PG_CTL2);
+
+	val = readl(snfi->regs + SNFI_MISC_CTL);
+	val |= WR_CUSTOM_EN;
+	if (op->data.buswidth == 4)
+		val |= WR_X4_EN;
+	writel(val, snfi->regs + SNFI_MISC_CTL);
+
+	val = snfi->page_size + snfi->sectors * snfi->spare_size;
+
+	writel(val << WR_LEN_SHIFT,
+		snfi->regs + SNFI_MISC_CTL2);
+	writel(INTR_CUS_PROG_EN | INTR_IRQ_EN,
+		snfi->regs + NFI_INTR_EN);
+}
+
+static void mtk_snfi_prepare_for_rx(struct mtk_snfi *snfi,
+			   const struct spi_mem_op *op)
+{
+	u32 val, dummy_cycle;
+
+	writel(0x00, snfi->regs + NFI_CMD);
+	dummy_cycle = (op->dummy.nbytes << 3) >>
+				  (ffs(op->dummy.buswidth) - 1);
+	val = (op->cmd.opcode & RD_CMD_MASK) |
+		  (dummy_cycle << RD_DUMMY_SHIFT);
+	writel(val, snfi->regs + SNFI_RD_CTL2);
+
+	writel(op->addr.val & RD_ADDR_MASK,
+		   snfi->regs + SNFI_RD_CTL3);
+
+	val = readl(snfi->regs + SNFI_MISC_CTL);
+	val |= RD_CUSTOM_EN;
+	val &= ~RD_MODE_MASK;
+	if (op->data.buswidth == 4)
+		val |= RD_MODE_X4;
+	else if (op->data.buswidth == 2)
+		val |= RD_MODE_X2;
+
+	if (op->addr.buswidth != 1)
+		val |= RD_MODE_DQUAL;
+	writel(val, snfi->regs + SNFI_MISC_CTL);
+
+	val = snfi->page_size + snfi->sectors * snfi->spare_size;
+	writel(val, snfi->regs + SNFI_MISC_CTL2);
+	writel(INTR_CUS_READ_EN | INTR_IRQ_EN,
+		   snfi->regs + NFI_INTR_EN);
+}
+
+static int mtk_snfi_prepare(struct mtk_snfi *snfi,
+			   const struct spi_mem_op *op, bool rx)
+{
+	int ret;
+	dma_addr_t addr;
+	u32 val;
+
+	addr = dma_map_single(snfi->dev,
+				op->data.buf.in, op->data.nbytes,
+				rx ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+	ret = dma_mapping_error(snfi->dev, addr);
+	if (ret) {
+		dev_err(snfi->dev, "dma mapping error\n");
+		return -EINVAL;
+	}
+
+	snfi->dma_addr = addr;
+	writel(lower_32_bits(addr), snfi->regs + NFI_STRADDR);
+
+	if (snfi->ecc_en && !rx)
+		mtk_snfi_write_fdm(snfi, op);
+
+	val = readw(snfi->regs + NFI_CNFG);
+	val |= CNFG_DMA | CNFG_DMA_BURST_EN | CNFG_OP_CUST;
+	val |= rx ? CNFG_READ_EN : 0;
+	writew(val, snfi->regs + NFI_CNFG);
+
+	writel(snfi->sectors << CON_SEC_SHIFT, snfi->regs + NFI_CON);
+
+	init_completion(&snfi->done);
+
+	if (rx)
+		mtk_snfi_prepare_for_rx(snfi, op);
+	else
+		mtk_snfi_prepare_for_tx(snfi, op);
+
+	return 0;
+}
+
+static void mtk_snfi_trigger(struct mtk_snfi *snfi,
+			   const struct spi_mem_op *op, bool rx)
+{
+	u32 val;
+
+	val = readl(snfi->regs + NFI_CON);
+	val |= rx ? CON_BRD : CON_BWR;
+	writew(val, snfi->regs + NFI_CON);
+
+	writew(STAR_EN, snfi->regs + NFI_STRDATA);
+}
+
+static int mtk_snfi_wait_done(struct mtk_snfi *snfi,
+			   const struct spi_mem_op *op, bool rx)
+{
+	u32 val;
+	int ret;
+
+	ret = wait_for_completion_timeout(&snfi->done, msecs_to_jiffies(500));
+	if (!ret) {
+		dev_err(snfi->dev, "wait for %d completion done timeout\n", rx);
+		dump_register(snfi);
+		return -ETIMEDOUT;
+	}
+
+	if (rx) {
+		ret = readl_poll_timeout_atomic(snfi->regs + NFI_BYTELEN, val,
+						ADDRCNTR_SEC(val) >= snfi->sectors, 0,
+						MTK_SNFI_TIMEOUT);
+		if (ret < 0) {
+			dev_err(snfi->dev, "wait for read sector count timeout\n");
+			dump_register(snfi);
+			return -ETIMEDOUT;
+		}
+
+		ret = readl_poll_timeout_atomic(snfi->regs + NFI_MASTERSTA, val,
+					!(val & (AHB_BUS_BUSY | BUS_BUSY)),
+					0, MTK_SNFI_TIMEOUT);
+		if (ret) {
+			dev_err(snfi->dev, "wait for bus busy timeout\n");
+			dump_register(snfi);
+			return -ETIMEDOUT;
+		}
+	} else {
+		ret = readl_poll_timeout_atomic(snfi->regs + NFI_ADDRCNTR, val,
+						ADDRCNTR_SEC(val) >= snfi->sectors,
+						0, MTK_SNFI_TIMEOUT);
+		if (ret) {
+			dev_err(snfi->dev, "wait for program sector count timeout\n");
+			dump_register(snfi);
+			return -ETIMEDOUT;
+		}
+	}
+
+	return 0;
+}
+
+static void mtk_snfi_complete(struct mtk_snfi *snfi,
+			   const struct spi_mem_op *op, bool rx)
+{
+	u32 val;
+
+	dma_unmap_single(snfi->dev,
+					 snfi->dma_addr, op->data.nbytes,
+					 rx ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+
+	if (snfi->ecc_en && rx)
+		mtk_snfi_read_fdm(snfi, op);
+
+	val = readl(snfi->regs + SNFI_MISC_CTL);
+	val &= rx ? ~RD_CUSTOM_EN : ~WR_CUSTOM_EN;
+	writel(val, snfi->regs + SNFI_MISC_CTL);
+
+	val = readl(snfi->regs + SNFI_STA_CTL1);
+	val |= rx ? CUS_READ_DONE : CUS_PROG_DONE;
+	writew(val, snfi->regs + SNFI_STA_CTL1);
+	val &= rx ? ~CUS_READ_DONE : ~CUS_PROG_DONE;
+	writew(val, snfi->regs + SNFI_STA_CTL1);
+
+	/* Disable interrupt */
+	val = readl(snfi->regs + NFI_INTR_EN);
+	val &= rx ? ~INTR_CUS_READ_EN : ~INTR_CUS_PROG_EN;
+	writew(val, snfi->regs + NFI_INTR_EN);
+
+	writew(0, snfi->regs + NFI_CNFG);
+	writew(0, snfi->regs + NFI_CON);
+}
+
+static int mtk_snfi_transfer_dma(struct mtk_snfi *snfi,
+			   const struct spi_mem_op *op, bool rx)
+{
+	int ret;
+
+	ret = mtk_snfi_prepare(snfi, op, rx);
+	if (ret)
+		return ret;
+
+	mtk_snfi_trigger(snfi, op, rx);
+
+	ret = mtk_snfi_wait_done(snfi, op, rx);
+
+	mtk_snfi_complete(snfi, op, rx);
+
+	return ret;
+}
+
+static int mtk_snfi_transfer_mac(struct mtk_snfi *snfi,
+			    const u8 *txbuf, u8 *rxbuf,
+			    const u32 txlen, const u32 rxlen)
+{
+	u32 i, j, val, tmp;
+	u8 *p_tmp = (u8 *)(&tmp);
+	u32 addr_offset = 0;
+	int ret = 0;
+
+	/* Move tx data to snfi gpram */
+	for (i = 0; i < txlen; ) {
+		for (j = 0, tmp = 0; i < txlen && j < 4; i++, j++)
+			p_tmp[j] = txbuf[i];
+
+		writel(tmp, snfi->regs + SNFI_GPRAM_DATA + addr_offset);
+		addr_offset += 4;
+	}
+
+	writel(txlen, snfi->regs + SNFI_MAC_OUTL);
+	writel(rxlen, snfi->regs + SNFI_MAC_INL);
+
+	ret = mtk_snfi_mac_op(snfi);
+	if (ret) {
+		dev_warn(snfi->dev, "snfi mac operation fail\n");
+		return ret;
+	}
+
+	/* Get tx data from snfi gpram */
+	if (rxlen) {
+		for (i = 0, addr_offset = rounddown(txlen, 4); i < rxlen; ) {
+			val = readl(snfi->regs +
+					    SNFI_GPRAM_DATA + addr_offset);
+			for (j = 0; i < rxlen && j < 4; i++, j++, rxbuf++) {
+				if (i == 0)
+					j = txlen % 4;
+				*rxbuf = (val >> (j * 8)) & 0xff;
+			}
+			addr_offset += 4;
+		}
+	}
+
+	return ret;
+}
+
+static int mtk_snfi_exec_op(struct spi_mem *mem,
+			    const struct spi_mem_op *op)
+
+{
+	struct mtk_snfi *snfi = spi_controller_get_devdata(mem->spi->master);
+	u8 *buf, *txbuf = snfi->tx_buf, *rxbuf = NULL;
+	u32 txlen = 0, rxlen = 0;
+	int i, ret = 0;
+	bool rx;
+
+	rx = op->data.dir == SPI_MEM_DATA_IN;
+	
+	ret = mtk_snfi_init(snfi);
+	if (ret) {
+		dev_warn(snfi->dev, "reset snfi fail\n");
+		return ret;
+	}
+
+	/*
+	 * If tx/rx data buswidth is not 1, use snfi DMA mode.
+	 * Otherwise, use snfi mac mode.
+	 */
+	if ((op->data.buswidth != 1) && (op->data.buswidth != 0)) {
+		ret = mtk_snfi_transfer_dma(snfi, op, rx);
+		if (ret)
+			dev_warn(snfi->dev, "snfi dma transfer %d fail %d\n",
+					 rx, ret);
+		return ret;
+	}
+
+	txbuf[txlen++] = op->cmd.opcode;
+
+	if (op->addr.nbytes)
+		for (i = 0; i < op->addr.nbytes; i++)
+			txbuf[txlen++] = op->addr.val >>
+					(8 * (op->addr.nbytes - i - 1));
+
+	txlen += op->dummy.nbytes;
+
+	if (op->data.dir == SPI_MEM_DATA_OUT) {
+		buf = (u8 *)op->data.buf.out;
+		for (i = 0; i < op->data.nbytes; i++)
+			txbuf[txlen++] = buf[i];
+	}
+
+	if (op->data.dir == SPI_MEM_DATA_IN) {
+		rxbuf = (u8 *)op->data.buf.in;
+		rxlen = op->data.nbytes;
+	}
+
+	ret = mtk_snfi_transfer_mac(snfi, txbuf, rxbuf, txlen, rxlen);
+	if (ret)
+		dev_warn(snfi->dev, "snfi mac transfer %d fail %d\n",
+				 op->data.dir, ret);
+	return ret;
+}
+
+static int mtk_snfi_check_buswidth(u8 width)
+{
+	switch (width) {
+	case 1:
+	case 2:
+	case 4:
+		return 0;
+
+	default:
+		break;
+	}
+
+	return -ENOTSUPP;
+}
+
+static bool mtk_snfi_supports_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op)
+{
+	struct mtk_snfi *snfi = spi_controller_get_devdata(mem->spi->master);
+	int ret = 0;
+	u32 val;
+
+	if (!spi_mem_default_supports_op(mem, op))
+		return false;
+
+	if (op->cmd.buswidth != 1)
+		return false;
+
+	val = readl(snfi->regs + NFI_CNFG);
+	if (val & CNFG_HW_ECC_EN)
+		snfi->ecc_en = true;
+	else
+		snfi->ecc_en = false;
+
+	/*
+	 * For current design, the operation will use mac mode when data
+	 * buswidth is 1. However, the HW ECC can not be used in mac mode.
+	 */
+	if (snfi->ecc_en && op->data.buswidth == 1 &&
+			op->data.nbytes >= SNFI_GPRAM_MAX_LEN)
+		return false;
+
+	switch (op->data.dir) {
+	case SPI_MEM_DATA_IN:
+		if (op->addr.nbytes)
+			ret |= mtk_snfi_check_buswidth(op->addr.buswidth);
+
+		if (op->dummy.nbytes)
+			ret |= mtk_snfi_check_buswidth(op->dummy.buswidth);
+
+		if (op->data.nbytes)
+			ret |= mtk_snfi_check_buswidth(op->data.buswidth);
+
+		if (ret)
+			return false;
+
+		break;
+	case SPI_MEM_DATA_OUT:
+		if ((op->addr.buswidth != 0) && (op->addr.buswidth != 1))
+			return false;
+
+		if ((op->dummy.buswidth != 0) && (op->dummy.buswidth != 1))
+			return false;
+
+		if ((op->data.buswidth != 1) && (op->data.buswidth != 4))
+			return false;
+
+		break;
+	default:
+		break;
+	}
+
+	return true;
+}
+
+static int mtk_snfi_adjust_op_size(struct spi_mem *mem,
+				   struct spi_mem_op *op)
+{
+	u32 len, max_len;
+
+	if ((op->data.buswidth == 1) || (op->data.buswidth == 0))
+		max_len = SNFI_GPRAM_MAX_LEN;
+	else
+		max_len = KB(16);
+
+	len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
+	if (len > max_len)
+		return -ENOTSUPP;
+
+	if ((len + op->data.nbytes) > max_len)
+		op->data.nbytes = max_len - len;
+
+	return 0;
+}
+
+static const struct mtk_snfi_caps mtk_snfi_caps_mt7622 = {
+	.spare_size = spare_size_mt7622,
+	.num_spare_size = 4,
+	.pageformat_spare_shift = 16,
+};
+
+static const struct spi_controller_mem_ops mtk_snfi_ops = {
+	.adjust_op_size = mtk_snfi_adjust_op_size,
+	.supports_op = mtk_snfi_supports_op,
+	.exec_op = mtk_snfi_exec_op,
+};
+
+static const struct of_device_id mtk_snfi_id_table[] = {
+	{ .compatible = "mediatek,mt7622-snfi",
+	  .data = &mtk_snfi_caps_mt7622,
+	},
+	{  /* sentinel */ }
+};
+
+static int mtk_snfi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct spi_controller *ctlr;
+	struct mtk_snfi *snfi;
+	struct resource *res;
+	int ret, irq;
+	u32 val;
+
+	ctlr = spi_alloc_master(&pdev->dev, sizeof(*snfi));
+	if (!ctlr)
+		return -ENOMEM;
+
+	snfi = spi_controller_get_devdata(ctlr);
+	snfi->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	snfi->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(snfi->regs)) {
+		ret = PTR_ERR(snfi->regs);
+		goto err_put_master;
+	}
+
+	ret = of_property_read_u32(np, "sample-delay", &val);
+	if (ret) {
+		dev_err(dev, "no sample-delay property\n");
+		return ret;
+	}
+	snfi->sample_delay = val;
+
+	ret = of_property_read_u32(np, "read-latency", &val);
+	if (ret) {
+		dev_err(dev, "no read-latency property\n");
+		return ret;
+	}
+	snfi->read_latency = val;
+
+	snfi->nfi_clk = devm_clk_get(dev, "nfi_clk");
+	if (IS_ERR(snfi->nfi_clk)) {
+		dev_err(dev, "no nfi clk\n");
+		ret = PTR_ERR(snfi->nfi_clk);
+		goto err_put_master;
+	}
+
+	snfi->snfi_clk = devm_clk_get(dev, "snfi_clk");
+	if (IS_ERR(snfi->snfi_clk)) {
+		dev_err(dev, "no snfi clk\n");
+		ret = PTR_ERR(snfi->snfi_clk);
+		goto err_put_master;
+	}
+
+	snfi->hclk = devm_clk_get(dev, "hclk");
+	if (IS_ERR(snfi->hclk)) {
+		dev_err(dev, "no hclk\n");
+		ret = PTR_ERR(snfi->hclk);
+		goto err_put_master;
+	}
+
+	ret = mtk_snfi_enable_clk(dev, snfi);
+	if (ret)
+		goto err_put_master;
+
+	snfi->caps = of_device_get_match_data(dev);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "no snfi irq resource\n");
+		ret = -EINVAL;
+		goto clk_disable;
+	}
+
+	ret = devm_request_irq(dev, irq, mtk_snfi_irq, 0, "mtk-snfi", snfi);
+	if (ret) {
+		dev_err(dev, "failed to request snfi irq\n");
+		goto clk_disable;
+	}
+
+	ret = dma_set_mask(dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(dev, "failed to set dma mask\n");
+		goto clk_disable;
+	}
+
+	snfi->tx_buf = kzalloc(SNFI_GPRAM_MAX_LEN, GFP_KERNEL);
+	if (!snfi->tx_buf) {
+		ret = -ENOMEM;
+		goto clk_disable;
+	}
+
+	ctlr->dev.of_node = np;
+	ctlr->mem_ops = &mtk_snfi_ops;
+	ctlr->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD | SPI_TX_QUAD;
+	ctlr->auto_runtime_pm = false;
+
+	dev_set_drvdata(&pdev->dev, ctlr);
+
+	ret = mtk_snfi_init(snfi);
+	if (ret) {
+		dev_err(dev, "failed to init snfi\n");
+		goto free_buf;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = devm_spi_register_master(dev, ctlr);
+	if (ret) {
+		dev_err(dev, "failed to register spi master\n");
+		goto disable_pm_runtime;
+	}
+
+	return 0;
+
+disable_pm_runtime:
+	pm_runtime_disable(&pdev->dev);
+
+free_buf:
+	kfree(snfi->tx_buf);
+
+clk_disable:
+	mtk_snfi_disable_clk(snfi);
+
+err_put_master:
+	spi_master_put(ctlr);
+
+	return ret;
+}
+
+static int mtk_snfi_remove(struct platform_device *pdev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(&pdev->dev);
+	struct mtk_snfi *snfi = spi_controller_get_devdata(ctlr);
+
+	pm_runtime_disable(&pdev->dev);
+	kfree(snfi->tx_buf);
+	spi_master_put(ctlr);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int mtk_snfi_runtime_suspend(struct device *dev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct mtk_snfi *snfi = spi_controller_get_devdata(ctlr);
+
+	mtk_snfi_disable_clk(snfi);
+
+	return 0;
+}
+
+static int mtk_snfi_runtime_resume(struct device *dev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct mtk_snfi *snfi = spi_controller_get_devdata(ctlr);
+	int ret;
+
+	ret = mtk_snfi_enable_clk(dev, snfi);
+	if (ret)
+		return ret;
+
+	ret = mtk_snfi_init(snfi);
+	if (ret)
+		dev_err(dev, "failed to init snfi\n");
+
+	return ret;
+}
+#endif /* CONFIG_PM */
+
+static const struct dev_pm_ops mtk_snfi_pm_ops = {
+	SET_RUNTIME_PM_OPS(mtk_snfi_runtime_suspend,
+			   mtk_snfi_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+			   pm_runtime_force_resume)
+};
+
+static struct platform_driver mtk_snfi_driver = {
+	.driver = {
+		.name	= "mtk-snfi",
+		.of_match_table = mtk_snfi_id_table,
+		.pm = &mtk_snfi_pm_ops,
+	},
+	.probe		= mtk_snfi_probe,
+	.remove		= mtk_snfi_remove,
+};
+
+module_platform_driver(mtk_snfi_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Xiangsheng Hou <xiangsheng.hou@mediatek.com>");
+MODULE_DESCRIPTION("Mediatek SPI Nand Interface Driver");
+
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
