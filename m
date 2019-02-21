Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B898C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 10:04:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39FA8214AF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 10:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bk7Hnuim"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39FA8214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtdpx8CC6CIAgR1C0lLMWAjYSBj2amiW42ao3mdGM+M=; b=bk7Hnuim17qY7N
	ESirHBus5mrwJtUauIsLrMzg+fhnV5CWIvZknR35FlyQwQ1cx7aNNrZRaKuo0pvmmtry8JrfkYdeP
	DY2Xpl15B2muvPK8b4DjO3yncXHbaPbywAzbBFkliKZjnd9FQl1rp0PTkyp/quKaivgoY+BT/TMSr
	tprS1bJ6dGTbRR/SZDTrqn70NJrIG8o1JRftK9fz0pzcZvgOGK9fW8t3bQ9WvpssAmhPeu05UToB3
	cwjSY8uytgEx8P278mdhEaYA+STg2k08Me0peQlSlses9h+vM7CiURqBUZ+nRpwMTfP039hr+Dk2v
	AQgxLzSlNqbYFx9+aUWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwlD8-00010M-Vq; Thu, 21 Feb 2019 10:04:10 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwlBg-0007Mp-S0; Thu, 21 Feb 2019 10:02:46 +0000
Received: from localhost.localdomain
 (aaubervilliers-681-1-81-190.w90-88.abo.wanadoo.fr [90.88.23.190])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id B9FCA10000F;
 Thu, 21 Feb 2019 10:02:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [RFC PATCH 05/27] mtd: nand: Move standard OOB layouts to the NAND
 core
Date: Thu, 21 Feb 2019 11:01:54 +0100
Message-Id: <20190221100216.25255-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190221100216.25255-1-miquel.raynal@bootlin.com>
References: <20190221100216.25255-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_020241_751865_C7A61440 
X-CRM114-Status: GOOD (  16.96  )
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
 Schrempf Frieder <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

These OOB layouts are generic to all NAND chips, the should not be
restricted to be used only by raw NAND controller drivers. They might
later be used by generic ECC engines and SPI-NAND devices as well.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/core.c             | 161 ++++++++++++++++++++++++++++
 drivers/mtd/nand/raw/nand_base.c    | 161 +---------------------------
 drivers/mtd/nand/raw/nand_toshiba.c |   2 +
 include/linux/mtd/nand.h            |   4 +
 include/linux/mtd/rawnand.h         |   3 -
 5 files changed, 168 insertions(+), 163 deletions(-)

diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
index 0a2be5e6d669..a76d206d233a 100644
--- a/drivers/mtd/nand/core.c
+++ b/drivers/mtd/nand/core.c
@@ -270,6 +270,167 @@ void nanddev_cleanup(struct nand_device *nand)
 }
 EXPORT_SYMBOL_GPL(nanddev_cleanup);
 
+/* Define default oob placement schemes for large and small page devices */
+static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.conf.total;
+
+	if (section > 1)
+		return -ERANGE;
+
+	if (!section) {
+		oobregion->offset = 0;
+		if (mtd->oobsize == 16)
+			oobregion->length = 4;
+		else
+			oobregion->length = 3;
+	} else {
+		if (mtd->oobsize == 8)
+			return -ERANGE;
+
+		oobregion->offset = 6;
+		oobregion->length = total_ecc_bytes - 4;
+	}
+
+	return 0;
+}
+
+static int nand_ooblayout_free_sp(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oobregion)
+{
+	if (section > 1)
+		return -ERANGE;
+
+	if (mtd->oobsize == 16) {
+		if (section)
+			return -ERANGE;
+
+		oobregion->length = 8;
+		oobregion->offset = 8;
+	} else {
+		oobregion->length = 2;
+		if (!section)
+			oobregion->offset = 3;
+		else
+			oobregion->offset = 6;
+	}
+
+	return 0;
+}
+
+const struct mtd_ooblayout_ops nand_ooblayout_sp_ops = {
+	.ecc = nand_ooblayout_ecc_sp,
+	.free = nand_ooblayout_free_sp,
+};
+EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
+
+static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.conf.total;
+
+	if (section || !total_ecc_bytes)
+		return -ERANGE;
+
+	oobregion->length = total_ecc_bytes;
+	oobregion->offset = mtd->oobsize - oobregion->length;
+
+	return 0;
+}
+
+static int nand_ooblayout_free_lp(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.conf.total;
+
+	if (section)
+		return -ERANGE;
+
+	oobregion->length = mtd->oobsize - total_ecc_bytes - 2;
+	oobregion->offset = 2;
+
+	return 0;
+}
+
+const struct mtd_ooblayout_ops nand_ooblayout_lp_ops = {
+	.ecc = nand_ooblayout_ecc_lp,
+	.free = nand_ooblayout_free_lp,
+};
+EXPORT_SYMBOL_GPL(nand_ooblayout_lp_ops);
+
+/*
+ * Support the old "large page" layout used for 1-bit Hamming ECC where ECC
+ * are placed at a fixed offset.
+ */
+static int nand_ooblayout_ecc_lp_hamming(struct mtd_info *mtd, int section,
+					 struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.conf.total;
+
+	if (section)
+		return -ERANGE;
+
+	switch (mtd->oobsize) {
+	case 64:
+		oobregion->offset = 40;
+		break;
+	case 128:
+		oobregion->offset = 80;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	oobregion->length = total_ecc_bytes;
+	if (oobregion->offset + oobregion->length > mtd->oobsize)
+		return -ERANGE;
+
+	return 0;
+}
+
+static int nand_ooblayout_free_lp_hamming(struct mtd_info *mtd, int section,
+					  struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.conf.total;
+	int ecc_offset = 0;
+
+	if (section < 0 || section > 1)
+		return -ERANGE;
+
+	switch (mtd->oobsize) {
+	case 64:
+		ecc_offset = 40;
+		break;
+	case 128:
+		ecc_offset = 80;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (section == 0) {
+		oobregion->offset = 2;
+		oobregion->length = ecc_offset - 2;
+	} else {
+		oobregion->offset = ecc_offset + total_ecc_bytes;
+		oobregion->length = mtd->oobsize - oobregion->offset;
+	}
+
+	return 0;
+}
+
+const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
+	.ecc = nand_ooblayout_ecc_lp_hamming,
+	.free = nand_ooblayout_free_lp_hamming,
+};
+EXPORT_SYMBOL_GPL(nand_ooblayout_lp_hamming_ops);
+
 MODULE_DESCRIPTION("Generic NAND framework");
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@free-electrons.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 82ac620bbdac..0851ac63e70d 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -38,6 +38,7 @@
 #include <linux/mm.h>
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/nand_bch.h>
 #include <linux/interrupt.h>
@@ -49,166 +50,6 @@
 
 #include "internals.h"
 
-/* Define default oob placement schemes for large and small page devices */
-static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
-				 struct mtd_oob_region *oobregion)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
-
-	if (section > 1)
-		return -ERANGE;
-
-	if (!section) {
-		oobregion->offset = 0;
-		if (mtd->oobsize == 16)
-			oobregion->length = 4;
-		else
-			oobregion->length = 3;
-	} else {
-		if (mtd->oobsize == 8)
-			return -ERANGE;
-
-		oobregion->offset = 6;
-		oobregion->length = ecc->total - 4;
-	}
-
-	return 0;
-}
-
-static int nand_ooblayout_free_sp(struct mtd_info *mtd, int section,
-				  struct mtd_oob_region *oobregion)
-{
-	if (section > 1)
-		return -ERANGE;
-
-	if (mtd->oobsize == 16) {
-		if (section)
-			return -ERANGE;
-
-		oobregion->length = 8;
-		oobregion->offset = 8;
-	} else {
-		oobregion->length = 2;
-		if (!section)
-			oobregion->offset = 3;
-		else
-			oobregion->offset = 6;
-	}
-
-	return 0;
-}
-
-const struct mtd_ooblayout_ops nand_ooblayout_sp_ops = {
-	.ecc = nand_ooblayout_ecc_sp,
-	.free = nand_ooblayout_free_sp,
-};
-EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
-
-static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
-				 struct mtd_oob_region *oobregion)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
-
-	if (section || !ecc->total)
-		return -ERANGE;
-
-	oobregion->length = ecc->total;
-	oobregion->offset = mtd->oobsize - oobregion->length;
-
-	return 0;
-}
-
-static int nand_ooblayout_free_lp(struct mtd_info *mtd, int section,
-				  struct mtd_oob_region *oobregion)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
-
-	if (section)
-		return -ERANGE;
-
-	oobregion->length = mtd->oobsize - ecc->total - 2;
-	oobregion->offset = 2;
-
-	return 0;
-}
-
-const struct mtd_ooblayout_ops nand_ooblayout_lp_ops = {
-	.ecc = nand_ooblayout_ecc_lp,
-	.free = nand_ooblayout_free_lp,
-};
-EXPORT_SYMBOL_GPL(nand_ooblayout_lp_ops);
-
-/*
- * Support the old "large page" layout used for 1-bit Hamming ECC where ECC
- * are placed at a fixed offset.
- */
-static int nand_ooblayout_ecc_lp_hamming(struct mtd_info *mtd, int section,
-					 struct mtd_oob_region *oobregion)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
-
-	if (section)
-		return -ERANGE;
-
-	switch (mtd->oobsize) {
-	case 64:
-		oobregion->offset = 40;
-		break;
-	case 128:
-		oobregion->offset = 80;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	oobregion->length = ecc->total;
-	if (oobregion->offset + oobregion->length > mtd->oobsize)
-		return -ERANGE;
-
-	return 0;
-}
-
-static int nand_ooblayout_free_lp_hamming(struct mtd_info *mtd, int section,
-					  struct mtd_oob_region *oobregion)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct nand_ecc_ctrl *ecc = &chip->ecc;
-	int ecc_offset = 0;
-
-	if (section < 0 || section > 1)
-		return -ERANGE;
-
-	switch (mtd->oobsize) {
-	case 64:
-		ecc_offset = 40;
-		break;
-	case 128:
-		ecc_offset = 80;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (section == 0) {
-		oobregion->offset = 2;
-		oobregion->length = ecc_offset - 2;
-	} else {
-		oobregion->offset = ecc_offset + ecc->total;
-		oobregion->length = mtd->oobsize - oobregion->offset;
-	}
-
-	return 0;
-}
-
-static const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
-	.ecc = nand_ooblayout_ecc_lp_hamming,
-	.free = nand_ooblayout_free_lp_hamming,
-};
-
 static int check_offs_len(struct nand_chip *chip, loff_t ofs, uint64_t len)
 {
 	int ret = 0;
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index f00d958d724f..566cc1a11679 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -15,6 +15,8 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/mtd/nand.h>
+
 #include "internals.h"
 
 /* Bit for detecting BENAND */
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 9e3b018d0b83..da214aaa0b8a 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -122,6 +122,10 @@ struct nand_page_io_req {
 	int mode;
 };
 
+extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
+extern const struct mtd_ooblayout_ops nand_ooblayout_lp_ops;
+extern const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops;
+
 /**
  * struct nand_ecc_conf - NAND ECC configuration
  * @strength: ECC strength
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 14748183508b..0059f5952187 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1098,9 +1098,6 @@ struct nand_chip {
 	} manufacturer;
 };
 
-extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
-extern const struct mtd_ooblayout_ops nand_ooblayout_lp_ops;
-
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
 {
 	return container_of(mtd, struct nand_chip, base.mtd);
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
