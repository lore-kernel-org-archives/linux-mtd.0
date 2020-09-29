Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5422FC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9056C20897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pbwh687f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9056C20897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tEXbkO48zs4UOX/iP3u5GdASzGA+SNJVNFRo2FS9N3M=; b=pbwh687fbi6zbqsY8qVKBRVV+
	5ChZwrS1ogoYWBqrZjqZ4DpGTznypwbzkPYmsyWg8MAPstR4puLrYHfQA5aC/xmXEyN0HUxOl7iZX
	y0WcRREx7FtgNBfImwBUQ30fUxkd+7MhbN001bzgk6w+yfKRHyr/YmXJWjbnEmexJeX159xnm2/QA
	usjrrTCdYaLSa/G27eZe/70bOIST718eqznrIFjvIlfS7GC8JsV4k2jTpHcOUp2oEZzAFU6hF/thR
	+ojYMRuRfhOo/OUGAM/qgn12ZvMSe3wCaW6CJXs0cV5LStq3C48pUFR6Bcz5Tu76lMlghWBOGcvL7
	GBcuEjZDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOdX-0001QT-OD; Tue, 29 Sep 2020 23:02:19 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcu-0001Dz-QY
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:42 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 237D8200011;
 Tue, 29 Sep 2020 23:01:38 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/20] mtd: rawnand: Get rid of chip->ecc.priv
Date: Wed, 30 Sep 2020 01:01:14 +0200
Message-Id: <20200929230124.31491-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190141_103341_5819A515 
X-CRM114-Status: GOOD (  18.61  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

nand_ecc_ctrl embeds a private pointer which only has a meaning in the
sunxi driver. This structure will soon be deprecated, but as this
field is actually not needed, let's just drop it.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++--------------
 include/linux/mtd/rawnand.h       |  2 --
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 2a7ca3072f35..540529540ade 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -182,6 +182,7 @@ struct sunxi_nand_hw_ecc {
  *
  * @node: used to store NAND chips into a list
  * @nand: base NAND chip structure
+ * @ecc: ECC controller structure
  * @clk_rate: clk_rate required for this NAND chip
  * @timing_cfg: TIMING_CFG register value for this NAND chip
  * @timing_ctl: TIMING_CTL register value for this NAND chip
@@ -191,6 +192,7 @@ struct sunxi_nand_hw_ecc {
 struct sunxi_nand_chip {
 	struct list_head node;
 	struct nand_chip nand;
+	struct sunxi_nand_hw_ecc *ecc;
 	unsigned long clk_rate;
 	u32 timing_cfg;
 	u32 timing_ctl;
@@ -676,15 +678,15 @@ static void sunxi_nfc_randomizer_read_buf(struct nand_chip *nand, uint8_t *buf,
 
 static void sunxi_nfc_hw_ecc_enable(struct nand_chip *nand)
 {
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_hw_ecc *data = nand->ecc.priv;
 	u32 ecc_ctl;
 
 	ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL);
 	ecc_ctl &= ~(NFC_ECC_MODE_MSK | NFC_ECC_PIPELINE |
 		     NFC_ECC_BLOCK_SIZE_MSK);
-	ecc_ctl |= NFC_ECC_EN | NFC_ECC_MODE(data->mode) | NFC_ECC_EXCEPTION |
-		   NFC_ECC_PIPELINE;
+	ecc_ctl |= NFC_ECC_EN | NFC_ECC_MODE(sunxi_nand->ecc->mode) |
+		   NFC_ECC_EXCEPTION | NFC_ECC_PIPELINE;
 
 	if (nand->ecc.size == 512)
 		ecc_ctl |= NFC_ECC_BLOCK_512;
@@ -1597,9 +1599,9 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 	.free = sunxi_nand_ooblayout_free,
 };
 
-static void sunxi_nand_hw_ecc_ctrl_cleanup(struct nand_ecc_ctrl *ecc)
+static void sunxi_nand_hw_ecc_ctrl_cleanup(struct sunxi_nand_chip *sunxi_nand)
 {
-	kfree(ecc->priv);
+	kfree(sunxi_nand->ecc);
 }
 
 static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
@@ -1607,10 +1609,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				       struct device_node *np)
 {
 	static const u8 strengths[] = { 16, 24, 28, 32, 40, 48, 56, 60, 64 };
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_device *nanddev = mtd_to_nanddev(mtd);
-	struct sunxi_nand_hw_ecc *data;
 	int nsectors;
 	int ret;
 	int i;
@@ -1647,8 +1649,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (ecc->size != 512 && ecc->size != 1024)
 		return -EINVAL;
 
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data)
+	sunxi_nand->ecc = kzalloc(sizeof(*sunxi_nand->ecc), GFP_KERNEL);
+	if (!sunxi_nand->ecc)
 		return -ENOMEM;
 
 	/* Prefer 1k ECC chunk over 512 ones */
@@ -1675,7 +1677,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		goto err;
 	}
 
-	data->mode = i;
+	sunxi_nand->ecc->mode = i;
 
 	/* HW ECC always request ECC bytes for 1024 bytes blocks */
 	ecc->bytes = DIV_ROUND_UP(ecc->strength * fls(8 * 1024), 8);
@@ -1693,7 +1695,6 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->read_oob = sunxi_nfc_hw_ecc_read_oob;
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
-	ecc->priv = data;
 
 	if (nfc->dmac) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
@@ -1714,16 +1715,18 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	return 0;
 
 err:
-	kfree(data);
+	kfree(sunxi_nand->ecc);
 
 	return ret;
 }
 
-static void sunxi_nand_ecc_cleanup(struct nand_ecc_ctrl *ecc)
+static void sunxi_nand_ecc_cleanup(struct sunxi_nand_chip *sunxi_nand)
 {
+	struct nand_ecc_ctrl *ecc = &sunxi_nand->nand.ecc;
+
 	switch (ecc->engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
-		sunxi_nand_hw_ecc_ctrl_cleanup(ecc);
+		sunxi_nand_hw_ecc_ctrl_cleanup(sunxi_nand);
 		break;
 	case NAND_ECC_ENGINE_TYPE_NONE:
 	default:
@@ -2053,7 +2056,7 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
 		nand_cleanup(chip);
-		sunxi_nand_ecc_cleanup(&chip->ecc);
+		sunxi_nand_ecc_cleanup(sunxi_nand);
 		list_del(&sunxi_nand->node);
 	}
 }
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 23623beaad1d..15743c2c2cab 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -302,7 +302,6 @@ static const struct nand_ecc_caps __name = {			\
  * @prepad:	padding information for syndrome based ECC generators
  * @postpad:	padding information for syndrome based ECC generators
  * @options:	ECC specific options (see NAND_ECC_XXX flags defined above)
- * @priv:	pointer to private ECC control data
  * @calc_buf:	buffer for calculated ECC, size is oobsize.
  * @code_buf:	buffer for ECC read from flash, size is oobsize.
  * @hwctl:	function to control hardware ECC generator. Must only
@@ -355,7 +354,6 @@ struct nand_ecc_ctrl {
 	int prepad;
 	int postpad;
 	unsigned int options;
-	void *priv;
 	u8 *calc_buf;
 	u8 *code_buf;
 	void (*hwctl)(struct nand_chip *chip, int mode);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
