Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACEAC56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:17:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F3721D1A
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gV/F7gb5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pVGb1ocN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3F3721D1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gt4BLp+mKgRV0f9EwBfteWAHr3Alzze0xGIWz25lkQM=; b=gV/F7gb5qYTeFERN2nMsHeC2L
	+g4k1gGdL35T9a6cUxYU7hOqSPR5ydSl5anDu9hbx6zcqssniEcwNT4xMZKopeYL12m6SK07XYUyx
	/pOf4RtBoG1MIvFyS0SVTfzl8JKeVwQF+l/1PU9De/mdfngObHsVJ4f7VSh6peNoMS56ONmrMVg+i
	a6wmGD6wQZw0G7g8Rxmg8VuZlCTwqLrRvJ5vBpsVqkBiv9f2rKWq5PjGMZzGobPZT04P+hQQBI6Cq
	vCbVhjgnQ48MMKgOX1Z5HMuoqSG7Ylz/jn+1uEnZBiy5Iquft6GjqTvk2SfDveEa2QYWPj0Q8oA6b
	RBlFt1Z/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiH8Y-0001zo-KU; Thu, 26 Nov 2020 13:16:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzY-0008D5-Mp
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=K1Z4h4bY+Em7tTffAceNUsYLga3tYfdkZ7ZkqWnFlaA=; b=pVGb1ocNGrV+mNW2xDqIoyVwQd
 u7N5eYTAoYmMx5/fs9mSyZrLP7GGIrtq67w4AJX5gui8gqnSZd0N40u+34s59Qyi+HIDY11ZPeSgb
 o2Qycg7KmxwBip9xNvUfQgCgwu6UuFdOk20CABN5c9awGp3JHOaLZE15n93AjhATLdrZgqeXGYqBt
 wU0rzldf2iRhWAiHKqkFjiXzotSEp3ibcyb2Jr2myfNN4zlq5wCJdn0O1g1Z/1llL6LK+dSJHXZiv
 JKsyiVyIYqHIjpMbkrAiUP/oKiW68FZJEBE5hAKYB95B7C4f4DhPOv0elEfa6O/UQy0FxV+cUCdaQ
 Pq07vZog==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzX-00046R-3X; Thu, 26 Nov 2020 13:07:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 32/44] block: move the partition_meta_info to struct
 block_device
Date: Thu, 26 Nov 2020 14:04:10 +0100
Message-Id: <20201126130422.92945-33-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126130422.92945-1-hch@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
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

Move the partition_meta_info to struct block_device in preparation for
killing struct hd_struct.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk.h               |  1 -
 block/genhd.c             |  3 ++-
 block/partitions/core.c   | 18 +++++++-----------
 fs/block_dev.c            |  1 +
 include/linux/blk_types.h |  2 ++
 include/linux/genhd.h     |  1 -
 init/do_mounts.c          |  7 ++++---
 7 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/block/blk.h b/block/blk.h
index 3f801f6e86f8a1..0bd4b58bcbaf77 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -381,7 +381,6 @@ static inline void hd_struct_put(struct hd_struct *part)
 
 static inline void hd_free_part(struct hd_struct *part)
 {
-	kfree(part->info);
 	bdput(part->bdev);
 	percpu_ref_exit(&part->ref);
 }
diff --git a/block/genhd.c b/block/genhd.c
index 7bb45382658385..fe202a12eec096 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1002,7 +1002,8 @@ void __init printk_all_partitions(void)
 			       bdevt_str(part_devt(part), devt_buf),
 			       bdev_nr_sectors(part->bdev) >> 1,
 			       disk_name(disk, part->partno, name_buf),
-			       part->info ? part->info->uuid : "");
+			       part->bdev->bd_meta_info ?
+					part->bdev->bd_meta_info->uuid : "");
 			if (is_part0) {
 				if (dev->parent && dev->parent->driver)
 					printk(" driver: %s\n",
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 485777cea26bfa..224a22d82fb86f 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -275,8 +275,9 @@ static int part_uevent(struct device *dev, struct kobj_uevent_env *env)
 	struct hd_struct *part = dev_to_part(dev);
 
 	add_uevent_var(env, "PARTN=%u", part->partno);
-	if (part->info && part->info->volname[0])
-		add_uevent_var(env, "PARTNAME=%s", part->info->volname);
+	if (part->bdev->bd_meta_info && part->bdev->bd_meta_info->volname[0])
+		add_uevent_var(env, "PARTNAME=%s",
+			       part->bdev->bd_meta_info->volname);
 	return 0;
 }
 
@@ -422,13 +423,10 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 	p->policy = get_disk_ro(disk);
 
 	if (info) {
-		struct partition_meta_info *pinfo;
-
-		pinfo = kzalloc_node(sizeof(*pinfo), GFP_KERNEL, disk->node_id);
-		if (!pinfo)
+		err = -ENOMEM;
+		bdev->bd_meta_info = kmemdup(info, sizeof(*info), GFP_KERNEL);
+		if (!bdev->bd_meta_info)
 			goto out_bdput;
-		memcpy(pinfo, info, sizeof(*info));
-		p->info = pinfo;
 	}
 
 	dname = dev_name(ddev);
@@ -444,7 +442,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 
 	err = blk_alloc_devt(p, &devt);
 	if (err)
-		goto out_free_info;
+		goto out_bdput;
 	pdev->devt = devt;
 
 	/* delay uevent until 'holders' subdir is created */
@@ -481,8 +479,6 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 		kobject_uevent(&pdev->kobj, KOBJ_ADD);
 	return p;
 
-out_free_info:
-	kfree(p->info);
 out_bdput:
 	bdput(bdev);
 out_free:
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 11e6a9a255845d..62fae6a0e8aa56 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -785,6 +785,7 @@ static void bdev_free_inode(struct inode *inode)
 	struct block_device *bdev = I_BDEV(inode);
 
 	free_percpu(bdev->bd_stats);
+	kfree(bdev->bd_meta_info);
 
 	kmem_cache_free(bdev_cachep, BDEV_I(inode));
 }
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index a690008f60cd92..2f8ede04e5a94c 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -49,6 +49,8 @@ struct block_device {
 	/* Mutex for freeze */
 	struct mutex		bd_fsfreeze_mutex;
 	struct super_block	*bd_fsfreeze_sb;
+
+	struct partition_meta_info *bd_meta_info;
 } __randomize_layout;
 
 #define bdev_whole(_bdev) \
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 50d27f5d38e2af..30d7076155b4d2 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -57,7 +57,6 @@ struct hd_struct {
 	struct device __dev;
 	struct kobject *holder_dir;
 	int policy, partno;
-	struct partition_meta_info *info;
 #ifdef CONFIG_FAIL_MAKE_REQUEST
 	int make_it_fail;
 #endif
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 5879edf083b318..368ccb71850126 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -79,8 +79,8 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
 	const struct uuidcmp *cmp = data;
 	struct hd_struct *part = dev_to_part(dev);
 
-	if (!part->info ||
-	    strncasecmp(cmp->uuid, part->info->uuid, cmp->len))
+	if (!part->bdev->bd_meta_info ||
+	    strncasecmp(cmp->uuid, part->bdev->bd_meta_info->uuid, cmp->len))
 		return 0;
 	return 1;
 }
@@ -169,7 +169,8 @@ static int match_dev_by_label(struct device *dev, const void *data)
 	const char *label = data;
 	struct hd_struct *part = dev_to_part(dev);
 
-	if (!part->info || strcmp(label, part->info->volname))
+	if (!part->bdev->bd_meta_info ||
+	    strcmp(label, part->bdev->bd_meta_info->volname))
 		return 0;
 	return 1;
 }
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
