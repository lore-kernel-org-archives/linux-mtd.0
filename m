Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992E0C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 00:36:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3368F2075F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 00:36:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NEMMcvyg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3368F2075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lv0iuRphqFApSuqHR6pYgPo+0n1FoagWzKCB22yQwhk=; b=NEMMcvygOKiCGQ
	k0fUjS4Sdwqi69mCL/RdVdSc1ojxtFeP1jnsRrZkx0wHumzh7dNJDSGtX/gE7OD+DuX+wGe+FuPbq
	fMM19pRA0BHf9teNsZK6anXHBA97ZCzFICL5HqEpq1lC70GW9+Qov+vu3mGIyVTVFWBGT4RUtOizQ
	jx6pMit5l4KIaa+pvEjF92J7bNEqvoW4L7BdY94tdzXgjXdHT+p33PuC4DiGvLK76UYlokG/1JWRQ
	RfEQcbkImlHXRpPIaPTxv/OEjJRMt50tHGoeOWEEHKSlicfbOlvvexCy32yHYyfd72WB5ghYif/5K
	HhX4Et/OiIfXo8Y0CiEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeT0h-0003bc-MT; Fri, 29 May 2020 00:36:31 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeSqQ-0006HN-Ix; Fri, 29 May 2020 00:26:02 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 30116200002;
 Fri, 29 May 2020 00:25:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v7 17/20] mtd: rawnand: Hide the generic OOB layout objects
 behind helpers
Date: Fri, 29 May 2020 02:25:14 +0200
Message-Id: <20200529002517.3546-18-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529002517.3546-1-miquel.raynal@bootlin.com>
References: <20200529002517.3546-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_172554_935091_DB63D749 
X-CRM114-Status: GOOD (  15.35  )
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

Stop exposing these objects, create helpers to retrieve them instead.

Also export an helper for the Hamming large page ops for later use.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c |  2 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c  |  2 +-
 drivers/mtd/nand/raw/davinci_nand.c           |  3 +-
 .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |  6 ++--
 drivers/mtd/nand/raw/nand_base.c              | 35 ++++++++++++++-----
 drivers/mtd/nand/raw/nand_toshiba.c           |  2 +-
 drivers/mtd/nand/raw/vf610_nfc.c              |  2 +-
 include/linux/mtd/rawnand.h                   |  5 +--
 8 files changed, 38 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index a0b5c539ca73..594d01229468 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -980,7 +980,7 @@ static int anfc_init_hw_ecc_controller(struct arasan_nfc *nfc,
 		return -EINVAL;
 	}
 
-	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	mtd_set_ooblayout(mtd, nand_get_large_page_layout());
 
 	ecc->steps = mtd->writesize / ecc->size;
 	ecc->algo = NAND_ECC_ALGO_BCH;
diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 2ebcf3087d8d..ab1c6d058e10 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1107,7 +1107,7 @@ static int atmel_nand_pmecc_init(struct nand_chip *chip)
 
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
-	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	mtd_set_ooblayout(mtd, nand_get_large_page_layout());
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 58966a9706b1..85e4606ab184 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -645,7 +645,8 @@ static int davinci_nand_attach_chip(struct nand_chip *chip)
 				mtd_set_ooblayout(mtd,
 						  &hwecc4_small_ooblayout_ops);
 			} else if (chunks == 4 || chunks == 8) {
-				mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+				mtd_set_ooblayout(mtd,
+						  nand_get_large_page_layout());
 				info->chip.ecc.read_page = nand_davinci_read_page_hwecc_oob_first;
 			} else {
 				return -EIO;
diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index 70309f18124c..986fb1c5f352 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -243,8 +243,10 @@ static int ingenic_nand_attach_chip(struct nand_chip *chip)
 	/* For legacy reasons we use a different layout on the qi,lb60 board. */
 	if (of_machine_is_compatible("qi,lb60"))
 		mtd_set_ooblayout(mtd, &qi_lb60_ooblayout_ops);
-	else
+	else if (nfc->soc_info->oob_layout)
 		mtd_set_ooblayout(mtd, nfc->soc_info->oob_layout);
+	else
+		mtd_set_ooblayout(mtd, nand_get_large_page_layout());
 
 	return 0;
 }
@@ -532,7 +534,6 @@ static const struct jz_soc_info jz4740_soc_info = {
 	.data_offset = 0x00000000,
 	.cmd_offset = 0x00008000,
 	.addr_offset = 0x00010000,
-	.oob_layout = &nand_ooblayout_lp_ops,
 };
 
 static const struct jz_soc_info jz4725b_soc_info = {
@@ -546,7 +547,6 @@ static const struct jz_soc_info jz4780_soc_info = {
 	.data_offset = 0x00000000,
 	.cmd_offset = 0x00400000,
 	.addr_offset = 0x00800000,
-	.oob_layout = &nand_ooblayout_lp_ops,
 };
 
 static const struct of_device_id ingenic_nand_dt_match[] = {
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index bc2d5d2e8f4c..1eb478ec1d1c 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -95,11 +95,16 @@ static int nand_ooblayout_free_sp(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-const struct mtd_ooblayout_ops nand_ooblayout_sp_ops = {
+static const struct mtd_ooblayout_ops nand_ooblayout_sp_ops = {
 	.ecc = nand_ooblayout_ecc_sp,
 	.free = nand_ooblayout_free_sp,
 };
-EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
+
+const struct mtd_ooblayout_ops *nand_get_small_page_layout(void)
+{
+	return &nand_ooblayout_sp_ops;
+}
+EXPORT_SYMBOL_GPL(nand_get_small_page_layout);
 
 static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *oobregion)
@@ -131,11 +136,16 @@ static int nand_ooblayout_free_lp(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-const struct mtd_ooblayout_ops nand_ooblayout_lp_ops = {
+static const struct mtd_ooblayout_ops nand_ooblayout_lp_ops = {
 	.ecc = nand_ooblayout_ecc_lp,
 	.free = nand_ooblayout_free_lp,
 };
-EXPORT_SYMBOL_GPL(nand_ooblayout_lp_ops);
+
+const struct mtd_ooblayout_ops *nand_get_large_page_layout(void)
+{
+	return &nand_ooblayout_lp_ops;
+}
+EXPORT_SYMBOL_GPL(nand_get_large_page_layout);
 
 /*
  * Support the old "large page" layout used for 1-bit Hamming ECC where ECC
@@ -205,6 +215,12 @@ static const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
 	.free = nand_ooblayout_free_lp_hamming,
 };
 
+const struct mtd_ooblayout_ops *nand_get_large_page_hamming_layout(void)
+{
+	return &nand_ooblayout_lp_hamming_ops;
+}
+EXPORT_SYMBOL_GPL(nand_get_large_page_hamming_layout);
+
 static int nand_pairing_dist3_get_info(struct mtd_info *mtd, int page,
 				       struct mtd_pairing_info *info)
 {
@@ -5379,7 +5395,7 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 				return -EINVAL;
 			}
 
-			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+			mtd_set_ooblayout(mtd, nand_get_large_page_layout());
 
 		}
 
@@ -5388,7 +5404,7 @@ static int nand_set_ecc_soft_ops(struct nand_chip *chip)
 		 * used, otherwise we don't know how many bytes can really be
 		 * used.
 		 */
-		if (mtd->ooblayout == &nand_ooblayout_lp_ops &&
+		if (mtd->ooblayout == nand_get_large_page_layout() &&
 		    ecc->options & NAND_ECC_MAXIMIZE) {
 			int steps, bytes;
 
@@ -5787,11 +5803,12 @@ static int nand_scan_tail(struct nand_chip *chip)
 		switch (mtd->oobsize) {
 		case 8:
 		case 16:
-			mtd_set_ooblayout(mtd, &nand_ooblayout_sp_ops);
+			mtd_set_ooblayout(mtd, nand_get_small_page_layout());
 			break;
 		case 64:
 		case 128:
-			mtd_set_ooblayout(mtd, &nand_ooblayout_lp_hamming_ops);
+			mtd_set_ooblayout(mtd,
+					  nand_get_large_page_hamming_layout());
 			break;
 		default:
 			/*
@@ -5803,7 +5820,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 			 */
 			if (ecc->engine_type == NAND_ECC_ENGINE_TYPE_NONE) {
 				mtd_set_ooblayout(mtd,
-						&nand_ooblayout_lp_ops);
+						  nand_get_large_page_layout());
 				break;
 			}
 
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index 1180068007a9..bdfbb9d121a5 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -140,7 +140,7 @@ static void toshiba_nand_benand_init(struct nand_chip *chip)
 
 	chip->options |= NAND_SUBPAGE_READ;
 
-	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	mtd_set_ooblayout(mtd, nand_get_large_page_layout());
 }
 
 static void toshiba_nand_decode_id(struct nand_chip *chip)
diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 8ee2c1f539c4..9b863bfcb997 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -779,7 +779,7 @@ static int vf610_nfc_attach_chip(struct nand_chip *chip)
 		mtd->oobsize = 64;
 
 	/* Use default large page ECC layout defined in NAND core */
-	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+	mtd_set_ooblayout(mtd, nand_get_large_page_layout());
 	if (chip->ecc.strength == 32) {
 		nfc->ecc_mode = ECC_60_BYTE;
 		chip->ecc.bytes = 60;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 8f7f1cce3b4b..106f3698875d 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1159,8 +1159,9 @@ struct nand_chip {
 	int (*unlock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
 };
 
-extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
-extern const struct mtd_ooblayout_ops nand_ooblayout_lp_ops;
+const struct mtd_ooblayout_ops *nand_get_small_page_layout(void);
+const struct mtd_ooblayout_ops *nand_get_large_page_layout(void);
+const struct mtd_ooblayout_ops *nand_get_large_page_hamming_layout(void);
 
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
 {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
