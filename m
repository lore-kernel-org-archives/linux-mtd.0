Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99A9C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:33:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 973CB20823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:33:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hIeZCFW/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eW+IFEYo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 973CB20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOzbJ2FIJXsHBwXPCNsvav5ihT0LgMiv91kOZdSAQyU=; b=hIeZCFW/t3aWNN
	XupXsrnA/KeGAp8aJazj/5S17AKjYgc9IvFULhMFCxrRvvG3PwZcEfoKTQKrDw6jf4MP+UZ1fHEsj
	jfVJpxMANiCIoEQsv/P6toHzRty3LTJgyL+BORrDp5IesgeqSnJa94ivWuYKufW6mz0Ds3f/UzGtL
	AWSU8YtDw4TN2adqoNztQYy9J3gJOjuqwz/Me77qjMcH9aXyJlmI7TIGePAa0LKx68whLg61ivq2P
	4zYq40V4vUnrn5nYItM34+p4G+/JsQ2IQ0eFq/eLENY0O+Z1vizcPrkr4Aqxrs4mmCymMJD33zqv+
	dwy7ARjmmLK4Bk2M3eew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0uGf-00062C-8A; Mon, 04 Mar 2019 20:32:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0uGY-0005ee-2S; Mon, 04 Mar 2019 20:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hB1aHHumn/Sq5ZAq6XBHyK4nBsrBaHDoza1rJi2Mj84=; b=eW+IFEYosPw8r0ZFxywXbOkrTZ
 N/vx7h6wjNLAW3YNV9q44yGXAg0pxEWSJsH+Fbp/w+mqd88/vZzQUN6zRv1XirW7Rswy38BfmCc86
 sg8ND+rCtf7Esy/Ds7aGstEPKhmOPOKTTEVZTS9RfNz+W2AlyuIdecBAWhcebGscRXkXFJgTYwcqL
 ZxCg990+lBTv9Z9Q3T6TQ28VbramguFmQZD/HSXtF61l6Bx35DLpPbZkgalGynA7WToIqXGqmNg0Q
 24WhwPGGoeFmcrexc6TpSrphtAIUtHnkTfcsTjwLbBjFl5q7Gv4jdLe8DJjfsKC3Nz2aK2uhtzo45
 tNJVkUPw==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u1u-0006Vv-Oh; Mon, 04 Mar 2019 20:17:45 +0000
Received: from localhost.localdomain (26.43.136.77.rev.sfr.net [77.136.43.26])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8D9C024000B;
 Mon,  4 Mar 2019 20:17:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 14/15] mtd: rawnand: Get rid of chip->numchips
Date: Mon,  4 Mar 2019 21:15:21 +0100
Message-Id: <20190304201522.11323-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304201522.11323-1-miquel.raynal@bootlin.com>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_201742_850462_5E08D76C 
X-CRM114-Status: GOOD (  30.25  )
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
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

The same information is provided by nanddev_ntargets().

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/raw/diskonchip.c    |  2 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c |  2 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c  |  2 +-
 drivers/mtd/nand/raw/hisi504_nand.c  |  2 +-
 drivers/mtd/nand/raw/internals.h     |  2 +-
 drivers/mtd/nand/raw/jz4740_nand.c   |  1 -
 drivers/mtd/nand/raw/nand_base.c     | 15 ++++-----------
 drivers/mtd/nand/raw/nand_bbt.c      | 16 ++++++++--------
 include/linux/mtd/rawnand.h          |  7 +++----
 9 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index e9767e06415d..3cee832716ec 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1291,7 +1291,7 @@ static int __init inftl_scan_bbt(struct mtd_info *mtd)
 	struct doc_priv *doc = nand_get_controller_data(this);
 	struct mtd_partition parts[5];
 
-	if (this->numchips > doc->chips_per_floor) {
+	if (nanddev_ntargets(&this->base) > doc->chips_per_floor) {
 		pr_err("Multi-floor INFTL devices not yet supported.\n");
 		return -EIO;
 	}
diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
index 1d960a6cd691..293a5b71833a 100644
--- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
@@ -653,7 +653,7 @@ static int fsl_elbc_attach_chip(struct nand_chip *chip)
 	priv->fmr |= al << FMR_AL_SHIFT;
 
 	dev_dbg(priv->dev, "fsl_elbc_init: nand->numchips = %d\n",
-	        chip->numchips);
+	        nanddev_ntargets(&chip->base));
 	dev_dbg(priv->dev, "fsl_elbc_init: nand->chipsize = %lld\n",
 	        nanddev_target_size(&chip->base));
 	dev_dbg(priv->dev, "fsl_elbc_init: nand->pagemask = %8x\n",
diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index a9e8f89aeebd..04a3dcd675bf 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -722,7 +722,7 @@ static int fsl_ifc_attach_chip(struct nand_chip *chip)
 	struct fsl_ifc_mtd *priv = nand_get_controller_data(chip);
 
 	dev_dbg(priv->dev, "%s: nand->numchips = %d\n", __func__,
-							chip->numchips);
+		nanddev_ntargets(&chip->base));
 	dev_dbg(priv->dev, "%s: nand->chipsize = %lld\n", __func__,
 	        nanddev_target_size(&chip->base));
 	dev_dbg(priv->dev, "%s: nand->pagemask = %8x\n", __func__,
diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index f3f9aa160cff..e4526fff9da4 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -849,7 +849,7 @@ static int hisi_nfc_resume(struct device *dev)
 	struct hinfc_host *host = dev_get_drvdata(dev);
 	struct nand_chip *chip = &host->chip;
 
-	for (cs = 0; cs < chip->numchips; cs++)
+	for (cs = 0; cs < nanddev_ntargets(&chip->base); cs++)
 		hisi_nfc_send_cmd_reset(host, cs);
 	hinfc_write(host, SET_HINFC504_PWIDTH(HINFC504_W_LATCH,
 		    HINFC504_R_LATCH, HINFC504_RW_LATCH), HINFC504_PWIDTH);
diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index fbf6ca015cd7..a204f9d7e123 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -110,7 +110,7 @@ static inline int nand_exec_op(struct nand_chip *chip,
 	if (!nand_has_exec_op(chip))
 		return -ENOTSUPP;
 
-	if (WARN_ON(op->cs >= chip->numchips))
+	if (WARN_ON(op->cs >= nanddev_ntargets(&chip->base)))
 		return -EINVAL;
 
 	return chip->controller->ops->exec_op(chip, op, false);
diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
index 06690b3603b1..c992a664bdee 100644
--- a/drivers/mtd/nand/raw/jz4740_nand.c
+++ b/drivers/mtd/nand/raw/jz4740_nand.c
@@ -354,7 +354,6 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
 		}
 
 		/* Update size of the MTD. */
-		chip->numchips++;
 		memorg->ntargets++;
 		mtd->size += nanddev_target_size(&chip->base);
 	}
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 427c80abef3f..ce01824dcc62 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -240,10 +240,10 @@ static int check_offs_len(struct nand_chip *chip, loff_t ofs, uint64_t len)
 void nand_select_target(struct nand_chip *chip, unsigned int cs)
 {
 	/*
-	 * cs should always lie between 0 and chip->numchips, when that's not
-	 * the case it's a bug and the caller should be fixed.
+	 * cs should always lie between 0 and nanddev_ntargets(), when that's
+	 * not the case it's a bug and the caller should be fixed.
 	 */
-	if (WARN_ON(cs > chip->numchips))
+	if (WARN_ON(cs > nanddev_ntargets(&chip->base)))
 		return;
 
 	chip->cur_cs = cs;
@@ -5042,12 +5042,6 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	if (!mtd->name && mtd->dev.parent)
 		mtd->name = dev_name(mtd->dev.parent);
 
-	/*
-	 * Start with chips->numchips = maxchips to let nand_select_target() do
-	 * its job. chip->numchips will be adjusted after.
-	 */
-	chip->numchips = maxchips;
-
 	/* Set the default functions */
 	nand_set_defaults(chip);
 
@@ -5091,7 +5085,6 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 
 	/* Store the number of chips and calc total size for mtd */
 	memorg->ntargets = i;
-	chip->numchips = i;
 	mtd->size = i * nanddev_target_size(&chip->base);
 
 	return 0;
@@ -5833,7 +5826,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 		goto err_nanddev_cleanup;
 
 	/* Enter fastest possible mode on all dies. */
-	for (i = 0; i < chip->numchips; i++) {
+	for (i = 0; i < nanddev_ntargets(&chip->base); i++) {
 		ret = nand_setup_data_interface(chip, i);
 		if (ret)
 			goto err_nanddev_cleanup;
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index e3308857b2ee..303408039650 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -269,7 +269,7 @@ static int read_abs_bbt(struct nand_chip *this, uint8_t *buf,
 
 	if (td->options & NAND_BBT_PERCHIP) {
 		int offs = 0;
-		for (i = 0; i < this->numchips; i++) {
+		for (i = 0; i < nanddev_ntargets(&this->base); i++) {
 			if (chip == -1 || chip == i)
 				res = read_bbt(this, buf, td->pages[i],
 					targetsize >> this->bbt_erase_shift,
@@ -478,9 +478,9 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
 		startblock = 0;
 		from = 0;
 	} else {
-		if (chip >= this->numchips) {
+		if (chip >= nanddev_ntargets(&this->base)) {
 			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
-			       chip + 1, this->numchips);
+			        chip + 1, nanddev_ntargets(&this->base));
 			return -EINVAL;
 		}
 		numblocks = targetsize >> this->bbt_erase_shift;
@@ -550,7 +550,7 @@ static int search_bbt(struct nand_chip *this, uint8_t *buf,
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		chips = this->numchips;
+		chips = nanddev_ntargets(&this->base);
 		bbtblocks = targetsize >> this->bbt_erase_shift;
 		startblock &= bbtblocks - 1;
 	} else {
@@ -643,7 +643,7 @@ static int get_bbt_block(struct nand_chip *this, struct nand_bbt_descr *td,
 
 	numblocks = (int)(targetsize >> this->bbt_erase_shift);
 	if (!(td->options & NAND_BBT_PERCHIP))
-		numblocks *= this->numchips;
+		numblocks *= nanddev_ntargets(&this->base);
 
 	/*
 	 * Automatic placement of the bad block table. Search direction
@@ -745,7 +745,7 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 		numblocks = (int)(targetsize >> this->bbt_erase_shift);
 		/* Full device write or specific chip? */
 		if (chipsel == -1) {
-			nrchips = this->numchips;
+			nrchips = nanddev_ntargets(&this->base);
 		} else {
 			nrchips = chipsel + 1;
 			chip = chipsel;
@@ -932,7 +932,7 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP)
-		chips = this->numchips;
+		chips = nanddev_ntargets(&this->base);
 	else
 		chips = 1;
 
@@ -1111,7 +1111,7 @@ static void mark_bbt_region(struct nand_chip *this, struct nand_bbt_descr *td)
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		chips = this->numchips;
+		chips = nanddev_ntargets(&this->base);
 		nrblocks = (int)(targetsize >> this->bbt_erase_shift);
 	} else {
 		chips = 1;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index a127eb773b1a..e5a25ba75211 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1014,7 +1014,6 @@ struct nand_legacy {
  *			      set to the actually used ONFI mode if the chip is
  *			      ONFI compliant or deduced from the datasheet if
  *			      the NAND chip is not ONFI compliant.
- * @numchips:		[INTERN] number of physical chips
  * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
  * @data_buf:		[INTERN] buffer for data, size is (page size + oobsize).
  * @pagecache:		Structure containing page cache related fields
@@ -1028,8 +1027,9 @@ struct nand_legacy {
  * @data_interface:	[INTERN] NAND interface timing information
  * @cur_cs:		currently selected target. -1 means no target selected,
  *			otherwise we should always have cur_cs >= 0 &&
- *			cur_cs < numchips. NAND Controller drivers should not
- *			modify this value, but they're allowed to read it.
+ *			cur_cs < nanddev_ntargets(). NAND Controller drivers
+ *			should not modify this value, but they're allowed to
+ *			read it.
  * @read_retries:	[INTERN] the number of read retry modes supported
  * @bbt:		[INTERN] bad block table pointer
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
@@ -1060,7 +1060,6 @@ struct nand_chip {
 	int phys_erase_shift;
 	int bbt_erase_shift;
 	int chip_shift;
-	int numchips;
 	int pagemask;
 	u8 *data_buf;
 
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
