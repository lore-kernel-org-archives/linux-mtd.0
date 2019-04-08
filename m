Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF16FC282CE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 07:43:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C82A20880
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 07:43:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HPSDFvNc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C82A20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GKs9nnoVFJEsb98CwThqJOUBydHl0CHSBLRHlMA64s=; b=HPSDFvNcIjxOFT
	j4QMMAsC1YXCXlu7iHO5T+5tSuhHvQ9qa0rPr663+JdbtVovDKmErYCUU5nNPGVyibZkZ1u25WxjY
	WIIPMxZWBV9lypBIVpgIN01u0V/vPekMTMIHH+YDHdI4DRr6fzYB2A74SDMCtg8BcmZZCX85n1vYb
	cZI2Mdy95nDLurQcezy2FWbuFQcw75zo+ZyYt1ce0/x8d/vCg/zsTBUAGBI8cLNsfNg7sbwFLw8Md
	v109Zd1uFPAmUxbyYEnR0/a1bC6B/Kqe06TyuxwwXquz464hOmxU+FJI5JipwWg45ALE/evWQ3v5M
	M29gUEXSjLu742pU+HNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDOwN-0003aB-3C; Mon, 08 Apr 2019 07:43:39 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDOul-0001PP-Hd; Mon, 08 Apr 2019 07:42:28 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost.localdomain
 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr [90.88.30.125])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AC4C31C0008;
 Mon,  8 Apr 2019 07:41:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v2 3/4] mtd: rawnand: sunxi: Add A33 DMA support
Date: Mon,  8 Apr 2019 09:41:46 +0200
Message-Id: <20190408074147.26797-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190408074147.26797-1-miquel.raynal@bootlin.com>
References: <20190408074147.26797-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_004200_763639_160DF4ED 
X-CRM114-Status: GOOD (  19.67  )
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

Allwinner NAND controllers can make use of DMA to enhance the I/O
throughput thanks to ECC pipelining. DMA handling with A33 NAND IP
is a bit different than with the older SoCs, hence the introduction of
a new compatible to handle:
* the differences between register offsets,
* the burst length change from 4 to minimum 8,
* drive SRAM accesses through the AHB bus instead of the MBUS.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v2:
* Enumerate the SoCs already supported (A10, A10s, A13 and A20)
  instead of using the inaccurate acronym 'A10+'.
* s/p.12 of the user manual/p.12 of the *NFC* user manual/
* s/sun8i/A33/

 drivers/mtd/nand/raw/sunxi_nand.c | 38 +++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7b824c245083..18fa30175d67 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -43,6 +43,7 @@
 #define NFC_REG_RCMD_SET	0x0028
 #define NFC_REG_WCMD_SET	0x002C
 #define NFC_REG_A10_IO_DATA	0x0030
+#define NFC_REG_A33_IO_DATA	0x0300
 #define NFC_REG_ECC_CTL		0x0034
 #define NFC_REG_ECC_ST		0x0038
 #define NFC_REG_DEBUG		0x003C
@@ -204,10 +205,14 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * NAND Controller capabilities structure: stores NAND controller capabilities
  * for distinction between compatible strings.
  *
+ * @sram_through_ahb:	On A33, we choose to access the internal RAM through AHB
+ *                      instead of MBUS (less configuration). A10, A10s, A13 and
+ *                      A20 use the MBUS but no extra configuration is needed.
  * @reg_io_data:	I/O data register
  * @dma_maxburst:	DMA maxburst
  */
 struct sunxi_nfc_caps {
+	bool sram_through_ahb;
 	unsigned int reg_io_data;
 	unsigned int dma_maxburst;
 };
@@ -363,10 +368,29 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 		goto err_unmap_buf;
 	}
 
-	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
-	       nfc->regs + NFC_REG_CTL);
+	/*
+	 * On A33, we suppose the "internal RAM" (p.12 of the NFC user manual)
+	 * refers to the NAND controller's internal SRAM. This memory is mapped
+	 * and so is accessible from the AHB. It seems that it can also be
+	 * accessed by the MBUS. MBUS accesses are mandatory when using the
+	 * internal DMA instead of the external DMA engine.
+	 *
+	 * During DMA I/O operation, either we access this memory from the AHB
+	 * by clearing the NFC_RAM_METHOD bit, or we set the bit and use the
+	 * MBUS. In this case, we should also configure the MBUS DMA length
+	 * NFC_REG_MDMA_CNT(0xC4) to be chunksize * nchunks. NAND I/O over MBUS
+	 * are also limited to 32kiB pages.
+	 */
+	if (nfc->caps->sram_through_ahb)
+		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
+		       nfc->regs + NFC_REG_CTL);
+	else
+		writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
+		       nfc->regs + NFC_REG_CTL);
+
 	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
 	writel(chunksize, nfc->regs + NFC_REG_CNT);
+
 	dmat = dmaengine_submit(dmad);
 
 	ret = dma_submit_error(dmat);
@@ -2176,11 +2200,21 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.dma_maxburst = 4,
 };
 
+static const struct sunxi_nfc_caps sunxi_nfc_a33_caps = {
+	.sram_through_ahb = true,
+	.reg_io_data = NFC_REG_A33_IO_DATA,
+	.dma_maxburst = 8,
+};
+
 static const struct of_device_id sunxi_nfc_ids[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-nand",
 		.data = &sunxi_nfc_a10_caps,
 	},
+	{
+		.compatible = "allwinner,sun8i-a33-nand-controller",
+		.data = &sunxi_nfc_a33_caps,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_nfc_ids);
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
