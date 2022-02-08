Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3BFC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Feb 2022 08:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TtxHgE4yO3BMV/tpQglAmnjuOuQKs9ZvehNso7N5ePM=; b=Kjruohnzb01TKz
	y6PUf9BIFQ0WNpHsyz31iQN69VPREp5qNuaKDwHjiByZZ2CFwRf+or1Vu+dE4rnFGCvxxX+E4RgLP
	5pnRkwZfdntooqkWSl01H+tMuQ8vOwh4q+0v4igYgz1T0nY9b9N4Waq0ieHASY1QGDvtKnJqqXPaV
	C1ydtymigs7MxqvBqctyM4TgF6T7DG4eAiTsbIrlWlMfVQdkgKna648KhvKSh4zh3rmsYJkM8AU3B
	mBkm4KvviKfZt4NXkKRnjTqxd4fbX2TbO6S648Qp/uAgiPrpX6JXJNfxGtQRGj+tXwpIu/SiuPSvh
	7o2E43UKFitpAXFxG3TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHLoX-00Cwsl-AJ; Tue, 08 Feb 2022 08:25:29 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHLoS-00CwoV-P9
 for linux-mtd@lists.infradead.org; Tue, 08 Feb 2022 08:25:27 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 3B30AE28D1;
 Tue,  8 Feb 2022 08:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1644308719; bh=Efu6zjcxm/eWjynAIA8LNMAq9G0qvlYvhealE9QUzXQ=;
 h=From:To:Cc:Subject:Date;
 b=C2ohMC85IOb51JqunUAZHpOrmNCwKkz1ZlbIrTMm12tmkPSAGUPUtAfynh+pxU2Tb
 Jo9+i8yz8kitAON4mcrNf3/w4EtR5N8Re3sf8JaxSkApNWKxWUj5fgk7o7Gw9Fgl5k
 ETMGo2aW2WdWjlo8gIcp+EuGIY3s1aLfLZinpZsemsX5vAHCsK+ShtX4soNyB5MFim
 3dd0ZiVf6IldfoR/NtOUeIiYWM0NEh9s3qigwgsRRfp51es91ujVqeKHTjk9NpbVN/
 bdQGmEZDldUJszJYssqmSm7uO979MI71LCtWrIHzXf6X6b6L+jK7zOnELzlULxN9vA
 rwCmCD1jUkLOA==
From: Sean Nyekjaer <sean@geanix.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Cc: Sean Nyekjaer <sean@geanix.com>, stable@vger.kernel.org,
 sfr@canb.auug.org.au, Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: rawnand: protect access to rawnand devices while in
 suspend
Date: Tue,  8 Feb 2022 09:25:06 +0100
Message-Id: <20220208082507.1837764-1-sean@geanix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_002525_598357_34381AC3 
X-CRM114-Status: GOOD (  19.26  )
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
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Follow-up on discussion in:
https://lkml.org/lkml/2021/10/4/41
https://lkml.org/lkml/2021/10/11/435
https://lkml.org/lkml/2021/10/20/184
https://lkml.org/lkml/2021/10/25/288
https://lkml.org/lkml/2021/10/26/55
https://lkml.org/lkml/2021/11/2/352

Changes since v1:
 - fixed uninitialized return

Changes since v2:
 - fixed wait queue description

 drivers/mtd/nand/raw/nand_base.c | 44 +++++++++++++++-----------------
 include/linux/mtd/rawnand.h      |  2 ++
 2 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e7b2ba016d8c..8daaba96edb2 100644
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
@@ -3826,9 +3827,7 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	    ops->mode != MTD_OPS_RAW)
 		return -ENOTSUPP;
 
-	ret = nand_get_device(chip);
-	if (ret)
-		return ret;
+	nand_get_device(chip);
 
 	if (!ops->datbuf)
 		ret = nand_do_read_oob(chip, from, ops);
@@ -4415,13 +4414,11 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 			  struct mtd_oob_ops *ops)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
-	int ret;
+	int ret = 0;
 
 	ops->retlen = 0;
 
-	ret = nand_get_device(chip);
-	if (ret)
-		return ret;
+	nand_get_device(chip);
 
 	switch (ops->mode) {
 	case MTD_OPS_PLACE_OOB:
@@ -4481,9 +4478,7 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		return -EIO;
 
 	/* Grab the lock and see if the device is available */
-	ret = nand_get_device(chip);
-	if (ret)
-		return ret;
+	nand_get_device(chip);
 
 	/* Shift to get first page */
 	page = (int)(instr->addr >> chip->page_shift);
@@ -4570,7 +4565,7 @@ static void nand_sync(struct mtd_info *mtd)
 	pr_debug("%s: called\n", __func__);
 
 	/* Grab the lock and see if the device is available */
-	WARN_ON(nand_get_device(chip));
+	nand_get_device(chip);
 	/* Release it and go back */
 	nand_release_device(chip);
 }
@@ -4587,9 +4582,7 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 	int ret;
 
 	/* Select the NAND device */
-	ret = nand_get_device(chip);
-	if (ret)
-		return ret;
+	nand_get_device(chip);
 
 	nand_select_target(chip, chipnr);
 
@@ -4660,6 +4653,8 @@ static void nand_resume(struct mtd_info *mtd)
 			__func__);
 	}
 	mutex_unlock(&chip->lock);
+
+	wake_up_all(&chip->resume_wq);
 }
 
 /**
@@ -5437,6 +5432,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	chip->cur_cs = -1;
 
 	mutex_init(&chip->lock);
+	init_waitqueue_head(&chip->resume_wq);
 
 	/* Enforce the right timings for reset/detection */
 	chip->current_interface_config = nand_get_reset_interface_config();
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5b88cd51fadb..dcf90144d70b 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1240,6 +1240,7 @@ struct nand_secure_region {
  * @lock: Lock protecting the suspended field. Also used to serialize accesses
  *        to the NAND device
  * @suspended: Set to 1 when the device is suspended, 0 when it's not
+ * @resume_wq: wait queue to sleep if rawnand is in suspended state.
  * @cur_cs: Currently selected target. -1 means no target selected, otherwise we
  *          should always have cur_cs >= 0 && cur_cs < nanddev_ntargets().
  *          NAND Controller drivers should not modify this value, but they're
@@ -1294,6 +1295,7 @@ struct nand_chip {
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
