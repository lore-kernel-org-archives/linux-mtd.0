Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9577EC282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 13:02:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FF6A2175B
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 13:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TuD2EO5w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FF6A2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2KBrePbqDtMrBj2pJDMdBKcTdgf0A02VdJn4CaTpl0=; b=TuD2EO5wmoWV8m
	URppVxT4eyN+uw9iTVF2CGXcU9KbHOaiC1y0p23WDRh0JGtf9HX2OIK5WkXMZAXmACiZQKsPFxWhj
	1KQC0sHCXTfx5x09z01h93uDboPXG4TYU0N4BNV3e7hdbLvKvlo9GwZxamWDivzcv70fSyUsvkrgX
	ObtWGdKmPiv5ICqMnXpAMCyYBvDxi7r090ptU0TdXj6c5+AX5U6B00ezMMtMZ+w9KgKr6qQQfAKhc
	xkAX3n7Vy8bd9E52YMXovEiGc9OvdxAg1YYm4QJVWd/0C8eFrnAfQFIILdxEYei74cbbdvQFFAlIL
	xVw22To47pxMercdxMfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gopVe-000260-Jb; Wed, 30 Jan 2019 13:02:30 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gopUx-0001OB-Jd
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 13:01:59 +0000
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id D988A67BC90;
 Wed, 30 Jan 2019 14:01:44 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Wed, 30 Jan
 2019 14:01:44 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%5]) with mapi id
 15.01.1466.003; Wed, 30 Jan 2019 14:01:44 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, Kyungmin Park <kyungmin.park@samsung.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "Marek
 Vasut" <marek.vasut@gmail.com>
Subject: [PATCH v3 1/5] mtd: nand: Always store info about bad block markers
 in chip struct
Thread-Topic: [PATCH v3 1/5] mtd: nand: Always store info about bad block
 markers in chip struct
Thread-Index: AQHUuJvz9LZKjU9NdkCgOImqm/qQ2A==
Date: Wed, 30 Jan 2019 13:01:44 +0000
Message-ID: <20190130130111.32724-2-frieder.schrempf@kontron.de>
References: <20190130130111.32724-1-frieder.schrempf@kontron.de>
In-Reply-To: <20190130130111.32724-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.43]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: D988A67BC90.A2DA3
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, kyungmin.park@samsung.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_050148_703491_35E4AC06 
X-CRM114-Status: GOOD (  21.27  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Schrempf
 Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The information about where the manufacturer puts the bad block
markers inside the bad block and in the OOB data is stored in
different places. Let's move this information to nand_chip.options
and nand_chip.badblockpos.

As this chip-specific information is not directly related to the
bad block table (BBT), we also rename the flags to NAND_BBM_*.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/onenand/onenand_base.c |  2 +-
 drivers/mtd/nand/onenand/onenand_bbt.c  |  2 +-
 drivers/mtd/nand/raw/nand_amd.c         |  2 +-
 drivers/mtd/nand/raw/nand_base.c        | 12 ++++++------
 drivers/mtd/nand/raw/nand_bbt.c         |  4 ++--
 drivers/mtd/nand/raw/nand_esmt.c        |  2 +-
 drivers/mtd/nand/raw/nand_hynix.c       |  4 ++--
 drivers/mtd/nand/raw/nand_macronix.c    |  2 +-
 drivers/mtd/nand/raw/nand_micron.c      |  2 +-
 drivers/mtd/nand/raw/nand_samsung.c     |  4 ++--
 drivers/mtd/nand/raw/nand_toshiba.c     |  2 +-
 drivers/mtd/nand/raw/sh_flctl.c         |  4 ++--
 include/linux/mtd/bbm.h                 | 14 +-------------
 include/linux/mtd/rawnand.h             | 15 +++++++++++++++
 14 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index 4ca4b194e7d7..d6701b8f031f 100644
--- a/drivers/mtd/nand/onenand/onenand_base.c
+++ b/drivers/mtd/nand/onenand/onenand_base.c
@@ -2458,7 +2458,7 @@ static int onenand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
                 bbm->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);
 
         /* We write two bytes, so we don't have to mess with 16-bit access */
-        ofs += mtd->oobsize + (bbm->badblockpos & ~0x01);
+        ofs += mtd->oobsize + (this->badblockpos & ~0x01);
 	/* FIXME : What to do when marking SLC block in partition
 	 * 	   with MLC erasesize? For now, it is not advisable to
 	 *	   create partitions containing both SLC and MLC regions.
diff --git a/drivers/mtd/nand/onenand/onenand_bbt.c b/drivers/mtd/nand/onenand/onenand_bbt.c
index dde20487937d..880b0abd36c8 100644
--- a/drivers/mtd/nand/onenand/onenand_bbt.c
+++ b/drivers/mtd/nand/onenand/onenand_bbt.c
@@ -191,7 +191,7 @@ static int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 		return -ENOMEM;
 
 	/* Set the bad block position */
-	bbm->badblockpos = ONENAND_BADBLOCK_POS;
+	this->badblockpos = NAND_BBM_POS_ONENAND;
 
 	/* Set erase shift */
 	bbm->bbt_erase_shift = this->erase_shift;
diff --git a/drivers/mtd/nand/raw/nand_amd.c b/drivers/mtd/nand/raw/nand_amd.c
index 890c5b43e03c..6e248bdcc797 100644
--- a/drivers/mtd/nand/raw/nand_amd.c
+++ b/drivers/mtd/nand/raw/nand_amd.c
@@ -40,7 +40,7 @@ static void amd_nand_decode_id(struct nand_chip *chip)
 static int amd_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
-		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+		chip->options |= NAND_BBM_SECONDPAGE;
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index cca4b24d2ffa..c6199cc68d2f 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -298,11 +298,11 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
 	int page, page_end, res;
 	u8 bad;
 
-	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
+	if (chip->options & NAND_BBM_LASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
 
 	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
-	page_end = page + (chip->bbt_options & NAND_BBT_SCAN2NDPAGE ? 2 : 1);
+	page_end = page + ((chip->options & NAND_BBM_SECONDPAGE) ? 2 : 1);
 
 	for (; page < page_end; page++) {
 		res = chip->ecc.read_oob(chip, page);
@@ -541,7 +541,7 @@ static int nand_default_block_markbad(struct nand_chip *chip, loff_t ofs)
 	ops.mode = MTD_OPS_PLACE_OOB;
 
 	/* Write to first/last page(s) if necessary */
-	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
+	if (chip->options & NAND_BBM_LASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
 	do {
 		res = nand_do_write_oob(chip, ofs, &ops);
@@ -550,7 +550,7 @@ static int nand_default_block_markbad(struct nand_chip *chip, loff_t ofs)
 
 		i++;
 		ofs += mtd->writesize;
-	} while ((chip->bbt_options & NAND_BBT_SCAN2NDPAGE) && i < 2);
+	} while ((chip->options & NAND_BBM_SECONDPAGE) && i < 2);
 
 	return ret;
 }
@@ -4576,9 +4576,9 @@ static void nand_decode_bbm_options(struct nand_chip *chip)
 
 	/* Set the bad block position */
 	if (mtd->writesize > 512 || (chip->options & NAND_BUSWIDTH_16))
-		chip->badblockpos = NAND_LARGE_BADBLOCK_POS;
+		chip->badblockpos = NAND_BBM_POS_LARGE;
 	else
-		chip->badblockpos = NAND_SMALL_BADBLOCK_POS;
+		chip->badblockpos = NAND_BBM_POS_SMALL;
 }
 
 static inline bool is_full_id_nand(struct nand_flash_dev *type)
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 1b722fe9213c..862eaa3a0552 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -466,7 +466,7 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
 
 	pr_info("Scanning device for bad blocks\n");
 
-	if (bd->options & NAND_BBT_SCAN2NDPAGE)
+	if (this->options & NAND_BBM_SECONDPAGE)
 		numpages = 2;
 	else
 		numpages = 1;
@@ -487,7 +487,7 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
 		from = (loff_t)startblock << this->bbt_erase_shift;
 	}
 
-	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
+	if (this->bbt_options & NAND_BBM_LASTPAGE)
 		from += mtd->erasesize - (mtd->writesize * numpages);
 
 	for (i = startblock; i < numblocks; i++) {
diff --git a/drivers/mtd/nand/raw/nand_esmt.c b/drivers/mtd/nand/raw/nand_esmt.c
index 96f039a83bc8..80d2d3a1b5f2 100644
--- a/drivers/mtd/nand/raw/nand_esmt.c
+++ b/drivers/mtd/nand/raw/nand_esmt.c
@@ -36,7 +36,7 @@ static void esmt_nand_decode_id(struct nand_chip *chip)
 static int esmt_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
-		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+		chip->options |= NAND_BBM_SECONDPAGE;
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index 343f477362d1..2789bf3857c9 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -672,9 +672,9 @@ static int hynix_nand_init(struct nand_chip *chip)
 	int ret;
 
 	if (!nand_is_slc(chip))
-		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
+		chip->options |= NAND_BBM_LASTPAGE;
 	else
-		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+		chip->options |= NAND_BBM_SECONDPAGE;
 
 	hynix = kzalloc(sizeof(*hynix), GFP_KERNEL);
 	if (!hynix)
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 47d8cda547cf..6db7ced4b96b 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -62,7 +62,7 @@ static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
 static int macronix_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
-		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+		chip->options |= NAND_BBM_SECONDPAGE;
 
 	macronix_nand_fix_broken_get_timings(chip);
 
diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index b85e1c13b79e..ea6b6e80d6f8 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -448,7 +448,7 @@ static int micron_nand_init(struct nand_chip *chip)
 		goto err_free_manuf_data;
 
 	if (mtd->writesize == 2048)
-		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+		chip->options |= NAND_BBM_SECONDPAGE;
 
 	ondie = micron_supports_on_die_ecc(chip);
 
diff --git a/drivers/mtd/nand/raw/nand_samsung.c b/drivers/mtd/nand/raw/nand_samsung.c
index e46d4c492ad8..3be737139210 100644
--- a/drivers/mtd/nand/raw/nand_samsung.c
+++ b/drivers/mtd/nand/raw/nand_samsung.c
@@ -121,9 +121,9 @@ static int samsung_nand_init(struct nand_chip *chip)
 		chip->options |= NAND_SAMSUNG_LP_OPTIONS;
 
 	if (!nand_is_slc(chip))
-		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
+		chip->options |= NAND_BBM_LASTPAGE;
 	else
-		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+		chip->options |= NAND_BBM_SECONDPAGE;
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index d068163b64b3..222a66bf0aa6 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -147,7 +147,7 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
 static int toshiba_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
-		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
+		chip->options |=  NAND_BBM_SECONDPAGE;
 
 	/* Check that chip is BENAND and ECC mode is on-die */
 	if (nand_is_slc(chip) && chip->ecc.mode == NAND_ECC_ON_DIE &&
diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index cf6b1be1cf9c..2017b00fadd8 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -101,14 +101,12 @@ static const struct mtd_ooblayout_ops flctl_4secc_oob_largepage_ops = {
 static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
 
 static struct nand_bbt_descr flctl_4secc_smallpage = {
-	.options = NAND_BBT_SCAN2NDPAGE,
 	.offs = 11,
 	.len = 1,
 	.pattern = scan_ff_pattern,
 };
 
 static struct nand_bbt_descr flctl_4secc_largepage = {
-	.options = NAND_BBT_SCAN2NDPAGE,
 	.offs = 0,
 	.len = 2,
 	.pattern = scan_ff_pattern,
@@ -1178,6 +1176,8 @@ static int flctl_probe(struct platform_device *pdev)
 	if (pdata->flcmncr_val & SEL_16BIT)
 		nand->options |= NAND_BUSWIDTH_16;
 
+	nand->options |= NAND_BBM_SECONDPAGE;
+
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_resume(&pdev->dev);
 
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 3102bd754d18..010bc5544c54 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -93,10 +93,7 @@ struct nand_bbt_descr {
 #define NAND_BBT_WRITE		0x00002000
 /* Read and write back block contents when writing bbt */
 #define NAND_BBT_SAVECONTENT	0x00004000
-/* Search good / bad pattern on the first and the second page */
-#define NAND_BBT_SCAN2NDPAGE	0x00008000
-/* Search good / bad pattern on the last page of the eraseblock */
-#define NAND_BBT_SCANLASTPAGE	0x00010000
+
 /*
  * Use a flash based bad block table. By default, OOB identifier is saved in
  * OOB area. This option is passed to the default bad block table function.
@@ -123,13 +120,6 @@ struct nand_bbt_descr {
 /* The maximum number of blocks to scan for a bbt */
 #define NAND_BBT_SCAN_MAXBLOCKS	4
 
-/*
- * Constants for oob configuration
- */
-#define NAND_SMALL_BADBLOCK_POS		5
-#define NAND_LARGE_BADBLOCK_POS		0
-#define ONENAND_BADBLOCK_POS		0
-
 /*
  * Bad block scanning errors
  */
@@ -140,7 +130,6 @@ struct nand_bbt_descr {
 /**
  * struct bbm_info - [GENERIC] Bad Block Table data structure
  * @bbt_erase_shift:	[INTERN] number of address bits in a bbt entry
- * @badblockpos:	[INTERN] position of the bad block marker in the oob area
  * @options:		options for this descriptor
  * @bbt:		[INTERN] bad block table pointer
  * @isbad_bbt:		function to determine if a block is bad
@@ -150,7 +139,6 @@ struct nand_bbt_descr {
  */
 struct bbm_info {
 	int bbt_erase_shift;
-	int badblockpos;
 	int options;
 
 	uint8_t *bbt;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 33e240acdc6d..da785d92e26e 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -169,6 +169,21 @@ enum nand_ecc_algo {
 /* Macros to identify the above */
 #define NAND_HAS_SUBPAGE_READ(chip) ((chip->options & NAND_SUBPAGE_READ))
 
+/*
+ * There are different places where the manufacturer stores the factory bad
+ * block markers.
+ *
+ * Position within the block: Each of these pages needs to be checked for a
+ * bad block marking pattern.
+ */
+#define NAND_BBM_SECONDPAGE		0x02000000
+#define NAND_BBM_LASTPAGE		0x04000000
+
+/* Position within the OOB data of the page */
+#define NAND_BBM_POS_SMALL		5
+#define NAND_BBM_POS_LARGE		0
+#define NAND_BBM_POS_ONENAND		0
+
 /* Non chip related options */
 /* This option skips the bbt scan during initialization. */
 #define NAND_SKIP_BBTSCAN	0x00010000
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
