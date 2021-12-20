Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A065BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BPRN+P/+lyP78RwebkgCPPc1a8rp7/rU4L+VCIEFz8g=; b=BC26MLw7U7hgOA
	rTDmMJan690csoV/aENjoxEVwR57WT3usyCQmE0rITkXlSZVo4FQX0WLzLDX9WihCLmZIr6dHKIE1
	eJGogrpxBKFvqj7W8/R8A1QINn+GYkEIgrO5VO+O7f3S11NhIKfe/XWpsQdtjkswniydz03wj7Uey
	3HHijvrBMxUm0qUxZBfcL3NP98ofXwQpvhEYlKRTSvQ60bmXt+b9pZj2r05hU3xAv2jyj0OG4hb/6
	gP3gWP5P0z9bKIrX6uWPR5StJN43BOf7KOcVNt6LQYry1DMXB30COXD3dmKmL0+Iu88tB473kCxi4
	wpV/w7K2NjzkvNMw1iXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzIHH-002Qz9-OU; Mon, 20 Dec 2021 13:00:31 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzIHD-002Qv8-PC
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 13:00:30 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 9A8BBE1C31;
 Mon, 20 Dec 2021 13:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1640005221; bh=hvwCkqPjGD5frgBR39knvzzCIahAUPKeCdgKyX7cVOQ=;
 h=From:To:Cc:Subject:Date;
 b=cqfJn+qW30EC3BAsTTNcCzSDvgyeyRsPHqWrXDvcYRy0y52FOsOo83CBD8rvusqff
 mMxZ8LcDmaKuOYLcRQyByFkVeIhtOTQhYgUCnaDN4z4PGjEvdubXVT1KrPkTF0zOK4
 7ix5/6taFXy+IOuMpAFfdWsH9bsjvUDHWAFvyknBkefOe1uZr0zWFF0N1jZNJ2rinO
 ICszJRR4mkRTyOYjn6WE59WBcEbCrh1GSb1D1LI5W3YWFZF1HIzwzMq6BBUDkBcThW
 YCW2ZzTj+mZ5IVCJ1A3vHR5QK9yk3DnEmkzVdWMpHuQ+mzX29C7Z3XPyOIw8EiHhI7
 uMN5BkQa/w69w==
From: Sean Nyekjaer <sean@geanix.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Cc: Sean Nyekjaer <sean@geanix.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: protect access to rawnand devices while in
 suspend
Date: Mon, 20 Dec 2021 14:00:15 +0100
Message-Id: <20211220130015.3630975-1-sean@geanix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_050028_166022_2529AC09 
X-CRM114-Status: GOOD (  16.40  )
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

Prevent rawnend access while in a suspended state.

Commit 013e6292aaf5 ("mtd: rawnand: Simplify the locking") allows the
rawnand layer to return errors rather than waiting in a blocking wait.

Tested on a iMX6ULL.

Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
Follow-up on discussion in:
https://lkml.org/lkml/2021/10/4/41
https://lkml.org/lkml/2021/10/11/435
https://lkml.org/lkml/2021/10/20/184
https://lkml.org/lkml/2021/10/25/288
https://lkml.org/lkml/2021/10/26/55
https://lkml.org/lkml/2021/11/2/352

 drivers/mtd/nand/raw/nand_base.c | 42 +++++++++++++++-----------------
 include/linux/mtd/rawnand.h      |  1 +
 2 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index b3a9bc08b4bb..eb4ec9a42d49 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -338,16 +338,19 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Return: -EBUSY if the chip has been suspended, 0 otherwise
  */
-static int nand_get_device(struct nand_chip *chip)
+static void nand_get_device(struct nand_chip *chip)
 {
-	mutex_lock(&chip->lock);
-	if (chip->suspended) {
+	/* Wait until the device is resumed. */
+	while (1) {
+		mutex_lock(&chip->lock);
+		if (!chip->suspended) {
+			mutex_lock(&chip->controller->lock);
+			return;
+		}
 		mutex_unlock(&chip->lock);
-		return -EBUSY;
-	}
-	mutex_lock(&chip->controller->lock);
 
-	return 0;
+		wait_event(chip->resume_wq, !chip->suspended);
+	}
 }
 
 /**
@@ -576,9 +579,7 @@ static int nand_block_markbad_lowlevel(struct nand_chip *chip, loff_t ofs)
 		nand_erase_nand(chip, &einfo, 0);
 
 		/* Write bad block marker to OOB */
-		ret = nand_get_device(chip);
-		if (ret)
-			return ret;
+		nand_get_device(chip);
 
 		ret = nand_markbad_bbm(chip, ofs);
 		nand_release_device(chip);
@@ -3759,9 +3760,7 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	    ops->mode != MTD_OPS_RAW)
 		return -ENOTSUPP;
 
-	ret = nand_get_device(chip);
-	if (ret)
-		return ret;
+	nand_get_device(chip);
 
 	if (!ops->datbuf)
 		ret = nand_do_read_oob(chip, from, ops);
@@ -4352,9 +4351,7 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 
 	ops->retlen = 0;
 
-	ret = nand_get_device(chip);
-	if (ret)
-		return ret;
+	nand_get_device(chip);
 
 	switch (ops->mode) {
 	case MTD_OPS_PLACE_OOB:
@@ -4414,9 +4411,7 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		return -EIO;
 
 	/* Grab the lock and see if the device is available */
-	ret = nand_get_device(chip);
-	if (ret)
-		return ret;
+	nand_get_device(chip);
 
 	/* Shift to get first page */
 	page = (int)(instr->addr >> chip->page_shift);
@@ -4503,7 +4498,7 @@ static void nand_sync(struct mtd_info *mtd)
 	pr_debug("%s: called\n", __func__);
 
 	/* Grab the lock and see if the device is available */
-	WARN_ON(nand_get_device(chip));
+	nand_get_device(chip);
 	/* Release it and go back */
 	nand_release_device(chip);
 }
@@ -4520,9 +4515,7 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 	int ret;
 
 	/* Select the NAND device */
-	ret = nand_get_device(chip);
-	if (ret)
-		return ret;
+	nand_get_device(chip);
 
 	nand_select_target(chip, chipnr);
 
@@ -4593,6 +4586,8 @@ static void nand_resume(struct mtd_info *mtd)
 			__func__);
 	}
 	mutex_unlock(&chip->lock);
+
+	wake_up_all(&chip->resume_wq);
 }
 
 /**
@@ -5370,6 +5365,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	chip->cur_cs = -1;
 
 	mutex_init(&chip->lock);
+	init_waitqueue_head(&chip->resume_wq);
 
 	/* Enforce the right timings for reset/detection */
 	chip->current_interface_config = nand_get_reset_interface_config();
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index b2f9dd3cbd69..248054560581 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1294,6 +1294,7 @@ struct nand_chip {
 	/* Internals */
 	struct mutex lock;
 	unsigned int suspended : 1;
+	wait_queue_head_t resume_wq;
 	int cur_cs;
 	int read_retries;
 	struct nand_secure_region *secure_regions;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
