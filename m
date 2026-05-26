Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B15CD5BD0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 09:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ymkg+3tSfMUtNxsgNzonWPY9kvMMhWfl15JkTN069Dk=; b=Id4oEZSTOxUd9L
	R79R6A0WCXVJllCA8zicDv82EfQmYV6OWa7znnLGltnEEvLO6+WzKvPUNgr6FTEJLBgMnB0yzXS3R
	Sk6hJMJ28ltukqXL0WuXmcNOmzMwzvjqbu0tL6GZRzyZs/QMl3WxxBhhl2TpRk6ZlTNtQ9FBCnEGb
	lu3sqw0bTC3xXATkRAxj0Ok2Wl7Hwwioc9vozfB7eo5ZQnsWKxkACdXS9/bbHzj5ivtg+CRUpcFJ1
	q9RR1RJ7sI+h3M0kShxi2YhcgcSKumugw+vsVKR0nHSvrXw5+LyJ++snqqWP9UA6+EkpJLnRlEJo+
	6S7rfF1bRbMJSXccJh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoMS-00000001YwJ-0LoI;
	Tue, 26 May 2026 09:46:08 +0000
Received: from m16.mail.126.com ([117.135.210.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoMO-00000001YuN-3e5a
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 09:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Fj
	rFZSTMn1q+lOhhJ2EBxwrUxCv4HIlYmvMNpWw6s7A=; b=gcIO2KvLeoJ53Baeda
	cigp23jcYzvd6S34sgXPtbrUGKqItwC6/jZJLmPn2XNDrKnuyKxpGGkrCcZApgYk
	pOvAJi6lo4tEx3QvIYruaUV8LMlfI4LO4wnuD/qAAGVlXzqs5F3uhzPUXwl65Zih
	lm90SPLpHpj1S5FPBlSQ3OXkA=
Received: from DESKTOP-EQVOVNC.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDX37rHaxVqwt5DAQ--.44118S2;
	Tue, 26 May 2026 17:45:43 +0800 (CST)
From: Li Xinyu <xinyuili@126.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	Li Xinyu <xinyuili@126.com>
Subject: [PATCH] mtd: inftlmount: convert printk(KERN_WARNING) to pr_warn
Date: Tue, 26 May 2026 17:45:40 +0800
Message-Id: <20260526094540.1974076-1-xinyuili@126.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDX37rHaxVqwt5DAQ--.44118S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKw1UuFW3Wr17tF15ArW5Jrb_yoW3Gr4Dp3
	W3G3yDZr4vgw1UX3Z5Ka1rZFyYkw4ktFWDWFW5W3ZYkr1DGr9rWas0y34UXr98KrWDWwsx
	Zr43Ary5CFyjqFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4xRDUUUUU=
X-Originating-IP: [171.217.92.244]
X-CM-SenderInfo: 50lq53xlolqiyswou0bp/xtbBrwfrNGoVa8c3FAAA3H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_024605_347822_2D1A5213 
X-CRM114-Status: GOOD (  13.27  )
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

Replace all printk(KERN_WARNING ...) calls with pr_warn() to follow
the kernel's recommended logging style and resolve checkpatch warnings.
Also convert one bare printk() that was missing a log level.

No functional change.

Signed-off-by: Li Xinyu <xinyuili@126.com>
---
 drivers/mtd/inftlmount.c | 44 ++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 6276daa296da..87e246a6f488 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -67,12 +67,12 @@ static int find_boot_record(struct INFTLrecord *inftl)
 			static int warncount = 5;
 
 			if (warncount) {
-				printk(KERN_WARNING "INFTL: block read at 0x%x "
+				pr_warn("INFTL: block read at 0x%x "
 					"of mtd%d failed: %d\n",
 					block * inftl->EraseSize,
 					inftl->mbd.mtd->index, ret);
 				if (!--warncount)
-					printk(KERN_WARNING "INFTL: further "
+					pr_warn("INFTL: further "
 						"failures for this block will "
 						"not be printed\n");
 			}
@@ -89,7 +89,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 				     block * inftl->EraseSize + SECTORSIZE + 8,
 				     8, &retlen,(char *)&h1);
 		if (ret < 0) {
-			printk(KERN_WARNING "INFTL: ANAND header found at "
+			pr_warn("INFTL: ANAND header found at "
 				"0x%x in mtd%d, but OOB data read failed "
 				"(err %d)\n", block * inftl->EraseSize,
 				inftl->mbd.mtd->index, ret);
@@ -107,13 +107,13 @@ static int find_boot_record(struct INFTLrecord *inftl)
 		mtd_read(mtd, block * inftl->EraseSize + 4096, SECTORSIZE,
 			 &retlen, buf);
 		if (retlen != SECTORSIZE) {
-			printk(KERN_WARNING "INFTL: Unable to read spare "
+			pr_warn("INFTL: Unable to read spare "
 			       "Media Header\n");
 			return -1;
 		}
 		/* Check if this one is the same as the first one we found. */
 		if (memcmp(mh, buf, sizeof(struct INFTLMediaHeader))) {
-			printk(KERN_WARNING "INFTL: Primary and spare Media "
+			pr_warn("INFTL: Primary and spare Media "
 			       "Headers disagree.\n");
 			return -1;
 		}
@@ -141,14 +141,14 @@ static int find_boot_record(struct INFTLrecord *inftl)
 			 mh->OsakVersion, mh->PercentUsed);
 
 		if (mh->NoOfBDTLPartitions == 0) {
-			printk(KERN_WARNING "INFTL: Media Header sanity check "
+			pr_warn("INFTL: Media Header sanity check "
 				"failed: NoOfBDTLPartitions (%d) == 0, "
 				"must be at least 1\n", mh->NoOfBDTLPartitions);
 			return -1;
 		}
 
 		if ((mh->NoOfBDTLPartitions + mh->NoOfBinaryPartitions) > 4) {
-			printk(KERN_WARNING "INFTL: Media Header sanity check "
+			pr_warn("INFTL: Media Header sanity check "
 				"failed: Total Partitions (%d) > 4, "
 				"BDTL=%d Binary=%d\n", mh->NoOfBDTLPartitions +
 				mh->NoOfBinaryPartitions,
@@ -158,12 +158,12 @@ static int find_boot_record(struct INFTLrecord *inftl)
 		}
 
 		if (mh->BlockMultiplierBits > 1) {
-			printk(KERN_WARNING "INFTL: sorry, we don't support "
+			pr_warn("INFTL: sorry, we don't support "
 				"UnitSizeFactor 0x%02x\n",
 				mh->BlockMultiplierBits);
 			return -1;
 		} else if (mh->BlockMultiplierBits == 1) {
-			printk(KERN_WARNING "INFTL: support for INFTL with "
+			pr_warn("INFTL: support for INFTL with "
 				"UnitSizeFactor 0x%02x is experimental\n",
 				mh->BlockMultiplierBits);
 			inftl->EraseSize = inftl->mbd.mtd->erasesize <<
@@ -207,7 +207,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 				mtd_erase(mtd, instr);
 			}
 			if ((ip->lastUnit - ip->firstUnit + 1) < ip->virtualUnits) {
-				printk(KERN_WARNING "INFTL: Media Header "
+				pr_warn("INFTL: Media Header "
 					"Partition %d sanity check failed\n"
 					"    firstUnit %d : lastUnit %d  >  "
 					"virtualUnits %d\n", i, ip->lastUnit,
@@ -215,7 +215,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 				return -1;
 			}
 			if (ip->Reserved1 != 0) {
-				printk(KERN_WARNING "INFTL: Media Header "
+				pr_warn("INFTL: Media Header "
 					"Partition %d sanity check failed: "
 					"Reserved1 %d != 0\n",
 					i, ip->Reserved1);
@@ -227,7 +227,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 		}
 
 		if (i >= 4) {
-			printk(KERN_WARNING "INFTL: Media Header Partition "
+			pr_warn("INFTL: Media Header Partition "
 				"sanity check failed:\n       No partition "
 				"marked as Disk Partition\n");
 			return -1;
@@ -237,7 +237,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 		inftl->numvunits = ip->virtualUnits;
 		if (inftl->numvunits > (inftl->nb_blocks -
 		    inftl->nb_boot_blocks - 2)) {
-			printk(KERN_WARNING "INFTL: Media Header sanity check "
+			pr_warn("INFTL: Media Header sanity check "
 				"failed:\n        numvunits (%d) > nb_blocks "
 				"(%d) - nb_boot_blocks(%d) - 2\n",
 				inftl->numvunits, inftl->nb_blocks,
@@ -385,7 +385,7 @@ int INFTL_formatblock(struct INFTLrecord *inftl, int block)
 
 		ret = mtd_erase(inftl->mbd.mtd, instr);
 		if (ret) {
-			printk(KERN_WARNING "INFTL: error while formatting block %d\n",
+			pr_warn("INFTL: error while formatting block %d\n",
 				block);
 			goto fail;
 		}
@@ -428,13 +428,13 @@ static void format_chain(struct INFTLrecord *inftl, unsigned int first_block)
 {
 	unsigned int block = first_block, block1;
 
-	printk(KERN_WARNING "INFTL: formatting chain at block %d\n",
+	pr_warn("INFTL: formatting chain at block %d\n",
 		first_block);
 
 	for (;;) {
 		block1 = inftl->PUtable[block];
 
-		printk(KERN_WARNING "INFTL: formatting block %d\n", block);
+		pr_warn("INFTL: formatting block %d\n", block);
 		if (INFTL_formatblock(inftl, block) < 0) {
 			/*
 			 * Cannot format !!!! Mark it as Bad Unit,
@@ -539,7 +539,7 @@ int INFTL_mount(struct INFTLrecord *s)
 
 	/* Search for INFTL MediaHeader and Spare INFTL Media Header */
 	if (find_boot_record(s) < 0) {
-		printk(KERN_WARNING "INFTL: could not find valid boot record?\n");
+		pr_warn("INFTL: could not find valid boot record?\n");
 		return -ENXIO;
 	}
 
@@ -610,7 +610,7 @@ int INFTL_mount(struct INFTLrecord *s)
 
 			/* Check for invalid block */
 			if (erase_mark != ERASE_MARK) {
-				printk(KERN_WARNING "INFTL: corrupt block %d "
+				pr_warn("INFTL: corrupt block %d "
 					"in chain %d, chain length %d, erase "
 					"mark 0x%x?\n", block, first_block,
 					chain_length, erase_mark);
@@ -635,7 +635,7 @@ int INFTL_mount(struct INFTLrecord *s)
 			    ((prev_block >= s->nb_blocks) &&
 			     (prev_block != BLOCK_NIL))) {
 				if (chain_length > 0) {
-					printk(KERN_WARNING "INFTL: corrupt "
+					pr_warn("INFTL: corrupt "
 						"block %d in chain %d?\n",
 						block, first_block);
 					do_format_chain++;
@@ -670,7 +670,7 @@ int INFTL_mount(struct INFTLrecord *s)
 
 			/* Validate next block before following it... */
 			if (block > s->lastEUN) {
-				printk(KERN_WARNING "INFTL: invalid previous "
+				pr_warn("INFTL: invalid previous "
 					"block %d in chain %d?\n", block,
 					first_block);
 				do_format_chain++;
@@ -714,7 +714,7 @@ int INFTL_mount(struct INFTLrecord *s)
 			if (s->PUtable[block] == BLOCK_NIL)
 				break;
 			if (s->PUtable[block] > s->lastEUN) {
-				printk(KERN_WARNING "INFTL: invalid prev %d, "
+				pr_warn("INFTL: invalid prev %d, "
 					"in virtual chain %d\n",
 					s->PUtable[block], logical_block);
 				s->PUtable[block] = BLOCK_NIL;
@@ -757,7 +757,7 @@ int INFTL_mount(struct INFTLrecord *s)
 	pr_debug("INFTL: pass 3, format unused blocks\n");
 	for (block = s->firstEUN; block <= s->lastEUN; block++) {
 		if (s->PUtable[block] == BLOCK_NOTEXPLORED) {
-			printk("INFTL: unreferenced block %d, formatting it\n",
+			pr_warn("INFTL: unreferenced block %d, formatting it\n",
 				block);
 			if (INFTL_formatblock(s, block) < 0)
 				s->PUtable[block] = BLOCK_RESERVED;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
