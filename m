Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39367E9A03E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Feb 2026 22:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dYXmqk3titLvo854a/tDm/FcIffAHbYZkIM/EN5ltkQ=; b=3Huenh7gmNC96O
	D5svIzwjWkKJXyMtg9Pf/8hnyXutW1YX0eoy3674F/6MkXuntXt2L+b+x9IOTW/udehtN4rZZC1a9
	VZC5uxMoXGCWMUy/TgzqV3lE6cBKueRDQ36ie/TonkLHm5j3NzyYDo8jAARG8O17zOM/szpooVGMA
	VI9XevNCSLpImVv2QeG+e4uzp+LMLbdj9dyMuXYZTjbs6epfujDj0nbHq7kRBD0uRMEdDmxIEKK3j
	f59wsuLt20tZi7yxPZS4xabZIfXHMH4pSSXpKqdB7zVxt+yKHiHSJx6iR9AJmyp6AMRDkaGgKsFZV
	B9q3q+CmwEyS9Hpmr33A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsTLO-00000008yCk-35mQ;
	Tue, 17 Feb 2026 22:14:58 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsTLM-00000008yCN-2O9I
	for linux-mtd@lists.infradead.org;
	Tue, 17 Feb 2026 22:14:57 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8954c9daaeaso65686306d6.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Feb 2026 14:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771366495; x=1771971295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ex1+/gblJkmklt0qn4fCR0hlDJHh6uIwSzRJi9ZYNVA=;
        b=Bu1rCDIg0l8xVi4cALTt4vHoP63+ZvpeFTXqloIJ+Og3l72PVo0D9nvwlBY7vR4HNq
         uT3w9k20trARECwteUa/5baxUALK4YzsVqWgFmQsTER8NF79QkfTkCrEQWabYDmmM1Kt
         4grneWDgh10vrVMeTzldeD3OUYnVXRcArxxYjDDiV7eDyPc71UbwFO6r2e8a0g7NUCch
         72WH1kxjqYB7/f32cZUB1akCrp8dJRBEvX34KNUiqZa+lL43NlRqadTi3OSrjgpG8aO2
         eHJD37fIW/+pdrV9hnrsIM3F8z9W3t11JvhTYqWSBffQns9n+lur3JZ7ZX1Ke3byXd45
         ISEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771366495; x=1771971295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ex1+/gblJkmklt0qn4fCR0hlDJHh6uIwSzRJi9ZYNVA=;
        b=K1D+f5IcGPyS8CfMcJlJ6S/8YLIXEbTkm96UFE1DFvP5cMK3P8kApe7fFE/D0lYcEf
         Hzice5nF0rrN6ijqrlNcuTZO88HBbjNyIIZf0QW8EB7/Iq8ClOUsJfVURTq20gIfY3HW
         BCAVf9fUMewAJ3a8OVdFqdd5SEKr6KBR/Cgws3p52Bsi2D9G1e44yBFLw0ADRMjlwB36
         YyQ6SLk0k7uxOLd6dg4sdZYXo/eAR2Z5HK659CXgIoSNh6EBhGinDIYQLjoLonoP+JOS
         VY/iWdXswZq1KVEvhu+rZj0lkpXrl+pontqlMPeIlsF6Y5nwSUmupRpxsGdwwkHVPqNm
         bvlw==
X-Gm-Message-State: AOJu0YykbSQkiCGGj7eelxse6N8rB+kuiG9u4Dlnwp6qdpcp+L8LuyKL
	6a4i0X+e0geQDW/blmj5dM32kO8YM4OslmDCh2IyXgL98Ttv2wVShbjiM1UIUWkD
X-Gm-Gg: AZuq6aJq+SQ8YD8P5SIcq2VL/iOqKVaIIqrvOxDbQQGURaZnqbILZTYLzTLTdZxbj4u
	/e6Fm/20PKqfJVJsGijKaBEXF6NR420AfWQ7RXQT8pLYmTeRpnhHKCNwK8LPlyJrKXF9H3BAr1j
	UU3+70NSm+wGeElLXFk6TQ/dQXji1BudEAKSLrrEHpqUg4A77KTz+zTyc0WvA5eWXTtKg3y2sxV
	QMjJD8IIBWrYah/8t3SphxuoPx+8jpRA/6Fm8ym4YUrQh5p4nkSbNlqaIbAeah0P62lHy2QQgDP
	8boqIF4E2ziirzcztvbuEuxQvwk9wBygCAVe6c09xGBstHdksqR2AWImKVKZMrSsOrNyGWt6D1h
	JWM4/nkhwQpkv+MFy8kMXVYIumimilxVBuONee5vpbJ1rSt3hnjN6dUMR3IWgQOKEfhpe8IGMOF
	c4MLelDAJDTCMH+TmNzvC/zGyry1166gElUeleWCVmt/UwE9OlMaY5cttpsAvvj7J0m69Avun9o
	S5tWQc=
X-Received: by 2002:ad4:4ee4:0:b0:896:f320:b18c with SMTP id 6a1803df08f44-89734881468mr241769086d6.6.1771366494809;
        Tue, 17 Feb 2026 14:14:54 -0800 (PST)
Received: from localhost.localdomain ([94.156.149.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc7bd20sm175255436d6.2.2026.02.17.14.14.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Feb 2026 14:14:54 -0800 (PST)
From: Qing Wu <ses1er@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Qing Wu <ses1er@gmail.com>
Subject: [PATCH] [v2] mtd: spinand: add support for additional Dosilicon models
Date: Tue, 17 Feb 2026 17:14:44 -0500
Message-ID: <20260217221444.11171-1-ses1er@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_141456_665985_A816B747 
X-CRM114-Status: GOOD (  14.57  )
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

Link: https://lore.kernel.org/all/20260217211427.9120-1-ses1er@gmail.com/

Signed-off-by: Qing Wu <ses1er@gmail.com>
---
Changes in v2:
- Fixed compilation errors.
- Link to v1: https://lore.kernel.org/all/20260217211427.9120-1-ses1er@gmail.com
---
 drivers/mtd/nand/spi/dosilicon.c | 203 +++++++++++++++++++++++++++++--
 1 file changed, 196 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/spi/dosilicon.c b/drivers/mtd/nand/spi/dosilicon.c
index f99899866ceb..6a5100c6bf99 100644
--- a/drivers/mtd/nand/spi/dosilicon.c
+++ b/drivers/mtd/nand/spi/dosilicon.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Author: Ahmed Naseef <naseefkm@gmail.com>
+ * Additions: Qing Wu <ses1er@gmail.com>
  */
 
 #include <linux/device.h>
@@ -9,6 +10,12 @@
 
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
@@ -23,7 +30,7 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
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
