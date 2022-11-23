Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA451C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kA/cK+zgYaBZYHF8ve88A9RcSJqOb+YoZIR3hLXv64=; b=M5Xc6lbHAElvd2
	UkrKcO/2kxEJp8iBID8pbWA89jWrfpZhrK9EzRH4+IDG2LZt/d8ONMr91bgANeVuTRlsvxirdQHgL
	pAFRsX29w/WHZOzCS5aSvsiWBfQ7YI50GmNIta2godfNme4BhtuHZRBt2iyzdMP60hHxZI9Ri/MWc
	U/KDPpXpvmekgBBPSNmjA94AuHgaS6F+mAtE37LgaFc13JTtyTj31r5SQsZaOoNzsrofSN5F0OlaV
	P1AprrgA6moaENMQg8iIEPYKrbrOHMWOAHCaRlBvZKUa7i6PTbwpUq2YKbPi2MGWWYizIq/UQaJUY
	OznrW7TfJEvlX0N+4lIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqxy-0007vJ-6y; Wed, 23 Nov 2022 14:43:10 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqwR-0007W1-Qb
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 14:41:38 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:881b:815b:474d:c3fd])
	by michel.telenet-ops.be with bizsmtp
	id nqhS2800V49U0Rd06qhSXJ; Wed, 23 Nov 2022 15:41:30 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oxqwI-001Rqg-0P; Wed, 23 Nov 2022 15:41:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oxqwH-0012HG-1S; Wed, 23 Nov 2022 15:41:25 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/6] memory: renesas-rpc-if: Split-off private data from struct rpcif
Date: Wed, 23 Nov 2022 15:41:17 +0100
Message-Id: <09fbb6fa67d5a8cd48a08808c9afa2f6a499aa42.1669213027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669213027.git.geert+renesas@glider.be>
References: <cover.1669213027.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_064136_127635_B2DA016D 
X-CRM114-Status: GOOD (  19.69  )
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

The rpcif structure is used as a common data structure, shared by the
RPC-IF core driver and by the HyperBus and SPI child drivers.
This poses several problems:
  - Most structure members describe private core driver state, which
    should not be accessible by the child drivers,
  - The structure's lifetime is controlled by the child drivers,
    complicating use by the core driver.

Fix this by moving the private core driver state to its own structure,
managed by the RPC-IF core driver, and store it in the core driver's
private data field.  This requires absorbing the child's platform
device, as that was stored in the driver's private data field before.

Fixes: ca7d8b980b67f133 ("memory: add Renesas RPC-IF driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Move forward in series,
  - Add Fixes tag.
---
 drivers/memory/renesas-rpc-if.c | 75 +++++++++++++++++++++++++--------
 include/memory/renesas-rpc-if.h | 16 -------
 2 files changed, 57 insertions(+), 34 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index f38a44877b15e8b1..224973ac859f88fa 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -163,14 +163,36 @@ static const struct regmap_access_table rpcif_volatile_table = {
 	.n_yes_ranges	= ARRAY_SIZE(rpcif_volatile_ranges),
 };
 
+struct rpcif_priv {
+	struct device *dev;
+	void __iomem *base;
+	void __iomem *dirmap;
+	struct regmap *regmap;
+	struct reset_control *rstc;
+	struct platform_device *vdev;
+	size_t size;
+	enum rpcif_type type;
+	enum rpcif_data_dir dir;
+	u8 bus_size;
+	u8 xfer_size;
+	void *buffer;
+	u32 xferlen;
+	u32 smcr;
+	u32 smadr;
+	u32 command;		/* DRCMR or SMCMR */
+	u32 option;		/* DROPR or SMOPR */
+	u32 enable;		/* DRENR or SMENR */
+	u32 dummy;		/* DRDMCR or SMDMCR */
+	u32 ddr;		/* DRDRENR or SMDRENR */
+};
 
 /*
  * Custom accessor functions to ensure SM[RW]DR[01] are always accessed with
- * proper width.  Requires rpcif.xfer_size to be correctly set before!
+ * proper width.  Requires rpcif_priv.xfer_size to be correctly set before!
  */
 static int rpcif_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
-	struct rpcif *rpc = context;
+	struct rpcif_priv *rpc = context;
 
 	switch (reg) {
 	case RPCIF_SMRDR0:
@@ -206,7 +228,7 @@ static int rpcif_reg_read(void *context, unsigned int reg, unsigned int *val)
 
 static int rpcif_reg_write(void *context, unsigned int reg, unsigned int val)
 {
-	struct rpcif *rpc = context;
+	struct rpcif_priv *rpc = context;
 
 	switch (reg) {
 	case RPCIF_SMWDR0:
@@ -253,13 +275,12 @@ static const struct regmap_config rpcif_regmap_config = {
 	.volatile_table	= &rpcif_volatile_table,
 };
 
-int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
+int rpcif_sw_init(struct rpcif *rpcif, struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	struct rpcif_priv *rpc = dev_get_drvdata(dev);
 	struct resource *res;
 
-	rpc->dev = dev;
-
 	rpc->base = devm_platform_ioremap_resource_byname(pdev, "regs");
 	if (IS_ERR(rpc->base))
 		return PTR_ERR(rpc->base);
@@ -280,12 +301,17 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
 
 	rpc->type = (uintptr_t)of_device_get_match_data(dev);
 	rpc->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(rpc->rstc))
+		return PTR_ERR(rpc->rstc);
 
-	return PTR_ERR_OR_ZERO(rpc->rstc);
+	rpcif->dev = dev;
+	rpcif->dirmap = rpc->dirmap;
+	rpcif->size = rpc->size;
+	return 0;
 }
 EXPORT_SYMBOL(rpcif_sw_init);
 
-static void rpcif_rzg2l_timing_adjust_sdr(struct rpcif *rpc)
+static void rpcif_rzg2l_timing_adjust_sdr(struct rpcif_priv *rpc)
 {
 	regmap_write(rpc->regmap, RPCIF_PHYWR, 0xa5390000);
 	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000000);
@@ -299,8 +325,9 @@ static void rpcif_rzg2l_timing_adjust_sdr(struct rpcif *rpc)
 	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000032);
 }
 
-int rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
+int rpcif_hw_init(struct rpcif *rpcif, bool hyperflash)
 {
+	struct rpcif_priv *rpc = dev_get_drvdata(rpcif->dev);
 	u32 dummy;
 
 	pm_runtime_get_sync(rpc->dev);
@@ -364,7 +391,7 @@ int rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
 }
 EXPORT_SYMBOL(rpcif_hw_init);
 
-static int wait_msg_xfer_end(struct rpcif *rpc)
+static int wait_msg_xfer_end(struct rpcif_priv *rpc)
 {
 	u32 sts;
 
@@ -373,7 +400,7 @@ static int wait_msg_xfer_end(struct rpcif *rpc)
 					USEC_PER_SEC);
 }
 
-static u8 rpcif_bits_set(struct rpcif *rpc, u32 nbytes)
+static u8 rpcif_bits_set(struct rpcif_priv *rpc, u32 nbytes)
 {
 	if (rpc->bus_size == 2)
 		nbytes /= 2;
@@ -386,9 +413,11 @@ static u8 rpcif_bit_size(u8 buswidth)
 	return buswidth > 4 ? 2 : ilog2(buswidth);
 }
 
-void rpcif_prepare(struct rpcif *rpc, const struct rpcif_op *op, u64 *offs,
+void rpcif_prepare(struct rpcif *rpcif, const struct rpcif_op *op, u64 *offs,
 		   size_t *len)
 {
+	struct rpcif_priv *rpc = dev_get_drvdata(rpcif->dev);
+
 	rpc->smcr = 0;
 	rpc->smadr = 0;
 	rpc->enable = 0;
@@ -472,8 +501,9 @@ void rpcif_prepare(struct rpcif *rpc, const struct rpcif_op *op, u64 *offs,
 }
 EXPORT_SYMBOL(rpcif_prepare);
 
-int rpcif_manual_xfer(struct rpcif *rpc)
+int rpcif_manual_xfer(struct rpcif *rpcif)
 {
+	struct rpcif_priv *rpc = dev_get_drvdata(rpcif->dev);
 	u32 smenr, smcr, pos = 0, max = rpc->bus_size == 2 ? 8 : 4;
 	int ret = 0;
 
@@ -593,7 +623,7 @@ int rpcif_manual_xfer(struct rpcif *rpc)
 err_out:
 	if (reset_control_reset(rpc->rstc))
 		dev_err(rpc->dev, "Failed to reset HW\n");
-	rpcif_hw_init(rpc, rpc->bus_size == 2);
+	rpcif_hw_init(rpcif, rpc->bus_size == 2);
 	goto exit;
 }
 EXPORT_SYMBOL(rpcif_manual_xfer);
@@ -640,8 +670,9 @@ static void memcpy_fromio_readw(void *to,
 	}
 }
 
-ssize_t rpcif_dirmap_read(struct rpcif *rpc, u64 offs, size_t len, void *buf)
+ssize_t rpcif_dirmap_read(struct rpcif *rpcif, u64 offs, size_t len, void *buf)
 {
+	struct rpcif_priv *rpc = dev_get_drvdata(rpcif->dev);
 	loff_t from = offs & (rpc->size - 1);
 	size_t size = rpc->size - from;
 
@@ -676,6 +707,7 @@ static int rpcif_probe(struct platform_device *pdev)
 {
 	struct platform_device *vdev;
 	struct device_node *flash;
+	struct rpcif_priv *rpc;
 	const char *name;
 	int ret;
 
@@ -696,11 +728,18 @@ static int rpcif_probe(struct platform_device *pdev)
 	}
 	of_node_put(flash);
 
+	rpc = devm_kzalloc(&pdev->dev, sizeof(*rpc), GFP_KERNEL);
+	if (!rpc)
+		return -ENOMEM;
+
 	vdev = platform_device_alloc(name, pdev->id);
 	if (!vdev)
 		return -ENOMEM;
 	vdev->dev.parent = &pdev->dev;
-	platform_set_drvdata(pdev, vdev);
+
+	rpc->dev = &pdev->dev;
+	rpc->vdev = vdev;
+	platform_set_drvdata(pdev, rpc);
 
 	ret = platform_device_add(vdev);
 	if (ret) {
@@ -713,9 +752,9 @@ static int rpcif_probe(struct platform_device *pdev)
 
 static int rpcif_remove(struct platform_device *pdev)
 {
-	struct platform_device *vdev = platform_get_drvdata(pdev);
+	struct rpcif_priv *rpc = platform_get_drvdata(pdev);
 
-	platform_device_unregister(vdev);
+	platform_device_unregister(rpc->vdev);
 
 	return 0;
 }
diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
index 862eff613dc7963d..2dcb82df0d176ed1 100644
--- a/include/memory/renesas-rpc-if.h
+++ b/include/memory/renesas-rpc-if.h
@@ -65,24 +65,8 @@ enum rpcif_type {
 
 struct rpcif {
 	struct device *dev;
-	void __iomem *base;
 	void __iomem *dirmap;
-	struct regmap *regmap;
-	struct reset_control *rstc;
 	size_t size;
-	enum rpcif_type type;
-	enum rpcif_data_dir dir;
-	u8 bus_size;
-	u8 xfer_size;
-	void *buffer;
-	u32 xferlen;
-	u32 smcr;
-	u32 smadr;
-	u32 command;		/* DRCMR or SMCMR */
-	u32 option;		/* DROPR or SMOPR */
-	u32 enable;		/* DRENR or SMENR */
-	u32 dummy;		/* DRDMCR or SMDMCR */
-	u32 ddr;		/* DRDRENR or SMDRENR */
 };
 
 int rpcif_sw_init(struct rpcif *rpc, struct device *dev);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
