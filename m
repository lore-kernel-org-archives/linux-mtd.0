Return-Path: <SRS0=9DP4=3M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD0EC33CAA
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 08:04:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FD8F24655
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 08:04:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="feXaVdus"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FD8F24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kioxia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=UAGQW0AyUji0r3XKVDzsVGF87dM6Sp4QrNmbZd16oWc=; b=feX
	aVduse6gBUT+nPt+WHBDijVjwhn9wveK2v7Jh1eNtg+ltfiRYr0r2ZgmycwMuHxGxbdI/5P7CNgij
	j6XM1IM2I2//4syWYBvagPshiV6wNp1nhe6q2nKw7G0kq1J1UqYmmeF/bQhyr7+cTiof5f4AobGqV
	qVVenDfJ6bTe0n0IXn1QoFstYEeCCyfkICmA35Z9B85pFtYwfqpCKCcYTfO/gACPUwzpgpl3NCQuX
	EFNQ1tj4exntFjn0xMObWhi4cGRDltrFuAkiJR3sKRYMlISSoF0LK8UOZhVz01LSO4VNuKyWfz/F4
	ZAkYzhcnAz8vqo4fSesFfnDjlxxKFlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuXTk-0001lV-QJ; Thu, 23 Jan 2020 08:04:40 +0000
Received: from mo-csw1516.securemx.jp ([210.130.202.155]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuXTe-0001l5-79
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2020 08:04:37 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 00N84HvF029403;
 Thu, 23 Jan 2020 17:04:17 +0900
X-Iguazu-Qid: 34trOzu6X0FWqQfsel
X-Iguazu-QSIG: v=2; s=0; t=1579766656; q=34trOzu6X0FWqQfsel;
 m=pTr+mSjPK091CWNCIihQcPNTPYUhiCgNUOlQ3hsrZY8=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
 by relay.securemx.jp (mx-mr1510) id 00N84FR2006162;
 Thu, 23 Jan 2020 17:04:16 +0900
Received: from enc01.localdomain ([106.186.93.100])
 by imx2.toshiba.co.jp  with ESMTP id 00N84Fnp019529;
 Thu, 23 Jan 2020 17:04:15 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.localdomain  with ESMTP id 00N84EXP024358;
 Thu, 23 Jan 2020 17:04:15 +0900
From: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
To: miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: [PATCH] mtd: nand: Rename Toshiba Memory to Kioxia
Date: Thu, 23 Jan 2020 17:04:03 +0900
X-TSB-HOP: ON
Message-Id: <1579766643-4983-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_000434_513015_022AE8E4 
X-CRM114-Status: GOOD (  20.70  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Rename Toshiba Memory to Kioxia since the company name has changed.

Signed-off-by: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
---
 drivers/mtd/nand/raw/Makefile       |   2 +-
 drivers/mtd/nand/raw/internals.h    |   4 +-
 drivers/mtd/nand/raw/nand_ids.c     |   2 +-
 drivers/mtd/nand/raw/nand_kioxia.c  | 159 ++++++++++++++++++++++++++++++
 drivers/mtd/nand/raw/nand_toshiba.c | 159 ------------------------------
 drivers/mtd/nand/spi/Makefile       |   2 +-
 drivers/mtd/nand/spi/core.c         |   2 +-
 drivers/mtd/nand/spi/kioxia.c       | 188 ++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/toshiba.c      | 188 ------------------------------------
 include/linux/mtd/spinand.h         |   2 +-
 10 files changed, 354 insertions(+), 354 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/nand_kioxia.c
 delete mode 100644 drivers/mtd/nand/raw/nand_toshiba.c
 create mode 100644 drivers/mtd/nand/spi/kioxia.c
 delete mode 100644 drivers/mtd/nand/spi/toshiba.c

diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 2d136b1..e7eb3b5 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -68,4 +68,4 @@ nand-objs += nand_hynix.o
 nand-objs += nand_macronix.o
 nand-objs += nand_micron.o
 nand-objs += nand_samsung.o
-nand-objs += nand_toshiba.o
+nand-objs += nand_kioxia.o
diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index cba6fe7..25054fe 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -30,7 +30,7 @@
 #define NAND_MFR_SAMSUNG	0xec
 #define NAND_MFR_SANDISK	0x45
 #define NAND_MFR_STMICRO	0x20
-#define NAND_MFR_TOSHIBA	0x98
+#define NAND_MFR_KIOXIA		0x98
 #define NAND_MFR_WINBOND	0xef
 
 /**
@@ -72,7 +72,7 @@ struct nand_manufacturer {
 extern const struct nand_manufacturer_ops macronix_nand_manuf_ops;
 extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
 extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
-extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
+extern const struct nand_manufacturer_ops kioxia_nand_manuf_ops;
 
 /* Core functions */
 const struct nand_manufacturer *nand_get_manufacturer(u8 id);
diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index ba27902..24c8bb3 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -181,7 +181,7 @@ struct nand_flash_dev nand_flash_ids[] = {
 	{NAND_MFR_SAMSUNG, "Samsung", &samsung_nand_manuf_ops},
 	{NAND_MFR_SANDISK, "SanDisk"},
 	{NAND_MFR_STMICRO, "ST Micro"},
-	{NAND_MFR_TOSHIBA, "Toshiba", &toshiba_nand_manuf_ops},
+	{NAND_MFR_KIOXIA, "Kioxia", &kioxia_nand_manuf_ops},
 	{NAND_MFR_WINBOND, "Winbond"},
 };
 
diff --git a/drivers/mtd/nand/raw/nand_kioxia.c b/drivers/mtd/nand/raw/nand_kioxia.c
new file mode 100644
index 0000000..ae85e71
--- /dev/null
+++ b/drivers/mtd/nand/raw/nand_kioxia.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2017 Free Electrons
+ * Copyright (C) 2017 NextThing Co
+ *
+ * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
+ */
+
+#include "internals.h"
+
+/* Bit for detecting BENAND */
+#define KIOXIA_NAND_ID4_IS_BENAND		BIT(7)
+
+/* Recommended to rewrite for BENAND */
+#define KIOXIA_NAND_STATUS_REWRITE_RECOMMENDED	BIT(3)
+
+static int kioxia_nand_benand_eccstatus(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret;
+	unsigned int max_bitflips = 0;
+	u8 status;
+
+	/* Check Status */
+	ret = nand_status_op(chip, &status);
+	if (ret)
+		return ret;
+
+	if (status & NAND_STATUS_FAIL) {
+		/* uncorrected */
+		mtd->ecc_stats.failed++;
+	} else if (status & KIOXIA_NAND_STATUS_REWRITE_RECOMMENDED) {
+		/* corrected */
+		max_bitflips = mtd->bitflip_threshold;
+		mtd->ecc_stats.corrected += max_bitflips;
+	}
+
+	return max_bitflips;
+}
+
+static int
+kioxia_nand_read_page_benand(struct nand_chip *chip, uint8_t *buf,
+			     int oob_required, int page)
+{
+	int ret;
+
+	ret = nand_read_page_raw(chip, buf, oob_required, page);
+	if (ret)
+		return ret;
+
+	return kioxia_nand_benand_eccstatus(chip);
+}
+
+static int
+kioxia_nand_read_subpage_benand(struct nand_chip *chip, uint32_t data_offs,
+				uint32_t readlen, uint8_t *bufpoi, int page)
+{
+	int ret;
+
+	ret = nand_read_page_op(chip, page, data_offs,
+				bufpoi + data_offs, readlen);
+	if (ret)
+		return ret;
+
+	return kioxia_nand_benand_eccstatus(chip);
+}
+
+static void kioxia_nand_benand_init(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	/*
+	 * On BENAND, the entire OOB region can be used by the MTD user.
+	 * The calculated ECC bytes are stored into other isolated
+	 * area which is not accessible to users.
+	 * This is why chip->ecc.bytes = 0.
+	 */
+	chip->ecc.bytes = 0;
+	chip->ecc.size = 512;
+	chip->ecc.strength = 8;
+	chip->ecc.read_page = kioxia_nand_read_page_benand;
+	chip->ecc.read_subpage = kioxia_nand_read_subpage_benand;
+	chip->ecc.write_page = nand_write_page_raw;
+	chip->ecc.read_page_raw = nand_read_page_raw_notsupp;
+	chip->ecc.write_page_raw = nand_write_page_raw_notsupp;
+
+	chip->options |= NAND_SUBPAGE_READ;
+
+	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
+}
+
+static void kioxia_nand_decode_id(struct nand_chip *chip)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_memory_organization *memorg;
+
+	memorg = nanddev_get_memorg(&chip->base);
+
+	nand_decode_ext_id(chip);
+
+	/*
+	 * Toshiba 24nm raw SLC (i.e., not BENAND) have 32B OOB per
+	 * 512B page. For Toshiba SLC, we decode the 5th/6th byte as
+	 * follows:
+	 * - ID byte 6, bits[2:0]: 100b -> 43nm, 101b -> 32nm,
+	 *                         110b -> 24nm
+	 * - ID byte 5, bit[7]:    1 -> BENAND, 0 -> raw SLC
+	 */
+	if (chip->id.len >= 6 && nand_is_slc(chip) &&
+	    (chip->id.data[5] & 0x7) == 0x6 /* 24nm */ &&
+	    !(chip->id.data[4] & 0x80) /* !BENAND */) {
+		memorg->oobsize = 32 * memorg->pagesize >> 9;
+		mtd->oobsize = memorg->oobsize;
+	}
+
+	/*
+	 * Extract ECC requirements from 6th id byte.
+	 * For Toshiba SLC, ecc requrements are as follows:
+	 *  - 43nm: 1 bit ECC for each 512Byte is required.
+	 *  - 32nm: 4 bit ECC for each 512Byte is required.
+	 *  - 24nm: 8 bit ECC for each 512Byte is required.
+	 */
+	if (chip->id.len >= 6 && nand_is_slc(chip)) {
+		chip->base.eccreq.step_size = 512;
+		switch (chip->id.data[5] & 0x7) {
+		case 0x4:
+			chip->base.eccreq.strength = 1;
+			break;
+		case 0x5:
+			chip->base.eccreq.strength = 4;
+			break;
+		case 0x6:
+			chip->base.eccreq.strength = 8;
+			break;
+		default:
+			WARN(1, "Could not get ECC info");
+			chip->base.eccreq.step_size = 0;
+			break;
+		}
+	}
+}
+
+static int kioxia_nand_init(struct nand_chip *chip)
+{
+	if (nand_is_slc(chip))
+		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
+
+	/* Check that chip is BENAND and ECC mode is on-die */
+	if (nand_is_slc(chip) && chip->ecc.mode == NAND_ECC_ON_DIE &&
+	    chip->id.data[4] & KIOXIA_NAND_ID4_IS_BENAND)
+		kioxia_nand_benand_init(chip);
+
+	return 0;
+}
+
+const struct nand_manufacturer_ops kioxia_nand_manuf_ops = {
+	.detect = kioxia_nand_decode_id,
+	.init = kioxia_nand_init,
+};
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
deleted file mode 100644
index 9c03fbb..0000000
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ /dev/null
@@ -1,159 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2017 Free Electrons
- * Copyright (C) 2017 NextThing Co
- *
- * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
- */
-
-#include "internals.h"
-
-/* Bit for detecting BENAND */
-#define TOSHIBA_NAND_ID4_IS_BENAND		BIT(7)
-
-/* Recommended to rewrite for BENAND */
-#define TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED	BIT(3)
-
-static int toshiba_nand_benand_eccstatus(struct nand_chip *chip)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	int ret;
-	unsigned int max_bitflips = 0;
-	u8 status;
-
-	/* Check Status */
-	ret = nand_status_op(chip, &status);
-	if (ret)
-		return ret;
-
-	if (status & NAND_STATUS_FAIL) {
-		/* uncorrected */
-		mtd->ecc_stats.failed++;
-	} else if (status & TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED) {
-		/* corrected */
-		max_bitflips = mtd->bitflip_threshold;
-		mtd->ecc_stats.corrected += max_bitflips;
-	}
-
-	return max_bitflips;
-}
-
-static int
-toshiba_nand_read_page_benand(struct nand_chip *chip, uint8_t *buf,
-			      int oob_required, int page)
-{
-	int ret;
-
-	ret = nand_read_page_raw(chip, buf, oob_required, page);
-	if (ret)
-		return ret;
-
-	return toshiba_nand_benand_eccstatus(chip);
-}
-
-static int
-toshiba_nand_read_subpage_benand(struct nand_chip *chip, uint32_t data_offs,
-				 uint32_t readlen, uint8_t *bufpoi, int page)
-{
-	int ret;
-
-	ret = nand_read_page_op(chip, page, data_offs,
-				bufpoi + data_offs, readlen);
-	if (ret)
-		return ret;
-
-	return toshiba_nand_benand_eccstatus(chip);
-}
-
-static void toshiba_nand_benand_init(struct nand_chip *chip)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-
-	/*
-	 * On BENAND, the entire OOB region can be used by the MTD user.
-	 * The calculated ECC bytes are stored into other isolated
-	 * area which is not accessible to users.
-	 * This is why chip->ecc.bytes = 0.
-	 */
-	chip->ecc.bytes = 0;
-	chip->ecc.size = 512;
-	chip->ecc.strength = 8;
-	chip->ecc.read_page = toshiba_nand_read_page_benand;
-	chip->ecc.read_subpage = toshiba_nand_read_subpage_benand;
-	chip->ecc.write_page = nand_write_page_raw;
-	chip->ecc.read_page_raw = nand_read_page_raw_notsupp;
-	chip->ecc.write_page_raw = nand_write_page_raw_notsupp;
-
-	chip->options |= NAND_SUBPAGE_READ;
-
-	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
-}
-
-static void toshiba_nand_decode_id(struct nand_chip *chip)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct nand_memory_organization *memorg;
-
-	memorg = nanddev_get_memorg(&chip->base);
-
-	nand_decode_ext_id(chip);
-
-	/*
-	 * Toshiba 24nm raw SLC (i.e., not BENAND) have 32B OOB per
-	 * 512B page. For Toshiba SLC, we decode the 5th/6th byte as
-	 * follows:
-	 * - ID byte 6, bits[2:0]: 100b -> 43nm, 101b -> 32nm,
-	 *                         110b -> 24nm
-	 * - ID byte 5, bit[7]:    1 -> BENAND, 0 -> raw SLC
-	 */
-	if (chip->id.len >= 6 && nand_is_slc(chip) &&
-	    (chip->id.data[5] & 0x7) == 0x6 /* 24nm */ &&
-	    !(chip->id.data[4] & 0x80) /* !BENAND */) {
-		memorg->oobsize = 32 * memorg->pagesize >> 9;
-		mtd->oobsize = memorg->oobsize;
-	}
-
-	/*
-	 * Extract ECC requirements from 6th id byte.
-	 * For Toshiba SLC, ecc requrements are as follows:
-	 *  - 43nm: 1 bit ECC for each 512Byte is required.
-	 *  - 32nm: 4 bit ECC for each 512Byte is required.
-	 *  - 24nm: 8 bit ECC for each 512Byte is required.
-	 */
-	if (chip->id.len >= 6 && nand_is_slc(chip)) {
-		chip->base.eccreq.step_size = 512;
-		switch (chip->id.data[5] & 0x7) {
-		case 0x4:
-			chip->base.eccreq.strength = 1;
-			break;
-		case 0x5:
-			chip->base.eccreq.strength = 4;
-			break;
-		case 0x6:
-			chip->base.eccreq.strength = 8;
-			break;
-		default:
-			WARN(1, "Could not get ECC info");
-			chip->base.eccreq.step_size = 0;
-			break;
-		}
-	}
-}
-
-static int toshiba_nand_init(struct nand_chip *chip)
-{
-	if (nand_is_slc(chip))
-		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
-
-	/* Check that chip is BENAND and ECC mode is on-die */
-	if (nand_is_slc(chip) && chip->ecc.mode == NAND_ECC_ON_DIE &&
-	    chip->id.data[4] & TOSHIBA_NAND_ID4_IS_BENAND)
-		toshiba_nand_benand_init(chip);
-
-	return 0;
-}
-
-const struct nand_manufacturer_ops toshiba_nand_manuf_ops = {
-	.detect = toshiba_nand_decode_id,
-	.init = toshiba_nand_init,
-};
diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 9662b9c..820c83f 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-spinand-objs := core.o gigadevice.o macronix.o micron.o paragon.o toshiba.o winbond.o
+spinand-objs := core.o gigadevice.o macronix.o micron.o paragon.o kioxia.o winbond.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 89f6bee..5c80ee7 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -758,7 +758,7 @@ static int spinand_create_dirmaps(struct spinand_device *spinand)
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
 	&paragon_spinand_manufacturer,
-	&toshiba_spinand_manufacturer,
+	&kioxia_spinand_manufacturer,
 	&winbond_spinand_manufacturer,
 };
 
diff --git a/drivers/mtd/nand/spi/kioxia.c b/drivers/mtd/nand/spi/kioxia.c
new file mode 100644
index 0000000..44fd9c3
--- /dev/null
+++ b/drivers/mtd/nand/spi/kioxia.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 exceet electronics GmbH
+ * Copyright (c) 2018 Kontron Electronics GmbH
+ *
+ * Author: Frieder Schrempf <frieder.schrempf@kontron.de>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_KIOXIA			0x98
+#define KIOXIA_STATUS_ECC_HAS_BITFLIPS_T	(3 << 4)
+
+static SPINAND_OP_VARIANTS(read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants,
+		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants,
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
+static int tc58cxgxsx_ooblayout_ecc(struct mtd_info *mtd, int section,
+				    struct mtd_oob_region *region)
+{
+	if (section > 0)
+		return -ERANGE;
+
+	region->offset = mtd->oobsize / 2;
+	region->length = mtd->oobsize / 2;
+
+	return 0;
+}
+
+static int tc58cxgxsx_ooblayout_free(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
+{
+	if (section > 0)
+		return -ERANGE;
+
+	/* 2 bytes reserved for BBM */
+	region->offset = 2;
+	region->length = (mtd->oobsize / 2) - 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops tc58cxgxsx_ooblayout = {
+	.ecc = tc58cxgxsx_ooblayout_ecc,
+	.free = tc58cxgxsx_ooblayout_free,
+};
+
+static int tc58cxgxsx_ecc_get_status(struct spinand_device *spinand,
+				     u8 status)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+	u8 mbf = 0;
+	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(0x30, &mbf);
+
+	switch (status & STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	case STATUS_ECC_HAS_BITFLIPS:
+	case KIOXIA_STATUS_ECC_HAS_BITFLIPS_T:
+		/*
+		 * Let's try to retrieve the real maximum number of bitflips
+		 * in order to avoid forcing the wear-leveling layer to move
+		 * data around if it's not necessary.
+		 */
+		if (spi_mem_exec_op(spinand->spimem, &op))
+			return nand->eccreq.strength;
+
+		mbf >>= 4;
+
+		if (WARN_ON(mbf > nand->eccreq.strength || !mbf))
+			return nand->eccreq.strength;
+
+		return mbf;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static const struct spinand_info kioxia_spinand_table[] = {
+	/* 3.3V 1Gb */
+	SPINAND_INFO("TC58CVG0S3", 0xC2,
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
+				     tc58cxgxsx_ecc_get_status)),
+	/* 3.3V 2Gb */
+	SPINAND_INFO("TC58CVG1S3", 0xCB,
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
+				     tc58cxgxsx_ecc_get_status)),
+	/* 3.3V 4Gb */
+	SPINAND_INFO("TC58CVG2S0", 0xCD,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
+				     tc58cxgxsx_ecc_get_status)),
+	/* 1.8V 1Gb */
+	SPINAND_INFO("TC58CYG0S3", 0xB2,
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
+				     tc58cxgxsx_ecc_get_status)),
+	/* 1.8V 2Gb */
+	SPINAND_INFO("TC58CYG1S3", 0xBB,
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
+				     tc58cxgxsx_ecc_get_status)),
+	/* 1.8V 4Gb */
+	SPINAND_INFO("TC58CYG2S0", 0xBD,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
+				     tc58cxgxsx_ecc_get_status)),
+};
+
+static int kioxia_spinand_detect(struct spinand_device *spinand)
+{
+	u8 *id = spinand->id.data;
+	int ret;
+
+	/*
+	 * Toshiba SPI NAND read ID needs a dummy byte,
+	 * so the first byte in id is garbage.
+	 */
+	if (id[1] != SPINAND_MFR_KIOXIA)
+		return 0;
+
+	ret = spinand_match_and_init(spinand, kioxia_spinand_table,
+				     ARRAY_SIZE(kioxia_spinand_table),
+				     id[2]);
+	if (ret)
+		return ret;
+
+	return 1;
+}
+
+static const struct spinand_manufacturer_ops kioxia_spinand_manuf_ops = {
+	.detect = kioxia_spinand_detect,
+};
+
+const struct spinand_manufacturer kioxia_spinand_manufacturer = {
+	.id = SPINAND_MFR_KIOXIA,
+	.name = "Kioxia",
+	.ops = &kioxia_spinand_manuf_ops,
+};
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
deleted file mode 100644
index 1cb3760..0000000
--- a/drivers/mtd/nand/spi/toshiba.c
+++ /dev/null
@@ -1,188 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2018 exceet electronics GmbH
- * Copyright (c) 2018 Kontron Electronics GmbH
- *
- * Author: Frieder Schrempf <frieder.schrempf@kontron.de>
- */
-
-#include <linux/device.h>
-#include <linux/kernel.h>
-#include <linux/mtd/spinand.h>
-
-#define SPINAND_MFR_TOSHIBA		0x98
-#define TOSH_STATUS_ECC_HAS_BITFLIPS_T	(3 << 4)
-
-static SPINAND_OP_VARIANTS(read_cache_variants,
-		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
-		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
-
-static SPINAND_OP_VARIANTS(write_cache_variants,
-		SPINAND_PROG_LOAD(true, 0, NULL, 0));
-
-static SPINAND_OP_VARIANTS(update_cache_variants,
-		SPINAND_PROG_LOAD(false, 0, NULL, 0));
-
-static int tc58cxgxsx_ooblayout_ecc(struct mtd_info *mtd, int section,
-				     struct mtd_oob_region *region)
-{
-	if (section > 0)
-		return -ERANGE;
-
-	region->offset = mtd->oobsize / 2;
-	region->length = mtd->oobsize / 2;
-
-	return 0;
-}
-
-static int tc58cxgxsx_ooblayout_free(struct mtd_info *mtd, int section,
-				      struct mtd_oob_region *region)
-{
-	if (section > 0)
-		return -ERANGE;
-
-	/* 2 bytes reserved for BBM */
-	region->offset = 2;
-	region->length = (mtd->oobsize / 2) - 2;
-
-	return 0;
-}
-
-static const struct mtd_ooblayout_ops tc58cxgxsx_ooblayout = {
-	.ecc = tc58cxgxsx_ooblayout_ecc,
-	.free = tc58cxgxsx_ooblayout_free,
-};
-
-static int tc58cxgxsx_ecc_get_status(struct spinand_device *spinand,
-				      u8 status)
-{
-	struct nand_device *nand = spinand_to_nand(spinand);
-	u8 mbf = 0;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(0x30, &mbf);
-
-	switch (status & STATUS_ECC_MASK) {
-	case STATUS_ECC_NO_BITFLIPS:
-		return 0;
-
-	case STATUS_ECC_UNCOR_ERROR:
-		return -EBADMSG;
-
-	case STATUS_ECC_HAS_BITFLIPS:
-	case TOSH_STATUS_ECC_HAS_BITFLIPS_T:
-		/*
-		 * Let's try to retrieve the real maximum number of bitflips
-		 * in order to avoid forcing the wear-leveling layer to move
-		 * data around if it's not necessary.
-		 */
-		if (spi_mem_exec_op(spinand->spimem, &op))
-			return nand->eccreq.strength;
-
-		mbf >>= 4;
-
-		if (WARN_ON(mbf > nand->eccreq.strength || !mbf))
-			return nand->eccreq.strength;
-
-		return mbf;
-
-	default:
-		break;
-	}
-
-	return -EINVAL;
-}
-
-static const struct spinand_info toshiba_spinand_table[] = {
-	/* 3.3V 1Gb */
-	SPINAND_INFO("TC58CVG0S3", 0xC2,
-		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
-		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
-	/* 3.3V 2Gb */
-	SPINAND_INFO("TC58CVG1S3", 0xCB,
-		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
-		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
-	/* 3.3V 4Gb */
-	SPINAND_INFO("TC58CVG2S0", 0xCD,
-		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
-		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
-	/* 1.8V 1Gb */
-	SPINAND_INFO("TC58CYG0S3", 0xB2,
-		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
-		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
-	/* 1.8V 2Gb */
-	SPINAND_INFO("TC58CYG1S3", 0xBB,
-		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
-		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
-	/* 1.8V 4Gb */
-	SPINAND_INFO("TC58CYG2S0", 0xBD,
-		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
-		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&tc58cxgxsx_ooblayout,
-				     tc58cxgxsx_ecc_get_status)),
-};
-
-static int toshiba_spinand_detect(struct spinand_device *spinand)
-{
-	u8 *id = spinand->id.data;
-	int ret;
-
-	/*
-	 * Toshiba SPI NAND read ID needs a dummy byte,
-	 * so the first byte in id is garbage.
-	 */
-	if (id[1] != SPINAND_MFR_TOSHIBA)
-		return 0;
-
-	ret = spinand_match_and_init(spinand, toshiba_spinand_table,
-				     ARRAY_SIZE(toshiba_spinand_table),
-				     id[2]);
-	if (ret)
-		return ret;
-
-	return 1;
-}
-
-static const struct spinand_manufacturer_ops toshiba_spinand_manuf_ops = {
-	.detect = toshiba_spinand_detect,
-};
-
-const struct spinand_manufacturer toshiba_spinand_manufacturer = {
-	.id = SPINAND_MFR_TOSHIBA,
-	.name = "Toshiba",
-	.ops = &toshiba_spinand_manuf_ops,
-};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 4ea558b..f8c2af8 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -228,7 +228,7 @@ struct spinand_manufacturer {
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
 extern const struct spinand_manufacturer paragon_spinand_manufacturer;
-extern const struct spinand_manufacturer toshiba_spinand_manufacturer;
+extern const struct spinand_manufacturer kioxia_spinand_manufacturer;
 extern const struct spinand_manufacturer winbond_spinand_manufacturer;
 
 /**
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
