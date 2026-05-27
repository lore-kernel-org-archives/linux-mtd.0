Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EACCD5BD5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 13:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Ub7dzoLRJ/RAbVeRu1216qWRjzmew0bHoVeGoT/2uY=; b=e4MRoQs2kTTuYb
	VU8LnuntnYTWqMuJYYEdi6/bXtG3Q9lKOLYmhkjx5JJG6hE0H+iMlI1okhdQ58l/Y9kNhYQCEQ4cf
	nReY3qmmcv39PKHpjIT0q5PG5jlZl+nWklFvgNOt1P1A4LRxDYGq/WToC3RqgqV0XTjkaX/sHc7ZM
	RVLVrKjmgMsPnVfI5HQi7AhhmJFo61/pdqIdy2R0YJO9sT8H2U3bNo7aY/rr/4cde6MwYVkpZ4RPU
	WPof3hePXXRL/SiPSaOurXkt+WsogxDF8wFD7Yp7cQv5Tr4BmUmVHawqAp/ry2fRMtrLtFyb2pdam
	0bBblrSTCrBbxcyuQA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDzb-000000049iI-3PZz;
	Wed, 27 May 2026 13:08:15 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDzZ-000000049hv-2ZOL
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 13:08:15 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8b74b460d77so157643666d6.3
        for <linux-mtd@lists.infradead.org>; Wed, 27 May 2026 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779887292; x=1780492092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DO+OVa0uvgfe0VBImj35jZte/cP6pXfJrwHyo3JhXxA=;
        b=seGFuHL/GXHiW4EJsZ3rgt2irzSBjCDaks3Wrda12MzXIPX+ZzIJeRJxPBiKUPrCPS
         rlMESNlEVI63GTPlFhhvcYwJIsr+y2i/jgB2vPzFFDiRJrOfdQF+xVDZCrt2f3uUq0eN
         yfK8rqNKMkjszPaU8IFkAKhi2VlzRDjrVGyCwqeQRkVJH/VcCzr8ePOY8/XUlrbU7l+5
         rlZ7rAFCo6+xnG/FhIyuOWutPT11fG6Z/VOlgTUIaZTDPaWllmtEboomFI5FB1iIFxAa
         Ff0fmsij2pvmxyKDPNTzPUYxBSjz30Qf/qP3+dszP7kimE9K8Ctcpjc0BgVxY1K1kDZ8
         IcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779887292; x=1780492092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DO+OVa0uvgfe0VBImj35jZte/cP6pXfJrwHyo3JhXxA=;
        b=CHNpvdKOq2W0yf0cCgH89dfNpaI4ZQ1scNPePpC/jMLoF6jh2arENS6Ena0jwWnegK
         nZEiDIU7B7L+cajScFficMwcG21UgLqL2eT4jbutF0X2n4MaUiUxTdIuH2udBI6myaI7
         Ko2yFYKvAhWu9RKEp1c/+dhfXMUdN97hSV5xh6Zx1C7MKeTr7yC8mb4UflW5Oajs4Za6
         TbNcph/2vvOFXqSh6Os1MAPM6s2iXa29tqwBD/6AQyWeMC42y1xFlelWpPD34ZVM4xvm
         VbQ83jN/G0N19d2qL6ArkuV2UAR9Oxe56YsjrOmKYaLLkrS0XVC48yRciZco+JLFCjpf
         UO3A==
X-Forwarded-Encrypted: i=1; AFNElJ+tN1pU0UdCIgUeaiA2+1bMnF/1aE+lzcdiP6sEB0OpHOtHEEs3GJUQI9VTUxnxFwtdfSrcOjv1p8c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaZ95NpGSP5Arwx5k21x/aXXpCGp5IM4yM4osBRPMuBLCU4kPt
	Yx30s8xJipZXkuOahudVPW7otXEEqe2ckUXyxT7rIE2ONUtJsUzZ2zEq
X-Gm-Gg: Acq92OGSvB2zw4IrM9ky5QJZ7jWCoVmDhjiwwnr/k4dLjWfbPPvX2HFBuh3pqXC1Cgb
	pDGklw39yLIFwnvdxQXheY/74J7s33mhDvlLxJbCEOtfNapNgOJh8nmdT/6snPW9hH0U6QKwxfF
	lMnfmTtpt+IK35sbFbexu0Jom0xR0eJuw3vKXzqLtV0HcVXrzEq613EeBXDM7Esx9LmP5f10QUt
	HIOFtDB4QqjbyOqMTIi2+67QCN7RpMmLvBM05NuOlxIObJpzKjjyNV7bJZ02owRMHtkFaQGs/3M
	rPUuN59WnWAeBcMy6Ws108m6zavUlijS45FDRddLVdMImo6vgHyWPRZukGSGqPqZKbUXhiE1mfZ
	s9XeCw/Q5ZFLutUPf2qbT3hmucnYYyynCyIzqHTXnlxGxeXPA+1l533siQ2F4DegRi7I6rLgnes
	LXB/bmAq/Q2r+ZoY8X5BIZyMpIAtOOPe8cvrFnQ98x5CBLK6QvPin31/GioqUSkQcdwBlzIlFTQ
	p6ox07MkYwwWx+f
X-Received: by 2002:a05:6214:1c43:b0:8b5:84:aa1b with SMTP id 6a1803df08f44-8cc7b50024dmr354653206d6.9.1779887292067;
        Wed, 27 May 2026 06:08:12 -0700 (PDT)
Received: from localhost.localdomain ([94.156.149.59])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cca9c02e56sm70321176d6.43.2026.05.27.06.08.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 May 2026 06:08:11 -0700 (PDT)
From: Qing Wu <ses1er@gmail.com>
To: ses1er@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] mtd: spinand: dosilicon: Add support for additional models
Date: Wed, 27 May 2026 09:07:54 -0400
Message-ID: <20260527130754.10867-1-ses1er@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_060813_679176_B46F2557 
X-CRM114-Status: GOOD (  14.68  )
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

Add support for additional Dosilicon SPI NAND chips.

Datasheets for chips included in this patch: https://www.dosilicon.com/SPI%20NAND%20Flash.html

Tested on a TP-Link TL-7DR7250 with a Dosilicon DS35Q1GB (0xE5 0xF1)

Signed-off-by: Qing Wu <ses1er@gmail.com>
---
Changes in v4:
- Fixed compilation errors.
Changes in v3:
- Changed title
- Updated 2 bytes for BBM
- Link to v2: https://lore.kernel.org/all/20260520003733.82514-1-ses1er@gmail.com/
Changes in v2:
- Fixed compilation errors.
- Link to v1: https://lore.kernel.org/all/20260217211427.9120-1-ses1er@gmail.com
---
 drivers/mtd/nand/spi/dosilicon.c | 202 +++++++++++++++++++++++++++++--
 1 file changed, 195 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/spi/dosilicon.c b/drivers/mtd/nand/spi/dosilicon.c
index f99899866ceb..8f96ea7922e8 100644
--- a/drivers/mtd/nand/spi/dosilicon.c
+++ b/drivers/mtd/nand/spi/dosilicon.c
@@ -9,6 +9,12 @@
 
 #define SPINAND_MFR_DOSILICON        0xE5
 
+#define DOSICON_STATUS_ECC_MASK			GENMASK(6, 4)
+#define DOSICON_STATUS_ECC_NO_BITFLIPS		(0 << 4)
+#define DOSICON_STATUS_ECC_1TO3_BITFLIPS	(1 << 4)
+#define DOSICON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
+#define DOSICON_STATUS_ECC_7TO8_BITFLIPS	(5 << 4)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0, 0),
@@ -23,7 +29,7 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
-static int ds35xx_ooblayout_ecc(struct mtd_info *mtd, int section,
+static int ds35xxga_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *region)
 {
 	if (section > 3)
@@ -35,7 +41,7 @@ static int ds35xx_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int ds35xx_ooblayout_free(struct mtd_info *mtd, int section,
+static int ds35xxga_ooblayout_free(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *region)
 {
 	if (section > 3)
@@ -53,11 +59,67 @@ static int ds35xx_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops ds35xx_ooblayout = {
-	.ecc = ds35xx_ooblayout_ecc,
-	.free = ds35xx_ooblayout_free,
+static const struct mtd_ooblayout_ops ds35xxga_ooblayout = {
+	.ecc = ds35xxga_ooblayout_ecc,
+	.free = ds35xxga_ooblayout_free,
 };
 
+static int ds35xxgb_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = 64;
+	region->length = 64;
+
+	return 0;
+}
+
+static int ds35xxgb_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	/* Reserve 2 bytes for the BBM. */
+	region->offset = 2;
+	region->length = 62;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops ds35xxgb_ooblayout = {
+	.ecc = ds35xxgb_ooblayout_ecc,
+	.free = ds35xxgb_ooblayout_free,
+};
+
+static int ds35xxgb_ecc_get_status(struct spinand_device *spinand,
+				   u8 status)
+{
+	switch (status & DOSICON_STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	case DOSICON_STATUS_ECC_1TO3_BITFLIPS:
+		return 3;
+
+	case DOSICON_STATUS_ECC_4TO6_BITFLIPS:
+		return 6;
+
+	case DOSICON_STATUS_ECC_7TO8_BITFLIPS:
+		return 8;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static const struct spinand_info dosilicon_spinand_table[] = {
 	SPINAND_INFO("DS35Q1GA",
 		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x71),
@@ -67,7 +129,16 @@ static const struct spinand_info dosilicon_spinand_table[] = {
 					 &write_cache_variants,
 					 &update_cache_variants),
 		SPINAND_HAS_QE_BIT,
-		SPINAND_ECCINFO(&ds35xx_ooblayout, NULL)),
+		SPINAND_ECCINFO(&ds35xxga_ooblayout, NULL)),
+	SPINAND_INFO("DS35Q2GA",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x72),
+		NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 2, 1, 1),
+		NAND_ECCREQ(4, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxga_ooblayout, NULL)),
 	SPINAND_INFO("DS35M1GA",
 		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x21),
 		NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -76,7 +147,124 @@ static const struct spinand_info dosilicon_spinand_table[] = {
 					 &write_cache_variants,
 					 &update_cache_variants),
 		SPINAND_HAS_QE_BIT,
-		SPINAND_ECCINFO(&ds35xx_ooblayout, NULL)),
+		SPINAND_ECCINFO(&ds35xxga_ooblayout, NULL)),
+	SPINAND_INFO("DS35M2GA",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x22),
+		NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 2, 1, 1),
+		NAND_ECCREQ(4, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxga_ooblayout, NULL)),
+	SPINAND_INFO("DS35Q2GB",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xF2),
+		NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
+		NAND_ECCREQ(8, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxgb_ooblayout, ds35xxgb_ecc_get_status)),
+	SPINAND_INFO("DS35M1GB",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xA1),
+		NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		NAND_ECCREQ(8, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxgb_ooblayout, ds35xxgb_ecc_get_status)),
+	SPINAND_INFO("DS35Q1GB",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xF1),
+		NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		NAND_ECCREQ(8, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxgb_ooblayout, ds35xxgb_ecc_get_status)),
+	SPINAND_INFO("DS35Q4GM",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xF4),
+		NAND_MEMORG(1, 2048, 128, 64, 4096, 80, 2, 1, 1),
+		NAND_ECCREQ(8, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxgb_ooblayout, ds35xxgb_ecc_get_status)),
+	SPINAND_INFO("DS35Q12B",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xF5),
+		NAND_MEMORG(1, 2048, 128, 64, 512, 10, 1, 1, 1),
+		NAND_ECCREQ(8, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxgb_ooblayout, ds35xxgb_ecc_get_status)),
+	SPINAND_INFO("DS35M12B",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xA5),
+		NAND_MEMORG(1, 2048, 128, 64, 512, 10, 1, 1, 1),
+		NAND_ECCREQ(8, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxgb_ooblayout, ds35xxgb_ecc_get_status)),
+	SPINAND_INFO("DS35Q1GD-IB",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x51),
+		NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		NAND_ECCREQ(8, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					&write_cache_variants,
+					&update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxgb_ooblayout, ds35xxgb_ecc_get_status)),
+	SPINAND_INFO("DS35M4GB-IB",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64),
+		NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 1, 1, 1),
+		NAND_ECCREQ(8, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxgb_ooblayout, ds35xxgb_ecc_get_status)),
+	SPINAND_INFO("DS35Q4GB-IB",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xB4),
+		NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 1, 1, 1),
+		NAND_ECCREQ(8, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxgb_ooblayout, ds35xxgb_ecc_get_status)),
+	SPINAND_INFO("DS35Q12C-IB",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75),
+		NAND_MEMORG(1, 2048, 128, 64, 512, 10, 1, 1, 1),
+		NAND_ECCREQ(8, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxgb_ooblayout, ds35xxgb_ecc_get_status)),
+	SPINAND_INFO("DS35M12C-IB",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x25),
+		NAND_MEMORG(1, 2048, 128, 64, 512, 10, 1, 1, 1),
+		NAND_ECCREQ(8, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxgb_ooblayout, ds35xxgb_ecc_get_status)),
+	SPINAND_INFO("DS35Q2GBS",
+		SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xB2),
+		NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		NAND_ECCREQ(8, 512),
+		SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					 &write_cache_variants,
+					 &update_cache_variants),
+		SPINAND_HAS_QE_BIT,
+		SPINAND_ECCINFO(&ds35xxgb_ooblayout, ds35xxgb_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops dosilicon_spinand_manuf_ops = {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
