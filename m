Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D13C433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Jan 2022 08:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HkVvFliRf/s3wGOnb1JvnwWm7LKE05H9/EoA9uQTEU=; b=Lzb5JC48YKeFY5
	QMUjUkImufKwpEIL3zZ9for3PNlwUu2FLs3QBGU6PKlDA6/JmB2QWcTXeiNJ0SVmZq3Viqt48Sd1U
	kBBzfiHqh7FbOewNR66GOrOy2v7Om8GpR3J7D4o0llosZBUX1UpDEn2CQ7If3Gd50t5EKHmLN2U23
	DsroVEq06wdhwJwi7bv5fhk8s0lXnhakstpSNZhzBlZIbn3mb38Xmou0gklvbEoVd2loSbvkRILj2
	M0PgDjm92ZzfDl+EGDCtQ+9Pgd8PzIMAtszyoEkeg+L99oXz2rOtVExgmu5nTTIhW7hEBwuqXhnND
	xs+jEBUkid9zDY5INvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3ZNE-006m5g-JY; Sat, 01 Jan 2022 08:04:21 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Z4E-006iq4-If
 for linux-mtd@lists.infradead.org; Sat, 01 Jan 2022 07:44:44 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2017iYTH085947;
 Sat, 1 Jan 2022 01:44:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641023074;
 bh=txZu6fU3MKR3uE/18fxqGGNnCmTSd/BV0SpgDwy3tGg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZDLAo+cn43AspJoYhnVSvzN/+5AuksfLs6Xg4gc6xSfl8+aZrxKbT6mTdbOAKB8aQ
 VBO5QwWstotd8GFYUiSHDoFMOigqy2GMAlK9i8Y2Gru3z5DE6DaACK9waU+yHRNHs+
 tvFB0nGDsiHR+ORob9UJl7jPgHAVgivgHtbfuXTM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2017iYv1091236
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 1 Jan 2022 01:44:34 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 1
 Jan 2022 01:44:34 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 1 Jan 2022 01:44:34 -0600
Received: from LT5CD112GSQZ.ent.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2017gpwm033162;
 Sat, 1 Jan 2022 01:44:29 -0600
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Daniel Palmer <daniel@0x0f.com>, Alexander
 Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v3 17/17] mtd: spinand: winbond: Add support for Winbond
 W35N01JW SPI NAND flash
Date: Sat, 1 Jan 2022 13:12:50 +0530
Message-ID: <20220101074250.14443-18-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220101074250.14443-1-a-nandan@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_234442_739577_42606CB0 
X-CRM114-Status: GOOD (  13.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Winbond W35N01JW is a SPI NAND flash supporting Octal DTR SPI protocol.
Add op_variants and ctrl_ops_variants for W35N01JW, thus adding all
required Octal DTR ops. Add W35N01JW's OOB layout functions for the
mtd_ooblayout_ops. Finally, add an entry for W35N01JW in spinand_info
table.

Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/winbond.c | 71 ++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 5b943169120e..42fdb578f731 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -42,6 +42,37 @@ static SPINAND_OP_VARIANTS(update_cache_variants_w25xxgv,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
+static SPINAND_OP_VARIANTS(read_cache_variants_w35n01jw,
+		SPINAND_PAGE_READ_FROM_CACHE_OCTALIO_DTR_OP(0, 24, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants_w35n01jw,
+		SPINAND_PROG_LOAD_OCTALIO_DTR(true, 0, NULL, 0),
+		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants_w35n01jw,
+		SPINAND_PROG_LOAD_OCTALIO_DTR(false, 0, NULL, 0),
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
+static SPINAND_CTRL_OPS_VARIANTS(ctrl_ops_variants_w35n01jw,
+		SPINAND_CTRL_OPS(SPINAND_8D_8D_8D,
+				 SPINAND_RESET_OP_OCTAL_DTR,
+				 SPINAND_GET_FEATURE_OP_OCTAL_DTR(0, NULL),
+				 SPINAND_SET_FEATURE_OP_OCTAL_DTR(0, NULL),
+				 SPINAND_WR_EN_DIS_OP_OCTAL_DTR(true),
+				 SPINAND_BLK_ERASE_OP_OCTAL_DTR(0),
+				 SPINAND_PAGE_READ_OP_OCTAL_DTR(0),
+				 SPINAND_PROG_EXEC_OP_OCTAL_DTR(0)),
+		SPINAND_CTRL_OPS(SPINAND_1S_1S_1S,
+				 SPINAND_RESET_OP,
+				 SPINAND_GET_FEATURE_OP(0, NULL),
+				 SPINAND_SET_FEATURE_OP(0, NULL),
+				 SPINAND_WR_EN_DIS_OP(true),
+				 SPINAND_BLK_ERASE_OP(0),
+				 SPINAND_PAGE_READ_OP(0),
+				 SPINAND_PROG_EXEC_OP(0)));
+
 static int w25m02gv_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -66,11 +97,40 @@ static int w25m02gv_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static int w35n01jw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 12;
+	region->length = 4;
+
+	return 0;
+}
+
+static int w35n01jw_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 2;
+	region->length = 10;
+
+	return 0;
+}
+
 static const struct mtd_ooblayout_ops w25m02gv_ooblayout = {
 	.ecc = w25m02gv_ooblayout_ecc,
 	.free = w25m02gv_ooblayout_free,
 };
 
+static const struct mtd_ooblayout_ops w35n01jw_ooblayout = {
+	.ecc = w35n01jw_ooblayout_ecc,
+	.free = w35n01jw_ooblayout_free,
+};
+
 static int w25m02gv_select_target(struct spinand_device *spinand,
 				  unsigned int target)
 {
@@ -105,6 +165,17 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants_w25xxgv),
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
+	SPINAND_INFO("W35N01JW",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdc),
+		     NAND_MEMORG(1, 4096, 128, 64, 512, 20, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_w35n01jw,
+					      &write_cache_variants_w35n01jw,
+					      &update_cache_variants_w35n01jw),
+		     SPINAND_HAS_OCTAL_DTR_BIT | SPINAND_HAS_CR_FEAT_BIT,
+		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
+		     SPINAND_INFO_CTRL_OPS_VARIANTS(&ctrl_ops_variants_w35n01jw)),
+
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
