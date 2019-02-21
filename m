Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83E2C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 09:30:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9A920880
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 09:30:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qui/qYYL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A9A920880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dt4bOJtAAXaKUJYe0WG0ZB7qAkIavW8FMqZbwst9BHM=; b=Qui/qYYLwKrMoW
	w02vVTpkK/yJL2M5Fu57lqTpk3V+0xoSV8x7oOpbBdZpvl2LRLBx4XRinY/+Pu9Tu8AZWicfQKEqu
	llsL3tYqoJbBzfeep9skGMveey9DotMBxB/E6dx6wXA1oZB3ItFxow3XaArD+++ivl/BRmbvcc5af
	dhY2Av9mBr5BEEwAK82sIEk+6Bnwb2q5VuW3aleM8htQsroZHbXqoiyzycl8JCfEDHtOTe8Swj4H4
	Nk3z23Z6aq8FzqUhPuVMOPpZhrVrltcvanSnP07fC+VbH+tu/fZtmyQU3gT/XRnk7QxpKnXIL+KAl
	+MV3+uMMcwkWk3mbdrWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwkgM-0008JT-B3; Thu, 21 Feb 2019 09:30:18 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwkSV-0001lP-Cm; Thu, 21 Feb 2019 09:16:08 +0000
X-Originating-IP: 90.88.23.190
Received: from localhost.localdomain
 (aaubervilliers-681-1-81-190.w90-88.abo.wanadoo.fr [90.88.23.190])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 70EE51BF20A;
 Thu, 21 Feb 2019 09:15:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH 10/15] mtd: rawnand: Move all page cache related fields to a
 sub-struct
Date: Thu, 21 Feb 2019 10:15:22 +0100
Message-Id: <20190221091527.20497-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190221091527.20497-1-miquel.raynal@bootlin.com>
References: <20190221091527.20497-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_011600_386265_F0284E3A 
X-CRM114-Status: GOOD (  17.29  )
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
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

Looking at the field names it's hard to tell what ->data_buf, ->pagebuf
and ->pagebuf_bitflips are for. Clarify that by moving those fields
in a sub-struct named pagecache.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 28 ++++++++++++++--------------
 include/linux/mtd/rawnand.h      | 18 +++++++++++-------
 2 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 07985d2b91ac..256d16903d54 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -493,8 +493,8 @@ static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
 	}
 
 	/* Invalidate the page cache, if we write to the cached page */
-	if (page == chip->pagebuf)
-		chip->pagebuf = -1;
+	if (page == chip->pagecache.page)
+		chip->pagecache.page = -1;
 
 	nand_fill_oob(chip, ops->oobbuf, ops->ooblen, ops);
 
@@ -3204,7 +3204,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 			use_bufpoi = 0;
 
 		/* Is the current page in the buffer? */
-		if (realpage != chip->pagebuf || oob) {
+		if (realpage != chip->pagecache.page || oob) {
 			bufpoi = use_bufpoi ? chip->data_buf : buf;
 
 			if (use_bufpoi && aligned)
@@ -3230,7 +3230,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 			if (ret < 0) {
 				if (use_bufpoi)
 					/* Invalidate page cache */
-					chip->pagebuf = -1;
+					chip->pagecache.page = -1;
 				break;
 			}
 
@@ -3239,11 +3239,11 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
 				    !(mtd->ecc_stats.failed - ecc_failures) &&
 				    (ops->mode != MTD_OPS_RAW)) {
-					chip->pagebuf = realpage;
-					chip->pagebuf_bitflips = ret;
+					chip->pagecache.page = realpage;
+					chip->pagecache.bitflips = ret;
 				} else {
 					/* Invalidate page cache */
-					chip->pagebuf = -1;
+					chip->pagecache.page = -1;
 				}
 				memcpy(buf, chip->data_buf + col, bytes);
 			}
@@ -3283,7 +3283,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 			memcpy(buf, chip->data_buf + col, bytes);
 			buf += bytes;
 			max_bitflips = max_t(unsigned int, max_bitflips,
-					     chip->pagebuf_bitflips);
+					     chip->pagecache.bitflips);
 		}
 
 		readlen -= bytes;
@@ -4002,9 +4002,9 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
 	page = realpage & chip->pagemask;
 
 	/* Invalidate the page cache, when we write to the cached page */
-	if (to <= ((loff_t)chip->pagebuf << chip->page_shift) &&
-	    ((loff_t)chip->pagebuf << chip->page_shift) < (to + ops->len))
-		chip->pagebuf = -1;
+	if (to <= ((loff_t)chip->pagecache.page << chip->page_shift) &&
+	    ((loff_t)chip->pagecache.page << chip->page_shift) < (to + ops->len))
+		chip->pagecache.page = -1;
 
 	/* Don't allow multipage oob writes with offset */
 	if (oob && ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen)) {
@@ -4241,9 +4241,9 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		 * Invalidate the page cache, if we erase the block which
 		 * contains the current cached page.
 		 */
-		if (page <= chip->pagebuf && chip->pagebuf <
+		if (page <= chip->pagecache.page && chip->pagecache.page <
 		    (page + pages_per_block))
-			chip->pagebuf = -1;
+			chip->pagecache.page = -1;
 
 		if (chip->legacy.erase)
 			status = chip->legacy.erase(chip,
@@ -5817,7 +5817,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 	chip->state = FL_READY;
 
 	/* Invalidate the pagebuffer reference */
-	chip->pagebuf = -1;
+	chip->pagecache.page = -1;
 
 	/* Large page NAND with SOFT_ECC should support subpage reads */
 	switch (ecc->mode) {
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index e62c3ab4e0f7..00a8795b215d 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1019,10 +1019,10 @@ struct nand_legacy {
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
  * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
  * @data_buf:		[INTERN] buffer for data, size is (page size + oobsize).
- * @pagebuf:		[INTERN] holds the pagenumber which is currently in
- *			data_buf.
- * @pagebuf_bitflips:	[INTERN] holds the bitflip count for the page which is
- *			currently in data_buf.
+ * @pagecache:		Structure containing page cache related fields
+ * @pagecache.bitflips:	Number of bitflips of the cached page
+ * @pagecache.page:	Page number currently in the cache. -1 means no page is
+ *			currently cached
  * @subpagesize:	[INTERN] holds the subpagesize
  * @id:			[INTERN] holds NAND ID
  * @parameters:		[INTERN] holds generic parameters under an easily
@@ -1069,8 +1069,12 @@ struct nand_chip {
 	uint64_t chipsize;
 	int pagemask;
 	u8 *data_buf;
-	int pagebuf;
-	unsigned int pagebuf_bitflips;
+
+	struct {
+		unsigned int bitflips;
+		int page;
+	} pagecache;
+
 	int subpagesize;
 	uint8_t bits_per_cell;
 	uint16_t ecc_strength_ds;
@@ -1374,7 +1378,7 @@ void nand_deselect_target(struct nand_chip *chip);
  */
 static inline void *nand_get_data_buf(struct nand_chip *chip)
 {
-	chip->pagebuf = -1;
+	chip->pagecache.page = -1;
 
 	return chip->data_buf;
 }
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
