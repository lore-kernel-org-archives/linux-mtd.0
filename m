Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3639C47088
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 19:24:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5138613CC
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 19:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5138613CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehMS2SnEfqxKzfkbQ/C8FVTg80Tq4j4APDT44iGAhV8=; b=CsDBLWQhN2eLde
	vNRrdBmiSspIqMinfsCwk6FhGdvlGHI0qGqeZHK6+BbJxY+LE14u22IK0Ja/8gQWA8/XJ6w3JTLwl
	tsBGbmhPPUv/CQXEEpmnrfshIxjKLnWPbNMXBlVW0/bqdbEMu/ChIEHVO4uvGdW7ym5q+QWDagRKY
	p7dFrK7XTz2RPMEEzdxjN8u1784Z40YmXkGCw0Icy/zb0b4yNw4kvmgAjvmwbDBDryshJYF5h1ZWf
	dK3uVbOj/GOdqAsH4YI/HuWuf2MyijKx7J7Sdkud9FscWWIvRwGwGMd89Y5DxBvwMmo8GBvFJvEju
	PQKwg14J7PdQS4TqAvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llz8Q-00Gvh0-GC; Wed, 26 May 2021 19:24:07 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lly5L-00GRKO-3F; Wed, 26 May 2021 18:16:55 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 66-20020a9d02c80000b02903615edf7c1aso1860578otl.13; 
 Wed, 26 May 2021 11:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BzyY+R6wPLdT98jGy+IZLujqag0rVel0U24HvQ9DU6w=;
 b=EEgghiDKo5hMaVElDDcoknrXxItgPSJ5EjOARg7MjY6BURQl/+E/fncXSXfRhbzLRy
 ZVdMUUvRjyOZ6vy/jiFor8RVU+WLi8bEuVkoV2qjuxnFI+uL2UOpezSfwCsQ9Ob6nqcn
 Gblih32xfC2MlRyxSBV1WihTMAwEE9QDaeWF4BKS+bAYdbJlbF1e58qyUQy90Efv0Jtk
 GC5fNFsZcbilO8J75kPNdDq+J2Mx9gBovTXVE/6en8AUlFEyAwLHEdKRAkC0K1wwoIWO
 4Lj892rRXhMrq0FZYFErq9p8hHorqlj/op04qYKXTEStLtxZVY2WKXcg71INkCqWeNy0
 MLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BzyY+R6wPLdT98jGy+IZLujqag0rVel0U24HvQ9DU6w=;
 b=l2adho3UQeEs+aplJuULPutf3iIYkSZo7gjKBVWPN9tzguDJ8K0vBDlX+1qKWcNSER
 xLoNsIj0jWstHkFXbkImHUFPVGB0vzjZPbSKglD91GSCbgUvA8tfN9fh38J6pjGcBA8U
 fgrZlBF2REtaO4i5OH5Cqtr52WHqVD7Z0tYI1AMAWPEfAdauhzz1rYjopf/UEuxpDZ8S
 oGm5CmEAfvoEQCYMhMyoa07k4vAnHf9yIqFq5bhskpf+G61l5nHZuSAmilEkHMfyzk0Q
 U+B6w0kX1NVEZVlPw597SmepMfxK+xLq0ns81XlSl9jHRbhZyu6ZKyzLVYtK1yp9Eohv
 m4+g==
X-Gm-Message-State: AOAM531UuBOHoMcpswF05UxL8nwy/fj3mQFOPRwSuSASdBB0xlAsNrsg
 T2RCsFLWOe/rj2cre9Ff/VBERYh+UYs=
X-Google-Smtp-Source: ABdhPJyO2GDIPpUHC2hxy+AWvMZYytAjhOw+/Pwdgb01oyxMJ+jMvePVez9MLfHqZyP8yCrM2ttOmw==
X-Received: by 2002:a9d:67c5:: with SMTP id c5mr3421859otn.50.1622053009287;
 Wed, 26 May 2021 11:16:49 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id j20sm4148311oot.29.2021.05.26.11.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 11:16:48 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org, andy.yan@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 heiko@sntech.de, robh+dt@kernel.org, vigneshr@ti.com, richard@nod.at,
 miquel.raynal@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/3] mtd: spi-nor: add rockchip serial flash controller driver
Date: Wed, 26 May 2021 13:16:34 -0500
Message-Id: <20210526181636.1130-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526181636.1130-1-macroalpha82@gmail.com>
References: <20210526181636.1130-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_111651_271902_C0D6F1D9 
X-CRM114-Status: GOOD (  26.03  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the rockchip serial flash controller (SFC) driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/mtd/spi-nor/controllers/Kconfig       |   7 +
 drivers/mtd/spi-nor/controllers/Makefile      |   1 +
 .../mtd/spi-nor/controllers/rockchip-sfc.c    | 944 ++++++++++++++++++
 3 files changed, 952 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/controllers/rockchip-sfc.c

diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
index 5c0e0ec2e6d1..81734655cf28 100644
--- a/drivers/mtd/spi-nor/controllers/Kconfig
+++ b/drivers/mtd/spi-nor/controllers/Kconfig
@@ -62,3 +62,10 @@ config SPI_INTEL_SPI_PLATFORM
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called intel-spi-platform.
+
+config SPI_ROCKCHIP_SFC
+	tristate "Rockchip Serial Flash Controller(SFC)"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on HAS_IOMEM && HAS_DMA
+	help
+	  This enables support for rockchip serial flash controller.
diff --git a/drivers/mtd/spi-nor/controllers/Makefile b/drivers/mtd/spi-nor/controllers/Makefile
index e7abba491d98..60d87252f8df 100644
--- a/drivers/mtd/spi-nor/controllers/Makefile
+++ b/drivers/mtd/spi-nor/controllers/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
 obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
 obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
 obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
+obj-$(CONFIG_SPI_ROCKCHIP_SFC)	+= rockchip-sfc.o
diff --git a/drivers/mtd/spi-nor/controllers/rockchip-sfc.c b/drivers/mtd/spi-nor/controllers/rockchip-sfc.c
new file mode 100644
index 000000000000..9e60acff1628
--- /dev/null
+++ b/drivers/mtd/spi-nor/controllers/rockchip-sfc.c
@@ -0,0 +1,944 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Rockchip Serial Flash Controller Driver
+ *
+ * Copyright (c) 2017, Rockchip Inc.
+ * Author: Shawn Lin <shawn.lin@rock-chips.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/spi-nor.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+/* System control */
+#define SFC_CTRL			0x0
+#define  SFC_CTRL_COMMON_BITS_1		0x0
+#define  SFC_CTRL_COMMON_BITS_2		0x1
+#define  SFC_CTRL_COMMON_BITS_4		0x2
+#define  SFC_CTRL_DATA_BITS_SHIFT	12
+#define  SFC_CTRL_ADDR_BITS_SHIFT	10
+#define  SFC_CTRL_CMD_BITS_SHIFT	8
+#define  SFC_CTRL_PHASE_SEL_NEGETIVE	BIT(1)
+
+/* Interrupt mask */
+#define SFC_IMR				0x4
+#define  SFC_IMR_RX_FULL		BIT(0)
+#define  SFC_IMR_RX_UFLOW		BIT(1)
+#define  SFC_IMR_TX_OFLOW		BIT(2)
+#define  SFC_IMR_TX_EMPTY		BIT(3)
+#define  SFC_IMR_TRAN_FINISH		BIT(4)
+#define  SFC_IMR_BUS_ERR		BIT(5)
+#define  SFC_IMR_NSPI_ERR		BIT(6)
+#define  SFC_IMR_DMA			BIT(7)
+
+/* Interrupt clear */
+#define SFC_ICLR			0x8
+#define  SFC_ICLR_RX_FULL		BIT(0)
+#define  SFC_ICLR_RX_UFLOW		BIT(1)
+#define  SFC_ICLR_TX_OFLOW		BIT(2)
+#define  SFC_ICLR_TX_EMPTY		BIT(3)
+#define  SFC_ICLR_TRAN_FINISH		BIT(4)
+#define  SFC_ICLR_BUS_ERR		BIT(5)
+#define  SFC_ICLR_NSPI_ERR		BIT(6)
+#define  SFC_ICLR_DMA			BIT(7)
+
+/* FIFO threshold level */
+#define SFC_FTLR			0xc
+#define  SFC_FTLR_TX_SHIFT		0
+#define  SFC_FTLR_TX_MASK		0x1f
+#define  SFC_FTLR_RX_SHIFT		8
+#define  SFC_FTLR_RX_MASK		0x1f
+
+/* Reset FSM and FIFO */
+#define SFC_RCVR			0x10
+#define  SFC_RCVR_RESET			BIT(0)
+
+/* Enhanced mode */
+#define SFC_AX				0x14
+
+/* Address Bit number */
+#define SFC_ABIT			0x18
+
+/* Interrupt status */
+#define SFC_ISR				0x1c
+#define  SFC_ISR_RX_FULL_SHIFT		BIT(0)
+#define  SFC_ISR_RX_UFLOW_SHIFT		BIT(1)
+#define  SFC_ISR_TX_OFLOW_SHIFT		BIT(2)
+#define  SFC_ISR_TX_EMPTY_SHIFT		BIT(3)
+#define  SFC_ISR_TX_FINISH_SHIFT	BIT(4)
+#define  SFC_ISR_BUS_ERR_SHIFT		BIT(5)
+#define  SFC_ISR_NSPI_ERR_SHIFT		BIT(6)
+#define  SFC_ISR_DMA_SHIFT		BIT(7)
+
+/* FIFO status */
+#define SFC_FSR				0x20
+#define  SFC_FSR_TX_IS_FULL		BIT(0)
+#define  SFC_FSR_TX_IS_EMPTY		BIT(1)
+#define  SFC_FSR_RX_IS_EMPTY		BIT(2)
+#define  SFC_FSR_RX_IS_FULL		BIT(3)
+#define  SFC_FSR_TXLV_MASK		GENMASK(12, 8)
+#define  SFC_FSR_TXLV_SHIFT		8
+#define  SFC_FSR_RXLV_MASK		GENMASK(20, 16)
+#define  SFC_FSR_RXLV_SHIFT		16
+
+/* FSM status */
+#define SFC_SR				0x24
+#define  SFC_SR_IS_IDLE			0x0
+#define  SFC_SR_IS_BUSY			0x1
+
+/* Raw interrupt status */
+#define SFC_RISR			0x28
+#define  SFC_RISR_RX_FULL		BIT(0)
+#define  SFC_RISR_RX_UNDERFLOW		BIT(1)
+#define  SFC_RISR_TX_OVERFLOW		BIT(2)
+#define  SFC_RISR_TX_EMPTY		BIT(3)
+#define  SFC_RISR_TRAN_FINISH		BIT(4)
+#define  SFC_RISR_BUS_ERR		BIT(5)
+#define  SFC_RISR_NSPI_ERR		BIT(6)
+#define  SFC_RISR_DMA			BIT(7)
+
+/* Master trigger */
+#define SFC_DMA_TRIGGER			0x80
+
+/* Src or Dst addr for master */
+#define SFC_DMA_ADDR			0x84
+
+/* Command */
+#define SFC_CMD				0x100
+#define  SFC_CMD_IDX_SHIFT		0
+#define  SFC_CMD_DUMMY_SHIFT		8
+#define  SFC_CMD_DIR_RD			0
+#define  SFC_CMD_DIR_WR			1
+#define  SFC_CMD_DIR_SHIFT		12
+#define  SFC_CMD_ADDR_ZERO		(0x0 << 14)
+#define  SFC_CMD_ADDR_24BITS		(0x1 << 14)
+#define  SFC_CMD_ADDR_32BITS		(0x2 << 14)
+#define  SFC_CMD_ADDR_FRS		(0x3 << 14)
+#define  SFC_CMD_TRAN_BYTES_SHIFT	16
+#define  SFC_CMD_CS_SHIFT		30
+
+/* Address */
+#define SFC_ADDR			0x104
+
+/* Data */
+#define SFC_DATA			0x108
+
+#define SFC_MAX_CHIPSELECT_NUM		4
+
+/* The SFC can transfer max 16KB - 1 at one time
+ * we set it to 15.5KB here for alignment.
+ */
+#define SFC_MAX_TRANS_BYTES		(512 * 31)
+
+#define SFC_CMD_DUMMY(x) \
+	((x) << SFC_CMD_DUMMY_SHIFT)
+
+enum rockchip_sfc_iftype {
+	IF_TYPE_STD,
+	IF_TYPE_DUAL,
+	IF_TYPE_QUAD,
+};
+
+struct rockchip_sfc;
+struct rockchip_sfc_chip_priv {
+	u8 cs;
+	u32 clk_rate;
+	struct spi_nor nor;
+	struct rockchip_sfc *sfc;
+};
+
+struct rockchip_sfc {
+	struct device *dev;
+	struct mutex lock;
+	void __iomem *regbase;
+	struct clk *hclk;
+	struct clk *clk;
+	/* virtual mapped addr for dma_buffer */
+	void *buffer;
+	dma_addr_t dma_buffer;
+	struct completion cp;
+	struct rockchip_sfc_chip_priv flash[SFC_MAX_CHIPSELECT_NUM];
+	u32 num_chip;
+	bool use_dma;
+};
+
+static int rockchip_sfc_get_if_type(struct rockchip_sfc *sfc, enum spi_nor_protocol proto)
+{
+	if (proto == SNOR_PROTO_1_1_2)
+		return IF_TYPE_DUAL;
+	else if (proto == SNOR_PROTO_1_1_4)
+		return IF_TYPE_QUAD;
+	else if (proto == SNOR_PROTO_1_1_1)
+		return IF_TYPE_STD;
+
+	dev_err(sfc->dev, "unsupported SPI read mode\n");
+
+	return -EINVAL;
+}
+
+static int rockchip_sfc_reset(struct rockchip_sfc *sfc)
+{
+	int err;
+	u32 status;
+
+	writel_relaxed(SFC_RCVR_RESET, sfc->regbase + SFC_RCVR);
+
+	err = readl_poll_timeout(sfc->regbase + SFC_RCVR, status,
+				 !(status & SFC_RCVR_RESET), 20,
+				 jiffies_to_usecs(HZ));
+	if (err)
+		dev_err(sfc->dev, "SFC reset never finished\n");
+
+	/* Still need to clear the masked interrupt from RISR */
+	writel_relaxed(SFC_ICLR_RX_FULL | SFC_ICLR_RX_UFLOW |
+		       SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |
+		       SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |
+		       SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,
+		       sfc->regbase + SFC_ICLR);
+
+	dev_dbg(sfc->dev, "reset\n");
+
+	return err;
+}
+
+static int rockchip_sfc_init(struct rockchip_sfc *sfc)
+{
+	int err;
+
+	err = rockchip_sfc_reset(sfc);
+	if (err)
+		return err;
+
+	/* Mask all eight interrupts */
+	writel_relaxed(0xff, sfc->regbase + SFC_IMR);
+
+	writel_relaxed(SFC_CTRL_PHASE_SEL_NEGETIVE, sfc->regbase + SFC_CTRL);
+
+	return 0;
+}
+
+static int rockchip_sfc_prep(struct spi_nor *nor)
+{
+	struct rockchip_sfc_chip_priv *priv = nor->priv;
+	struct rockchip_sfc *sfc = priv->sfc;
+	int ret;
+
+	mutex_lock(&sfc->lock);
+	pm_runtime_get_sync(sfc->dev);
+
+	ret = clk_set_rate(sfc->clk, priv->clk_rate);
+	if (ret)
+		goto out;
+
+	ret = clk_prepare_enable(sfc->clk);
+	if (ret)
+		goto out;
+
+	return 0;
+
+out:
+	mutex_unlock(&sfc->lock);
+	return ret;
+}
+
+static void rockchip_sfc_unprep(struct spi_nor *nor)
+{
+	struct rockchip_sfc_chip_priv *priv = nor->priv;
+	struct rockchip_sfc *sfc = priv->sfc;
+
+	clk_disable_unprepare(sfc->clk);
+	mutex_unlock(&sfc->lock);
+	pm_runtime_mark_last_busy(sfc->dev);
+	pm_runtime_put_autosuspend(sfc->dev);
+}
+
+static inline int rockchip_sfc_get_fifo_level(struct rockchip_sfc *sfc, int wr)
+{
+	u32 fsr = readl_relaxed(sfc->regbase + SFC_FSR);
+	int level;
+
+	if (wr)
+		level = (fsr & SFC_FSR_TXLV_MASK) >> SFC_FSR_TXLV_SHIFT;
+	else
+		level = (fsr & SFC_FSR_RXLV_MASK) >> SFC_FSR_RXLV_SHIFT;
+
+	return level;
+}
+
+static int rockchip_sfc_wait_fifo_ready(struct rockchip_sfc *sfc, int wr, u32 timeout)
+{
+	unsigned long deadline = jiffies + timeout;
+	int level;
+
+	while (!(level = rockchip_sfc_get_fifo_level(sfc, wr))) {
+		if (time_after_eq(jiffies, deadline)) {
+			dev_warn(sfc->dev, "%s fifo timeout\n", wr ? "write" : "read");
+			return -ETIMEDOUT;
+		}
+		udelay(1);
+	}
+
+	return level;
+}
+
+/* The SFC_CTRL register is a global control register,
+ * when the controller is in busy state(SFC_SR),
+ * SFC_CTRL cannot be set.
+ */
+static void rockchip_sfc_wait_idle(struct rockchip_sfc *sfc, u32 timeout_us)
+{
+	u32 status;
+	int ret;
+
+	ret = readl_poll_timeout(sfc->regbase + SFC_SR, status,
+				!(status & SFC_SR_IS_BUSY),
+				20, timeout_us);
+	if (ret) {
+		dev_err(sfc->dev, "wait sfc idle timeout\n");
+		rockchip_sfc_reset(sfc);
+	}
+}
+
+static void rockchip_sfc_setup_ctrl(struct rockchip_sfc *sfc)
+{
+	u32 reg;
+
+	reg = IF_TYPE_STD << SFC_CTRL_DATA_BITS_SHIFT;
+	reg |= IF_TYPE_STD << SFC_CTRL_ADDR_BITS_SHIFT;
+	reg |= IF_TYPE_STD << SFC_CTRL_CMD_BITS_SHIFT;
+	reg |= SFC_CTRL_PHASE_SEL_NEGETIVE;
+
+	rockchip_sfc_wait_idle(sfc, 10000);
+
+	writel_relaxed(reg, sfc->regbase + SFC_CTRL);
+}
+static int rockchip_sfc_op_reg(struct spi_nor *nor,
+			       u8 opcode, int len, u8 optype)
+{
+	struct rockchip_sfc_chip_priv *priv = nor->priv;
+	struct rockchip_sfc *sfc = priv->sfc;
+	u32 reg;
+
+	rockchip_sfc_setup_ctrl(sfc);
+
+	reg = opcode << SFC_CMD_IDX_SHIFT;
+	reg |= len << SFC_CMD_TRAN_BYTES_SHIFT;
+	reg |= priv->cs << SFC_CMD_CS_SHIFT;
+	reg |= optype << SFC_CMD_DIR_SHIFT;
+	writel_relaxed(reg, sfc->regbase + SFC_CMD);
+
+	return 0;
+}
+
+static int rockchip_sfc_write_fifo(struct rockchip_sfc *sfc, const u8 *buf, int len)
+{
+	u8 bytes = len & 0x3;
+	u32 dwords;
+	int tx_level;
+	u32 write_words;
+	u32 tmp = 0;
+
+	dwords = len >> 2;
+	while (dwords) {
+		tx_level = rockchip_sfc_wait_fifo_ready(sfc, SFC_CMD_DIR_WR, HZ);
+		if (tx_level < 0)
+			return tx_level;
+		write_words = min_t(u32, tx_level, dwords);
+		iowrite32_rep(sfc->regbase + SFC_DATA, buf, write_words);
+		buf += write_words << 2;
+		dwords -= write_words;
+		}
+
+	/* write the rest non word aligned bytes */
+	if (bytes) {
+		tx_level = rockchip_sfc_wait_fifo_ready(sfc, SFC_CMD_DIR_WR, HZ);
+		if (tx_level < 0)
+			return tx_level;
+		memcpy(&tmp, buf, bytes);
+		writel_relaxed(tmp, sfc->regbase + SFC_DATA);
+	}
+
+	return len;
+}
+
+static int rockchip_sfc_read_fifo(struct rockchip_sfc *sfc, u8 *buf, int len)
+{
+	u8 bytes = len & 0x3;
+	u32 dwords;
+	u8 read_words;
+	int rx_level;
+	int tmp;
+
+	/* word aligned access only */
+	dwords = len >> 2;
+	while (dwords) {
+		rx_level = rockchip_sfc_wait_fifo_ready(sfc, SFC_CMD_DIR_RD, HZ);
+		if (rx_level < 0)
+			return rx_level;
+		read_words = min_t(u32, rx_level, dwords);
+		ioread32_rep(sfc->regbase + SFC_DATA, buf, read_words);
+		buf += read_words << 2;
+		dwords -= read_words;
+		}
+
+	/* read the rest non word aligned bytes */
+	if (bytes) {
+		rx_level = rockchip_sfc_wait_fifo_ready(sfc, SFC_CMD_DIR_RD, HZ);
+		if (rx_level < 0)
+			return rx_level;
+		tmp = readl_relaxed(sfc->regbase + SFC_DATA);
+		memcpy(buf, &tmp, bytes);
+	}
+
+	return len;
+}
+
+static int rockchip_sfc_read_reg(struct spi_nor *nor, u8 opcode,
+				 u8 *buf, size_t len)
+{
+	struct rockchip_sfc_chip_priv *priv = nor->priv;
+	struct rockchip_sfc *sfc = priv->sfc;
+	int ret;
+	int trans;
+
+	trans = min_t(int, len, SFC_MAX_TRANS_BYTES);
+	ret = rockchip_sfc_op_reg(nor, opcode, trans, SFC_CMD_DIR_RD);
+	if (ret)
+		return ret;
+
+	ret = rockchip_sfc_read_fifo(sfc, buf, trans);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int rockchip_sfc_write_reg(struct spi_nor *nor, u8 opcode,
+				  const u8 *buf, size_t len)
+{
+	struct rockchip_sfc_chip_priv *priv = nor->priv;
+	struct rockchip_sfc *sfc = priv->sfc;
+	int ret;
+
+	ret = rockchip_sfc_op_reg(nor, opcode, len, SFC_CMD_DIR_WR);
+	if (ret)
+		return ret;
+	ret = rockchip_sfc_write_fifo(sfc, buf, len);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int rockchip_sfc_erase(struct spi_nor *nor, loff_t offs)
+{
+	struct rockchip_sfc_chip_priv *priv = nor->priv;
+	struct rockchip_sfc *sfc = priv->sfc;
+	u32 reg;
+
+	rockchip_sfc_setup_ctrl(sfc);
+
+	reg = nor->erase_opcode << SFC_CMD_IDX_SHIFT;
+	reg |= (nor->addr_width == 4) ?
+		SFC_CMD_ADDR_32BITS : SFC_CMD_ADDR_24BITS;
+	reg |= priv->cs << SFC_CMD_CS_SHIFT;
+	reg |= SFC_CMD_DIR_WR << SFC_CMD_DIR_SHIFT;
+
+	writel_relaxed(reg, sfc->regbase + SFC_CMD);
+
+	writel_relaxed(offs, sfc->regbase + SFC_ADDR);
+
+	return 0;
+}
+
+static int rockchip_sfc_setup_transfer(struct spi_nor *nor,
+					       loff_t from_to,
+					       size_t len, u8 op_type)
+{
+	struct rockchip_sfc_chip_priv *priv = nor->priv;
+	struct rockchip_sfc *sfc = priv->sfc;
+	u8 if_type = IF_TYPE_STD;
+	u32 reg;
+
+	if (op_type == SFC_CMD_DIR_RD)
+		if_type = rockchip_sfc_get_if_type(sfc, nor->read_proto);
+
+	rockchip_sfc_wait_idle(sfc, 10000);
+
+	writel_relaxed((if_type << SFC_CTRL_DATA_BITS_SHIFT) |
+		       (IF_TYPE_STD << SFC_CTRL_ADDR_BITS_SHIFT) |
+		       (IF_TYPE_STD << SFC_CTRL_CMD_BITS_SHIFT) |
+		       SFC_CTRL_PHASE_SEL_NEGETIVE,
+		       sfc->regbase + SFC_CTRL);
+
+	if (op_type == SFC_CMD_DIR_WR)
+		reg = nor->program_opcode << SFC_CMD_IDX_SHIFT;
+	else
+		reg = nor->read_opcode << SFC_CMD_IDX_SHIFT;
+
+	reg |= op_type << SFC_CMD_DIR_SHIFT;
+	reg |= (nor->addr_width == 4) ?
+		SFC_CMD_ADDR_32BITS : SFC_CMD_ADDR_24BITS;
+
+	reg |= priv->cs << SFC_CMD_CS_SHIFT;
+	reg |= len << SFC_CMD_TRAN_BYTES_SHIFT;
+
+	if (op_type == SFC_CMD_DIR_RD)
+		reg |= SFC_CMD_DUMMY(nor->read_dummy);
+
+	writel_relaxed(reg, sfc->regbase + SFC_CMD);
+	writel_relaxed(from_to, sfc->regbase + SFC_ADDR);
+
+	return 0;
+}
+
+static int rockchip_sfc_do_dma_transfer(struct spi_nor *nor, loff_t from_to,
+					dma_addr_t dma_buf, size_t len,
+					u8 op_type)
+{
+	struct rockchip_sfc_chip_priv *priv = nor->priv;
+	struct rockchip_sfc *sfc = priv->sfc;
+	u32 reg;
+	int err = 0;
+
+	init_completion(&sfc->cp);
+
+	writel_relaxed(SFC_ICLR_RX_FULL | SFC_ICLR_RX_UFLOW |
+		       SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |
+		       SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |
+		       SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,
+		       sfc->regbase + SFC_ICLR);
+
+	/* Enable transfer complete interrupt */
+	reg = readl_relaxed(sfc->regbase + SFC_IMR);
+	reg &= ~SFC_IMR_TRAN_FINISH;
+	writel_relaxed(reg, sfc->regbase + SFC_IMR);
+
+	err = rockchip_sfc_setup_transfer(nor, from_to, len, op_type);
+	if (err < 0)
+		return err;
+
+	writel_relaxed(dma_buf, sfc->regbase + SFC_DMA_ADDR);
+
+	/*
+	 * Start dma but note that the sfc->dma_buffer is derived from
+	 * dmam_alloc_coherent so we don't actually need any sync operations
+	 * for coherent dma memory.
+	 */
+	writel(0x1, sfc->regbase + SFC_DMA_TRIGGER);
+
+	/* Wait for the interrupt. */
+	if (!wait_for_completion_timeout(&sfc->cp, msecs_to_jiffies(2000))) {
+		dev_err(sfc->dev, "DMA wait for transfer finish timeout\n");
+		err = -ETIMEDOUT;
+	}
+
+	writel_relaxed(SFC_ICLR_RX_FULL | SFC_ICLR_RX_UFLOW |
+		       SFC_ICLR_TX_OFLOW | SFC_ICLR_TX_EMPTY |
+		       SFC_ICLR_TRAN_FINISH | SFC_ICLR_BUS_ERR |
+		       SFC_ICLR_NSPI_ERR | SFC_ICLR_DMA,
+		       sfc->regbase + SFC_ICLR);
+	/* Disable transfer finish interrupt */
+	reg = readl_relaxed(sfc->regbase + SFC_IMR);
+	reg |= SFC_IMR_TRAN_FINISH;
+	writel_relaxed(reg, sfc->regbase + SFC_IMR);
+
+	if (err) {
+		rockchip_sfc_reset(sfc);
+		return err;
+	}
+
+	return 0;
+}
+
+static inline int rockchip_sfc_pio_write(struct rockchip_sfc *sfc, u_char *buf,
+					 size_t len)
+{
+	return rockchip_sfc_write_fifo(sfc, buf, len);
+}
+
+static inline int rockchip_sfc_pio_read(struct rockchip_sfc *sfc, u_char *buf,
+					size_t len)
+{
+	return rockchip_sfc_read_fifo(sfc, buf, len);
+}
+
+static int rockchip_sfc_pio_transfer(struct spi_nor *nor, loff_t from_to,
+				     size_t len, u_char *buf, u8 op_type)
+{
+	struct rockchip_sfc_chip_priv *priv = nor->priv;
+	struct rockchip_sfc *sfc = priv->sfc;
+	size_t trans;
+	int ret;
+
+	trans = min_t(size_t, SFC_MAX_TRANS_BYTES, len);
+	ret = rockchip_sfc_setup_transfer(nor, from_to, trans, op_type);
+	if (ret < 0)
+		return ret;
+
+	if (op_type == SFC_CMD_DIR_WR)
+		ret = rockchip_sfc_pio_write(sfc, buf, trans);
+	else
+		ret = rockchip_sfc_pio_read(sfc, buf, trans);
+
+	return ret;
+}
+
+static int rockchip_sfc_dma_transfer(struct spi_nor *nor, loff_t from_to,
+				     size_t len, u_char *buf, u8 op_type)
+{
+	struct rockchip_sfc_chip_priv *priv = nor->priv;
+	struct rockchip_sfc *sfc = priv->sfc;
+	size_t trans;
+	int ret;
+
+	trans = min_t(size_t, SFC_MAX_TRANS_BYTES, len);
+
+	if (op_type == SFC_CMD_DIR_WR)
+		memcpy(sfc->buffer, buf, trans);
+
+	ret = rockchip_sfc_do_dma_transfer(nor, from_to, sfc->dma_buffer,
+					   trans, op_type);
+	if (ret) {
+		dev_warn(nor->dev, "DMA timeout\n");
+		return ret;
+	}
+
+	if (op_type == SFC_CMD_DIR_RD)
+		memcpy(buf, sfc->buffer, trans);
+
+	return trans;
+}
+
+static ssize_t rockchip_sfc_do_rd_wr(struct spi_nor *nor, loff_t from_to,
+				     size_t len, u_char *buf, u32 op_type)
+{
+	struct rockchip_sfc_chip_priv *priv = nor->priv;
+	struct rockchip_sfc *sfc = priv->sfc;
+
+	/* DMA can only handle word anligned transfer chunks */
+	if (likely(sfc->use_dma) && !(len & 0x3))
+		return rockchip_sfc_dma_transfer(nor, from_to, len, buf, op_type);
+	else
+		return rockchip_sfc_pio_transfer(nor, from_to, len, buf, op_type);
+}
+
+static ssize_t rockchip_sfc_read(struct spi_nor *nor, loff_t from,
+				 size_t len, u_char *read_buf)
+{
+	return rockchip_sfc_do_rd_wr(nor, from, len,
+				     read_buf, SFC_CMD_DIR_RD);
+}
+
+static ssize_t rockchip_sfc_write(struct spi_nor *nor, loff_t to,
+				  size_t len, const u_char *write_buf)
+{
+	return rockchip_sfc_do_rd_wr(nor, to, len,
+				     (u_char *)write_buf,
+				     SFC_CMD_DIR_WR);
+}
+
+static const struct spi_nor_controller_ops rockchip_sfc_controller_ops = {
+	.prepare = rockchip_sfc_prep,
+	.unprepare = rockchip_sfc_unprep,
+	.read_reg = rockchip_sfc_read_reg,
+	.write_reg = rockchip_sfc_write_reg,
+	.read = rockchip_sfc_read,
+	.write = rockchip_sfc_write,
+	.erase = rockchip_sfc_erase,
+};
+
+static int rockchip_sfc_register(struct device_node *np,
+				 struct rockchip_sfc *sfc)
+{
+	struct spi_nor_hwcaps hwcaps = {
+		.mask = SNOR_HWCAPS_READ |
+			SNOR_HWCAPS_READ_FAST |
+			SNOR_HWCAPS_PP,
+	};
+	struct device *dev = sfc->dev;
+	struct mtd_info *mtd;
+	struct spi_nor *nor;
+	u32 property;
+	int ret;
+
+	nor = &sfc->flash[sfc->num_chip].nor;
+	nor->dev = dev;
+	spi_nor_set_flash_node(nor, np);
+
+	if (!of_property_read_u32(np, "spi-rx-bus-width", &property)) {
+		switch (property) {
+		case 1:
+			break;
+		case 2:
+			hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
+			break;
+		case 4:
+			hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
+			break;
+		default:
+			dev_err(sfc->dev, "unsupported rx-bus-width\n");
+			return -EINVAL;
+		}
+	}
+
+	ret = of_property_read_u8(np, "reg", &sfc->flash[sfc->num_chip].cs);
+	if (ret) {
+		dev_err(dev, "No reg property for %s\n",
+			np->full_name);
+		return ret;
+	}
+
+	ret = of_property_read_u32(np, "spi-max-frequency",
+				   &sfc->flash[sfc->num_chip].clk_rate);
+	if (ret) {
+		dev_err(dev, "No spi-max-frequency property for %s\n",
+			np->full_name);
+		return ret;
+	}
+
+	sfc->flash[sfc->num_chip].sfc = sfc;
+	nor->priv = &sfc->flash[sfc->num_chip];
+
+	nor->controller_ops = &rockchip_sfc_controller_ops;
+	ret = spi_nor_scan(nor, NULL, &hwcaps);
+	if (ret)
+		return ret;
+
+	mtd = &nor->mtd;
+	mtd->name = np->name;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret)
+		return ret;
+
+	sfc->num_chip++;
+	return 0;
+}
+
+static void rockchip_sfc_unregister_all(struct rockchip_sfc *sfc)
+{
+	int i;
+
+	for (i = 0; i < sfc->num_chip; i++)
+		mtd_device_unregister(&sfc->flash[i].nor.mtd);
+}
+
+static int rockchip_sfc_register_all(struct rockchip_sfc *sfc)
+{
+	struct device *dev = sfc->dev;
+	struct device_node *np;
+	int ret;
+
+	for_each_available_child_of_node(dev->of_node, np) {
+		ret = rockchip_sfc_register(np, sfc);
+		if (ret)
+			goto fail;
+
+		if (sfc->num_chip >= SFC_MAX_CHIPSELECT_NUM) {
+			dev_warn(dev, "Exceeds the max cs limitation\n");
+			break;
+		}
+	}
+
+	return 0;
+
+fail:
+	dev_err(dev, "Failed to register all chips\n");
+	/* Unregister all the _registered_ nor flash */
+	rockchip_sfc_unregister_all(sfc);
+	return ret;
+}
+
+static irqreturn_t rockchip_sfc_irq_handler(int irq, void *dev_id)
+{
+	struct rockchip_sfc *sfc = dev_id;
+	u32 reg;
+
+	reg = readl(sfc->regbase + SFC_RISR);
+
+	/* Clear interrupt */
+	writel_relaxed(reg, sfc->regbase + SFC_ICLR);
+
+	if (reg & SFC_RISR_TRAN_FINISH)
+		complete(&sfc->cp);
+
+	return IRQ_HANDLED;
+}
+
+static int rockchip_sfc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct rockchip_sfc *sfc;
+	int ret;
+
+	sfc = devm_kzalloc(dev, sizeof(*sfc), GFP_KERNEL);
+	if (!sfc)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, sfc);
+	sfc->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	sfc->regbase = devm_ioremap_resource(dev, res);
+	if (IS_ERR(sfc->regbase))
+		return PTR_ERR(sfc->regbase);
+
+	sfc->clk = devm_clk_get(&pdev->dev, "sfc");
+	if (IS_ERR(sfc->clk)) {
+		dev_err(&pdev->dev, "Failed to get sfc interface clk\n");
+		return PTR_ERR(sfc->clk);
+	}
+
+	sfc->hclk = devm_clk_get(&pdev->dev, "hsfc");
+	if (IS_ERR(sfc->hclk)) {
+		dev_err(&pdev->dev, "Failed to get sfc ahp clk\n");
+		return PTR_ERR(sfc->hclk);
+	}
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_warn(dev, "Unable to set dma mask\n");
+		return ret;
+	}
+
+	sfc->buffer = dmam_alloc_coherent(dev, SFC_MAX_TRANS_BYTES,
+					  &sfc->dma_buffer,
+					  GFP_KERNEL);
+	if (!sfc->buffer)
+		return -ENOMEM;
+
+	mutex_init(&sfc->lock);
+
+	ret = clk_prepare_enable(sfc->hclk);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to enable hclk\n");
+		goto err_hclk;
+	}
+
+	ret = clk_prepare_enable(sfc->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to enable clk\n");
+		goto err_clk;
+	}
+
+	sfc->use_dma = !of_property_read_bool(sfc->dev->of_node,
+					      "rockchip,sfc-no-dma");
+
+	/* Find the irq */
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get the irq\n");
+		goto err_irq;
+	}
+
+	ret = devm_request_irq(dev, ret, rockchip_sfc_irq_handler,
+			       0, pdev->name, sfc);
+	if (ret) {
+		dev_err(dev, "Failed to request irq\n");
+		goto err_irq;
+	}
+
+	sfc->num_chip = 0;
+	ret = rockchip_sfc_init(sfc);
+	if (ret)
+		goto err_irq;
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
+	pm_runtime_use_autosuspend(&pdev->dev);
+
+	ret = rockchip_sfc_register_all(sfc);
+	if (ret)
+		goto err_register;
+
+	clk_disable_unprepare(sfc->clk);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
+	return 0;
+
+err_register:
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+err_irq:
+	clk_disable_unprepare(sfc->clk);
+err_clk:
+	clk_disable_unprepare(sfc->hclk);
+err_hclk:
+	mutex_destroy(&sfc->lock);
+	return ret;
+}
+
+static int rockchip_sfc_remove(struct platform_device *pdev)
+{
+	struct rockchip_sfc *sfc = platform_get_drvdata(pdev);
+
+	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+
+	rockchip_sfc_unregister_all(sfc);
+	mutex_destroy(&sfc->lock);
+	clk_disable_unprepare(sfc->clk);
+	clk_disable_unprepare(sfc->hclk);
+	return 0;
+}
+
+#ifdef CONFIG_PM
+int rockchip_sfc_runtime_suspend(struct device *dev)
+{
+	struct rockchip_sfc *sfc = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(sfc->hclk);
+	return 0;
+}
+
+int rockchip_sfc_runtime_resume(struct device *dev)
+{
+	struct rockchip_sfc *sfc = dev_get_drvdata(dev);
+
+	clk_prepare_enable(sfc->hclk);
+	return rockchip_sfc_reset(sfc);
+}
+#endif /* CONFIG_PM */
+
+static const struct of_device_id rockchip_sfc_dt_ids[] = {
+	{ .compatible = "rockchip,sfc"},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rockchip_sfc_dt_ids);
+
+static const struct dev_pm_ops rockchip_sfc_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(rockchip_sfc_runtime_suspend,
+			   rockchip_sfc_runtime_resume, NULL)
+};
+
+static struct platform_driver rockchip_sfc_driver = {
+	.driver = {
+		.name	= "rockchip-sfc",
+		.of_match_table = rockchip_sfc_dt_ids,
+		.pm = &rockchip_sfc_dev_pm_ops,
+	},
+	.probe	= rockchip_sfc_probe,
+	.remove	= rockchip_sfc_remove,
+};
+module_platform_driver(rockchip_sfc_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Rockchip Serial Flash Controller Driver");
+MODULE_AUTHOR("Shawn Lin <shawn.lin@rock-chips.com>");
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
