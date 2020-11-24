Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D56C56201
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:42:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E5520782
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:42:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ae5hOrY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KADdJG2R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24E5520782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yBaoy/vsPC9U5hjUVZpDVOrfJysMOOWN1k/eM4TZ8j8=; b=2ae5hOrY1AB/+nzap5jResH5C
	S2hOtomJPPkMALRpy+vWq+6epm85ebBIcDrvx03HRjpSqM9kaqgJ//1+NV3mjJ+txM0PaZNUgejpJ
	tB5AC+B7wID6bZy/XP+r/CaY+lydq0/gSqDRM1xdl4WZLvXEa9mzhDwyqxuPrm+MBDvEkUGSfXEC0
	3Eq5sGWtzGkd+H9Q569VWsWywr3mOK8XZYMR/zao0syNH7V0GcwwqZ/My5f6KWHNnIrc7/eGX83GP
	vE9ZUKPkx6Uw6hdSe67X4JrrnHfJUlUgmvUzP+4m9/bqsSwYJn2qsllF0ezkRWHBZiVflEkUe9eyq
	8v2yDy7SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYZD-000179-Op; Tue, 24 Nov 2020 13:41:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYNe-0008Vl-D8
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=oY/Kzr07zSpX+zHQFFeLth/QBlUbzbRy+7rMoha2aW8=; b=KADdJG2RhR4/EqqmDR2o46+ook
 CJr/KoBRvzXuaGAzArmj0uFbtLWWacUi3GUHPNtW5gX+xXv2xhbfbJGb7ALMkupFI53CzOTk86848
 7nWfv4SWiWKmQYpt7ubrEpnqNpH/Gv4MXURNq6jxRjnMI+yadTr91z4UnJ3e/Ux9cofnNl7pzL3aV
 uEFPy1OOl7jAKXLcYeRLyijWGjLTq1guL80iDVCbay23g7rQhuwy5LOm2l6sdF2RN9/jvwR+0hra6
 HdSBQuMgnQPSPASpJLUUiANBaVoaraWMU/rc01jMlFng4Fsq8t435FuUVFfM1FddcNMS4tYgD39ll
 jo+Vc6wg==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYNb-0006jz-99; Tue, 24 Nov 2020 13:29:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 45/45] block: stop using bdget_disk for partition 0
Date: Tue, 24 Nov 2020 14:27:51 +0100
Message-Id: <20201124132751.3747337-46-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We can just dereference the point in struct gendisk instead.  Also
remove the now unused export.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 block/genhd.c                   |  1 -
 drivers/block/nbd.c             |  4 +---
 drivers/block/xen-blkfront.c    | 20 +++++---------------
 drivers/block/zram/zram_drv.c   | 18 +++---------------
 drivers/md/dm.c                 | 16 ++--------------
 drivers/s390/block/dasd_ioctl.c |  5 ++---
 6 files changed, 13 insertions(+), 51 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index e1f67b9951f0ec..9a3ad1895888c6 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -912,7 +912,6 @@ struct block_device *bdget_disk(struct gendisk *disk, int partno)
 
 	return bdev;
 }
-EXPORT_SYMBOL(bdget_disk);
 
 /*
  * print a full list of all partitions - intended for places where the root
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 014683968ce174..92f84ed0ba9eb6 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1488,12 +1488,10 @@ static int nbd_open(struct block_device *bdev, fmode_t mode)
 static void nbd_release(struct gendisk *disk, fmode_t mode)
 {
 	struct nbd_device *nbd = disk->private_data;
-	struct block_device *bdev = bdget_disk(disk, 0);
 
 	if (test_bit(NBD_RT_DISCONNECT_ON_CLOSE, &nbd->config->runtime_flags) &&
-			bdev->bd_openers == 0)
+			disk->part0->bd_openers == 0)
 		nbd_disconnect_and_put(nbd);
-	bdput(bdev);
 
 	nbd_config_put(nbd);
 	nbd_put(nbd);
diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 79521e33d30ed5..188e0b47534bcf 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -2153,7 +2153,7 @@ static void blkfront_closing(struct blkfront_info *info)
 	}
 
 	if (info->gd)
-		bdev = bdget_disk(info->gd, 0);
+		bdev = bdgrab(info->gd->part0);
 
 	mutex_unlock(&info->mutex);
 
@@ -2518,7 +2518,7 @@ static int blkfront_remove(struct xenbus_device *xbdev)
 
 	disk = info->gd;
 	if (disk)
-		bdev = bdget_disk(disk, 0);
+		bdev = bdgrab(disk->part0);
 
 	info->xbdev = NULL;
 	mutex_unlock(&info->mutex);
@@ -2595,19 +2595,11 @@ static int blkif_open(struct block_device *bdev, fmode_t mode)
 static void blkif_release(struct gendisk *disk, fmode_t mode)
 {
 	struct blkfront_info *info = disk->private_data;
-	struct block_device *bdev;
 	struct xenbus_device *xbdev;
 
 	mutex_lock(&blkfront_mutex);
-
-	bdev = bdget_disk(disk, 0);
-
-	if (!bdev) {
-		WARN(1, "Block device %s yanked out from us!\n", disk->disk_name);
+	if (disk->part0->bd_openers)
 		goto out_mutex;
-	}
-	if (bdev->bd_openers)
-		goto out;
 
 	/*
 	 * Check if we have been instructed to close. We will have
@@ -2619,7 +2611,7 @@ static void blkif_release(struct gendisk *disk, fmode_t mode)
 
 	if (xbdev && xbdev->state == XenbusStateClosing) {
 		/* pending switch to state closed */
-		dev_info(disk_to_dev(bdev->bd_disk), "releasing disk\n");
+		dev_info(disk_to_dev(disk), "releasing disk\n");
 		xlvbd_release_gendisk(info);
 		xenbus_frontend_closed(info->xbdev);
  	}
@@ -2628,14 +2620,12 @@ static void blkif_release(struct gendisk *disk, fmode_t mode)
 
 	if (!xbdev) {
 		/* sudden device removal */
-		dev_info(disk_to_dev(bdev->bd_disk), "releasing disk\n");
+		dev_info(disk_to_dev(disk), "releasing disk\n");
 		xlvbd_release_gendisk(info);
 		disk->private_data = NULL;
 		free_info(info);
 	}
 
-out:
-	bdput(bdev);
 out_mutex:
 	mutex_unlock(&blkfront_mutex);
 }
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 01757f9578dcb8..56024905bd242c 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1748,7 +1748,7 @@ static ssize_t reset_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t len)
 {
 	struct zram *zram = dev_to_zram(dev);
-	struct block_device *bdev;
+	struct block_device *bdev = zram->disk->part0;
 	unsigned short do_reset;
 	int ret = 0;
 
@@ -1758,17 +1758,12 @@ static ssize_t reset_store(struct device *dev,
 	if (!do_reset)
 		return -EINVAL;
 
-	bdev = bdget_disk(zram->disk, 0);
-	if (!bdev)
-		return -ENOMEM;
-
 	mutex_lock(&bdev->bd_mutex);
 	if (bdev->bd_openers)
 		ret = -EBUSY;
 	else
 		zram_reset_device(zram);
 	mutex_unlock(&bdev->bd_mutex);
-	bdput(bdev);
 
 	return ret ? ret : len;
 }
@@ -1933,15 +1928,8 @@ static int zram_add(void)
 
 static int zram_remove(struct zram *zram)
 {
-	struct block_device *bdev = bdget_disk(zram->disk, 0);
-
-	if (bdev) {
-		if (bdev->bd_openers) {
-			bdput(bdev);
-			return -EBUSY;
-		}
-		bdput(bdev);
-	}
+	if (zram->disk->part0->bd_openers)
+		return -EBUSY;
 
 	del_gendisk(zram->disk);
 	zram_debugfs_unregister(zram);
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 176adcff56b380..ed7e836efbcdbc 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -2375,16 +2375,11 @@ struct dm_table *dm_swap_table(struct mapped_device *md, struct dm_table *table)
  */
 static int lock_fs(struct mapped_device *md)
 {
-	struct block_device *bdev;
 	int r;
 
 	WARN_ON(test_bit(DMF_FROZEN, &md->flags));
 
-	bdev = bdget_disk(md->disk, 0);
-	if (!bdev)
-		return -ENOMEM;
-	r = freeze_bdev(bdev);
-	bdput(bdev);
+	r = freeze_bdev(md->disk->part0);
 	if (!r)
 		set_bit(DMF_FROZEN, &md->flags);
 	return r;
@@ -2392,16 +2387,9 @@ static int lock_fs(struct mapped_device *md)
 
 static void unlock_fs(struct mapped_device *md)
 {
-	struct block_device *bdev;
-
 	if (!test_bit(DMF_FROZEN, &md->flags))
 		return;
-
-	bdev = bdget_disk(md->disk, 0);
-	if (!bdev)
-		return;
-	thaw_bdev(bdev);
-	bdput(bdev);
+	thaw_bdev(md->disk->part0);
 	clear_bit(DMF_FROZEN, &md->flags);
 }
 
diff --git a/drivers/s390/block/dasd_ioctl.c b/drivers/s390/block/dasd_ioctl.c
index 304eba1acf163c..9f642440894655 100644
--- a/drivers/s390/block/dasd_ioctl.c
+++ b/drivers/s390/block/dasd_ioctl.c
@@ -220,9 +220,8 @@ dasd_format(struct dasd_block *block, struct format_data_t *fdata)
 	 * enabling the device later.
 	 */
 	if (fdata->start_unit == 0) {
-		struct block_device *bdev = bdget_disk(block->gdp, 0);
-		bdev->bd_inode->i_blkbits = blksize_bits(fdata->blksize);
-		bdput(bdev);
+		block->gdp->part0->bd_inode->i_blkbits =
+			blksize_bits(fdata->blksize);
 	}
 
 	rc = base->discipline->format_device(base, fdata, 1);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
