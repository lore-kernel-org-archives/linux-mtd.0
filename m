Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262FAC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 06:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B06mfXndQgsN4OvqFWbT1lLybnKneRkv6BL2gVEyzTM=; b=IkB0I21cX+Eyvv
	5QPyruBZOXI2goIuDRyoHLD9XmMIzQwlKSl3Xt92UeBtl/HAexENCxM32udKYhJcM2Gym4uGsdxX7
	kbR8D2vh1X8GBNlXitRweljufi4akY5n5NIvd5ev8PQny5XsEq2hXZAnC+aTN0yYndcQzUVzOgEZN
	EQj0j6s1vlgrMabu/mk4+/osys7KoeknlOTKVvUK+OU82xV0DUaK+VTl5LkrrE1wJc3R/cDxN8/Kp
	DONb9c6PzHo3ZTJudwY3Y1pcg7R+X4XB9MFzWB5MiJDCqbx+DnXOWN6n3daoK79vE6TOJckreVzVR
	CYDYIH2GOcEoMuyIc0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyT2V-005BNh-RD; Tue, 07 Jun 2022 06:50:08 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyT0M-0059pg-SS; Tue, 07 Jun 2022 06:47:57 +0000
Received: from droid11-sz.amlogic.com (10.28.8.21) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Tue, 7 Jun 2022
 14:47:37 +0800
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>
CC: Liang Yang <liang.yang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Victor Wan <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng
	<bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v6 2/5] mtd: rawnand: meson: fix the clock
Date: Tue, 7 Jun 2022 14:47:27 +0800
Message-ID: <20220607064731.13367-3-liang.yang@amlogic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607064731.13367-1-liang.yang@amlogic.com>
References: <20220607064731.13367-1-liang.yang@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.8.21]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_234754_993469_EAED8985 
X-CRM114-Status: GOOD (  18.58  )
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

EMMC and NAND have the same clock control register named 'SD_EMMC_CLOCK'
which is defined in EMMC port internally. bit0~5 of 'SD_EMMC_CLOCK' is
the divider and bit6~7 is the mux for fix pll and xtal. At the beginning,
a common MMC and NAND sub-clock was discussed and planed to be implemented
as NFC clock provider, but now this series of patches of a common MMC and
NAND sub-clock are never being accepted.  the reasons for giving up are:
1. EMMC and NAND, which are mutually exclusive anyway
2. coupling the EMMC and NAND.
3. it seems that a common MMC and NAND sub-clock is over engineered.
and let us see the link fot more information:
https://lore.kernel.org/all/20220121074508.42168-5-liang.yang@amlogic.com
so The meson nfc can't work now, let us rework the clock.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Liang Yang <liang.yang@amlogic.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 82 +++++++++++++++----------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index ac3be92872d0..cc93667a1e7f 100644
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
@@ -56,6 +57,9 @@
 
 #define NFC_RB_IRQ_EN		BIT(21)
 
+#define CLK_DIV_SHIFT		0
+#define CLK_DIV_WIDTH		6
+
 #define CMDRWGEN(cmd_dir, ran, bch, short_mode, page_size, pages)	\
 	(								\
 		(cmd_dir)			|			\
@@ -151,15 +155,15 @@ struct meson_nfc {
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
+	void __iomem *reg_clk;
 	struct completion completion;
 	struct list_head chips;
 	const struct meson_nfc_data *data;
@@ -235,7 +239,7 @@ static void meson_nfc_select_chip(struct nand_chip *nand, int chip)
 	nfc->timing.tbers_max = meson_chip->tbers_max;
 
 	if (nfc->clk_rate != meson_chip->clk_rate) {
-		ret = clk_set_rate(nfc->device_clk, meson_chip->clk_rate);
+		ret = clk_set_rate(nfc->nand_clk, meson_chip->clk_rate);
 		if (ret) {
 			dev_err(nfc->dev, "failed to set clock rate\n");
 			return;
@@ -987,6 +991,8 @@ static const struct mtd_ooblayout_ops meson_ooblayout_ops = {
 
 static int meson_nfc_clk_init(struct meson_nfc *nfc)
 {
+	struct clk_parent_data nfc_divider_parent_data[1];
+	struct clk_init_data init = {0};
 	int ret;
 
 	/* request core clock */
@@ -1002,21 +1008,28 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
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
+	init.name = devm_kasprintf(nfc->dev,
+				   GFP_KERNEL, "%s#div",
+				   dev_name(nfc->dev));
+	init.ops = &clk_divider_ops;
+	nfc_divider_parent_data[0].fw_name = "device";
+	init.parent_data = nfc_divider_parent_data;
+	init.num_parents = 1;
+	nfc->nand_divider.reg = nfc->reg_clk;
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
+	writel(CLK_SELECT_NAND | readl(nfc->reg_clk),
+	       nfc->reg_clk);
 
 	ret = clk_prepare_enable(nfc->core_clk);
 	if (ret) {
@@ -1030,29 +1043,21 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 		goto err_device_clk;
 	}
 
-	ret = clk_prepare_enable(nfc->phase_tx);
+	ret = clk_prepare_enable(nfc->nand_clk);
 	if (ret) {
-		dev_err(nfc->dev, "failed to enable TX clock\n");
-		goto err_phase_tx;
+		dev_err(nfc->dev, "pre enable NFC divider fail\n");
+		goto err_nand_clk;
 	}
 
-	ret = clk_prepare_enable(nfc->phase_rx);
-	if (ret) {
-		dev_err(nfc->dev, "failed to enable RX clock\n");
-		goto err_phase_rx;
-	}
-
-	ret = clk_set_rate(nfc->device_clk, 24000000);
+	ret = clk_set_rate(nfc->nand_clk, 24000000);
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
@@ -1061,8 +1066,7 @@ static int meson_nfc_clk_init(struct meson_nfc *nfc)
 
 static void meson_nfc_disable_clk(struct meson_nfc *nfc)
 {
-	clk_disable_unprepare(nfc->phase_rx);
-	clk_disable_unprepare(nfc->phase_tx);
+	clk_disable_unprepare(nfc->nand_clk);
 	clk_disable_unprepare(nfc->device_clk);
 	clk_disable_unprepare(nfc->core_clk);
 }
@@ -1396,13 +1400,9 @@ static int meson_nfc_probe(struct platform_device *pdev)
 	if (IS_ERR(nfc->reg_base))
 		return PTR_ERR(nfc->reg_base);
 
-	nfc->reg_clk =
-		syscon_regmap_lookup_by_phandle(dev->of_node,
-						"amlogic,mmc-syscon");
-	if (IS_ERR(nfc->reg_clk)) {
-		dev_err(dev, "Failed to lookup clock base\n");
+	nfc->reg_clk = devm_platform_ioremap_resource_byname(pdev, "emmc");
+	if (IS_ERR(nfc->reg_clk))
 		return PTR_ERR(nfc->reg_clk);
-	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
