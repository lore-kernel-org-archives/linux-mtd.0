Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BD7C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 11:34:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE7292075A
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 11:34:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qFtKapta"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE7292075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OogJ2kEfm5AqkpG351EWCjrkgvHrGm6X9FK7jsRbWL8=; b=qFtKaptaG8nvzu
	G30TeAP6zpSBxNyoUGS+1H71kfsF1Hu8hDj6RNt1o9BVDdi6RnwzB+R6IGA7vp83wdVwKDpZ0Ji1F
	DKCFItEnT05F5JNBmoaOg4N4JlaTXfaaz8KwNZWDqCHAkwDEs2E/ekY7tX75gTTyZg3oBbXKOUP91
	pQZnhgRLr7UH6K0ZJwzEf2iLu11/qq4QHpRh3fMtaUN5K8lGbsKMOHKFZh5YA6qgt/Fck51O3mqAA
	t0cmJFr1CylBW1BveqwEb7QUmUllAE8C+BvCsRv2J/FbCoonhydIW2EpjhsnpX7ChkST0QmdEHhBy
	NhOiN616+zV9Y7LDM12g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeGnu-0003Zl-G4; Thu, 28 May 2020 11:34:30 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeGkw-0001OG-Up; Thu, 28 May 2020 11:31:29 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C1BD9200005;
 Thu, 28 May 2020 11:31:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v6 03/18] mtd: rawnand: Separate the ECC engine type and the
 OOB placement
Date: Thu, 28 May 2020 13:30:58 +0200
Message-Id: <20200528113113.9166-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528113113.9166-1-miquel.raynal@bootlin.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_043127_265566_B06D0F47 
X-CRM114-Status: GOOD (  19.42  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, Weijie Gao <weijie.gao@mediatek.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The use of "syndrome" placement should not be encoded in the ECC
engine mode/type.

Create a "placement" field in NAND chip and change all occurrences of
the NAND_ECC_HW_SYNDROME enumeration to be just NAND_ECC_HW and
possibly a placement entry like NAND_ECC_PLACEMENT_INTERLEAVED.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/mach-davinci/board-dm355-leopard.c |   3 +-
 drivers/mtd/nand/raw/cafe_nand.c            |   3 +-
 drivers/mtd/nand/raw/davinci_nand.c         |   5 +-
 drivers/mtd/nand/raw/denali.c               |   3 +-
 drivers/mtd/nand/raw/diskonchip.c           |   3 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c          |   3 +-
 drivers/mtd/nand/raw/nand_base.c            | 109 +++++++++++---------
 drivers/mtd/nand/raw/r852.c                 |   3 +-
 include/linux/mtd/rawnand.h                 |   6 +-
 include/linux/platform_data/mtd-davinci.h   |   1 +
 10 files changed, 81 insertions(+), 58 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm355-leopard.c b/arch/arm/mach-davinci/board-dm355-leopard.c
index b9e9950dd300..4c8a592754ac 100644
--- a/arch/arm/mach-davinci/board-dm355-leopard.c
+++ b/arch/arm/mach-davinci/board-dm355-leopard.c
@@ -76,7 +76,8 @@ static struct davinci_nand_pdata davinci_nand_data = {
 	.mask_chipsel		= BIT(14),
 	.parts			= davinci_nand_partitions,
 	.nr_parts		= ARRAY_SIZE(davinci_nand_partitions),
-	.ecc_mode		= NAND_ECC_HW_SYNDROME,
+	.ecc_mode		= NAND_HW_ECC_ENGINE,
+	.ecc_placement		= NAND_ECC_PLACEMENT_INTERLEAVED,
 	.ecc_bits		= 4,
 	.bbt_options		= NAND_BBT_USE_FLASH,
 };
diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 92173790f20b..2bf8ab542e38 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -629,7 +629,8 @@ static int cafe_nand_attach_chip(struct nand_chip *chip)
 		goto out_free_dma;
 	}
 
-	cafe->nand.ecc.mode = NAND_ECC_HW_SYNDROME;
+	cafe->nand.ecc.mode = NAND_ECC_HW;
+	cafe->nand.ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
 	cafe->nand.ecc.size = mtd->writesize;
 	cafe->nand.ecc.bytes = 14;
 	cafe->nand.ecc.strength = 4;
diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index d975a62caaa5..2e5d6c113b56 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -168,7 +168,7 @@ static int nand_davinci_correct_1bit(struct nand_chip *chip, u_char *dat,
 /*
  * 4-bit hardware ECC ... context maintained over entire AEMIF
  *
- * This is a syndrome engine, but we avoid NAND_ECC_HW_SYNDROME
+ * This is a syndrome engine, but we avoid NAND_ECC_PLACEMENT_INTERLEAVED
  * since that forces use of a problematic "infix OOB" layout.
  * Among other things, it trashes manufacturer bad block markers.
  * Also, and specific to this hardware, it ECC-protects the "prepad"
@@ -851,6 +851,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 
 	/* Use board-specific ECC config */
 	info->chip.ecc.mode	= pdata->ecc_mode;
+	info->chip.ecc.placement = pdata->ecc_placement;
 
 	spin_lock_irq(&davinci_nand_lock);
 
@@ -897,7 +898,7 @@ static int nand_davinci_remove(struct platform_device *pdev)
 	int ret;
 
 	spin_lock_irq(&davinci_nand_lock);
-	if (info->chip.ecc.mode == NAND_ECC_HW_SYNDROME)
+	if (info->chip.ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 4e6e1578aa2d..514a97ea4450 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1237,7 +1237,8 @@ int denali_chip_init(struct denali_controller *denali,
 	chip->bbt_options |= NAND_BBT_USE_FLASH;
 	chip->bbt_options |= NAND_BBT_NO_OOB;
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
-	chip->ecc.mode = NAND_ECC_HW_SYNDROME;
+	chip->ecc.mode = NAND_ECC_HW;
+	chip->ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
 	chip->ecc.read_page = denali_read_page;
 	chip->ecc.write_page = denali_write_page;
 	chip->ecc.read_page_raw = denali_read_page_raw;
diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 43721863a0d8..40360352136b 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1456,7 +1456,8 @@ static int __init doc_probe(unsigned long physadr)
 	nand->ecc.calculate	= doc200x_calculate_ecc;
 	nand->ecc.correct	= doc200x_correct_data;
 
-	nand->ecc.mode		= NAND_ECC_HW_SYNDROME;
+	nand->ecc.mode		= NAND_ECC_HW;
+	nand->ecc.placement	= NAND_ECC_PLACEMENT_INTERLEAVED;
 	nand->ecc.size		= 512;
 	nand->ecc.bytes		= 6;
 	nand->ecc.strength	= 2;
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index b151fd000815..ccb189c8e343 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -881,7 +881,8 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, host);
 
 	/* NAND callbacks for LPC32xx SLC hardware */
-	chip->ecc.mode = NAND_ECC_HW_SYNDROME;
+	chip->ecc.mode = NAND_ECC_HW;
+	chip->ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
 	chip->legacy.read_byte = lpc32xx_nand_read_byte;
 	chip->legacy.read_buf = lpc32xx_nand_read_buf;
 	chip->legacy.write_buf = lpc32xx_nand_write_buf;
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 4d2d444f9db9..9fbd2a474b62 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5772,61 +5772,74 @@ static int nand_scan_tail(struct nand_chip *chip)
 
 	switch (ecc->mode) {
 	case NAND_ECC_HW:
-		/* Use standard hwecc read page function? */
-		if (!ecc->read_page)
-			ecc->read_page = nand_read_page_hwecc;
-		if (!ecc->write_page)
-			ecc->write_page = nand_write_page_hwecc;
-		if (!ecc->read_page_raw)
-			ecc->read_page_raw = nand_read_page_raw;
-		if (!ecc->write_page_raw)
-			ecc->write_page_raw = nand_write_page_raw;
-		if (!ecc->read_oob)
-			ecc->read_oob = nand_read_oob_std;
-		if (!ecc->write_oob)
-			ecc->write_oob = nand_write_oob_std;
-		if (!ecc->read_subpage)
-			ecc->read_subpage = nand_read_subpage;
-		if (!ecc->write_subpage && ecc->hwctl && ecc->calculate)
-			ecc->write_subpage = nand_write_subpage_hwecc;
-		fallthrough;
-	case NAND_ECC_HW_SYNDROME:
-		if ((!ecc->calculate || !ecc->correct || !ecc->hwctl) &&
-		    (!ecc->read_page ||
-		     ecc->read_page == nand_read_page_hwecc ||
-		     !ecc->write_page ||
-		     ecc->write_page == nand_write_page_hwecc)) {
-			WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
-			ret = -EINVAL;
-			goto err_nand_manuf_cleanup;
-		}
-		/* Use standard syndrome read/write page function? */
-		if (!ecc->read_page)
-			ecc->read_page = nand_read_page_syndrome;
-		if (!ecc->write_page)
-			ecc->write_page = nand_write_page_syndrome;
-		if (!ecc->read_page_raw)
-			ecc->read_page_raw = nand_read_page_raw_syndrome;
-		if (!ecc->write_page_raw)
-			ecc->write_page_raw = nand_write_page_raw_syndrome;
-		if (!ecc->read_oob)
-			ecc->read_oob = nand_read_oob_syndrome;
-		if (!ecc->write_oob)
-			ecc->write_oob = nand_write_oob_syndrome;
+		switch (ecc->placement) {
+		case NAND_ECC_PLACEMENT_UNKNOWN:
+		case NAND_ECC_PLACEMENT_OOB:
+			/* Use standard hwecc read page function? */
+			if (!ecc->read_page)
+				ecc->read_page = nand_read_page_hwecc;
+			if (!ecc->write_page)
+				ecc->write_page = nand_write_page_hwecc;
+			if (!ecc->read_page_raw)
+				ecc->read_page_raw = nand_read_page_raw;
+			if (!ecc->write_page_raw)
+				ecc->write_page_raw = nand_write_page_raw;
+			if (!ecc->read_oob)
+				ecc->read_oob = nand_read_oob_std;
+			if (!ecc->write_oob)
+				ecc->write_oob = nand_write_oob_std;
+			if (!ecc->read_subpage)
+				ecc->read_subpage = nand_read_subpage;
+			if (!ecc->write_subpage && ecc->hwctl && ecc->calculate)
+				ecc->write_subpage = nand_write_subpage_hwecc;
+			fallthrough;
 
-		if (mtd->writesize >= ecc->size) {
-			if (!ecc->strength) {
-				WARN(1, "Driver must set ecc.strength when using hardware ECC\n");
+		case NAND_ECC_PLACEMENT_INTERLEAVED:
+			if ((!ecc->calculate || !ecc->correct || !ecc->hwctl) &&
+			    (!ecc->read_page ||
+			     ecc->read_page == nand_read_page_hwecc ||
+			     !ecc->write_page ||
+			     ecc->write_page == nand_write_page_hwecc)) {
+				WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
 				ret = -EINVAL;
 				goto err_nand_manuf_cleanup;
 			}
+			/* Use standard syndrome read/write page function? */
+			if (!ecc->read_page)
+				ecc->read_page = nand_read_page_syndrome;
+			if (!ecc->write_page)
+				ecc->write_page = nand_write_page_syndrome;
+			if (!ecc->read_page_raw)
+				ecc->read_page_raw = nand_read_page_raw_syndrome;
+			if (!ecc->write_page_raw)
+				ecc->write_page_raw = nand_write_page_raw_syndrome;
+			if (!ecc->read_oob)
+				ecc->read_oob = nand_read_oob_syndrome;
+			if (!ecc->write_oob)
+				ecc->write_oob = nand_write_oob_syndrome;
+
+			if (mtd->writesize >= ecc->size) {
+				if (!ecc->strength) {
+					WARN(1, "Driver must set ecc.strength when using hardware ECC\n");
+					ret = -EINVAL;
+					goto err_nand_manuf_cleanup;
+				}
+				break;
+			}
+			pr_warn("%d byte HW ECC not possible on %d byte page size, fallback to SW ECC\n",
+				ecc->size, mtd->writesize);
+			ecc->mode = NAND_ECC_SOFT;
+			ecc->algo = NAND_ECC_HAMMING;
 			break;
+
+		default:
+			pr_warn("Invalid NAND_ECC_PLACEMENT %d\n",
+				ecc->placement);
+			ret = -EINVAL;
+			goto err_nand_manuf_cleanup;
 		}
-		pr_warn("%d byte HW ECC not possible on %d byte page size, fallback to SW ECC\n",
-			ecc->size, mtd->writesize);
-		ecc->mode = NAND_ECC_SOFT;
-		ecc->algo = NAND_ECC_HAMMING;
 		fallthrough;
+
 	case NAND_ECC_SOFT:
 		ret = nand_set_ecc_soft_ops(chip);
 		if (ret) {
diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index f865e3a47b01..f0988cda4479 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -859,7 +859,8 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	chip->legacy.write_buf = r852_write_buf;
 
 	/* ecc */
-	chip->ecc.mode = NAND_ECC_HW_SYNDROME;
+	chip->ecc.mode = NAND_ECC_HW;
+	chip->ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
 	chip->ecc.size = R852_DMA_LEN;
 	chip->ecc.bytes = SM_OOB_SIZE;
 	chip->ecc.strength = 2;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5e014807e050..f6ffd174abb7 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -325,6 +325,7 @@ static const struct nand_ecc_caps __name = {			\
 /**
  * struct nand_ecc_ctrl - Control structure for ECC
  * @mode:	ECC mode
+ * @placement:	OOB bytes placement
  * @algo:	ECC algorithm
  * @steps:	number of ECC steps per page
  * @size:	data bytes per ECC step
@@ -352,7 +353,7 @@ static const struct nand_ecc_caps __name = {			\
  *			controller and always return contiguous in-band and
  *			out-of-band data even if they're not stored
  *			contiguously on the NAND chip (e.g.
- *			NAND_ECC_HW_SYNDROME interleaves in-band and
+ *			NAND_ECC_PLACEMENT_INTERLEAVED interleaves in-band and
  *			out-of-band data).
  * @write_page_raw:	function to write a raw page without ECC. This function
  *			should hide the specific layout used by the ECC
@@ -360,7 +361,7 @@ static const struct nand_ecc_caps __name = {			\
  *			in-band and out-of-band data. ECC controller is
  *			responsible for doing the appropriate transformations
  *			to adapt to its specific layout (e.g.
- *			NAND_ECC_HW_SYNDROME interleaves in-band and
+ *			NAND_ECC_PLACEMENT_INTERLEAVED interleaves in-band and
  *			out-of-band data).
  * @read_page:	function to read a page according to the ECC generator
  *		requirements; returns maximum number of bitflips corrected in
@@ -377,6 +378,7 @@ static const struct nand_ecc_caps __name = {			\
  */
 struct nand_ecc_ctrl {
 	enum nand_ecc_mode mode;
+	enum nand_ecc_placement placement;
 	enum nand_ecc_algo algo;
 	int steps;
 	int size;
diff --git a/include/linux/platform_data/mtd-davinci.h b/include/linux/platform_data/mtd-davinci.h
index 03e92c71b3fa..3383101c233b 100644
--- a/include/linux/platform_data/mtd-davinci.h
+++ b/include/linux/platform_data/mtd-davinci.h
@@ -69,6 +69,7 @@ struct davinci_nand_pdata {		/* platform_data */
 	 * using it with large page chips.
 	 */
 	enum nand_ecc_mode	ecc_mode;
+	enum nand_ecc_placement	ecc_placement;
 	u8			ecc_bits;
 
 	/* e.g. NAND_BUSWIDTH_16 */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
