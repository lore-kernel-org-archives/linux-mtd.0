Return-Path: <SRS0=SBmy=KG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0411C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 09:39:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FAB86008E
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 09:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FAB86008E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uVATlZlb8gJna3U28qGdXDaPfHBTWALM13ohqdvvf/Q=; b=gk7u5MYIKF7zhSbGPWD6K/GGh
	slWW1K3iEWY5mMyJugkmld/gOdLvFp03XfIpV03JnI2YkIV2TNCXpyLyDsiTyM82tpPvLu2fPUBFk
	6foBPxoobRYkFH5JoqMpwHMnP+LdQif2YEV6X6l+vk/fh5ThcpuS4rDLjbGAzyTjD0oHgOZrsn9cK
	uAY1t2ga6rXAFPRYrTjtkUkdf64SkkfTvyTBmH27ZbHxpP9OIwVidbuK2ckGpG1t6bnl/7EOqnKgN
	hj1LVL/WHhbau477wOfhUhfJPpDCoQHwdx3tsTU1/I6JZwez2r/kMgOtRxoZ0+C0OTLuMzwWBw6Jk
	KRnZ+o7Zg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgOqX-00Gj91-7t; Tue, 11 May 2021 09:38:33 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgEHK-00Foaz-92
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 22:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=R80nzKmBt48bS63oBckXuoJLmt6rsTMMI2W6M87C7mg=; b=ESuGZBundC9dZ+/2/0bf9Cojqi
 wlZFpIacX31/KvAdKdFieiYq3UbYFZTLsRAHCfxuLERqn3yA/noxj/yCFaFpXJW0lCtRBnvR6lFKU
 U7E4KWYJlnGIBHWinOzYjoJ1wLI+30c8Xg0JelD1PJK8/buHb4dqGZBdEDWbWZ9fwJ2wp5zeDe10t
 fDumhe0G/hVcqhnxsrhWkYe+CUavZuTGPtZD5BXwgLlGj5eyd3+b6N0Oyj6zPsuvbteuGZDalPZsG
 MfsKg4vLk4d9RSqbBml4qHfUtQCXESef62flqpK6ZWtBuPmzSjBB66l/H7rq8IdGfEgbqgliFZFmU
 Wfbos92g==;
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgEHH-0099fx-Nh
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 22:21:29 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1lgEHG-0001GW-0P; Tue, 11 May 2021 00:21:26 +0200
Date: Mon, 10 May 2021 23:21:17 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
 Hannes Reinecke <hare@suse.de>
Subject: [PATCH v4] mtd: super: don't rely on mtdblock device minor
Message-ID: <YJmx3Ru/5oyq6Y1a@makrotopia.org>
References: <20210510121837.14274d4f@xps13> <YG9qzC/SaD7SNWVm@makrotopia.org>
 <YHRj5MUb5MGdPQqw@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510121837.14274d4f@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_152127_795409_F52E08E9 
X-CRM114-Status: GOOD (  15.15  )
/bin/ln: failed to access
 'reaver_cache/texts/20210510_152127_795409_F52E08E9': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_152127_795409_F52E08E9 
X-CRM114-Status: GOOD (  12.06  )
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
v4: rebase on v5.13-rc1, improve error handling
v3: fix typo in patch description
v2: remove BUG() calls as requested by Miquel Raynal

 drivers/mtd/mtdsuper.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index 38b6aa849c638..40bb63e7bc7f6 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/mtd/super.h>
+#include <linux/mtd/blktrans.h>
 #include <linux/namei.h>
 #include <linux/export.h>
 #include <linux/ctype.h>
@@ -120,8 +121,9 @@ int get_tree_mtd(struct fs_context *fc,
 				struct fs_context *fc))
 {
 #ifdef CONFIG_BLOCK
-	dev_t dev;
-	int ret;
+	struct block_device *bdev;
+	struct mtd_blktrans_dev *blktrans_dev;
+	int ret, part_bits;
 #endif
 	int mtdnr;
 
@@ -169,16 +171,32 @@ int get_tree_mtd(struct fs_context *fc,
 	/* try the old way - the hack where we allowed users to mount
 	 * /dev/mtdblock$(n) but didn't actually _use_ the blockdev
 	 */
-	ret = lookup_bdev(fc->source, &dev);
-	if (ret) {
+	bdev = blkdev_get_by_path(fc->source, FMODE_READ, NULL);
+	if (IS_ERR(bdev)) {
+		ret = PTR_ERR(bdev);
 		errorf(fc, "MTD: Couldn't look up '%s': %d", fc->source, ret);
 		return ret;
 	}
-	pr_debug("MTDSB: lookup_bdev() returned 0\n");
+	pr_debug("MTDSB: blkdev_get_by_path() returned 0\n");
+
+	if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
+		if (!bdev->bd_disk)
+			goto error_mtdblock;
 
-	if (MAJOR(dev) == MTD_BLOCK_MAJOR)
-		return mtd_get_sb_by_nr(fc, MINOR(dev), fill_super);
+		blktrans_dev = (struct mtd_blktrans_dev *)(bdev->bd_disk->private_data);
+		if (!blktrans_dev || !blktrans_dev->tr)
+			goto error_mtdblock;
 
+		mtdnr = blktrans_dev->devnum;
+		part_bits = blktrans_dev->tr->part_bits;
+		if (MINOR(bdev->bd_dev) != (mtdnr << part_bits))
+			goto error_mtdblock;
+
+		blkdev_put(bdev, FMODE_READ);
+		return mtd_get_sb_by_nr(fc, mtdnr, fill_super);
+	}
+error_mtdblock:
+	blkdev_put(bdev, FMODE_READ);
 #endif /* CONFIG_BLOCK */
 
 	if (!(fc->sb_flags & SB_SILENT))
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
