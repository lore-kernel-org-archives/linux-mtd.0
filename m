Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F64C282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 12:16:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 837A52173C
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 12:16:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VPa0LAZZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 837A52173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTLg++k1yJ2CJ9rwC51/5nIGg2rvBPRQ8o3qpxCdg1M=; b=VPa0LAZZH+Fk70
	lDV3iQmTrTrWILPp9R6YFdko28EqJe2YxGDV+Lq/3mO13G3D97CPvAgDUes7sD4yKhrBeizsu4ZD8
	nMbTu8rPRCsl5djkU5Ct9quq5R7mxR8QxH3cpRZ7Neb739I0JN2C1xwLdu4RqLRGuzc4YLynBpz8C
	EqVdTX70DAeygQplEccceFxVcAKrW20ZO5Sx/FyAEWceO6iq6/QAmS9zswYWkhNyih12XQxNmz90Y
	O0Ex4MeGo/GFs77kczK3xWSQH5XUWHpNxi6tLh73qiFiqu9Lgr0yKUnNWPZWhBgDWV+dA1Lj/xdDo
	T8AnldlHsi3ygDH6IFgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGjTu-000589-Nq; Wed, 17 Apr 2019 12:16:02 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGjTJ-0004F4-DJ
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 12:15:28 +0000
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 16EFE67A911;
 Wed, 17 Apr 2019 14:15:22 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 17 Apr
 2019 14:15:21 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 17 Apr 2019 14:15:21 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 5/7] mtd: rawnand: Support bad block markers in first,
 second or last page
Thread-Topic: [PATCH v5 5/7] mtd: rawnand: Support bad block markers in first, 
 second or last page
Thread-Index: AQHU9Rc6HjfbjXcKnEeGlWAVLcNRdw==
Date: Wed, 17 Apr 2019 12:15:21 +0000
Message-ID: <20190417121420.21752-6-frieder.schrempf@kontron.de>
References: <20190417121420.21752-1-frieder.schrempf@kontron.de>
In-Reply-To: <20190417121420.21752-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 16EFE67A911.A2547
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_051525_929482_46D29D0B 
X-CRM114-Status: GOOD (  19.65  )
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
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Schrempf
 Frieder <frieder.schrempf@kontron.de>, Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Currently supported bad block marker positions within the block are:
* in first page only
* in last page only
* in first or second page

Some ESMT NANDs are known to have been shipped by the manufacturer
with bad block markers in the first or last page, instead of the
first or second page.

Also the datasheets for Cypress/Spansion/AMD NANDs claim that the
first, second *and* last page needs to be checked.

Therefore we make it possible to set NAND_BBM_FIRSTPAGE,
NAND_BBM_SECONDPAGE and NAND_BBM_LASTPAGE independently in any
combination.

To simplify the code, the logic to evaluate the flags is moved to a
a new function nand_bbm_get_next_page().

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
---
 drivers/mtd/nand/raw/internals.h |  1 +
 drivers/mtd/nand/raw/nand_base.c | 62 +++++++++++++++++++++-----------
 drivers/mtd/nand/raw/nand_bbt.c  | 29 +++++++--------
 3 files changed, 55 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index a204f9d7e123..cba6fe7dd8c4 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -76,6 +76,7 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 
 /* Core functions */
 const struct nand_manufacturer *nand_get_manufacturer(u8 id);
+int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 6e2d728d2fd9..d3e42a0d511f 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -282,6 +282,31 @@ static void nand_release_device(struct nand_chip *chip)
 	mutex_unlock(&chip->lock);
 }
 
+/**
+ * nand_bbm_get_next_page - Get the next page for bad block markers
+ * @chip: NAND chip object
+ * @index: Current page, only pages beyond this will be considered
+ *
+ * Returns an integer that corresponds to the page offset within a block, for
+ * a page that is used to store bad block markers. If no more pages are
+ * available, -1 is returned.
+ */
+int nand_bbm_get_next_page(struct nand_chip *chip, int page)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int last_page = ((mtd->erasesize - mtd->writesize) >>
+			 chip->page_shift) & chip->pagemask;
+
+	if (page < 0 && chip->options & NAND_BBM_FIRSTPAGE)
+		return 0;
+	else if (page < 1 && chip->options & NAND_BBM_SECONDPAGE)
+		return 1;
+	else if (page < last_page && chip->options & NAND_BBM_LASTPAGE)
+		return last_page;
+
+	return -1;
+}
+
 /**
  * nand_block_bad - [DEFAULT] Read bad block marker from the chip
  * @chip: NAND chip object
@@ -291,19 +316,14 @@ static void nand_release_device(struct nand_chip *chip)
  */
 static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
 {
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	int page, page_end, res;
+	int page_offset;
+	int res, first_page = (int)(ofs >> chip->page_shift) & chip->pagemask;
 	u8 bad;
 
-	if (chip->options & NAND_BBM_LASTPAGE)
-		ofs += mtd->erasesize - mtd->writesize;
+	page_offset = nand_bbm_get_next_page(chip, -1);
 
-	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
-	page_end = page + (((chip->options & NAND_BBM_FIRSTPAGE) &&
-			    (chip->options & NAND_BBM_SECONDPAGE)) ? 2 : 1);
-
-	for (; page < page_end; page++) {
-		res = chip->ecc.read_oob(chip, page);
+	while (page_offset != -1) {
+		res = chip->ecc.read_oob(chip, first_page + page_offset);
 		if (res < 0)
 			return res;
 
@@ -315,6 +335,8 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
 			res = hweight8(bad) < chip->badblockbits;
 		if (res)
 			return res;
+
+		page_offset = nand_bbm_get_next_page(chip, page_offset);
 	}
 
 	return 0;
@@ -494,7 +516,7 @@ static int nand_default_block_markbad(struct nand_chip *chip, loff_t ofs)
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct mtd_oob_ops ops;
 	uint8_t buf[2] = { 0, 0 };
-	int ret = 0, res, i = 0;
+	int ret = 0, res, page_offset;
 
 	memset(&ops, 0, sizeof(ops));
 	ops.oobbuf = buf;
@@ -507,18 +529,18 @@ static int nand_default_block_markbad(struct nand_chip *chip, loff_t ofs)
 	}
 	ops.mode = MTD_OPS_PLACE_OOB;
 
-	/* Write to first/last page(s) if necessary */
-	if (chip->options & NAND_BBM_LASTPAGE)
-		ofs += mtd->erasesize - mtd->writesize;
-	do {
-		res = nand_do_write_oob(chip, ofs, &ops);
+	page_offset = nand_bbm_get_next_page(chip, -1);
+
+	while (page_offset != -1) {
+		res = nand_do_write_oob(chip,
+					ofs + page_offset * mtd->writesize,
+					&ops);
+
 		if (!ret)
 			ret = res;
 
-		i++;
-		ofs += mtd->writesize;
-	} while ((chip->options & NAND_BBM_FIRSTPAGE) &&
-		 (chip->options & NAND_BBM_SECONDPAGE) && i < 2);
+		page_offset = nand_bbm_get_next_page(chip, page_offset);
+	}
 
 	return ret;
 }
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 4cb664847ef5..90c8be5695f6 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -416,11 +416,12 @@ static void read_abs_bbts(struct nand_chip *this, uint8_t *buf,
 
 /* Scan a given block partially */
 static int scan_block_fast(struct nand_chip *this, struct nand_bbt_descr *bd,
-			   loff_t offs, uint8_t *buf, int numpages)
+			   loff_t offs, uint8_t *buf)
 {
 	struct mtd_info *mtd = nand_to_mtd(this);
+
 	struct mtd_oob_ops ops;
-	int j, ret;
+	int ret, page_offset;
 
 	ops.ooblen = mtd->oobsize;
 	ops.oobbuf = buf;
@@ -428,12 +429,15 @@ static int scan_block_fast(struct nand_chip *this, struct nand_bbt_descr *bd,
 	ops.datbuf = NULL;
 	ops.mode = MTD_OPS_PLACE_OOB;
 
-	for (j = 0; j < numpages; j++) {
+	page_offset = nand_bbm_get_next_page(this, -1);
+
+	while (page_offset != -1) {
 		/*
 		 * Read the full oob until read_oob is fixed to handle single
 		 * byte reads for 16 bit buswidth.
 		 */
-		ret = mtd_read_oob(mtd, offs, &ops);
+		ret = mtd_read_oob(mtd, offs + page_offset * mtd->writesize,
+				   &ops);
 		/* Ignore ECC errors when checking for BBM */
 		if (ret && !mtd_is_bitflip_or_eccerr(ret))
 			return ret;
@@ -441,8 +445,9 @@ static int scan_block_fast(struct nand_chip *this, struct nand_bbt_descr *bd,
 		if (check_short_pattern(buf, bd))
 			return 1;
 
-		offs += mtd->writesize;
+		page_offset = nand_bbm_get_next_page(this, page_offset);
 	}
+
 	return 0;
 }
 
@@ -462,18 +467,11 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
 {
 	u64 targetsize = nanddev_target_size(&this->base);
 	struct mtd_info *mtd = nand_to_mtd(this);
-	int i, numblocks, numpages;
-	int startblock;
+	int i, numblocks, startblock;
 	loff_t from;
 
 	pr_info("Scanning device for bad blocks\n");
 
-	if ((this->options & NAND_BBM_FIRSTPAGE) &&
-	    (this->options & NAND_BBM_SECONDPAGE))
-		numpages = 2;
-	else
-		numpages = 1;
-
 	if (chip == -1) {
 		numblocks = mtd->size >> this->bbt_erase_shift;
 		startblock = 0;
@@ -490,15 +488,12 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
 		from = (loff_t)startblock << this->bbt_erase_shift;
 	}
 
-	if (this->options & NAND_BBM_LASTPAGE)
-		from += mtd->erasesize - (mtd->writesize * numpages);
-
 	for (i = startblock; i < numblocks; i++) {
 		int ret;
 
 		BUG_ON(bd->options & NAND_BBT_NO_OOB);
 
-		ret = scan_block_fast(this, bd, from, buf, numpages);
+		ret = scan_block_fast(this, bd, from, buf);
 		if (ret < 0)
 			return ret;
 
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
