Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545CBE9A04A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Feb 2026 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ySFBiPRojDxDsfTeedoN0gSLzfqWfYfmMeMq4jsqWY=; b=bO4N4HVowVJ4yI
	zL0/vlRI+bBJAu0K5GqeY4KYUjmVIWTodIeQw48Y21+gWWHXd4qsPeFLnZVmekwbQ9I9QCDmClnch
	Pt0FIykpVQGw94jYEPHVdRCI+EJf3bFlro1UJ/e4pI8qwFMmph4gkYf92hVWsdyo/ItCLiOoOsGak
	NR+2wJdDG5n4hQgi5h3G5AHVs7FN3iQwZjvW6X8rpCtCjaax3l5+im2rT4ZSCO9r+mqJOVgH5nldg
	f0gR/x7fjdZotpvzRNQilYfjTquWBzCFeQE8v4u92TCyASPTROrczwMxcDMgDEFYsks8T2ysms/vJ
	Wzts3KzIsSkf3Jp9YaBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsSPF-00000008tGA-45UZ;
	Tue, 17 Feb 2026 21:14:53 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsSPC-00000008tFE-3ZI3
	for linux-mtd@lists.infradead.org;
	Tue, 17 Feb 2026 21:14:52 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-89473dca8aaso60793666d6.0
        for <linux-mtd@lists.infradead.org>; Tue, 17 Feb 2026 13:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771362889; x=1771967689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lGuWbmaSOlBrmN/0lXpNFGjgLAKCjErByEWK0/R4iRI=;
        b=I9aY3RZa5kREZg+BowNnUAz0YhTErCvui7z7EWS6ymkMjF6r6fJ8Yd+JFjF/uETnqO
         VmDoyltCV3HYzehgp+1WA5A8YyG9wKpI3v4o87bnvGjjtMTKcqfrGM+3VwJ1iE7a1NCq
         EJA79vXCATcfbNylsOOcYxvmTpXHUI2QDL/n6gi3NzhTWh5YzsATHzMnDCAP2+nyOuGI
         gkv+2XHBOdhV5Hd9oy0zL4MTPyspcOB9Xy8SlxHVTQuSGUxiTX8vkJL2qo1mFJVnSZws
         bxcVzYAls+wFdVJ4LSaS2ub7xAXS/WgXCCoNXIU7VyPLNNlA1jdyR05lIaCAYUgczdMI
         wIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771362889; x=1771967689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGuWbmaSOlBrmN/0lXpNFGjgLAKCjErByEWK0/R4iRI=;
        b=r1AxCC1ijaK1xy/ABlqKenKEmfq2R5A/hOx3woXvIPQIyITN8nMZcXqFAZgPfn4K8R
         yGRWdt4sVhyTrqNzUKQoOqQkY2gQeeP+GjdhlabFWLSpdKs6ko/qux0CljYe30j1XWcK
         AcmRCxytM/wHYU6WRB68BIYqvxjn/3yQSq2ygfuOOm5Idz03kgR2YmkwKBj9Qd1vGNeN
         /I3zKYrw7v607uum/540hGxfcTV8fReD+EExtOlFnDBO4ktjtk2Qdc3vRo0AQLKKIwKM
         DCXsqFVauFqKL2YZH9Xho1OuYhQOtNtj47AfgUkoyLysPXTJeO8zHS75vRAKSi4ddUqi
         ///w==
X-Gm-Message-State: AOJu0YwOfVVvRXUP/Skl8jayja9S0txSk3R0y1yKAtmtTh8UsnB3jsZ6
	iMq9b5hpQTMTpUIqZxuOcF4+L4Jm6Uyn3CVeTPEc78zkqh7BX7TpCVycQyZ1C5I0
X-Gm-Gg: AZuq6aLJxAFwH/75tkT2H1ONlwM/9QYkTr1spGci9CrP38uXHEwMCqUBbmxLwr2B8ud
	PZrKYnQouB2uSwSf05IPEVFy5/dE21s9OUZxS4TfKiKDipCKyy3keVozHSkdxen/4QV2u7AQ/re
	v6FnTrwJ1/gjwbiSNYv+LUBM402r3COH5tnrW6jpVxnoMysJZN/v9O8UXsGRhIYezJuOBQ1i9JH
	rOUp4otqBQHXf4YhQ+fsvOZgTIk2FRkaM++EDNx9qEwr46Nt9ITEx7Di4YD3t6huBfUolUQZb8K
	2xig8ruAXlzYpMa4RdONL0t+gjc9/fLaNF0X+NFbfyJKpzTPUtnQ58L49QD00MR/Vsib/+Kn/+o
	9qpq1fLY28PPpBChWKtkZxIFzocCyCJLcrQbOjrasfxoPs/wHQhIpqPKm3qNNiPn1pLGlHiZIJ2
	JII9vedn3/jqEsWLuZu3kCKNPehhimsLosqa7grhtoqCM3RzUY4ClgCARHFweLWCj0+opDH72A1
	zOkNJI=
X-Received: by 2002:a05:6214:da1:b0:888:89fd:a727 with SMTP id 6a1803df08f44-897404b6a0bmr191256456d6.49.1771362888953;
        Tue, 17 Feb 2026 13:14:48 -0800 (PST)
Received: from localhost.localdomain ([94.156.149.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cd8d33fsm166944226d6.30.2026.02.17.13.14.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Feb 2026 13:14:48 -0800 (PST)
From: Qing Wu <ses1er@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Qing Wu <ses1er@gmail.com>
Subject: [PATCH] mtd: spinand: add support for additional Dosilicon models
Date: Tue, 17 Feb 2026 16:14:27 -0500
Message-ID: <20260217211427.9120-1-ses1er@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_131450_948519_A289BF59 
X-CRM114-Status: GOOD (  14.79  )
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
 drivers/mtd/nand/spi/dosilicon.c | 219 ++++++++++++++++++++++++++++---
 1 file changed, 204 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/spi/dosilicon.c b/drivers/mtd/nand/spi/dosilicon.c
index f99899866ceb..790671b65060 100644
--- a/drivers/mtd/nand/spi/dosilicon.c
+++ b/drivers/mtd/nand/spi/dosilicon.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Author: Ahmed Naseef <naseefkm@gmail.com>
+ * Additions: Qing Wu <ses1er@gmail.com>
  */
 
 #include <linux/device.h>
@@ -9,21 +10,27 @@
 
 #define SPINAND_MFR_DOSILICON        0xE5
 
+#define DOSICON_STATUS_ECC_MASK			GENMASK(6, 4)
+#define DOSICON_STATUS_ECC_NO_BITFLIPS		(0 << 4)
+#define DOSICON_STATUS_ECC_1TO3_BITFLIPS	(1 << 4)
+#define DOSICON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
+#define DOSICON_STATUS_ECC_7TO8_BITFLIPS	(5 << 4)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
-		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
-		SPINAND_PROG_LOAD_1S_1S_4S_OP(true, 0, NULL, 0),
-		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
+		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
+		SPINAND_PROG_LOAD(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_variants,
-		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
-		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
+		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
-static int ds35xx_ooblayout_ecc(struct mtd_info *mtd, int section,
+static int ds35xxga_ooblayout_ecc(struct mtd_info *mtd, int section,
 				struct mtd_oob_region *region)
 {
 	if (section > 3)
@@ -35,7 +42,7 @@ static int ds35xx_ooblayout_ecc(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static int ds35xx_ooblayout_free(struct mtd_info *mtd, int section,
+static int ds35xxga_ooblayout_free(struct mtd_info *mtd, int section,
 				 struct mtd_oob_region *region)
 {
 	if (section > 3)
@@ -53,11 +60,67 @@ static int ds35xx_ooblayout_free(struct mtd_info *mtd, int section,
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
+	/* Reserve 1 bytes for the BBM. */
+	region->offset = 1;
+	region->length = 63;
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
@@ -67,7 +130,16 @@ static const struct spinand_info dosilicon_spinand_table[] = {
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
@@ -76,7 +148,124 @@ static const struct spinand_info dosilicon_spinand_table[] = {
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
