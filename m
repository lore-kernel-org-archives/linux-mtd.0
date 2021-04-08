Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0976BC43462
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 20:44:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C70061107
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 20:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C70061107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sXTff8lIk8WuMDjhdXkpnD+MmnS3nuMiCOGG/Po/JVs=; b=i4rlpp4xAB6Ra/b+1LrB+KXal
	/fqrg3IH9E+Z7tsqbbrFW1XTPRZPx3UiTNd6fklnye2P4harAXp+pIzmMQ5tf+pyKTPnVhRe3DL3O
	2ETlIXZqskJw8qudyDoHpJqvVtvsUPM6Jr1R8U4KtW03R6TxZ5fLvmJZ583s+uJTpYiogPdRU4+7V
	FRtb5uVEwl3uVlB43Z7xHZKGBAeG/PrTJCns7o4ddxvcwB2/ZjQDy8Z2ZI9rwPmQOFfSQ9yWfIv2S
	4qy0fPS7DYxOm0Qz/Vc+JQL7GPEKXMT4je39tet2dUfKEAGME9XPIVMI7jgOjcdUd1nWEmUqTC9a1
	hKks19vYA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUbUi-009F4c-Pc; Thu, 08 Apr 2021 20:43:16 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUbUd-009F4I-56
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 20:43:14 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.93.0.4) (envelope-from <daniel@makrotopia.org>)
 id 1lUbUZ-0000cT-3d; Thu, 08 Apr 2021 22:43:07 +0200
Date: Thu, 8 Apr 2021 21:42:52 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2] mtd: super: don't reply on mtdblock device minor
Message-ID: <YG9qzC/SaD7SNWVm@makrotopia.org>
References: <20210408081508.1d04eb31@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408081508.1d04eb31@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_214311_377179_5F67D13D 
X-CRM114-Status: GOOD (  14.54  )
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

For blktrans devices with partitions (ie. part_bits != 0) the
assumption that the minor number of the mtdblock device matches
the mtdnum doesn't hold true.
Properly resolve mtd device from blktrans layer instead.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: remove BUG() calls as requested by Miquel Raynal

 drivers/mtd/mtdsuper.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index c3e2098372f2e..d3af80a7ce86e 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/mtd/super.h>
+#include <linux/mtd/blktrans.h>
 #include <linux/namei.h>
 #include <linux/export.h>
 #include <linux/ctype.h>
@@ -121,7 +122,8 @@ int get_tree_mtd(struct fs_context *fc,
 {
 #ifdef CONFIG_BLOCK
 	struct block_device *bdev;
-	int ret, major;
+	struct mtd_blktrans_dev *blktrans_dev;
+	int ret, major, part_bits;
 #endif
 	int mtdnr;
 
@@ -169,21 +171,36 @@ int get_tree_mtd(struct fs_context *fc,
 	/* try the old way - the hack where we allowed users to mount
 	 * /dev/mtdblock$(n) but didn't actually _use_ the blockdev
 	 */
-	bdev = lookup_bdev(fc->source);
+	bdev = blkdev_get_by_path(fc->source, FMODE_READ, NULL);
 	if (IS_ERR(bdev)) {
 		ret = PTR_ERR(bdev);
 		errorf(fc, "MTD: Couldn't look up '%s': %d", fc->source, ret);
 		return ret;
 	}
-	pr_debug("MTDSB: lookup_bdev() returned 0\n");
+	pr_debug("MTDSB: blkdev_get_by_path() returned 0\n");
 
 	major = MAJOR(bdev->bd_dev);
-	mtdnr = MINOR(bdev->bd_dev);
-	bdput(bdev);
 
-	if (major == MTD_BLOCK_MAJOR)
-		return mtd_get_sb_by_nr(fc, mtdnr, fill_super);
+	if (major == MTD_BLOCK_MAJOR) {
+		if (!bdev->bd_disk) {
+			blkdev_put(bdev, FMODE_READ);
+			return -EINVAL;
+		}
+
+		blktrans_dev = (struct mtd_blktrans_dev *)(bdev->bd_disk->private_data);
+		if (!blktrans_dev || !blktrans_dev->tr) {
+			blkdev_put(bdev, FMODE_READ);
+			return -EINVAL;
+		}
+		mtdnr = blktrans_dev->devnum;
+		part_bits = blktrans_dev->tr->part_bits;
+		blkdev_put(bdev, FMODE_READ);
+		if (MINOR(bdev->bd_dev) != (mtdnr << part_bits))
+			return -EINVAL;
 
+		return mtd_get_sb_by_nr(fc, mtdnr, fill_super);
+	}
+	blkdev_put(bdev, FMODE_READ);
 #endif /* CONFIG_BLOCK */
 
 	if (!(fc->sb_flags & SB_SILENT))
-- 
2.31.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
