Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4ECC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 20:59:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE26461073
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 20:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE26461073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fC5FkplV2Nwige8nifSY7p1IzI06UxD3zhTL3ICjbgM=; b=obrNbhCBQ8Kek/
	dnRyuH2ULKLQbRopB4c2brtbDDwIsrEcCv7+5ynaq0iqRpn2AFkinlqyYTY+8x1MuR+THDRObY8lf
	2CA04kaFOZ1Zx2WguShO5RYuFyb7bemnXTbWA8JPseMhX5ssK9BU8LK1essuxzHx14euDwjzMIc5+
	kXeQ2jhLt598Ll126icMDzOdo2qEe4Cf1+arXWWw1ci1QzaJiXtHITzPW+V4WhsJxxA/DWCuqbidF
	bGBj/k14zLLZ4YSeZyF4g1IYdxYO143QTPczKd5a5P8nLWemBMltHJUAfnOSpOrBgMF+8qubTINT3
	ptxSWJmhYBj7gzQ1OtMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf73g-0001om-72; Mon, 25 Oct 2021 20:59:04 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf71n-00019C-99
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 20:57:09 +0000
X-IronPort-AV: E=Sophos;i="5.87,181,1631545200"; d="scan'208";a="98142164"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 26 Oct 2021 05:57:06 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 48745410099C;
 Tue, 26 Oct 2021 05:57:03 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 7/7] memory: renesas-rpc-if: Add support for RZ/G2L
Date: Mon, 25 Oct 2021 21:56:31 +0100
Message-Id: <20211025205631.21151-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_135707_732456_FF912882 
X-CRM114-Status: GOOD (  24.54  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SPI Multi I/O Bus Controller on RZ/G2L SoC is almost identical to
the RPC-IF interface found on R-Car Gen3 SoC's.

This patch adds a new compatible string for the RZ/G2L family so
that the timing values on RZ/G2L can be adjusted.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated macros as suggested by Wolfram
---
 drivers/memory/renesas-rpc-if.c | 72 ++++++++++++++++++++++++++++-----
 drivers/mtd/hyperbus/rpc-if.c   |  4 +-
 drivers/spi/spi-rpc-if.c        |  4 +-
 include/memory/renesas-rpc-if.h |  8 +++-
 4 files changed, 75 insertions(+), 13 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 0c56decc91f2..8c51145c0f5c 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
@@ -27,8 +28,8 @@
 #define RPCIF_CMNCR_MOIIO_HIZ	(RPCIF_CMNCR_MOIIO0(3) | \
 				 RPCIF_CMNCR_MOIIO1(3) | \
 				 RPCIF_CMNCR_MOIIO2(3) | RPCIF_CMNCR_MOIIO3(3))
-#define RPCIF_CMNCR_IO3FV(val)	(((val) & 0x3) << 14) /* undocumented */
-#define RPCIF_CMNCR_IO2FV(val)	(((val) & 0x3) << 12) /* undocumented */
+#define RPCIF_CMNCR_IO3FV(val)	(((val) & 0x3) << 14) /* documented for RZ/G2L */
+#define RPCIF_CMNCR_IO2FV(val)	(((val) & 0x3) << 12) /* documented for RZ/G2L */
 #define RPCIF_CMNCR_IO0FV(val)	(((val) & 0x3) << 8)
 #define RPCIF_CMNCR_IOFV_HIZ	(RPCIF_CMNCR_IO0FV(3) | RPCIF_CMNCR_IO2FV(3) | \
 				 RPCIF_CMNCR_IO3FV(3))
@@ -126,6 +127,9 @@
 #define RPCIF_SMDRENR_OPDRE	BIT(4)
 #define RPCIF_SMDRENR_SPIDRE	BIT(0)
 
+#define RPCIF_PHYADD		0x0070	/* R/W available on R-Car E3/D3/V3M and RZ/G2{E,L} */
+#define RPCIF_PHYWR		0x0074	/* R/W available on R-Car E3/D3/V3M and RZ/G2{E,L} */
+
 #define RPCIF_PHYCNT		0x007C	/* R/W */
 #define RPCIF_PHYCNT_CAL	BIT(31)
 #define RPCIF_PHYCNT_OCTA(v)	(((v) & 0x3) << 22)
@@ -133,10 +137,12 @@
 #define RPCIF_PHYCNT_OCT	BIT(20)
 #define RPCIF_PHYCNT_DDRCAL	BIT(19)
 #define RPCIF_PHYCNT_HS		BIT(18)
-#define RPCIF_PHYCNT_STRTIM(v)	(((v) & 0x7) << 15)
+#define RPCIF_PHYCNT_CKSEL(v)	(((v) & 0x3) << 16) /* valid only for RZ/G2L */
+#define RPCIF_PHYCNT_STRTIM(v)	(((v) & 0x7) << 15) /* valid for R-Car and RZ/G2{E,H,M,N} */
 #define RPCIF_PHYCNT_WBUF2	BIT(4)
 #define RPCIF_PHYCNT_WBUF	BIT(2)
 #define RPCIF_PHYCNT_PHYMEM(v)	(((v) & 0x3) << 0)
+#define RPCIF_PHYCNT_PHYMEM_MASK GENMASK(1, 0)
 
 #define RPCIF_PHYOFFSET1	0x0080	/* R/W */
 #define RPCIF_PHYOFFSET1_DDRTMG(v) (((v) & 0x3) << 28)
@@ -244,18 +250,46 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
 		return PTR_ERR(rpc->dirmap);
 	rpc->size = resource_size(res);
 
+	rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
 	rpc->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 
 	return PTR_ERR_OR_ZERO(rpc->rstc);
 }
 EXPORT_SYMBOL(rpcif_sw_init);
 
-void rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
+static void rpcif_rzg2l_timing_adjust_sdr(struct rpcif *rpc)
+{
+	u32 data;
+
+	regmap_write(rpc->regmap, RPCIF_PHYWR, 0xa5390000);
+	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000000);
+	regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00008080);
+	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000022);
+	regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00008080);
+	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000024);
+
+	regmap_read(rpc->regmap, RPCIF_PHYCNT, &data);
+	regmap_write(rpc->regmap, RPCIF_PHYCNT, data | RPCIF_PHYCNT_CKSEL(3));
+	regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00000030);
+	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000032);
+}
+
+int rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
 {
 	u32 dummy;
 
 	pm_runtime_get_sync(rpc->dev);
 
+	if (rpc->type == RPCIF_RZ_G2L) {
+		int ret;
+
+		ret = reset_control_reset(rpc->rstc);
+		if (ret)
+			return ret;
+		usleep_range(200, 300);
+		rpcif_rzg2l_timing_adjust_sdr(rpc);
+	}
+
 	/*
 	 * NOTE: The 0x260 are undocumented bits, but they must be set.
 	 *	 RPCIF_PHYCNT_STRTIM is strobe timing adjustment bits,
@@ -264,8 +298,15 @@ void rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
 	 *	 On H3 ES1.x, the value should be 0, while on others,
 	 *	 the value should be 7.
 	 */
-	regmap_write(rpc->regmap, RPCIF_PHYCNT, RPCIF_PHYCNT_STRTIM(7) |
-		     RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260);
+	if (rpc->type == RPCIF_RCAR_GEN3) {
+		regmap_write(rpc->regmap, RPCIF_PHYCNT, RPCIF_PHYCNT_STRTIM(7) |
+			     RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260);
+	} else {
+		regmap_read(rpc->regmap, RPCIF_PHYCNT, &dummy);
+		dummy &= ~RPCIF_PHYCNT_PHYMEM_MASK;
+		dummy |= RPCIF_PHYCNT_PHYMEM(hyperflash ? 3 : 0) | 0x260;
+		regmap_write(rpc->regmap, RPCIF_PHYCNT, dummy);
+	}
 
 	/*
 	 * NOTE: The 0x1511144 are undocumented bits, but they must be set
@@ -282,9 +323,17 @@ void rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
 		regmap_update_bits(rpc->regmap, RPCIF_PHYINT,
 				   RPCIF_PHYINT_WPVAL, 0);
 
-	regmap_write(rpc->regmap, RPCIF_CMNCR, RPCIF_CMNCR_SFDE |
-		     RPCIF_CMNCR_MOIIO_HIZ | RPCIF_CMNCR_IOFV_HIZ |
-		     RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
+	if (rpc->type == RPCIF_RCAR_GEN3)
+		regmap_write(rpc->regmap, RPCIF_CMNCR, RPCIF_CMNCR_SFDE |
+			     RPCIF_CMNCR_MOIIO_HIZ | RPCIF_CMNCR_IOFV_HIZ |
+			     RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
+	else
+		regmap_write(rpc->regmap, RPCIF_CMNCR, RPCIF_CMNCR_SFDE |
+			     RPCIF_CMNCR_MOIIO3(1) | RPCIF_CMNCR_MOIIO2(1) |
+			     RPCIF_CMNCR_MOIIO1(1) | RPCIF_CMNCR_MOIIO0(1) |
+			     RPCIF_CMNCR_IO3FV(2) | RPCIF_CMNCR_IO2FV(2) |
+			     RPCIF_CMNCR_IO0FV(2) | RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
+
 	/* Set RCF after BSZ update */
 	regmap_write(rpc->regmap, RPCIF_DRCR, RPCIF_DRCR_RCF);
 	/* Dummy read according to spec */
@@ -295,6 +344,8 @@ void rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
 	pm_runtime_put(rpc->dev);
 
 	rpc->bus_size = hyperflash ? 2 : 1;
+
+	return 0;
 }
 EXPORT_SYMBOL(rpcif_hw_init);
 
@@ -657,7 +708,8 @@ static int rpcif_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id rpcif_of_match[] = {
-	{ .compatible = "renesas,rcar-gen3-rpc-if", },
+	{ .compatible = "renesas,rcar-gen3-rpc-if", .data = (void *)RPCIF_RCAR_GEN3 },
+	{ .compatible = "renesas,rzg2l-rpc-if", .data = (void *)RPCIF_RZ_G2L },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rpcif_of_match);
diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index 367b0d72bf62..40bca89268c3 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -132,7 +132,9 @@ static int rpcif_hb_probe(struct platform_device *pdev)
 
 	rpcif_enable_rpm(&hyperbus->rpc);
 
-	rpcif_hw_init(&hyperbus->rpc, true);
+	error = rpcif_hw_init(&hyperbus->rpc, true);
+	if (error)
+		return error;
 
 	hyperbus->hbdev.map.size = hyperbus->rpc.size;
 	hyperbus->hbdev.map.virt = hyperbus->rpc.dirmap;
diff --git a/drivers/spi/spi-rpc-if.c b/drivers/spi/spi-rpc-if.c
index 83796a4ead34..fe82f3575df4 100644
--- a/drivers/spi/spi-rpc-if.c
+++ b/drivers/spi/spi-rpc-if.c
@@ -156,7 +156,9 @@ static int rpcif_spi_probe(struct platform_device *pdev)
 	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_TX_QUAD | SPI_RX_QUAD;
 	ctlr->flags = SPI_CONTROLLER_HALF_DUPLEX;
 
-	rpcif_hw_init(rpc, false);
+	error = rpcif_hw_init(rpc, false);
+	if (error)
+		return error;
 
 	error = spi_register_controller(ctlr);
 	if (error) {
diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
index 77c694a19149..7c93f5177532 100644
--- a/include/memory/renesas-rpc-if.h
+++ b/include/memory/renesas-rpc-if.h
@@ -57,6 +57,11 @@ struct rpcif_op {
 	} data;
 };
 
+enum rpcif_type {
+	RPCIF_RCAR_GEN3,
+	RPCIF_RZ_G2L,
+};
+
 struct rpcif {
 	struct device *dev;
 	void __iomem *base;
@@ -64,6 +69,7 @@ struct rpcif {
 	struct regmap *regmap;
 	struct reset_control *rstc;
 	size_t size;
+	enum rpcif_type type;
 	enum rpcif_data_dir dir;
 	u8 bus_size;
 	void *buffer;
@@ -78,7 +84,7 @@ struct rpcif {
 };
 
 int rpcif_sw_init(struct rpcif *rpc, struct device *dev);
-void rpcif_hw_init(struct rpcif *rpc, bool hyperflash);
+int rpcif_hw_init(struct rpcif *rpc, bool hyperflash);
 void rpcif_prepare(struct rpcif *rpc, const struct rpcif_op *op, u64 *offs,
 		   size_t *len);
 int rpcif_manual_xfer(struct rpcif *rpc);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
