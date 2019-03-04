Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5F0C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:49:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DFF42070B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 22:49:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qRxy1/Eu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h1ueOTOq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DFF42070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/JfVoiNwVAanpA372V9EhiaEgP1D7eFzyqmvd81ygg=; b=qRxy1/EukZuKry
	OKQi1ysPjntwUtOd70kgvVNUw9Rsx711tUnyF/o88Timj20sECzVeghCPey640AQ0LwNH2kPxauEj
	J8XF1UATCwRRdKoTcQm6d8DbwzP3WMVZ4dXH0lwY9/FupQH1E+4qRy+NN3+hUQmllwC9PG/vaqs9C
	S5Z/H5J/p+YNB5TSzeSFr0iGE73TuZNMYvsdocYgfuGIQNZNnFmWsuPXvjwVHaq0k7pYl0pvBgd/C
	veWIXRKumW1ziOn6P+rIYMglTr9kooh3utZ2UhflCuctLdVgqVsH7B6LQHu627WcCCUePIZRiRK7m
	aZmdqVMorbbkAvIYHeJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wPD-0004Bh-Us; Mon, 04 Mar 2019 22:49:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wMl-0000N8-UC; Mon, 04 Mar 2019 22:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6aajeg/PV+PbWpH/C4wbN/YzyIMeA4SmEZ5UmB4i1Ko=; b=h1ueOTOqlf4zbfsQG4cl5Jpq6G
 B/r8NHXz9yJse9D2P/6ZqG/kbDDZBRLVpfA+pHK6YrDFUNpTLb/YaUkSBUju3gQCY/QNELLC3m7gR
 Eib2fGErFcogrydXafQfl1eXtOsDiGUo9fdFT3EUMwe4Y88coYVlqvlGI0m9RtBdILWn1L0IRPyIZ
 OToCi2S/xZhEHfLcj5tJymDqIbk875TQPqtBK5vm2wDXRqpW5852T0lYDlgAil0AG4M5EFeIFdMwK
 r8Be16YCIyTePGgK73Qd8EkXs06aTID2V4sILd1AczXsNWBiaqF02yYM6Fve9QUpb6qemV1NKkeqc
 ndG+TN0Q==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w66-00030M-DC; Mon, 04 Mar 2019 22:30:12 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D893E24000C;
 Mon,  4 Mar 2019 22:29:44 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 12/36] mtd: nand: Move standard OOB layouts to the generic
 ECC core
Date: Mon,  4 Mar 2019 23:28:17 +0100
Message-Id: <20190304222841.13899-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_223010_484496_44819799 
X-CRM114-Status: GOOD (  21.95  )
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

These OOB layouts are generic to all NAND chips, the should not be
restricted to be used only by raw NAND controller drivers. They might
later be used by generic ECC engines and SPI-NAND devices as well.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc/engine.c       | 161 +++++++++++++++++++++++++++
 drivers/mtd/nand/raw/Kconfig        |   1 +
 drivers/mtd/nand/raw/nand_base.c    | 162 +---------------------------
 drivers/mtd/nand/raw/nand_toshiba.c |   2 +
 include/linux/mtd/nand.h            |   4 +
 include/linux/mtd/rawnand.h         |   3 -
 6 files changed, 170 insertions(+), 163 deletions(-)

diff --git a/drivers/mtd/nand/ecc/engine.c b/drivers/mtd/nand/ecc/engine.c
index 4c7943ddf2cc..f52ffce8e684 100644
--- a/drivers/mtd/nand/ecc/engine.c
+++ b/drivers/mtd/nand/ecc/engine.c
@@ -133,6 +133,167 @@ int nand_ecc_finish_io_req(struct nand_device *nand,
 }
 EXPORT_SYMBOL(nand_ecc_finish_io_req);
 
+/* Define default oob placement schemes for large and small page devices */
+static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
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
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
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
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
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
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
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
+	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
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
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("Generic ECC engine");
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 952dc50a8634..621991a242c1 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -12,6 +12,7 @@ config MTD_NAND_ECC_SW_HAMMING_SMC
 menuconfig MTD_RAW_NAND
 	tristate "Raw/Parallel NAND Device Support"
 	select MTD_NAND_CORE
+	select MTD_NAND_ECC
 	select MTD_NAND_ECC_SW_HAMMING
 	help
 	  This enables support for accessing all type of raw/parallel
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index b12ca291c7e3..187e6b1fd84d 100644
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
@@ -5735,6 +5576,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 		goto err_nand_manuf_cleanup;
 	}
 	ecc->total = ecc->steps * ecc->bytes;
+	chip->base.ecc.ctx.total = ecc->total;
 	if (ecc->total > mtd->oobsize) {
 		WARN(1, "Total number of ECC bytes exceeded oobsize\n");
 		ret = -EINVAL;
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
index 45caaa489085..277c0cf822b9 100644
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
  * @provider: ECC engine provider type
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 95b0c7114701..0c2beb6fcf0b 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1099,9 +1099,6 @@ struct nand_chip {
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
