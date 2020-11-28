Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8ADC63777
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:22:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F971246C3
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GgCWxf5X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="M2g6tz31"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F971246C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mVk9xabkhyFJvJIOw3XmwRaOUqsYOMxTeT1LVQAKKJs=; b=GgCWxf5XN3+6XoTH70ms+vk+u
	7zU7LvDBfBnOAISAS3kwSFAp4w6bAzSg8RyZe8zTdVFeu1YFNtPbXUxoa0TJTvXpXD4MjSI0ToH5G
	lbIs+ffgpSZ7jLri3KcFwJVm3RTpQKeWuAXLmLyUyjd4OLUm0OOH4uPtkygRDQcB8k9ya0wT41h+E
	uV1JMNe1RaxcPViRFJjCtaqIEiKJp0qUNtEFkoVm+ILMv+2RVQCSxzwtlG9SUjLp1/Th4cH5/FnhV
	gUuoCUMWJoFXaw+FbcOJ9jxJhBU1QMSbUa+GDOPhpMpShtd1maKfkyodcwuPPmX/2m07EHtCELbie
	cExdw8VAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2y7-0003a6-31; Sat, 28 Nov 2020 16:21:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2tE-0000wx-Rr
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7uXerCHB6aSYeRVOmpW3+FvIW2+Jb0Cz0RvY49RAcoU=; b=M2g6tz31JNLCCrGTJYFzJiW+Ft
 OwvXoI4Vwnq4nDhY9H8grOkdPI/x6b1ccCv8RLM9znBNqe7muYbrDZDozp2XXP7b1FB1JbeVV5yNp
 7zIOMVc5SbhiHDCMHU//dUKkQhYCg5sBPniNSBjJRSQmDAZTgNt9xgfuH0hSn4JUoKvgPzQI5Sph3
 nqoGRyClMJjgi6JC5O5ng7r442WMhSws/fiVscAFY2FnfOBmY5z7gs98h5E4kjNGtWPozT9nO/siy
 W7Fyk11k2z5C70AsPegFeCyCKhM4/VDeNxh9WR9A8g6UKPvldoTMuMKEFkt6XTXh4VYmrmr+Lw4qp
 1PHwoXnA==;
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2tB-0000LJ-HP; Sat, 28 Nov 2020 16:15:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 27/45] block: simplify the block device claiming interface
Date: Sat, 28 Nov 2020 17:14:52 +0100
Message-Id: <20201128161510.347752-28-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128161510.347752-1-hch@lst.de>
References: <20201128161510.347752-1-hch@lst.de>
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
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Stop passing the whole device as a separate argument given that it
can be trivially deducted and cleanup the !holder debug check.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
Acked-by: Tejun Heo <tj@kernel.org>
---
 drivers/block/loop.c   | 12 +++++-----
 fs/block_dev.c         | 51 +++++++++++++++---------------------------
 include/linux/blkdev.h |  6 ++---
 3 files changed, 25 insertions(+), 44 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index c0df88b3300c41..d643c67be6acea 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1069,7 +1069,6 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	struct file	*file;
 	struct inode	*inode;
 	struct address_space *mapping;
-	struct block_device *claimed_bdev = NULL;
 	int		error;
 	loff_t		size;
 	bool		partscan;
@@ -1088,8 +1087,7 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	 * here to avoid changing device under exclusive owner.
 	 */
 	if (!(mode & FMODE_EXCL)) {
-		claimed_bdev = bdev_whole(bdev);
-		error = bd_prepare_to_claim(bdev, claimed_bdev, loop_configure);
+		error = bd_prepare_to_claim(bdev, loop_configure);
 		if (error)
 			goto out_putf;
 	}
@@ -1176,15 +1174,15 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	mutex_unlock(&loop_ctl_mutex);
 	if (partscan)
 		loop_reread_partitions(lo, bdev);
-	if (claimed_bdev)
-		bd_abort_claiming(bdev, claimed_bdev, loop_configure);
+	if (!(mode & FMODE_EXCL))
+		bd_abort_claiming(bdev, loop_configure);
 	return 0;
 
 out_unlock:
 	mutex_unlock(&loop_ctl_mutex);
 out_bdev:
-	if (claimed_bdev)
-		bd_abort_claiming(bdev, claimed_bdev, loop_configure);
+	if (!(mode & FMODE_EXCL))
+		bd_abort_claiming(bdev, loop_configure);
 out_putf:
 	fput(file);
 out:
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 94baee369d26e5..0569f5ebeb6fd0 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -110,24 +110,20 @@ EXPORT_SYMBOL(invalidate_bdev);
 int truncate_bdev_range(struct block_device *bdev, fmode_t mode,
 			loff_t lstart, loff_t lend)
 {
-	struct block_device *claimed_bdev = NULL;
-	int err;
-
 	/*
 	 * If we don't hold exclusive handle for the device, upgrade to it
 	 * while we discard the buffer cache to avoid discarding buffers
 	 * under live filesystem.
 	 */
 	if (!(mode & FMODE_EXCL)) {
-		claimed_bdev = bdev_whole(bdev);
-		err = bd_prepare_to_claim(bdev, claimed_bdev,
-					  truncate_bdev_range);
+		int err = bd_prepare_to_claim(bdev, truncate_bdev_range);
 		if (err)
 			return err;
 	}
+
 	truncate_inode_pages_range(bdev->bd_inode->i_mapping, lstart, lend);
-	if (claimed_bdev)
-		bd_abort_claiming(bdev, claimed_bdev, truncate_bdev_range);
+	if (!(mode & FMODE_EXCL))
+		bd_abort_claiming(bdev, truncate_bdev_range);
 	return 0;
 }
 EXPORT_SYMBOL(truncate_bdev_range);
@@ -978,7 +974,6 @@ static bool bd_may_claim(struct block_device *bdev, struct block_device *whole,
 /**
  * bd_prepare_to_claim - claim a block device
  * @bdev: block device of interest
- * @whole: the whole device containing @bdev, may equal @bdev
  * @holder: holder trying to claim @bdev
  *
  * Claim @bdev.  This function fails if @bdev is already claimed by another
@@ -988,9 +983,12 @@ static bool bd_may_claim(struct block_device *bdev, struct block_device *whole,
  * RETURNS:
  * 0 if @bdev can be claimed, -EBUSY otherwise.
  */
-int bd_prepare_to_claim(struct block_device *bdev, struct block_device *whole,
-		void *holder)
+int bd_prepare_to_claim(struct block_device *bdev, void *holder)
 {
+	struct block_device *whole = bdev_whole(bdev);
+
+	if (WARN_ON_ONCE(!holder))
+		return -EINVAL;
 retry:
 	spin_lock(&bdev_lock);
 	/* if someone else claimed, fail */
@@ -1030,15 +1028,15 @@ static void bd_clear_claiming(struct block_device *whole, void *holder)
 /**
  * bd_finish_claiming - finish claiming of a block device
  * @bdev: block device of interest
- * @whole: whole block device
  * @holder: holder that has claimed @bdev
  *
  * Finish exclusive open of a block device. Mark the device as exlusively
  * open by the holder and wake up all waiters for exclusive open to finish.
  */
-static void bd_finish_claiming(struct block_device *bdev,
-		struct block_device *whole, void *holder)
+static void bd_finish_claiming(struct block_device *bdev, void *holder)
 {
+	struct block_device *whole = bdev_whole(bdev);
+
 	spin_lock(&bdev_lock);
 	BUG_ON(!bd_may_claim(bdev, whole, holder));
 	/*
@@ -1063,11 +1061,10 @@ static void bd_finish_claiming(struct block_device *bdev,
  * also used when exclusive open is not actually desired and we just needed
  * to block other exclusive openers for a while.
  */
-void bd_abort_claiming(struct block_device *bdev, struct block_device *whole,
-		       void *holder)
+void bd_abort_claiming(struct block_device *bdev, void *holder)
 {
 	spin_lock(&bdev_lock);
-	bd_clear_claiming(whole, holder);
+	bd_clear_claiming(bdev_whole(bdev), holder);
 	spin_unlock(&bdev_lock);
 }
 EXPORT_SYMBOL(bd_abort_claiming);
@@ -1487,7 +1484,6 @@ void blkdev_put_no_open(struct block_device *bdev)
  */
 struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder)
 {
-	struct block_device *claiming;
 	bool unblock_events = true;
 	struct block_device *bdev;
 	struct gendisk *disk;
@@ -1510,15 +1506,9 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder)
 	disk = bdev->bd_disk;
 
 	if (mode & FMODE_EXCL) {
-		WARN_ON_ONCE(!holder);
-	
-		ret = -ENOMEM;
-		claiming = bdget_disk(disk, 0);
-		if (!claiming)
-			goto put_blkdev;
-		ret = bd_prepare_to_claim(bdev, claiming, holder);
+		ret = bd_prepare_to_claim(bdev, holder);
 		if (ret)
-			goto put_claiming;
+			goto put_blkdev;
 	}
 
 	disk_block_events(disk);
@@ -1528,7 +1518,7 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder)
 	if (ret)
 		goto abort_claiming;
 	if (mode & FMODE_EXCL) {
-		bd_finish_claiming(bdev, claiming, holder);
+		bd_finish_claiming(bdev, holder);
 
 		/*
 		 * Block event polling for write claims if requested.  Any write
@@ -1547,18 +1537,13 @@ struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder)
 
 	if (unblock_events)
 		disk_unblock_events(disk);
-	if (mode & FMODE_EXCL)
-		bdput(claiming);
 	return bdev;
 
 abort_claiming:
 	if (mode & FMODE_EXCL)
-		bd_abort_claiming(bdev, claiming, holder);
+		bd_abort_claiming(bdev, holder);
 	mutex_unlock(&bdev->bd_mutex);
 	disk_unblock_events(disk);
-put_claiming:
-	if (mode & FMODE_EXCL)
-		bdput(claiming);
 put_blkdev:
 	blkdev_put_no_open(bdev);
 	if (ret == -ERESTARTSYS)
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 5d48b92f5e4348..43a25d855e049a 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1988,10 +1988,8 @@ void blkdev_show(struct seq_file *seqf, off_t offset);
 struct block_device *blkdev_get_by_path(const char *path, fmode_t mode,
 		void *holder);
 struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder);
-int bd_prepare_to_claim(struct block_device *bdev, struct block_device *whole,
-		void *holder);
-void bd_abort_claiming(struct block_device *bdev, struct block_device *whole,
-		void *holder);
+int bd_prepare_to_claim(struct block_device *bdev, void *holder);
+void bd_abort_claiming(struct block_device *bdev, void *holder);
 void blkdev_put(struct block_device *bdev, fmode_t mode);
 
 /* just for blk-cgroup, don't use elsewhere */
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
