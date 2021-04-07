Return-Path: <SRS0=eMUk=JE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB073C433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 21:56:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A652611C1
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 21:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A652611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LIdbdkMfgwLn1XCDjn7yJZ+2QfLFH6uT09iRbGkFT5k=; b=TE9STZ1tKjjIK23Ah9f1yYd96I
	Hy7IUTsdDRVuQXnDxCv95G+V8q5U5vnFkInb6r4DqjxvM/l/zpcSXr+Dl/fAdWRUC9JDcs3RqQUYa
	KOTYX+BR7qfUthO+YfC7a27C1/2PuD+2GvTFHrnYuiIfaee5zFYrWqF6iBTQX/3M2bl83Gr42LNQ4
	+IFx3BXpLRkUuBklJ35tP9tO282CinSyPIRRKkw9shm1uWMEGKVgnf9THptgyzYc4b00NjYTpBjfA
	khsa6muEVBE7oR7Ic/pbRaWfvtarUkKKoDONt+E8T0qfydlFhQcaE2cligIrnJrWJxF+NAvwcs9mn
	EwOmlKDg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUG9W-00675F-JL; Wed, 07 Apr 2021 21:55:58 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUG9R-00673T-BW
 for linux-mtd@lists.infradead.org; Wed, 07 Apr 2021 21:55:56 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.93.0.4) (envelope-from <daniel@makrotopia.org>)
 id 1lUG9M-0004ui-MP; Wed, 07 Apr 2021 23:55:48 +0200
Date: Wed, 7 Apr 2021 22:55:32 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: super: don't reply on mtdblock device minor
Message-ID: <YG4qVPz68WAwPtB+@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_225553_469855_397159B4 
X-CRM114-Status: GOOD (  13.83  )
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

For mtdblock devices with partitions (ie. part_bits != 0) the
assumption that the minor number of the mtdblock device matches
the mtdnum doesn't hold true.
Properly resolve mtd device from blktrans layer instead.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/mtdsuper.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index c3e2098372f2e..dc52f9929c8fb 100644
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
 
@@ -169,21 +171,38 @@ int get_tree_mtd(struct fs_context *fc,
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
+			BUG();
+			return -EINVAL;
+		}
+
+		blktrans_dev = (struct mtd_blktrans_dev *)(bdev->bd_disk->private_data);
+		if (!blktrans_dev || !blktrans_dev->tr) {
+			blkdev_put(bdev, FMODE_READ);
+			BUG();
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
