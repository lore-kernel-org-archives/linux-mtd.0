Return-Path: <SRS0=MywH=JJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB7AC43460
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 15:16:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B5E60C3E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Apr 2021 15:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9B5E60C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=26Ev/+gnD73aKU6iSwmdDfqGlcAGTxkc7xcbIPvxtC0=; b=NjRXTSzDa3E3mFXsLrFlmXd7L
	lY0BogZvaygCYQisl2OV4C3pkh/XLn7KNL074UFO8rhUJc3YGGoFjwwkhWyvO198ladwQYSjlWdgo
	ykXyrmQQA4JNyrIAhiNPBCqqzA0qKuZ8KYpiJQPzMJQjCXYX4G8YhMBQAtny9huS6AUj+hpaxh3K5
	0YSoZnfyHqWw0cEEghQ2dvWcD9LTGc6sK6rd4dvNvGMTSA4x1ggpyvspwOlU2Zm25a/VsogXiubX0
	vNTmIQWGZRoTtIvYcFsGoU2C6aCVltSZPMkhOgC7ZsEcBMVoGan50gn5APFVAUtHByn91MsecOEpj
	Zlg+Bn+8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVyHN-0072gJ-UK; Mon, 12 Apr 2021 15:15:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyHL-0072gE-LE
 for linux-mtd@desiato.infradead.org; Mon, 12 Apr 2021 15:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ho3hzjr8HD7dLNNxr5JmVeZvcjH7tfHx0KcSS1afNZ4=; b=2RVutfTp1JrZDcr/M95IsvOmY2
 Hi14cnliCcDC/eRZeBoNXPq8MMAc4NBQpso8JKF46km+rx1TpuJ/YzBXWCX9IzqTRmhsAl8YjXeBV
 Z06641s6j7r+rL93trBRIYg17mNA/VFAW2VXhzzXIy5PTZhy8EzoAJrHjRHAj1LmkUsmu/lPxzDWs
 s7fBcJebwiqrCIDsNjVu5174dqS+CN1/XtxbDyL02/qA7wmyWO+Y8OSV7V1akFmKRafhohnLTxt9V
 HQJwidbu9jtd+h9oOkhOGj8FzXSOL58Y6W+6qdet5lL7SV3PftPoLSISMJpwIfBkOLpidTigs0vI0
 8Rgmq+xQ==;
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyHI-006KmY-Pb
 for linux-mtd@lists.infradead.org; Mon, 12 Apr 2021 15:15:06 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.93.0.4) (envelope-from <daniel@makrotopia.org>)
 id 1lVyHA-000690-Ee; Mon, 12 Apr 2021 17:14:56 +0200
Date: Mon, 12 Apr 2021 16:14:44 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v3] mtd: super: don't rely on mtdblock device minor
Message-ID: <YHRj5MUb5MGdPQqw@makrotopia.org>
References: <YG9qzC/SaD7SNWVm@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YG9qzC/SaD7SNWVm@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_081504_858427_4BFD95DA 
X-CRM114-Status: GOOD (  14.36  )
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
v3: fix typo in patch description
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
