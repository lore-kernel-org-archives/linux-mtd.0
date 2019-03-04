Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EC8C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:14:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3632B20823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e7fC2RqD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="enYVngaq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3632B20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6Mp6Tk8cI6FdEb7hgL6iHvksy8Sg968hbBe6UYD424=; b=e7fC2RqDwMdMob
	dLhn+Pnmdjj06eT0HEttX65F8l1rUcbSzg/y0a/Ib+Lff0pOZiW6fA4fbjPnClM4OF9ScuorrM0wi
	FzwEkiS939ami6iLH2TgruTgcLefR0yqSbp8hi8JgJmiKJjwhtCVcVhTdU/gmoyW47JdAaKOH1NCM
	beZ8nTeIb/SKPjOb9D8abJ59iK8onlZyDQ8Ks3x43qDU0dU5ukany5xe9w1Feco4JUL3b93Eyk0XR
	VQlfwU8zuHm9B3IkZjKpGulwT6NNLDYpIECpu2ezRW5EUZtva6klqfGJ6IpgbTGS9Z0sE1DfidnAl
	L4oZmQpKL2+pbxDG/CsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wn9-0003bd-7E; Mon, 04 Mar 2019 23:14:39 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wjd-0007DE-TL; Mon, 04 Mar 2019 23:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v8b6RNrWLqs3oqobRUSVUPPk+rpmDiFglsM3j3SWwFg=; b=enYVngaq5XG723FVBzmwvaXgI4
 cV5qCXTl55nDlpjpUVKY0tXdVZDlX8DplpdgUViKj9hDpuQfIog9PVA7RzqACKh9ilFLe6HgUU8/I
 SAUru4FynL38iGShPXyKc0LffdwNgK6plctMhjt2lNKCy0H5jNi3L94IMkXlb2sYCzOPmeXmepIfV
 cH57+mkd7MZLQTOnykXq0mdRqE/SHO1kVZd4RlEgqmBZ6Ub2rsf7BHEqAr0ks+VYtpuJeDK38SPSo
 VqxahZd+NGy7GHKeT7Rq8QRWkxaw3AjWfg+4AB0Mee0+UEAVRRgGUIJ0KcVmQVW2cix15MmzhcaNI
 10qHAktA==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w6e-000185-9u; Mon, 04 Mar 2019 22:30:45 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id BB06B240008;
 Mon,  4 Mar 2019 22:30:17 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 17/36] mtd: rawnand: Get rid of chip->ecc.priv
Date: Mon,  4 Mar 2019 23:28:22 +0100
Message-Id: <20190304222841.13899-18-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_173044_624730_E2208A6B 
X-CRM114-Status: GOOD (  18.04  )
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
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

nand_ecc_ctrl embeds a private pointer which had only a meaning in the
sunxi driver. This structure will soon be deprecated, but as this
field is actually not needed, let's just drop it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 30 +++++++++++++++---------------
 include/linux/mtd/rawnand.h       |  2 --
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index bff30a42f270..b30f5a31e8a0 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -199,6 +199,7 @@ struct sunxi_nand_hw_ecc {
 struct sunxi_nand_chip {
 	struct list_head node;
 	struct nand_chip nand;
+	struct sunxi_nand_hw_ecc *ecc;
 	unsigned long clk_rate;
 	u32 timing_cfg;
 	u32 timing_ctl;
@@ -230,6 +231,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *			this NAND controller
  * @complete:		a completion object used to wait for NAND
  *			controller events
+ * @ecc:		ECC controller structure
  */
 struct sunxi_nfc {
 	struct nand_controller controller;
@@ -773,15 +775,15 @@ static void sunxi_nfc_randomizer_read_buf(struct mtd_info *mtd, uint8_t *buf,
 static void sunxi_nfc_hw_ecc_enable(struct mtd_info *mtd)
 {
 	struct nand_chip *nand = mtd_to_nand(mtd);
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
@@ -1671,9 +1673,9 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 	.free = sunxi_nand_ooblayout_free,
 };
 
-static void sunxi_nand_hw_ecc_ctrl_cleanup(struct nand_ecc_ctrl *ecc)
+static void sunxi_nand_hw_ecc_ctrl_cleanup(struct sunxi_nand_chip *sunxi_nand)
 {
-	kfree(ecc->priv);
+	kfree(sunxi_nand->ecc);
 }
 
 static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
@@ -1685,7 +1687,6 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
-	struct sunxi_nand_hw_ecc *data;
 	int nsectors;
 	int ret;
 	int i;
@@ -1722,8 +1723,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
 	if (ecc->size != 512 && ecc->size != 1024)
 		return -EINVAL;
 
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data)
+	sunxi_nand->ecc = kzalloc(sizeof(*sunxi_nand->ecc), GFP_KERNEL);
+	if (!sunxi_nand->ecc)
 		return -ENOMEM;
 
 	/* Prefer 1k ECC chunk over 512 ones */
@@ -1750,7 +1751,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
 		goto err;
 	}
 
-	data->mode = i;
+	sunxi_nand->ecc->mode = i;
 
 	/* HW ECC always request ECC bytes for 1024 bytes blocks */
 	ecc->bytes = DIV_ROUND_UP(ecc->strength * fls(8 * 1024), 8);
@@ -1768,7 +1769,6 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
 	ecc->read_oob = sunxi_nfc_hw_ecc_read_oob;
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
-	ecc->priv = data;
 
 	if (nfc->dmac) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
@@ -1789,16 +1789,16 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
 	return 0;
 
 err:
-	kfree(data);
+	kfree(sunxi_nand->ecc);
 
 	return ret;
 }
 
-static void sunxi_nand_ecc_cleanup(struct nand_ecc_ctrl *ecc)
+static void sunxi_nand_ecc_cleanup(struct sunxi_nand_chip *sunxi_nand)
 {
-	switch (ecc->mode) {
+	switch (sunxi_nand->ecc->mode) {
 	case NAND_ECC_HW:
-		sunxi_nand_hw_ecc_ctrl_cleanup(ecc);
+		sunxi_nand_hw_ecc_ctrl_cleanup(sunxi_nand);
 		break;
 	case NAND_ECC_NONE:
 	default:
@@ -1980,7 +1980,7 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 		chip = list_first_entry(&nfc->chips, struct sunxi_nand_chip,
 					node);
 		nand_release(&chip->nand);
-		sunxi_nand_ecc_cleanup(&chip->nand.ecc);
+		sunxi_nand_ecc_cleanup(chip);
 		list_del(&chip->node);
 	}
 }
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 72d4672b424b..b0c6e1ac3989 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -279,7 +279,6 @@ static const struct nand_ecc_caps __name = {			\
  * @prepad:	padding information for syndrome based ECC generators
  * @postpad:	padding information for syndrome based ECC generators
  * @options:	ECC specific options (see NAND_ECC_XXX flags defined above)
- * @priv:	pointer to private ECC control data
  * @calc_buf:	buffer for calculated ECC, size is oobsize.
  * @code_buf:	buffer for ECC read from flash, size is oobsize.
  * @hwctl:	function to control hardware ECC generator. Must only
@@ -331,7 +330,6 @@ struct nand_ecc_ctrl {
 	int prepad;
 	int postpad;
 	unsigned int options;
-	void *priv;
 	u8 *calc_buf;
 	u8 *code_buf;
 	void (*hwctl)(struct nand_chip *chip, int mode);
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
