Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE5FC282DE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 07:59:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7281720883
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 07:59:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XDtJf4j9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KpnfZEYw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7281720883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bi4Ld43nD0gvICEJ2CjKS5dD6PaBk/7mhrzDHue9GUo=; b=XDtJf4j9DTsLn8
	CWyFJcI3cloIt5dDUVnjTiz3yFrbnXWaPDZWPALMehAcyc9PPKHa25wSwcDh1XSpi4xapJnm2tMrR
	ujsmdMwAMZa4f5v3+Dt5qwYvaAA9a96z8aEXWIlIf8HO3P8MtJgcIja10BhEmdrUUG1PH6LEOP+Jg
	HF78AfsVQsLhyD0csCjT9vegCx2w/epkygRFW+kZ7V7x0mRl2Lrp5tIDdpsedFRF455n2A/SYJoR8
	a1WLmvc/Md+UD9X3q0xS9WgWZq0k6HQ2PwgT43t76tj23tXsS0tqxhXFCpirJFQqqsKeTARZa4r3M
	xUUbNOyhcVOyBCiuIR3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDPBz-0004HR-GG; Mon, 08 Apr 2019 07:59:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDPBU-0003L7-DJ; Mon, 08 Apr 2019 07:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=amOREe5gdkHMJgISir4qBvfLKymyMuba861Qy99HMVw=; b=KpnfZEYw15zRb+tVlaU/U69Lip
 j3GxsDJ+dyKwh5rWUc9QBM558BmkMWUb1J+5VzSXWi6QXQFrcDd94N2/3l+GVTn1fWt/oFvmasG1i
 gKM11HmKcf7268l8bl9yvbYlsh1D+3pTdGnz4k8F2iXd6jxGS5mAoj1O65VfIgDYwxrtQ/9HExyv0
 /Kty6RSmDbKpdS9aYTLgmgJIVW9m9zu740VygbJfHPcXTZZNYhYayxRANFcNqNvtm9W//SmqCHuzb
 7c3qOkDtI6mRUwrsNYCN4WJEwCkujQfzYxMSiIHXDrEaqzOMo24TN4RP1MucML6C+6w1RpqkMm4LK
 iR7CWVsA==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDOv2-00009X-2K; Mon, 08 Apr 2019 07:42:19 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost.localdomain
 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr [90.88.30.125])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 59B2E1C000F;
 Mon,  8 Apr 2019 07:41:53 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v2 2/4] mtd: rawnand: sunxi: Add a platform data structure
Date: Mon,  8 Apr 2019 09:41:45 +0200
Message-Id: <20190408074147.26797-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190408074147.26797-1-miquel.raynal@bootlin.com>
References: <20190408074147.26797-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_084216_151073_491B5B5F 
X-CRM114-Status: GOOD (  18.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Before the introduction of A33 NAND DMA support, let's use a platform
data structure for parameters that will differ. Right now, there is
only one compatible with one data structure.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v2:
* New patch: splitting the introduction of the A33 NAND DMA support:
  first let's introduce the platform data ("capabilities")
  structure. Then, in a second time, A33 NAND DMA support will be
  introduced.

 drivers/mtd/nand/raw/sunxi_nand.c | 37 ++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4282bc477761..7b824c245083 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -42,7 +42,7 @@
 #define NFC_REG_CMD		0x0024
 #define NFC_REG_RCMD_SET	0x0028
 #define NFC_REG_WCMD_SET	0x002C
-#define NFC_REG_IO_DATA		0x0030
+#define NFC_REG_A10_IO_DATA	0x0030
 #define NFC_REG_ECC_CTL		0x0034
 #define NFC_REG_ECC_ST		0x0038
 #define NFC_REG_DEBUG		0x003C
@@ -200,6 +200,18 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
 	return container_of(nand, struct sunxi_nand_chip, nand);
 }
 
+/*
+ * NAND Controller capabilities structure: stores NAND controller capabilities
+ * for distinction between compatible strings.
+ *
+ * @reg_io_data:	I/O data register
+ * @dma_maxburst:	DMA maxburst
+ */
+struct sunxi_nfc_caps {
+	unsigned int reg_io_data;
+	unsigned int dma_maxburst;
+};
+
 /**
  * struct sunxi_nfc - stores sunxi NAND controller information
  *
@@ -228,6 +240,7 @@ struct sunxi_nfc {
 	struct list_head chips;
 	struct completion complete;
 	struct dma_chan *dmac;
+	const struct sunxi_nfc_caps *caps;
 };
 
 static inline struct sunxi_nfc *to_sunxi_nfc(struct nand_controller *ctrl)
@@ -2088,6 +2101,12 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 		goto out_mod_clk_unprepare;
 	}
 
+	nfc->caps = of_device_get_match_data(&pdev->dev);
+	if (!nfc->caps) {
+		ret = -EINVAL;
+		goto out_ahb_reset_reassert;
+	}
+
 	ret = sunxi_nfc_rst(nfc);
 	if (ret)
 		goto out_ahb_reset_reassert;
@@ -2102,12 +2121,12 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	if (nfc->dmac) {
 		struct dma_slave_config dmac_cfg = { };
 
-		dmac_cfg.src_addr = r->start + NFC_REG_IO_DATA;
+		dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data;
 		dmac_cfg.dst_addr = dmac_cfg.src_addr;
 		dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width;
-		dmac_cfg.src_maxburst = 4;
-		dmac_cfg.dst_maxburst = 4;
+		dmac_cfg.src_maxburst = nfc->caps->dma_maxburst;
+		dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst;
 		dmaengine_slave_config(nfc->dmac, &dmac_cfg);
 	} else {
 		dev_warn(dev, "failed to request rxtx DMA channel\n");
@@ -2152,8 +2171,16 @@ static int sunxi_nfc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
+	.reg_io_data = NFC_REG_A10_IO_DATA,
+	.dma_maxburst = 4,
+};
+
 static const struct of_device_id sunxi_nfc_ids[] = {
-	{ .compatible = "allwinner,sun4i-a10-nand" },
+	{
+		.compatible = "allwinner,sun4i-a10-nand",
+		.data = &sunxi_nfc_a10_caps,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_nfc_ids);
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
