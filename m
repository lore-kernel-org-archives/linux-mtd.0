Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17532C56201
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:35:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B3F6205ED
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:35:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="huw+qhbg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FlEj2XVd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B3F6205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yoo/V7sqFzjLgGqdCE7woYkxWpcpycA1MekXMS6II+U=; b=huw+qhbgV9N3UmYNbAzF87oLf
	eOpOym+QV1dEdUAcRArKDHSeuU81mZOItZ7hGRtwa5UC0NOjbhLa+H40uMSnAtNzfnbtwdCeli394
	yIrgoU3+xshMtaGJNYOn9lcCxcFDF1vcMsyhrJ/XhKy5njrsNGymwlYYfXTG9kBPG/lihCPE6RaSc
	0rCIVmRfKTgjpF5VwQX8Bnb+VFcrhaENRMCppl/TSswp8CJpVrLUSUg878X6YPxH49Jaxt3xfNLf+
	cBtqgWZT+DLUhNPI4kph6Gk0ei/WZo0xFzlJCHEibr8VALvCdj73lks/OJ3ZuZbQPIKPOv9SZ6Ldk
	laNzGpw9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYSH-0002UP-F8; Tue, 24 Nov 2020 13:34:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMu-0008A2-7a
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=72pzSMUtG54OL/Eca8JCS6Cut6vtXvByBKF+r5JkUZU=; b=FlEj2XVd4aO5E+awAOEaxrjHFP
 nbTwD38evQvBZtbbRpaPRv4w7SQgR/X5RUlt/qA1fFWMPnWI86V5fG/R+1H2W/UZ29b7ldRWLa1dd
 tU1fTXQkFVMRV5FKtiDc5PNo+nlp3px3fcZyUXemalSLi8QkH68sCLNjrgg/YWejEIQ4GICloHKpX
 hcIJqz4QLGO7aEZpxnGZJ/p3S2Y6mm2yl1JeTx600EG8EhKGRAmNzZwBbGkSr/guQr9ug6dVSnUs1
 PcWorBNAAH3r27c7yQDm7bIcF+dmd7t7AZ2DGtVVY9S3IddEspErcixUNQioTsPQbjYtA1t5lfJJL
 UNaX/fwg==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMs-0006Z8-1F; Tue, 24 Nov 2020 13:28:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 21/45] block: refactor blkdev_get
Date: Tue, 24 Nov 2020 14:27:27 +0100
Message-Id: <20201124132751.3747337-22-hch@lst.de>
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

Move more code that is only run on the outer open but not the open of
the underlying whole device when opening a partition into blkdev_get,
which leads to a much easier to follow structure.

This allows to simplify the disk and module refcounting so that one
reference is held for each open, similar to what we do with normal
file operations.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/block_dev.c | 185 +++++++++++++++++++++++--------------------------
 1 file changed, 86 insertions(+), 99 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 88847839ef0102..2ffa11a95f10db 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1403,46 +1403,12 @@ EXPORT_SYMBOL_GPL(bdev_disk_changed);
  *  mutex_lock(part->bd_mutex)
  *    mutex_lock_nested(whole->bd_mutex, 1)
  */
-
-static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
-		int for_part)
+static int __blkdev_get(struct block_device *bdev, struct gendisk *disk,
+		int partno, fmode_t mode)
 {
-	struct block_device *whole = NULL, *claiming = NULL;
-	struct gendisk *disk;
 	int ret;
-	int partno;
-	bool first_open = false, unblock_events = true, need_restart;
-
- restart:
-	need_restart = false;
-	ret = -ENXIO;
-	disk = bdev_get_gendisk(bdev, &partno);
-	if (!disk)
-		goto out;
-
-	if (partno) {
-		whole = bdget_disk(disk, 0);
-		if (!whole) {
-			ret = -ENOMEM;
-			goto out_put_disk;
-		}
-	}
 
-	if (!for_part && (mode & FMODE_EXCL)) {
-		WARN_ON_ONCE(!holder);
-		if (whole)
-			claiming = whole;
-		else
-			claiming = bdev;
-		ret = bd_prepare_to_claim(bdev, claiming, holder);
-		if (ret)
-			goto out_put_whole;
-	}
-
-	disk_block_events(disk);
-	mutex_lock_nested(&bdev->bd_mutex, for_part);
 	if (!bdev->bd_openers) {
-		first_open = true;
 		bdev->bd_disk = disk;
 		bdev->bd_contains = bdev;
 		bdev->bd_partno = partno;
@@ -1454,15 +1420,8 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
 				goto out_clear;
 
 			ret = 0;
-			if (disk->fops->open) {
+			if (disk->fops->open)
 				ret = disk->fops->open(bdev, mode);
-				/*
-				 * If we lost a race with 'disk' being deleted,
-				 * try again.  See md.c
-				 */
-				if (ret == -ERESTARTSYS)
-					need_restart = true;
-			}
 
 			if (!ret) {
 				bd_set_nr_sectors(bdev, get_capacity(disk));
@@ -1482,14 +1441,23 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
 			if (ret)
 				goto out_clear;
 		} else {
-			BUG_ON(for_part);
-			ret = __blkdev_get(whole, mode, NULL, 1);
-			if (ret)
+			struct block_device *whole = bdget_disk(disk, 0);
+
+			mutex_lock_nested(&whole->bd_mutex, 1);
+			ret = __blkdev_get(whole, disk, 0, mode);
+			if (ret) {
+				mutex_unlock(&whole->bd_mutex);
+				bdput(whole);
 				goto out_clear;
-			bdev->bd_contains = bdgrab(whole);
+			}
+			whole->bd_part_count++;
+			mutex_unlock(&whole->bd_mutex);
+
+			bdev->bd_contains = whole;
 			bdev->bd_part = disk_get_part(disk, partno);
 			if (!(disk->flags & GENHD_FL_UP) ||
 			    !bdev->bd_part || !bdev->bd_part->nr_sects) {
+				__blkdev_put(whole, mode, 1);
 				ret = -ENXIO;
 				goto out_clear;
 			}
@@ -1509,58 +1477,17 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
 			    (!ret || ret == -ENOMEDIUM))
 				bdev_disk_changed(bdev, ret == -ENOMEDIUM);
 			if (ret)
-				goto out_unlock_bdev;
+				return ret;
 		}
 	}
 	bdev->bd_openers++;
-	if (for_part)
-		bdev->bd_part_count++;
-	if (claiming)
-		bd_finish_claiming(bdev, claiming, holder);
-
-	/*
-	 * Block event polling for write claims if requested.  Any write holder
-	 * makes the write_holder state stick until all are released.  This is
-	 * good enough and tracking individual writeable reference is too
-	 * fragile given the way @mode is used in blkdev_get/put().
-	 */
-	if (claiming && (mode & FMODE_WRITE) && !bdev->bd_write_holder &&
-	    (disk->flags & GENHD_FL_BLOCK_EVENTS_ON_EXCL_WRITE)) {
-		bdev->bd_write_holder = true;
-		unblock_events = false;
-	}
-	mutex_unlock(&bdev->bd_mutex);
-
-	if (unblock_events)
-		disk_unblock_events(disk);
-
-	/* only one opener holds refs to the module and disk */
-	if (!first_open)
-		put_disk_and_module(disk);
-	if (whole)
-		bdput(whole);
 	return 0;
 
  out_clear:
 	disk_put_part(bdev->bd_part);
 	bdev->bd_disk = NULL;
 	bdev->bd_part = NULL;
-	if (bdev != bdev->bd_contains)
-		__blkdev_put(bdev->bd_contains, mode, 1);
 	bdev->bd_contains = NULL;
- out_unlock_bdev:
-	if (claiming)
-		bd_abort_claiming(bdev, claiming, holder);
-	mutex_unlock(&bdev->bd_mutex);
-	disk_unblock_events(disk);
- out_put_whole:
- 	if (whole)
-		bdput(whole);
- out_put_disk:
-	put_disk_and_module(disk);
-	if (need_restart)
-		goto restart;
- out:
 	return ret;
 }
 
@@ -1585,7 +1512,12 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
  */
 static int blkdev_get(struct block_device *bdev, fmode_t mode, void *holder)
 {
-	int ret, perm = 0;
+	struct block_device *claiming;
+	bool unblock_events = true;
+	struct gendisk *disk;
+	int perm = 0;
+	int partno;
+	int ret;
 
 	if (mode & FMODE_READ)
 		perm |= MAY_READ;
@@ -1595,13 +1527,67 @@ static int blkdev_get(struct block_device *bdev, fmode_t mode, void *holder)
 	if (ret)
 		goto bdput;
 
-	ret =__blkdev_get(bdev, mode, holder, 0);
-	if (ret)
+	/*
+	 * If we lost a race with 'disk' being deleted, try again.  See md.c.
+	 */
+retry:
+	ret = -ENXIO;
+	disk = bdev_get_gendisk(bdev, &partno);
+	if (!disk)
 		goto bdput;
-	return 0;
 
+	if (mode & FMODE_EXCL) {
+		WARN_ON_ONCE(!holder);
+	
+		ret = -ENOMEM;
+		claiming = bdget_disk(disk, 0);
+		if (!claiming)
+			goto put_disk;
+		ret = bd_prepare_to_claim(bdev, claiming, holder);
+		if (ret)
+			goto put_claiming;
+	}
+
+	disk_block_events(disk);
+
+	mutex_lock(&bdev->bd_mutex);
+	ret =__blkdev_get(bdev, disk, partno, mode);
+	if (!(mode & FMODE_EXCL)) {
+		; /* nothing to do here */
+	} else if (ret) {
+		bd_abort_claiming(bdev, claiming, holder);
+	} else {
+		bd_finish_claiming(bdev, claiming, holder);
+
+		/*
+		 * Block event polling for write claims if requested.  Any write
+		 * holder makes the write_holder state stick until all are
+		 * released.  This is good enough and tracking individual
+		 * writeable reference is too fragile given the way @mode is
+		 * used in blkdev_get/put().
+		 */
+		if ((mode & FMODE_WRITE) && !bdev->bd_write_holder &&
+		    (disk->flags & GENHD_FL_BLOCK_EVENTS_ON_EXCL_WRITE)) {
+			bdev->bd_write_holder = true;
+			unblock_events = false;
+		}
+	}
+	mutex_unlock(&bdev->bd_mutex);
+
+	if (unblock_events)
+		disk_unblock_events(disk);
+
+put_claiming:
+	if (mode & FMODE_EXCL)
+		bdput(claiming);
+put_disk:
+	if (ret)
+		put_disk_and_module(disk);
+	if (ret == -ERESTARTSYS)
+		goto retry;
 bdput:
-	bdput(bdev);
+	if (ret)
+		bdput(bdev);
 	return ret;
 }
 
@@ -1749,8 +1735,6 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
 		if (bdev_is_partition(bdev))
 			victim = bdev->bd_contains;
 		bdev->bd_contains = NULL;
-
-		put_disk_and_module(disk);
 	} else {
 		if (!bdev_is_partition(bdev) && disk->fops->release)
 			disk->fops->release(disk, mode);
@@ -1763,6 +1747,8 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
 
 void blkdev_put(struct block_device *bdev, fmode_t mode)
 {
+	struct gendisk *disk = bdev->bd_disk;
+
 	mutex_lock(&bdev->bd_mutex);
 
 	if (mode & FMODE_EXCL) {
@@ -1791,7 +1777,7 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
 		 * unblock evpoll if it was a write holder.
 		 */
 		if (bdev_free && bdev->bd_write_holder) {
-			disk_unblock_events(bdev->bd_disk);
+			disk_unblock_events(disk);
 			bdev->bd_write_holder = false;
 		}
 	}
@@ -1801,11 +1787,12 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
 	 * event.  This is to ensure detection of media removal commanded
 	 * from userland - e.g. eject(1).
 	 */
-	disk_flush_events(bdev->bd_disk, DISK_EVENT_MEDIA_CHANGE);
+	disk_flush_events(disk, DISK_EVENT_MEDIA_CHANGE);
 
 	mutex_unlock(&bdev->bd_mutex);
 
 	__blkdev_put(bdev, mode, 0);
+	put_disk_and_module(disk);
 }
 EXPORT_SYMBOL(blkdev_put);
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
