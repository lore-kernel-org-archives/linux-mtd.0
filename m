Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E06CD4F54
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 10:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ACY9aFDc91P8jMwNKJ0YqoCbyeGmXMLxFgmTx411SLw=; b=189m2WnZeRXEt8
	cDXFA+iI/z/mIIK65n76c7+vAzIWPst3Z/Lx3ZBWgsGhSjnaatcTTwR3haJQxCln3YYqQ7fQdzH1B
	iDUNwrJNwdg5+/1AmJs0LVvC/n+iSx9sD0GORW9AxLIHmocFRDtw8/naatFLFiSAQK8OkMhG9y5ey
	B+ROiIpcXn1Ppolh+2Is6g38CW+WUFiLZXGIwQHTD3nEWIWhvdPmnSoQW76Jepcky7PmNTXHNpev0
	+3mUfbPseHaa8JZ69X8NKUrkOTk9oL/6XB5aQvu5Dcll7RtpktwZme7S83DBQX43OjBc108q9wEZY
	W0KF3KDgm3yN6f5nuflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSB42-00000003gzv-1rwL;
	Wed, 27 May 2026 10:00:38 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSB3w-00000003guk-39Y3
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 10:00:35 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-51306c36c3eso126208601cf.0
        for <linux-mtd@lists.infradead.org>; Wed, 27 May 2026 03:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876031; x=1780480831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TYYX7F9TU2UqvnQ4rqTvcIfA7/lt//2BpmT7qAbp7ck=;
        b=fzZYX08RlEKH5sw7aFG3IqmCpMtDkYbotZE0idepss6wUnzyoUaf6gc5TIsH94KA+Z
         dxgMnhDn0g3JVLk3RYIMFJTDdaNico0EiRccfLyiXvNnk1olk0f7OTl8dTSIjD9/lSKv
         04VAJanYXjwwMbdEIhQmrue29ITGDy8pZttDzU/0/hYNv8RXiOVTYOz6QvYj4N4IWkb9
         P6cIFLC8fmNu2Jz9CfqvzQWZ95DUeI8SBEOLyKCPgQGIlPudoWuD1RdN0ihl/H4aJ1r1
         uaqBpNoC6aFiJeIrX11h50P2Q9bCjwa+v7/VdTVkXvu8PulM6PskVFKep8N+Kw2Wo1+C
         6ZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876031; x=1780480831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYYX7F9TU2UqvnQ4rqTvcIfA7/lt//2BpmT7qAbp7ck=;
        b=Fa+VEbTo/cGMcaVG349KRbRwiASeBoHqFThtEX4H6uTa08xtY0WOkXx7u4CsNKYeKG
         rd/YnVJscIrcalUz231nuwcNPXZCcXCZZGfbXWmJ6td4QM1F6lMH/lOGGHSlyNTZ+QsS
         dgFlBrhWlr/olXWGDlMGCXCbJ6d7555aDUGur0LUOHtL80KprvxB6P708aQuIjqITcow
         vcemBk6eVhZ3hgaHv+0ISda9gWDTTSXh60Nedo03wJS2U/zZjZhy1jZmqv00G3DmkbcU
         wJpd7OwTubC6ImA/HblDSXbSw5AHfAo+8B6lQlj24u1X5voCPPdjHlybnhFVL2fzmQxS
         xkSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9l79HOyrZQq5vf4OeAyQDAw0+FYrWQW/rvzt1335d7PJSPjZwXtfvFZUk/QNdoioc0c3jaf92L3Xw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwC1LE14sSgj4uIeDqtUhdts7FnX36dZPlVGEWS6ReCHjoidolY
	xaqJMbpyOwLc7gx/94Lb4Q3ncBA9km0LFgvWt2NeFLWpY/uoDe4HmLAkdkz4iXBCWBpmqA==
X-Gm-Gg: Acq92OE3pEtHCe7PVWqcXKKzRgtsbSwNQj3AIJMfhEev5Wea/1W1HIhZgR+1yxrvpc5
	zD05TTCIsW1kAS+HLb5UF1O0Z+JDgI+klsZ24tmNFMHS8GW6jjcXWHkIGQMejwG4DorSadwIcae
	vzxmiipHQszV3woM5hhoLYTP8z8AakDW7v5A6UBYgbcE3EqlTtcXaL4zJ3jnc6qFqg4MjGlUb7C
	RSBxHXZ8R+W3/WfpvshRNywwup+zN+ybDifjGRdiCDOCHCnMz792O6uxBfSlDE07WQsTbpDlBX8
	OvbXEW18AnFbFPtXh8/aJr7vHq5/BC7Lk7FI8qXUDpcha9Aj0Y5kaQDbw4Ynrl5ceY8iFc1aMCK
	U9QVYsQ4w6hvPWQAgRRd5TpAcZgo0ZYly0qIzUkECK5VrdbxnFr+CF66SDva+MnfCvUmj9WPt7X
	5VUPH3ea/NtyLUa9AFmXso7epMaeIrT03VAReXpoMoKahAa6uxWeBxoToMIHmQFJikfbCMMS9rE
	3d23A==
X-Received: by 2002:a05:622a:350:b0:50f:b724:85e3 with SMTP id d75a77b69052e-516d42bfc09mr313428371cf.17.1779876030931;
        Wed, 27 May 2026 03:00:30 -0700 (PDT)
Received: from localhost.localdomain ([94.156.149.59])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51706adc63dsm39366011cf.16.2026.05.27.03.00.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 May 2026 03:00:30 -0700 (PDT)
From: Qing Wu <ses1er@gmail.com>
To: ses1er@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: spinand: dosilicon: Add support for additional models
Date: Wed, 27 May 2026 06:00:21 -0400
Message-ID: <20260527100021.76247-1-ses1er@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_030032_839322_A94275CD 
X-CRM114-Status: GOOD (  14.90  )
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
Changes in v3:
- Changed title
- Updated 2 bytes for BBM
- Link to v2: https://lore.kernel.org/all/20260520003733.82514-1-ses1er@gmail.com/
Changes in v2:
- Fixed compilation errors.
- Link to v1: https://lore.kernel.org/all/20260217211427.9120-1-ses1er@gmail.com
---
 drivers/mtd/nand/spi/dosilicon.c | 218 ++++++++++++++++++++++++++++---
 1 file changed, 203 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/spi/dosilicon.c b/drivers/mtd/nand/spi/dosilicon.c
index f99899866ceb..fcd967c1bcbc 100644
--- a/drivers/mtd/nand/spi/dosilicon.c
+++ b/drivers/mtd/nand/spi/dosilicon.c
@@ -9,21 +9,27 @@
 
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
