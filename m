Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1C7C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 06:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i03UZIG5G9HKohWbmOI1BCzYFKbfAgQffwiUSb4n1c8=; b=s33Dx5K6PMgxbi
	VZZcKOM0Nvd2zK0MqVfYKnitCNk+/KVu0CaFgxTvORRN0AegU+XXV7/TPXOzxp4CNgZ2+eckxxRgB
	k1C9tS0UgWJ688NnhJBFKmtpI4XHx2W29zO/obgQMGjIaHllmVNW6c/rG8dTX0AnyQy9KX8OZ7Dcw
	AxctyfsfsaOz+xNwjoSCp+vXxgpy18Gve3pdEzn0mDHIrnGmTLPppQYgvRn2K6RYGu79baTSBAG9C
	6Uj4rOeR5GGKIhTq37qUwk3Lq7FIX4g+1qm3d9vXWTJUiH4jdBueIiU/S4xau7mb+qvpWsbzSP2kg
	9K1zfsEgGdGOXhKExgaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKaN2-0096dQ-MX; Thu, 17 Feb 2022 06:34:28 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKaMX-0096Vc-OV; Thu, 17 Feb 2022 06:33:59 +0000
Received: from droid11-sz.amlogic.com (10.28.8.21) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Thu, 17 Feb 2022
 14:33:52 +0800
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: Liang Yang <liang.yang@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH RESEND v2 1/2] mtd: rawnand: meson: discard the common MMC sub
 clock framework
Date: Thu, 17 Feb 2022 14:33:45 +0800
Message-ID: <20220217063346.21691-2-liang.yang@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217063346.21691-1-liang.yang@amlogic.com>
References: <20220217063346.21691-1-liang.yang@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.21]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_223357_823372_581E7AC7 
X-CRM114-Status: GOOD (  20.03  )
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

EMMC and NAND have the same clock control register named 'SD_EMMC_CLOCK' which is
defined in EMMC port internally. bit0~5 of 'SD_EMMC_CLOCK' is the divider and
bit6~7 is the mux for fix pll and xtal.A common MMC and NAND sub-clock has been
implemented and can be used by the eMMC and NAND controller (which are mutually
exclusive anyway). Let's use this new clock.

Signed-off-by: Liang Yang <liang.yang@amlogic.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 107 +++++++++++++++++-------------
 1 file changed, 61 insertions(+), 46 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index ac3be92872d0..c5b892d38ea0 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -10,6 +10,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mfd/syscon.h>
@@ -19,6 +20,7 @@
 #include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_address.h>
 #include <linux/sched/task_stack.h>
 
 #define NFC_REG_CMD		0x00
@@ -104,6 +106,9 @@
 
 #define PER_INFO_BYTE		8
 
+#define CLK_DIV_SHIFT		0
+#define CLK_DIV_WIDTH		6
+
 struct meson_nfc_nand_chip {
 	struct list_head node;
 	struct nand_chip nand;
@@ -151,15 +156,15 @@ struct meson_nfc {
 	struct nand_controller controller;
 	struct clk *core_clk;
 	struct clk *device_clk;
-	struct clk *phase_tx;
-	struct clk *phase_rx;
+	struct clk *nand_clk;
+	struct clk_divider nand_divider;
 
 	unsigned long clk_rate;
 	u32 bus_timing;
 
 	struct device *dev;
 	void __iomem *reg_base;
-	struct regmap *reg_clk;
+	void __iomem *sd_emmc_clock;
 	struct completion completion;
 	struct list_head chips;
 	const struct meson_nfc_data *data;
@@ -988,6 +993,8 @@ static const struct mtd_ooblayout_ops meson_ooblayout_ops = {
 static int meson_nfc_clk_init(struct meson_nfc *nfc)
 {
 	int ret;
+	struct clk_init_data init = {0};
+	struct clk_parent_data nfc_divider_parent_data[1];
 
 	/* request core clock */
 	nfc->core_clk = devm_clk_get(nfc->dev, "core");
@@ -1002,21 +1009,26 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 		return PTR_ERR(nfc->device_clk);
 	}
 
-	nfc->phase_tx = devm_clk_get(nfc->dev, "tx");
-	if (IS_ERR(nfc->phase_tx)) {
-		dev_err(nfc->dev, "failed to get TX clk\n");
-		return PTR_ERR(nfc->phase_tx);
-	}
-
-	nfc->phase_rx = devm_clk_get(nfc->dev, "rx");
-	if (IS_ERR(nfc->phase_rx)) {
-		dev_err(nfc->dev, "failed to get RX clk\n");
-		return PTR_ERR(nfc->phase_rx);
-	}
+	init.name = devm_kstrdup(nfc->dev, "nfc#div", GFP_KERNEL);
+	init.ops = &clk_divider_ops;
+	nfc_divider_parent_data[0].fw_name = __clk_get_name(nfc->device_clk);
+	init.parent_data = nfc_divider_parent_data;
+	init.num_parents = 1;
+	nfc->nand_divider.reg = nfc->sd_emmc_clock;
+	nfc->nand_divider.shift = CLK_DIV_SHIFT;
+	nfc->nand_divider.width = CLK_DIV_WIDTH;
+	nfc->nand_divider.hw.init = &init;
+	nfc->nand_divider.flags = CLK_DIVIDER_ONE_BASED |
+				  CLK_DIVIDER_ROUND_CLOSEST |
+				  CLK_DIVIDER_ALLOW_ZERO;
+
+	nfc->nand_clk = devm_clk_register(nfc->dev, &nfc->nand_divider.hw);
+	if (IS_ERR(nfc->nand_clk))
+		return PTR_ERR(nfc->nand_clk);
 
 	/* init SD_EMMC_CLOCK to sane defaults w/min clock rate */
-	regmap_update_bits(nfc->reg_clk,
-			   0, CLK_SELECT_NAND, CLK_SELECT_NAND);
+	writel(CLK_SELECT_NAND | readl(nfc->sd_emmc_clock),
+	       nfc->sd_emmc_clock);
 
 	ret = clk_prepare_enable(nfc->core_clk);
 	if (ret) {
@@ -1030,29 +1042,21 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 		goto err_device_clk;
 	}
 
-	ret = clk_prepare_enable(nfc->phase_tx);
-	if (ret) {
-		dev_err(nfc->dev, "failed to enable TX clock\n");
-		goto err_phase_tx;
-	}
-
-	ret = clk_prepare_enable(nfc->phase_rx);
+	ret = clk_prepare_enable(nfc->nand_clk);
 	if (ret) {
-		dev_err(nfc->dev, "failed to enable RX clock\n");
-		goto err_phase_rx;
+		dev_err(nfc->dev, "pre enable NFC divider fail\n");
+		goto err_nand_clk;
 	}
 
 	ret = clk_set_rate(nfc->device_clk, 24000000);
 	if (ret)
-		goto err_disable_rx;
+		goto err_disable_clk;
 
 	return 0;
 
-err_disable_rx:
-	clk_disable_unprepare(nfc->phase_rx);
-err_phase_rx:
-	clk_disable_unprepare(nfc->phase_tx);
-err_phase_tx:
+err_disable_clk:
+	clk_disable_unprepare(nfc->nand_clk);
+err_nand_clk:
 	clk_disable_unprepare(nfc->device_clk);
 err_device_clk:
 	clk_disable_unprepare(nfc->core_clk);
@@ -1061,8 +1065,7 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 
 static void meson_nfc_disable_clk(struct meson_nfc *nfc)
 {
-	clk_disable_unprepare(nfc->phase_rx);
-	clk_disable_unprepare(nfc->phase_tx);
+	clk_disable_unprepare(nfc->nand_clk);
 	clk_disable_unprepare(nfc->device_clk);
 	clk_disable_unprepare(nfc->core_clk);
 }
@@ -1370,11 +1373,31 @@ static const struct of_device_id meson_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, meson_nfc_id_table);
 
+static int meson_nfc_reg_resource(struct device *dev, struct meson_nfc *nfc)
+{
+	struct resource res;
+	void __iomem *base[2];
+	struct device_node *node = dev->of_node;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		if (of_address_to_resource(node, i, &res))
+			return -ENOENT;
+
+		base[i] = devm_ioremap_resource(dev, &res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+	}
+	nfc->reg_base = base[0];
+	nfc->sd_emmc_clock = base[1];
+
+	return 0;
+}
+
 static int meson_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_nfc *nfc;
-	struct resource *res;
 	int ret, irq;
 
 	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
@@ -1388,20 +1411,12 @@ static int meson_nfc_probe(struct platform_device *pdev)
 	nand_controller_init(&nfc->controller);
 	INIT_LIST_HEAD(&nfc->chips);
 	init_completion(&nfc->completion);
-
 	nfc->dev = dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	nfc->reg_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(nfc->reg_base))
-		return PTR_ERR(nfc->reg_base);
-
-	nfc->reg_clk =
-		syscon_regmap_lookup_by_phandle(dev->of_node,
-						"amlogic,mmc-syscon");
-	if (IS_ERR(nfc->reg_clk)) {
-		dev_err(dev, "Failed to lookup clock base\n");
-		return PTR_ERR(nfc->reg_clk);
+	ret = meson_nfc_reg_resource(dev, nfc);
+	if (ret) {
+		dev_err(dev, "Failed to get reg resource\n");
+		return ret;
 	}
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
