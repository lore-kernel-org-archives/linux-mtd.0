Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46D2C63798
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:35:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 186D42083E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:35:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yJF9RLyr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ea+9q0/5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 186D42083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vypBS2DCt6SwtUQrLiLa0bupEfPJcF1DbJ9FCp8GaZg=; b=yJF9RLyrxgKCM8XmwTTff+lqW
	OumX6YTYTA9qemq8vwOTjTzZ25rlffmXlnFoW+x+i7mgFI0c4FLnCkWGiE9UpRGnTPWOnb+D/0ssB
	Yme6NzN/bteohGVvsfJEfTOzZzWPo5NcyRTstXhsem5e8mk06OIx6ijiu1dnHYTg738le5RM1pkK0
	unVBKP3RkAKjzIEW04HlTJ67bwpTO5vhdmoNKFXtwhhtoNL6pKEpqYk4+rCs7OMG3ftsC51IwTuEM
	XZG4Toe+QKvKOUjhUMJThXvrOS3fmEUKFSF1mS5zvLKy8b+x2RbuT/uaF5mH91RcY7/Yu38rBblj4
	22/Kcukug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYTT-00034h-0Y; Tue, 24 Nov 2020 13:35:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYN0-0008D3-K6
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Mhpy0Cb59wkbzThtZwDnrbLXD1rWczYtJDTvhh8SMU0=; b=Ea+9q0/5U1C3lxpYG+cp8W8+yq
 HDJXNs1xkR6d5Q3Tqe8DzJMoqEQ7/6jzh7BdzDFOCgM6eJtZ/NdJBDr4wa1fg4oXr74Y5kroSq79K
 VzT26zUATIM8C+jMZIcZTGU/6xcbiiu6NMExdkpxZExa8l29GhQ0Qte1UYrKyFBP9keFbOOHO8Do8
 pg6wptGVpopV7o1YV4zwjSA2vi6DqZrN+W1PPJvGBKFgFYLTf6Hhc/xGBLAwEP1JaP8w6JU559eQE
 bqw7WPqgNie7PhEXK192YC8HvtakiLkYEPYmuhZflhhpqi33qULhu7LUJVG5R4zXadf40txQOM3eh
 EzrjvHUQ==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMx-0006bA-OT; Tue, 24 Nov 2020 13:28:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 24/45] blk-cgroup: stop abusing get_gendisk
Date: Tue, 24 Nov 2020 14:27:30 +0100
Message-Id: <20201124132751.3747337-25-hch@lst.de>
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

Properly open the device instead of relying on deep internals by
using get_gendisk.  Note that this uses FMODE_NDELAY without either
FMODE_READ or FMODE_WRITE, which is a special open mode to allow
for opening without media access, thus avoiding unexpexted interactions
especially on removable media.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-cgroup.c         | 42 +++++++++++++++++++-------------------
 block/blk-iocost.c         | 36 ++++++++++++++++----------------
 include/linux/blk-cgroup.h |  4 ++--
 3 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 54fbe1e80cc41a..23437b96ea41e6 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -556,22 +556,22 @@ static struct blkcg_gq *blkg_lookup_check(struct blkcg *blkcg,
 }
 
 /**
- * blkg_conf_prep - parse and prepare for per-blkg config update
+ * blkcg_conf_open_bdev - parse and open bdev for per-blkg config update
  * @inputp: input string pointer
  *
  * Parse the device node prefix part, MAJ:MIN, of per-blkg config update
- * from @input and get and return the matching gendisk.  *@inputp is
+ * from @input and get and return the matching bdev.  *@inputp is
  * updated to point past the device node prefix.  Returns an ERR_PTR()
  * value on error.
  *
  * Use this function iff blkg_conf_prep() can't be used for some reason.
  */
-struct gendisk *blkcg_conf_get_disk(char **inputp)
+struct block_device *blkcg_conf_open_bdev(char **inputp)
 {
 	char *input = *inputp;
 	unsigned int major, minor;
-	struct gendisk *disk;
-	int key_len, part;
+	struct block_device *bdev;
+	int key_len;
 
 	if (sscanf(input, "%u:%u%n", &major, &minor, &key_len) != 2)
 		return ERR_PTR(-EINVAL);
@@ -581,16 +581,16 @@ struct gendisk *blkcg_conf_get_disk(char **inputp)
 		return ERR_PTR(-EINVAL);
 	input = skip_spaces(input);
 
-	disk = get_gendisk(MKDEV(major, minor), &part);
-	if (!disk)
+	bdev = blkdev_get_by_dev(MKDEV(major, minor), FMODE_NDELAY, NULL);
+	if (!bdev)
 		return ERR_PTR(-ENODEV);
-	if (part) {
-		put_disk_and_module(disk);
+	if (bdev_is_partition(bdev)) {
+		blkdev_put(bdev, FMODE_NDELAY);
 		return ERR_PTR(-ENODEV);
 	}
 
 	*inputp = input;
-	return disk;
+	return bdev;
 }
 
 /**
@@ -607,18 +607,18 @@ struct gendisk *blkcg_conf_get_disk(char **inputp)
  */
 int blkg_conf_prep(struct blkcg *blkcg, const struct blkcg_policy *pol,
 		   char *input, struct blkg_conf_ctx *ctx)
-	__acquires(rcu) __acquires(&disk->queue->queue_lock)
+	__acquires(rcu) __acquires(&bdev->bd_disk->queue->queue_lock)
 {
-	struct gendisk *disk;
+	struct block_device *bdev;
 	struct request_queue *q;
 	struct blkcg_gq *blkg;
 	int ret;
 
-	disk = blkcg_conf_get_disk(&input);
-	if (IS_ERR(disk))
-		return PTR_ERR(disk);
+	bdev = blkcg_conf_open_bdev(&input);
+	if (IS_ERR(bdev))
+		return PTR_ERR(bdev);
 
-	q = disk->queue;
+	q = bdev->bd_disk->queue;
 
 	rcu_read_lock();
 	spin_lock_irq(&q->queue_lock);
@@ -689,7 +689,7 @@ int blkg_conf_prep(struct blkcg *blkcg, const struct blkcg_policy *pol,
 			goto success;
 	}
 success:
-	ctx->disk = disk;
+	ctx->bdev = bdev;
 	ctx->blkg = blkg;
 	ctx->body = input;
 	return 0;
@@ -700,7 +700,7 @@ int blkg_conf_prep(struct blkcg *blkcg, const struct blkcg_policy *pol,
 	spin_unlock_irq(&q->queue_lock);
 	rcu_read_unlock();
 fail:
-	put_disk_and_module(disk);
+	blkdev_put(bdev, FMODE_NDELAY);
 	/*
 	 * If queue was bypassing, we should retry.  Do so after a
 	 * short msleep().  It isn't strictly necessary but queue
@@ -723,11 +723,11 @@ EXPORT_SYMBOL_GPL(blkg_conf_prep);
  * with blkg_conf_prep().
  */
 void blkg_conf_finish(struct blkg_conf_ctx *ctx)
-	__releases(&ctx->disk->queue->queue_lock) __releases(rcu)
+	__releases(&ctx->bdev->bd_disk->queue->queue_lock) __releases(rcu)
 {
-	spin_unlock_irq(&ctx->disk->queue->queue_lock);
+	spin_unlock_irq(&ctx->bdev->bd_disk->queue->queue_lock);
 	rcu_read_unlock();
-	put_disk_and_module(ctx->disk);
+	blkdev_put(ctx->bdev, FMODE_NDELAY);
 }
 EXPORT_SYMBOL_GPL(blkg_conf_finish);
 
diff --git a/block/blk-iocost.c b/block/blk-iocost.c
index bbe86d1199dc5b..9f219718e9813c 100644
--- a/block/blk-iocost.c
+++ b/block/blk-iocost.c
@@ -3120,23 +3120,23 @@ static const match_table_t qos_tokens = {
 static ssize_t ioc_qos_write(struct kernfs_open_file *of, char *input,
 			     size_t nbytes, loff_t off)
 {
-	struct gendisk *disk;
+	struct block_device *bdev;
 	struct ioc *ioc;
 	u32 qos[NR_QOS_PARAMS];
 	bool enable, user;
 	char *p;
 	int ret;
 
-	disk = blkcg_conf_get_disk(&input);
-	if (IS_ERR(disk))
-		return PTR_ERR(disk);
+	bdev = blkcg_conf_open_bdev(&input);
+	if (IS_ERR(bdev))
+		return PTR_ERR(bdev);
 
-	ioc = q_to_ioc(disk->queue);
+	ioc = q_to_ioc(bdev->bd_disk->queue);
 	if (!ioc) {
-		ret = blk_iocost_init(disk->queue);
+		ret = blk_iocost_init(bdev->bd_disk->queue);
 		if (ret)
 			goto err;
-		ioc = q_to_ioc(disk->queue);
+		ioc = q_to_ioc(bdev->bd_disk->queue);
 	}
 
 	spin_lock_irq(&ioc->lock);
@@ -3231,12 +3231,12 @@ static ssize_t ioc_qos_write(struct kernfs_open_file *of, char *input,
 	ioc_refresh_params(ioc, true);
 	spin_unlock_irq(&ioc->lock);
 
-	put_disk_and_module(disk);
+	blkdev_put(bdev, FMODE_NDELAY);
 	return nbytes;
 einval:
 	ret = -EINVAL;
 err:
-	put_disk_and_module(disk);
+	blkdev_put(bdev, FMODE_NDELAY);
 	return ret;
 }
 
@@ -3287,23 +3287,23 @@ static const match_table_t i_lcoef_tokens = {
 static ssize_t ioc_cost_model_write(struct kernfs_open_file *of, char *input,
 				    size_t nbytes, loff_t off)
 {
-	struct gendisk *disk;
+	struct block_device *bdev;
 	struct ioc *ioc;
 	u64 u[NR_I_LCOEFS];
 	bool user;
 	char *p;
 	int ret;
 
-	disk = blkcg_conf_get_disk(&input);
-	if (IS_ERR(disk))
-		return PTR_ERR(disk);
+	bdev = blkcg_conf_open_bdev(&input);
+	if (IS_ERR(bdev))
+		return PTR_ERR(bdev);
 
-	ioc = q_to_ioc(disk->queue);
+	ioc = q_to_ioc(bdev->bd_disk->queue);
 	if (!ioc) {
-		ret = blk_iocost_init(disk->queue);
+		ret = blk_iocost_init(bdev->bd_disk->queue);
 		if (ret)
 			goto err;
-		ioc = q_to_ioc(disk->queue);
+		ioc = q_to_ioc(bdev->bd_disk->queue);
 	}
 
 	spin_lock_irq(&ioc->lock);
@@ -3356,13 +3356,13 @@ static ssize_t ioc_cost_model_write(struct kernfs_open_file *of, char *input,
 	ioc_refresh_params(ioc, true);
 	spin_unlock_irq(&ioc->lock);
 
-	put_disk_and_module(disk);
+	blkdev_put(bdev, FMODE_NDELAY);
 	return nbytes;
 
 einval:
 	ret = -EINVAL;
 err:
-	put_disk_and_module(disk);
+	blkdev_put(bdev, FMODE_NDELAY);
 	return ret;
 }
 
diff --git a/include/linux/blk-cgroup.h b/include/linux/blk-cgroup.h
index c8fc9792ac776d..b9f3c246c3c908 100644
--- a/include/linux/blk-cgroup.h
+++ b/include/linux/blk-cgroup.h
@@ -197,12 +197,12 @@ void blkcg_print_blkgs(struct seq_file *sf, struct blkcg *blkcg,
 u64 __blkg_prfill_u64(struct seq_file *sf, struct blkg_policy_data *pd, u64 v);
 
 struct blkg_conf_ctx {
-	struct gendisk			*disk;
+	struct block_device		*bdev;
 	struct blkcg_gq			*blkg;
 	char				*body;
 };
 
-struct gendisk *blkcg_conf_get_disk(char **inputp);
+struct block_device *blkcg_conf_open_bdev(char **inputp);
 int blkg_conf_prep(struct blkcg *blkcg, const struct blkcg_policy *pol,
 		   char *input, struct blkg_conf_ctx *ctx);
 void blkg_conf_finish(struct blkg_conf_ctx *ctx);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
