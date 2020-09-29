Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB0BC47420
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF9C20897
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 23:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PO1Otz/b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EF9C20897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wH6bE/LceobDzgam4K8da9mVXfqc/9yDDHSrJ49ZBrU=; b=PO1Otz/bMFbnaVE7oF3FZfhoT
	rr7Ho7vfat2XucIzSuR2xRLk7W21U/YDMP///4iH5mDfNGn16XpCMCWusS4+GKyYOWj7YbNo54nbe
	fyXiPFl1zuBOMOxUR4KUE8VVOo69hyVhKbhBOYBRka0/41pL1uHv+QmBVku9S4LFeFZaCHr5VbGdz
	aBrld05q01HvckT9iK2ACnTUCi/4ffW6VQiry0774zjw9c120HguC9NWvUr27SAvvaiaN0V98JTuO
	wf3fifvz1i+72iB47AmO6nLbKHTC286ef7D8m2iWJBC+zF6q2Wsf9w1vrlYBnwXZTmOjBrHwaW0sH
	XIJsGAE7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNOcy-0001FT-Jt; Tue, 29 Sep 2020 23:01:44 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNOcm-0001AS-Se
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 23:01:35 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D7C4B20000A;
 Tue, 29 Sep 2020 23:01:30 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/20] mtd: nand: ecc-bch: Cleanup and style fixes
Date: Wed, 30 Sep 2020 01:01:07 +0200
Message-Id: <20200929230124.31491-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929230124.31491-1-miquel.raynal@bootlin.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_190133_124540_1984094E 
X-CRM114-Status: GOOD (  20.68  )
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

Fix function headers, capitals and reword a little bit the comments
to make this driver more readable.

There is not functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-bch.c | 55 ++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-bch.c b/drivers/mtd/nand/ecc-sw-bch.c
index d0dc84cfdbdc..fe080a0837d8 100644
--- a/drivers/mtd/nand/ecc-sw-bch.c
+++ b/drivers/mtd/nand/ecc-sw-bch.c
@@ -29,10 +29,10 @@ struct nand_bch_control {
 };
 
 /**
- * nand_bch_calculate_ecc - [NAND Interface] Calculate ECC for data block
- * @chip:	NAND chip object
- * @buf:	input buffer with raw data
- * @code:	output buffer with ECC
+ * nand_bch_calcuate_ecc - Calculate the ECC corresponding to a data block
+ * @chip: NAND chip object
+ * @buf: Input buffer with raw data
+ * @code: Output buffer with ECC
  */
 int nand_bch_calculate_ecc(struct nand_chip *chip, const unsigned char *buf,
 			   unsigned char *code)
@@ -52,13 +52,13 @@ int nand_bch_calculate_ecc(struct nand_chip *chip, const unsigned char *buf,
 EXPORT_SYMBOL(nand_bch_calculate_ecc);
 
 /**
- * nand_bch_correct_data - [NAND Interface] Detect and correct bit error(s)
- * @chip:	NAND chip object
- * @buf:	raw data read from the chip
- * @read_ecc:	ECC from the chip
- * @calc_ecc:	the ECC calculated from raw data
+ * nand_bch_correct_data - Detect, correct and report bit error(s)
+ * @chip: NAND chip object
+ * @buf: Raw data read from the chip
+ * @read_ecc: ECC bytes from the chip
+ * @calc_ecc: ECC calculated from the raw data
  *
- * Detect and correct bit errors for a data byte block
+ * Detect and correct bit errors for a data block.
  */
 int nand_bch_correct_data(struct nand_chip *chip, unsigned char *buf,
 			  unsigned char *read_ecc, unsigned char *calc_ecc)
@@ -71,37 +71,39 @@ int nand_bch_correct_data(struct nand_chip *chip, unsigned char *buf,
 			   NULL, errloc);
 	if (count > 0) {
 		for (i = 0; i < count; i++) {
-			if (errloc[i] < (chip->ecc.size*8))
-				/* error is located in data, correct it */
+			if (errloc[i] < (chip->ecc.size * 8))
+				/* The error is in the data area: correct it */
 				buf[errloc[i] >> 3] ^= (1 << (errloc[i] & 7));
-			/* else error in ecc, no action needed */
 
+			/* Otherwise the error is in the ECC area: nothing to do */
 			pr_debug("%s: corrected bitflip %u\n", __func__,
-					errloc[i]);
+				 errloc[i]);
 		}
 	} else if (count < 0) {
-		pr_err("ecc unrecoverable error\n");
+		pr_err("ECC unrecoverable error\n");
 		count = -EBADMSG;
 	}
+
 	return count;
 }
 EXPORT_SYMBOL(nand_bch_correct_data);
 
 /**
- * nand_bch_init - [NAND Interface] Initialize NAND BCH error correction
- * @mtd:	MTD block structure
+ * nand_bch_init - Initialize software BCH ECC engine
+ * @mtd: MTD device
  *
- * Returns:
- *  a pointer to a new NAND BCH control structure, or NULL upon failure
+ * Returns: a pointer to a new NAND BCH control structure, or NULL upon failure
  *
  * Initialize NAND BCH error correction. Parameters @eccsize and @eccbytes
- * are used to compute BCH parameters m (Galois field order) and t (error
- * correction capability). @eccbytes should be equal to the number of bytes
- * required to store m*t bits, where m is such that 2^m-1 > @eccsize*8.
+ * are used to compute the following BCH parameters:
+ *     m, the Galois field order
+ *     t, the error correction capability
+ * @eccbytes should be equal to the number of bytes required to store m * t
+ * bits, where m is such that 2^m - 1 > step_size * 8.
  *
  * Example: to configure 4 bit correction per 512 bytes, you should pass
- * @eccsize = 512  (thus, m=13 is the smallest integer such that 2^m-1 > 512*8)
- * @eccbytes = 7   (7 bytes are required to store m*t = 13*4 = 52 bits)
+ * @eccsize = 512 (thus, m = 13 is the smallest integer such that 2^m - 1 > 512 * 8)
+ * @eccbytes = 7 (7 bytes are required to store m * t = 13 * 4 = 52 bits)
  */
 struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 {
@@ -174,6 +176,7 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 	nbc->errloc = kmalloc_array(t, sizeof(*nbc->errloc), GFP_KERNEL);
 	if (!nbc->eccmask || !nbc->errloc)
 		goto fail;
+
 	/*
 	 * compute and store the inverted ecc of an erased ecc block
 	 */
@@ -199,8 +202,8 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 EXPORT_SYMBOL(nand_bch_init);
 
 /**
- * nand_bch_free - [NAND Interface] Release NAND BCH ECC resources
- * @nbc:	NAND BCH control structure
+ * nand_bch_free - Release NAND BCH ECC resources
+ * @nbc: NAND BCH control structure
  */
 void nand_bch_free(struct nand_bch_control *nbc)
 {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
