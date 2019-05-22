Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CBCC282DD
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 22:06:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FC2D218BB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 22:06:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RwL7rkG+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FC2D218BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allycomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5GbVQctwFnqKdR3Dj5tTB7zKj/FSI665T9NA7hLySg=; b=RwL7rkG+uYz7GH
	/kuP8lUCed8ZQxo5+y5O19uE2i4WPMWbNAGuWpuAgAcpEK/FddpDxP6kugnrHsrhFv0x5ZaAhIPQv
	oVzON1WppYo8lQ088V3J3mhK4PdckEREgkDeZ6ShzhwKB+uaEnqZO2UPbbpQczJzafTHiT7HTpgyX
	lrTXKKRUluXBDhr0Gyu8GwRkbeuKeAMIefaaFxAbow/JPGIu2vgE90yTHdZ9JiD8hd0J1novH9g7s
	lhGBqzwTHC4E6A3dQFEt5dkMljRHjKyiubZd7gfou9NTkr5SeqxVkfjb9dWDpgCCWflHA+J8ZrMLU
	Jsef4eRqG6V6V8l4brLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTZNt-00053i-KT; Wed, 22 May 2019 22:06:53 +0000
Received: from mx.allycomm.com ([138.68.30.55])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTZNp-00051X-Mu
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 22:06:51 +0000
Received: from allycomm.com (unknown [IPv6:2601:647:5401:2210::49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.allycomm.com (Postfix) with ESMTPSA id 8ED723CB18;
 Wed, 22 May 2019 15:06:18 -0700 (PDT)
From: Jeff Kletsky <lede@allycomm.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v4 3/3] mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG
Date: Wed, 22 May 2019 15:05:55 -0700
Message-Id: <20190522220555.11626-4-lede@allycomm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522220555.11626-1-lede@allycomm.com>
References: <20190522220555.11626-1-lede@allycomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_150649_759665_2928ACBD 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: linux-mtd@lists.infradead.org, Jeff Kletsky <git-commits@allycomm.com>,
 kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Jeff Kletsky <git-commits@allycomm.com>

The GigaDevice GD5F1GQ4UFxxG SPI NAND is in current production devices
and, while it has the same logical layout as the E-series devices,
it differs in the SPI interfacing in significant ways.

This support is contingent on previous commits to:

  * Add support for two-byte device IDs
  * Define macros for page-read ops with three-byte addresses

http://www.gigadevice.com/datasheet/gd5f1gq4xfxxg/

Signed-off-by: Jeff Kletsky <git-commits@allycomm.com>

Reported-by: kbuild test robot <lkp@intel.com>
---
 drivers/mtd/nand/spi/gigadevice.c | 79 +++++++++++++++++++++++++------
 1 file changed, 64 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index e5586390026a..b0c26eb5e8b6 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -9,11 +9,17 @@
 #include <linux/mtd/spinand.h>
 
 #define SPINAND_MFR_GIGADEVICE			0xC8
+
 #define GD5FXGQ4XA_STATUS_ECC_1_7_BITFLIPS	(1 << 4)
 #define GD5FXGQ4XA_STATUS_ECC_8_BITFLIPS	(3 << 4)
 
 #define GD5FXGQ4UEXXG_REG_STATUS2		0xf0
 
+#define GD5FXGQ4UXFXXG_STATUS_ECC_MASK		(7 << 4)
+#define GD5FXGQ4UXFXXG_STATUS_ECC_NO_BITFLIPS	(0 << 4)
+#define GD5FXGQ4UXFXXG_STATUS_ECC_1_3_BITFLIPS	(1 << 4)
+#define GD5FXGQ4UXFXXG_STATUS_ECC_UNCOR_ERROR	(7 << 4)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -22,6 +28,14 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
 
+static SPINAND_OP_VARIANTS(read_cache_variants_f,
+		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP_3A(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(false, 0, 0, NULL, 0));
+
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
 		SPINAND_PROG_LOAD(true, 0, NULL, 0));
@@ -59,6 +73,11 @@ static int gd5fxgq4xa_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static const struct mtd_ooblayout_ops gd5fxgq4xa_ooblayout = {
+	.ecc = gd5fxgq4xa_ooblayout_ecc,
+	.free = gd5fxgq4xa_ooblayout_free,
+};
+
 static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
 					 u8 status)
 {
@@ -83,7 +102,7 @@ static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
-static int gd5fxgq4uexxg_ooblayout_ecc(struct mtd_info *mtd, int section,
+static int gd5fxgq4_variant2_ooblayout_ecc(struct mtd_info *mtd, int section,
 				       struct mtd_oob_region *region)
 {
 	if (section)
@@ -95,7 +114,7 @@ static int gd5fxgq4uexxg_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int gd5fxgq4uexxg_ooblayout_free(struct mtd_info *mtd, int section,
+static int gd5fxgq4_variant2_ooblayout_free(struct mtd_info *mtd, int section,
 					struct mtd_oob_region *region)
 {
 	if (section)
@@ -108,6 +127,11 @@ static int gd5fxgq4uexxg_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static const struct mtd_ooblayout_ops gd5fxgq4_variant2_ooblayout = {
+	.ecc = gd5fxgq4_variant2_ooblayout_ecc,
+	.free = gd5fxgq4_variant2_ooblayout_free,
+};
+
 static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
 					u8 status)
 {
@@ -150,15 +174,25 @@ static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
-static const struct mtd_ooblayout_ops gd5fxgq4xa_ooblayout = {
-	.ecc = gd5fxgq4xa_ooblayout_ecc,
-	.free = gd5fxgq4xa_ooblayout_free,
-};
+static int gd5fxgq4ufxxg_ecc_get_status(struct spinand_device *spinand,
+					u8 status)
+{
+	switch (status & GD5FXGQ4UXFXXG_STATUS_ECC_MASK) {
+	case GD5FXGQ4UXFXXG_STATUS_ECC_NO_BITFLIPS:
+		return 0;
 
-static const struct mtd_ooblayout_ops gd5fxgq4uexxg_ooblayout = {
-	.ecc = gd5fxgq4uexxg_ooblayout_ecc,
-	.free = gd5fxgq4uexxg_ooblayout_free,
-};
+	case GD5FXGQ4UXFXXG_STATUS_ECC_1_3_BITFLIPS:
+		return 3;
+
+	case GD5FXGQ4UXFXXG_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	default: /* (2 << 4) through (6 << 4) are 4-8 corrected errors */
+		return ((status & GD5FXGQ4UXFXXG_STATUS_ECC_MASK) >> 4) + 2;
+	}
+
+	return -EINVAL;
+}
 
 static const struct spinand_info gigadevice_spinand_table[] = {
 	SPINAND_INFO("GD5F1GQ4xA", 0xF1,
@@ -195,25 +229,40 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&gd5fxgq4uexxg_ooblayout,
+		     SPINAND_ECCINFO(&gd5fxgq4_variant2_ooblayout,
 				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F1GQ4UFxxG", 0xb148,
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_f,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&gd5fxgq4_variant2_ooblayout,
+				     gd5fxgq4ufxxg_ecc_get_status)),
 };
 
 static int gigadevice_spinand_detect(struct spinand_device *spinand)
 {
 	u8 *id = spinand->id.data;
+	u16 did;
 	int ret;
 
 	/*
-	 * For GD NANDs, There is an address byte needed to shift in before IDs
-	 * are read out, so the first byte in raw_id is dummy.
+	 * Earlier GDF5-series devices (A,E) return [0][MID][DID]
+	 * Later (F) devices return [MID][DID1][DID2]
 	 */
-	if (id[1] != SPINAND_MFR_GIGADEVICE)
+
+	if (id[0] == SPINAND_MFR_GIGADEVICE)
+		did = (id[1] << 8) + id[2];
+	else if (id[0] == 0 && id[1] == SPINAND_MFR_GIGADEVICE)
+		did = id[2];
+	else
 		return 0;
 
 	ret = spinand_match_and_init(spinand, gigadevice_spinand_table,
 				     ARRAY_SIZE(gigadevice_spinand_table),
-				     id[2]);
+				     did);
 	if (ret)
 		return ret;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
