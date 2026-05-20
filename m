Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCD1CD4F54
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2026 00:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m5U+Dcipe+2t5K8nZTAuHNIAU6/Dkv0MndO1nCrQ/H4=; b=bM2jzCg4H4Clv5
	MDSiki9/vDkBtyE/QboEi9QP95ED1v4qxrwWiFEiJx79L9zlBs7etBLm4GDqV3p7rJJCBuUuYxzrp
	rgtIX993zwNspGVEXe6lOjmOvuizS89il1qa588lIinFKHBVu6EODQl13Cpa76FVcMeuhdUS+Wsae
	enHsJsrPiT9/0l1ZdClfakjz9wZMSfmvOlSLmy1cZH3VSbPrBzGay+piS58V+RpeEGTi32sfLR6Bd
	zDplIHZxWta3LUAO7nJY5N4wrlzigzh1vD7DZL4cVNR1WvaM49ZckmdNaVmc7nPGnQOvcXVumqcu4
	zFD3MvfbPY42oVK3peRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPUwU-00000003A6j-472p;
	Wed, 20 May 2026 00:37:46 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPUwS-00000003A67-1rqI
	for linux-mtd@lists.infradead.org;
	Wed, 20 May 2026 00:37:46 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-9125d2a4d36so287452485a.3
        for <linux-mtd@lists.infradead.org>; Tue, 19 May 2026 17:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779237463; x=1779842263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jUD1FsQYm8ZBac7nvsbH5rr2iVlaq2U5jptkB2/TJtA=;
        b=IBqUXBKot25W1CDQlpyYl2fw2P7jcPblx36z/oi+TUIuh3BVBiZcWVM+6ipfXzEsTE
         GtCNxEwDYcSlPBmLUtRzP7isASKwQX6SopJ27mgPc4cIu2OoN5j7g0m2leZ9gIAvZIVH
         p1T6bR0w0Uqq/I0Di9CT2XW+6L3l4I4Vh5I2Xe15VCPZiN7bjj/eCYKbapDdxmahIsBV
         9Dcz0KXp9VgLQe/IPxQ0DwRYmqZ1Tw7+rBzR4wB/590OoQyv5jTBXz+UBfb72t+dE+h/
         ZZwdbW7jmcICgMhYgVB1IK5fJB4VtedWGuaNwRqKuILWnpmz2D9f8eCk7yeNnvGiyjnW
         iNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779237463; x=1779842263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUD1FsQYm8ZBac7nvsbH5rr2iVlaq2U5jptkB2/TJtA=;
        b=gN5nIhWzxzlhvV5qTwUx6Qt0Ojt6b6C7grLmW9AszsLOxKQMlKh/wJ1KSr/2+vsAMt
         XWZlZbX/D2/I2cdgaeKDvC9DL2lQXkgX6CBmgVi6aSx9KnDIy8+OXtEU2pzXXSp0itgh
         7YXd8fookZ8LHDFTS678XYQAan7ZdH5lLNjktD60VStLytLgtv16t0R5UglzDnCprkE5
         R8G3VpmlQsh3B8DqPQlrnoljh1XWwWYACrZptMXO8MywsXe5f67M1DL1lRYk3v056iIR
         bu0N9HIJp++cgQZgx2sfOPp68B9gPNG/q3zI8SGFVviR82biXdPnA4hd5YkvdCYEpG+x
         sv6A==
X-Forwarded-Encrypted: i=1; AFNElJ/vAf+8V7557yb3vFK1SLbgUW/eGK98TELfzx1M7xf7FyxnXaILublNxz8C0gaoti/RA4U1WDili/0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo6dS5SOMhm22EdA8nAPAwZwRZ8nrwW4LIcNhIhA6V6ra5/xcz
	fHiQ83r1QNZs/gj4ulqOZjuEgQYwyBb0+x44LsCiNf1C32Cd6jv7PO2g
X-Gm-Gg: Acq92OGB8XbIr9FpeVNRXzdvZ9gkd0t/vRVqHcTm8+zQDCeymurdFkuyRrok1MSKgSv
	/wFSXpi/3Fl66DvLo3V+iQTaarXamzE0pIFtExRu+BF4Ufw2/1qVcnGGsOxYC7xMKFt5Ygv7IVN
	HUy4BV31SOnUkPpaXRvTZAJmtORHpnUzGKFYKpyxE/GDtC6GNzY1XujJyBoy/a8IYg71YSCCVjm
	gGYgJHeVxpfnnvQB0jtGW4xc8gaeipLDAAEuUTAuyfvCuLehp6BpWSGDedQOPnrQVsgf4dFiSnp
	WgqaNUNSQKz41b61xsRbIXIT+uzktppTNFe3n0Bs2lsa2RyrSgi8p1NRxhf0qCJX5JU/dpQLLHc
	Rb1P+zltaJuDgYh9FEZ7lTf9k3oz/3/bwz0VHFBajsf7O6hKFBXsnlnzwTlMeszKlpx7bQJrHH3
	jDdOpXqf2YUuo79xjChbGhDal4fyCFDFr8eXQ24BsFD3XK3fmqc06Ve6rZzV5+bqB/qQY8e5EWt
	TF9Bg==
X-Received: by 2002:a05:620a:4542:b0:8f0:f1a5:680c with SMTP id af79cd13be357-911cef062f4mr3406807985a.29.1779237462724;
        Tue, 19 May 2026 17:37:42 -0700 (PDT)
Received: from localhost.localdomain ([94.156.149.63])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910c0ec392bsm1970592185a.41.2026.05.19.17.37.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 May 2026 17:37:42 -0700 (PDT)
From: Qing Wu <ses1er@gmail.com>
To: ses1er@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] [v2] mtd: spinand: add support for additional Dosilicon models
Date: Tue, 19 May 2026 20:37:33 -0400
Message-ID: <20260520003733.82514-1-ses1er@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_173744_509519_F2C9CD58 
X-CRM114-Status: GOOD (  15.04  )
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

Link to original v2: https://lore.kernel.org/all/20260217221444.11171-1-ses1er@gmail.com/

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
