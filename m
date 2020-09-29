Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97011C4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A62C20897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uR3VK21a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A62C20897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3GqiQlAuC9J9UP+ARztl70j+AdPfnh4dtjK0D+p1fqw=; b=uR3VK21aiwN85DfkypAVgAYMP
	mUZwALc69oDEhnrvWmOR4+FU7Y26CbpxUB61K5VjFcQXFhxyDFQi5qmUYXz4iyDHkqUT++gS9juk4
	Ieh0Vqu+Pb19Fky/u5NbIfGrPZq/vI98JI2NFNOCQq/rvUw7zuDGvC1+Sy3aC38MeplxBu4fuxzCk
	9XX0PVDr3QreWyAH1rDmep4wc8X80iBC8zG22fiUnvfygfpXKUacxJrxzKt/44ZX9JdEoPkxkKVTn
	O7KvvZLJ7Ad4xISAvLVykPjmWOlG2j2JrOWbsATjd7wJbjZIMwNckTiHXD8QXDYLb4LfcgaA3tKQD
	iWogQNeQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOdA-0001JM-RR; Tue, 29 Sep 2020 23:01:56 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcn-0001BP-Vd
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:36 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2EA61200009;
 Tue, 29 Sep 2020 23:01:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private structure
Date: Wed, 30 Sep 2020 01:01:08 +0200
Message-Id: <20200929230124.31491-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190134_225601_78ACA3D9 
X-CRM114-Status: GOOD (  20.21  )
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The NAND BCH control structure has nothing to do outside of this
driver, all users of the nand_bch_init/free() functions just save it
to chip->ecc.priv so do it in this driver directly and return a
regular error code instead.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-bch.c       | 36 ++++++++++++++++-------------
 drivers/mtd/nand/raw/fsmc_nand.c    |  2 +-
 drivers/mtd/nand/raw/nand_base.c    | 12 ++++++----
 drivers/mtd/nand/raw/omap2.c        | 16 ++++++-------
 include/linux/mtd/nand-ecc-sw-bch.h | 11 ++++-----
 5 files changed, 41 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-bch.c b/drivers/mtd/nand/ecc-sw-bch.c
index fe080a0837d8..97221ec3876e 100644
--- a/drivers/mtd/nand/ecc-sw-bch.c
+++ b/drivers/mtd/nand/ecc-sw-bch.c
@@ -90,7 +90,7 @@ EXPORT_SYMBOL(nand_bch_correct_data);
 
 /**
  * nand_bch_init - Initialize software BCH ECC engine
- * @mtd: MTD device
+ * @chip: NAND chip object
  *
  * Returns: a pointer to a new NAND BCH control structure, or NULL upon failure
  *
@@ -105,24 +105,24 @@ EXPORT_SYMBOL(nand_bch_correct_data);
  * @eccsize = 512 (thus, m = 13 is the smallest integer such that 2^m - 1 > 512 * 8)
  * @eccbytes = 7 (7 bytes are required to store m * t = 13 * 4 = 52 bits)
  */
-struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
+int nand_bch_init(struct nand_chip *chip)
 {
-	struct nand_chip *nand = mtd_to_nand(mtd);
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	unsigned int m, t, eccsteps, i;
 	struct nand_bch_control *nbc = NULL;
 	unsigned char *erased_page;
-	unsigned int eccsize = nand->ecc.size;
-	unsigned int eccbytes = nand->ecc.bytes;
-	unsigned int eccstrength = nand->ecc.strength;
+	unsigned int eccsize = chip->ecc.size;
+	unsigned int eccbytes = chip->ecc.bytes;
+	unsigned int eccstrength = chip->ecc.strength;
 
 	if (!eccbytes && eccstrength) {
 		eccbytes = DIV_ROUND_UP(eccstrength * fls(8 * eccsize), 8);
-		nand->ecc.bytes = eccbytes;
+		chip->ecc.bytes = eccbytes;
 	}
 
 	if (!eccsize || !eccbytes) {
 		pr_warn("ecc parameters not supplied\n");
-		goto fail;
+		return -EINVAL;
 	}
 
 	m = fls(1+8*eccsize);
@@ -130,7 +130,9 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 
 	nbc = kzalloc(sizeof(*nbc), GFP_KERNEL);
 	if (!nbc)
-		goto fail;
+		return -ENOMEM;
+
+	chip->ecc.priv = nbc;
 
 	nbc->bch = bch_init(m, t, 0, false);
 	if (!nbc->bch)
@@ -165,8 +167,8 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 	 * FIXME: we should probably rework the sequencing in nand_scan_tail()
 	 * to avoid setting those fields twice.
 	 */
-	nand->ecc.steps = eccsteps;
-	nand->ecc.total = eccsteps * eccbytes;
+	chip->ecc.steps = eccsteps;
+	chip->ecc.total = eccsteps * eccbytes;
 	if (mtd_ooblayout_count_eccbytes(mtd) != (eccsteps*eccbytes)) {
 		pr_warn("invalid ecc layout\n");
 		goto fail;
@@ -192,12 +194,12 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 		nbc->eccmask[i] ^= 0xff;
 
 	if (!eccstrength)
-		nand->ecc.strength = (eccbytes * 8) / fls(8 * eccsize);
+		chip->ecc.strength = (eccbytes * 8) / fls(8 * eccsize);
 
-	return nbc;
+	return 0;
 fail:
-	nand_bch_free(nbc);
-	return NULL;
+	nand_bch_free(chip);
+	return -EINVAL;
 }
 EXPORT_SYMBOL(nand_bch_init);
 
@@ -205,8 +207,10 @@ EXPORT_SYMBOL(nand_bch_init);
  * nand_bch_free - Release NAND BCH ECC resources
  * @nbc: NAND BCH control structure
  */
-void nand_bch_free(struct nand_bch_control *nbc)
+void nand_bch_free(struct nand_chip *chip)
 {
+	struct nand_bch_control *nbc = chip->ecc.priv;
+
 	if (nbc) {
 		bch_free(nbc->bch);
 		kfree(nbc->errloc);
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 4191831df182..1bc2462efeab 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -927,7 +927,7 @@ static int fsmc_nand_attach_chip(struct nand_chip *nand)
 
 	/*
 	 * Don't set layout for BCH4 SW ECC. This will be
-	 * generated later in nand_bch_init() later.
+	 * generated later during BCH initialization.
 	 */
 	if (nand->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
 		switch (mtd->oobsize) {
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 189d3a301a38..c47441ddc5cf 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5208,6 +5208,7 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	int ret;
 
 	if (WARN_ON(ecc->engine_type != NAND_ECC_ENGINE_TYPE_SOFT))
 		return -EINVAL;
@@ -5294,13 +5295,14 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 			ecc->strength = bytes * 8 / fls(8 * ecc->size);
 		}
 
-		/* See nand_bch_init() for details. */
+		/* See the software BCH ECC initialization for details */
 		ecc->bytes = 0;
-		ecc->priv = nand_bch_init(mtd);
-		if (!ecc->priv) {
+		ret = nand_bch_init(chip);
+		if (ret) {
 			WARN(1, "BCH ECC initialization failed!\n");
-			return -EINVAL;
+			return ret;
 		}
+
 		return 0;
 	default:
 		WARN(1, "Unsupported ECC algorithm!\n");
@@ -5960,7 +5962,7 @@ void nand_cleanup(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
 	    chip->ecc.algo == NAND_ECC_ALGO_BCH)
-		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
+		nand_bch_free(chip);
 
 	nanddev_cleanup(&chip->base);
 
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 0ef209e1cd87..6aab57336690 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2047,10 +2047,10 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		/* Reserve one byte for the OMAP marker */
 		oobbytes_per_step	= chip->ecc.bytes + 1;
 		/* Software BCH library is used for locating errors */
-		chip->ecc.priv		= nand_bch_init(mtd);
-		if (!chip->ecc.priv) {
+		err = nand_bch_init(chip);
+		if (err) {
 			dev_err(dev, "Unable to use BCH library\n");
-			return -EINVAL;
+			return err;
 		}
 		break;
 
@@ -2089,10 +2089,10 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		/* Reserve one byte for the OMAP marker */
 		oobbytes_per_step	= chip->ecc.bytes + 1;
 		/* Software BCH library is used for locating errors */
-		chip->ecc.priv		= nand_bch_init(mtd);
-		if (!chip->ecc.priv) {
+		err = nand_bch_init(chip);
+		if (err) {
 			dev_err(dev, "unable to use BCH library\n");
-			return -EINVAL;
+			return err;
 		}
 		break;
 
@@ -2272,7 +2272,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 	if (nand_chip->ecc.priv) {
-		nand_bch_free(nand_chip->ecc.priv);
+		nand_bch_free(nand_chip);
 		nand_chip->ecc.priv = NULL;
 	}
 	return err;
@@ -2286,7 +2286,7 @@ static int omap_nand_remove(struct platform_device *pdev)
 	int ret;
 
 	if (nand_chip->ecc.priv) {
-		nand_bch_free(nand_chip->ecc.priv);
+		nand_bch_free(nand_chip);
 		nand_chip->ecc.priv = NULL;
 	}
 	if (info->dma)
diff --git a/include/linux/mtd/nand-ecc-sw-bch.h b/include/linux/mtd/nand-ecc-sw-bch.h
index 1e1ee3af82b1..b62b8bd4669f 100644
--- a/include/linux/mtd/nand-ecc-sw-bch.h
+++ b/include/linux/mtd/nand-ecc-sw-bch.h
@@ -10,7 +10,6 @@
 
 struct mtd_info;
 struct nand_chip;
-struct nand_bch_control;
 
 #if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_BCH)
 
@@ -30,11 +29,11 @@ int nand_bch_correct_data(struct nand_chip *chip, u_char *dat,
 /*
  * Initialize BCH encoder/decoder
  */
-struct nand_bch_control *nand_bch_init(struct mtd_info *mtd);
+int nand_bch_init(struct nand_chip *chip);
 /*
  * Release BCH encoder/decoder resources
  */
-void nand_bch_free(struct nand_bch_control *nbc);
+void nand_bch_free(struct nand_chip *chip);
 
 #else /* !CONFIG_MTD_NAND_ECC_SW_BCH */
 
@@ -54,12 +53,12 @@ nand_bch_correct_data(struct nand_chip *chip, unsigned char *buf,
 	return -ENOTSUPP;
 }
 
-static inline struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
+static inline int nand_bch_init(struct nand_chip *chip)
 {
-	return NULL;
+	return -ENOTSUPP;
 }
 
-static inline void nand_bch_free(struct nand_bch_control *nbc) {}
+static inline void nand_bch_free(struct nand_chip *chip) {}
 
 #endif /* CONFIG_MTD_NAND_ECC_SW_BCH */
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
