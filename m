Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC5BC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5044020897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tApYxzhh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5044020897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qeeL1FNtMFbVxFvrDa2ddW785OqmUPlfJEjNXrPtFlw=; b=tApYxzhhRkfNdO1GrdqA01JRw
	7coG9J6nPzV75y6GlN9JAvi3cAIomV2u1diwtO7TL+CtOqSzBGgYHpuuY31jpKTeGxfXu96AYu8M+
	Si+o1q/O9zNF9CjCaACp/akBBAeKHWKofqBJWvIJfavn9sYdgLjvjhNA43Tiek747W4g1/jUDNCGG
	+s4sbjsA0rJTCUr2x2CAC8eLS7Zp3IDnf6GdLE/9uBz7BZvlV2uEk3Z1VIFjuXlYrph0sfbkVze0N
	CSE+2kdaAA8Rvq3D10lKv6R4Jm0zJL2bp2xtD0pTUS8GoK3MwBBRAGbVfG15SbKW9vOEYIB3Cjv0X
	3HDfcCk6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOdI-0001L2-Mb; Tue, 29 Sep 2020 23:02:04 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcq-0001CX-TW
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:39 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2ABD020000F;
 Tue, 29 Sep 2020 23:01:35 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 07/20] mtd: nand: ecc-bch: Update the prototypes to be more
 generic
Date: Wed, 30 Sep 2020 01:01:11 +0200
Message-Id: <20200929230124.31491-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190137_245749_257A9ADA 
X-CRM114-Status: GOOD (  22.73  )
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

These functions must be usable by the main NAND core, so their names
must be technology-agnostic as well as the parameters. Hence, we pass
a generic nand_device instead of a raw nand_chip structure.

As it seems that changing the raw NAND functions to always pass a
generic NAND device is a lost of time, we prefer to create dedicated
raw NAND wrappers that will be useful in the near future to do the
translation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-bch.c       | 47 +++++++++++++++++------------
 drivers/mtd/nand/raw/nand_base.c    | 44 ++++++++++++++++++++++++---
 drivers/mtd/nand/raw/omap2.c        | 23 ++++++--------
 include/linux/mtd/nand-ecc-sw-bch.h | 45 ++++++++++-----------------
 include/linux/mtd/rawnand.h         |  5 +++
 5 files changed, 97 insertions(+), 67 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-bch.c b/drivers/mtd/nand/ecc-sw-bch.c
index 97221ec3876e..b9bdfcf46c6d 100644
--- a/drivers/mtd/nand/ecc-sw-bch.c
+++ b/drivers/mtd/nand/ecc-sw-bch.c
@@ -13,6 +13,7 @@
 #include <linux/bitops.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
+#include <linux/mtd/nand.h>
 #include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/bch.h>
 
@@ -29,14 +30,15 @@ struct nand_bch_control {
 };
 
 /**
- * nand_bch_calcuate_ecc - Calculate the ECC corresponding to a data block
- * @chip: NAND chip object
+ * nand_ecc_sw_bch_calculate - Calculate the ECC corresponding to a data block
+ * @nand: NAND device
  * @buf: Input buffer with raw data
  * @code: Output buffer with ECC
  */
-int nand_bch_calculate_ecc(struct nand_chip *chip, const unsigned char *buf,
-			   unsigned char *code)
+int nand_ecc_sw_bch_calculate(struct nand_device *nand,
+			      const unsigned char *buf, unsigned char *code)
 {
+	struct nand_chip *chip = mtd_to_nand(nanddev_to_mtd(nand));
 	struct nand_bch_control *nbc = chip->ecc.priv;
 	unsigned int i;
 
@@ -49,20 +51,21 @@ int nand_bch_calculate_ecc(struct nand_chip *chip, const unsigned char *buf,
 
 	return 0;
 }
-EXPORT_SYMBOL(nand_bch_calculate_ecc);
+EXPORT_SYMBOL(nand_ecc_sw_bch_calculate);
 
 /**
- * nand_bch_correct_data - Detect, correct and report bit error(s)
- * @chip: NAND chip object
+ * nand_ecc_sw_bch_correct - Detect, correct and report bit error(s)
+ * @nand: NAND device
  * @buf: Raw data read from the chip
  * @read_ecc: ECC bytes from the chip
  * @calc_ecc: ECC calculated from the raw data
  *
  * Detect and correct bit errors for a data block.
  */
-int nand_bch_correct_data(struct nand_chip *chip, unsigned char *buf,
-			  unsigned char *read_ecc, unsigned char *calc_ecc)
+int nand_ecc_sw_bch_correct(struct nand_device *nand, unsigned char *buf,
+			    unsigned char *read_ecc, unsigned char *calc_ecc)
 {
+	struct nand_chip *chip = mtd_to_nand(nanddev_to_mtd(nand));
 	struct nand_bch_control *nbc = chip->ecc.priv;
 	unsigned int *errloc = nbc->errloc;
 	int i, count;
@@ -86,11 +89,11 @@ int nand_bch_correct_data(struct nand_chip *chip, unsigned char *buf,
 
 	return count;
 }
-EXPORT_SYMBOL(nand_bch_correct_data);
+EXPORT_SYMBOL(nand_ecc_sw_bch_correct);
 
 /**
- * nand_bch_init - Initialize software BCH ECC engine
- * @chip: NAND chip object
+ * nand_ecc_sw_bch_init - Initialize software BCH ECC engine
+ * @nand: NAND device
  *
  * Returns: a pointer to a new NAND BCH control structure, or NULL upon failure
  *
@@ -105,9 +108,10 @@ EXPORT_SYMBOL(nand_bch_correct_data);
  * @eccsize = 512 (thus, m = 13 is the smallest integer such that 2^m - 1 > 512 * 8)
  * @eccbytes = 7 (7 bytes are required to store m * t = 13 * 4 = 52 bits)
  */
-int nand_bch_init(struct nand_chip *chip)
+int nand_ecc_sw_bch_init(struct nand_device *nand)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	struct nand_chip *chip = mtd_to_nand(mtd);
 	unsigned int m, t, eccsteps, i;
 	struct nand_bch_control *nbc = NULL;
 	unsigned char *erased_page;
@@ -197,18 +201,21 @@ int nand_bch_init(struct nand_chip *chip)
 		chip->ecc.strength = (eccbytes * 8) / fls(8 * eccsize);
 
 	return 0;
+
 fail:
-	nand_bch_free(chip);
+	nand_ecc_sw_bch_cleanup(nand);
+
 	return -EINVAL;
 }
-EXPORT_SYMBOL(nand_bch_init);
+EXPORT_SYMBOL(nand_ecc_sw_bch_init);
 
 /**
- * nand_bch_free - Release NAND BCH ECC resources
- * @nbc: NAND BCH control structure
+ * nand_ecc_sw_bch_cleanup - Cleanup software BCH ECC resources
+ * @nand: NAND device
  */
-void nand_bch_free(struct nand_chip *chip)
+void nand_ecc_sw_bch_cleanup(struct nand_device *nand)
 {
+	struct nand_chip *chip = mtd_to_nand(nanddev_to_mtd(nand));
 	struct nand_bch_control *nbc = chip->ecc.priv;
 
 	if (nbc) {
@@ -218,7 +225,7 @@ void nand_bch_free(struct nand_chip *chip)
 		kfree(nbc);
 	}
 }
-EXPORT_SYMBOL(nand_bch_free);
+EXPORT_SYMBOL(nand_ecc_sw_bch_cleanup);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Ivan Djelic <ivan.djelic@parrot.com>");
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a6b6ab26a22a..69bdbb1c3b60 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5144,6 +5144,42 @@ static void nand_scan_ident_cleanup(struct nand_chip *chip)
 	kfree(chip->parameters.onfi);
 }
 
+int rawnand_sw_bch_init(struct nand_chip *chip)
+{
+	struct nand_device *base = &chip->base;
+
+	return nand_ecc_sw_bch_init(base);
+}
+EXPORT_SYMBOL(rawnand_sw_bch_init);
+
+static int rawnand_sw_bch_calculate(struct nand_chip *chip,
+				    const unsigned char *buf,
+				    unsigned char *code)
+{
+	struct nand_device *base = &chip->base;
+
+	return nand_ecc_sw_bch_calculate(base, buf, code);
+}
+
+int rawnand_sw_bch_correct(struct nand_chip *chip, unsigned char *buf,
+			   unsigned char *read_ecc, unsigned char *calc_ecc)
+{
+	struct nand_device *base = &chip->base;
+
+	return nand_ecc_sw_bch_correct(base, buf, read_ecc, calc_ecc);
+}
+EXPORT_SYMBOL(rawnand_sw_bch_correct);
+
+void rawnand_sw_bch_cleanup(struct nand_chip *chip)
+{
+	struct nand_device *base = &chip->base;
+
+	nand_ecc_sw_bch_cleanup(base);
+
+	chip->ecc.priv = NULL;
+}
+EXPORT_SYMBOL(rawnand_sw_bch_cleanup);
+
 static int nand_set_ecc_on_host_ops(struct nand_chip *chip)
 {
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
@@ -5240,8 +5276,8 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 			WARN(1, "CONFIG_MTD_NAND_ECC_SW_BCH not enabled\n");
 			return -EINVAL;
 		}
-		ecc->calculate = nand_bch_calculate_ecc;
-		ecc->correct = nand_bch_correct_data;
+		ecc->calculate = rawnand_sw_bch_calculate;
+		ecc->correct = rawnand_sw_bch_correct;
 		ecc->read_page = nand_read_page_swecc;
 		ecc->read_subpage = nand_read_subpage;
 		ecc->write_page = nand_write_page_swecc;
@@ -5297,7 +5333,7 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 
 		/* See the software BCH ECC initialization for details */
 		ecc->bytes = 0;
-		ret = nand_bch_init(chip);
+		ret = rawnand_sw_bch_init(chip);
 		if (ret) {
 			WARN(1, "BCH ECC initialization failed!\n");
 			return ret;
@@ -5962,7 +5998,7 @@ void nand_cleanup(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
 	    chip->ecc.algo == NAND_ECC_ALGO_BCH)
-		nand_bch_free(chip);
+		rawnand_sw_bch_cleanup(chip);
 
 	nanddev_cleanup(&chip->base);
 
diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 6aab57336690..4cc47ab7f01a 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -23,7 +23,6 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 
-#include <linux/mtd/nand-ecc-sw-bch.h>
 #include <linux/platform_data/elm.h>
 
 #include <linux/omap-gpmc.h>
@@ -2041,13 +2040,13 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		chip->ecc.bytes		= 7;
 		chip->ecc.strength	= 4;
 		chip->ecc.hwctl		= omap_enable_hwecc_bch;
-		chip->ecc.correct	= nand_bch_correct_data;
+		chip->ecc.correct	= rawnand_sw_bch_correct;
 		chip->ecc.calculate	= omap_calculate_ecc_bch_sw;
 		mtd_set_ooblayout(mtd, &omap_sw_ooblayout_ops);
 		/* Reserve one byte for the OMAP marker */
 		oobbytes_per_step	= chip->ecc.bytes + 1;
 		/* Software BCH library is used for locating errors */
-		err = nand_bch_init(chip);
+		err = rawnand_sw_bch_init(chip);
 		if (err) {
 			dev_err(dev, "Unable to use BCH library\n");
 			return err;
@@ -2083,13 +2082,13 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		chip->ecc.bytes		= 13;
 		chip->ecc.strength	= 8;
 		chip->ecc.hwctl		= omap_enable_hwecc_bch;
-		chip->ecc.correct	= nand_bch_correct_data;
+		chip->ecc.correct	= rawnand_sw_bch_correct;
 		chip->ecc.calculate	= omap_calculate_ecc_bch_sw;
 		mtd_set_ooblayout(mtd, &omap_sw_ooblayout_ops);
 		/* Reserve one byte for the OMAP marker */
 		oobbytes_per_step	= chip->ecc.bytes + 1;
 		/* Software BCH library is used for locating errors */
-		err = nand_bch_init(chip);
+		err = rawnand_sw_bch_init(chip);
 		if (err) {
 			dev_err(dev, "unable to use BCH library\n");
 			return err;
@@ -2195,7 +2194,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_chip		= &info->nand;
 	mtd			= nand_to_mtd(nand_chip);
 	mtd->dev.parent		= &pdev->dev;
-	nand_chip->ecc.priv	= NULL;
 	nand_set_flash_node(nand_chip, dev->of_node);
 
 	if (!mtd->name) {
@@ -2271,10 +2269,9 @@ static int omap_nand_probe(struct platform_device *pdev)
 return_error:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
-	if (nand_chip->ecc.priv) {
-		nand_bch_free(nand_chip);
-		nand_chip->ecc.priv = NULL;
-	}
+
+	rawnand_sw_bch_cleanup(nand_chip);
+
 	return err;
 }
 
@@ -2285,10 +2282,8 @@ static int omap_nand_remove(struct platform_device *pdev)
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 	int ret;
 
-	if (nand_chip->ecc.priv) {
-		nand_bch_free(nand_chip);
-		nand_chip->ecc.priv = NULL;
-	}
+	rawnand_sw_bch_cleanup(nand_chip);
+
 	if (info->dma)
 		dma_release_channel(info->dma);
 	ret = mtd_device_unregister(mtd);
diff --git a/include/linux/mtd/nand-ecc-sw-bch.h b/include/linux/mtd/nand-ecc-sw-bch.h
index 7b62996d9e01..f0caee3b03d0 100644
--- a/include/linux/mtd/nand-ecc-sw-bch.h
+++ b/include/linux/mtd/nand-ecc-sw-bch.h
@@ -8,53 +8,40 @@
 #ifndef __MTD_NAND_ECC_SW_BCH_H__
 #define __MTD_NAND_ECC_SW_BCH_H__
 
-struct mtd_info;
-struct nand_chip;
+#include <linux/mtd/nand.h>
 
 #if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_BCH)
 
-/*
- * Calculate BCH ecc code
- */
-int nand_bch_calculate_ecc(struct nand_chip *chip, const u_char *dat,
-			   u_char *ecc_code);
-
-/*
- * Detect and correct bit errors
- */
-int nand_bch_correct_data(struct nand_chip *chip, u_char *dat,
-			  u_char *read_ecc, u_char *calc_ecc);
-/*
- * Initialize BCH encoder/decoder
- */
-int nand_bch_init(struct nand_chip *chip);
-/*
- * Release BCH encoder/decoder resources
- */
-void nand_bch_free(struct nand_chip *chip);
+int nand_ecc_sw_bch_calculate(struct nand_device *nand,
+			      const unsigned char *buf, unsigned char *code);
+int nand_ecc_sw_bch_correct(struct nand_device *nand, unsigned char *buf,
+			    unsigned char *read_ecc, unsigned char *calc_ecc);
+int nand_ecc_sw_bch_init(struct nand_device *nand);
+void nand_ecc_sw_bch_cleanup(struct nand_device *nand);
 
 #else /* !CONFIG_MTD_NAND_ECC_SW_BCH */
 
-static inline int
-nand_bch_calculate_ecc(struct nand_chip *chip, const u_char *dat,
-		       u_char *ecc_code)
+static inline int nand_ecc_sw_bch_calculate(struct nand_device *nand,
+					    const unsigned char *buf,
+					    unsigned char *code)
 {
 	return -ENOTSUPP;
 }
 
-static inline int
-nand_bch_correct_data(struct nand_chip *chip, unsigned char *buf,
-		      unsigned char *read_ecc, unsigned char *calc_ecc)
+static inline int nand_ecc_sw_bch_correct(struct nand_device *nand,
+					  unsigned char *buf,
+					  unsigned char *read_ecc,
+					  unsigned char *calc_ecc)
 {
 	return -ENOTSUPP;
 }
 
-static inline int nand_bch_init(struct nand_chip *chip)
+static inline int nand_ecc_sw_bch_init(struct nand_device *nand)
 {
 	return -ENOTSUPP;
 }
 
-static inline void nand_bch_free(struct nand_chip *chip) {}
+static inline void nand_ecc_sw_bch_cleanup(struct nand_device *nand) {}
 
 #endif /* CONFIG_MTD_NAND_ECC_SW_BCH */
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index aac07940de09..23623beaad1d 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1303,6 +1303,11 @@ static inline int nand_opcode_8bits(unsigned int command)
 	return 0;
 }
 
+int rawnand_sw_bch_init(struct nand_chip *chip);
+int rawnand_sw_bch_correct(struct nand_chip *chip, unsigned char *buf,
+			   unsigned char *read_ecc, unsigned char *calc_ecc);
+void rawnand_sw_bch_cleanup(struct nand_chip *chip);
+
 int nand_check_erased_ecc_chunk(void *data, int datalen,
 				void *ecc, int ecclen,
 				void *extraoob, int extraooblen,
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
