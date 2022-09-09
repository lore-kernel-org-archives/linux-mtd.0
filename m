Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF82ECAAD3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ls8/eamLaXWgXoJFGMOLSjnbHLeWC5+B+8qr5nnslro=; b=CMZqVSKkBwTzRQ
	pKFjYbo5Idyoc4Uo6ljTIPILw1j2xLF9VsNZEqluaSFOod0xa+wfaXKqCrT0Au5RKW67Vvc6nfB4H
	Y3r2GqQwrgYu3JK7t6zON7Qo49uJCZVQvkGogl2RzAr7pOgoR23KxwzrqN77A6vflUBIHnkshtJW3
	jtc7NQlsL1cvYa63S0H/D+FKX8mLQkY1AwxtOYQEVIdTtZkYZAuv6KCG7kLcLoJb58FCLax240A5H
	vnUZIwAP7ckkjcUTJp3gOGAsn1pDxXvKnW4c1epW1h+NHyCuWFOGdcIQBpt1VusWGRWfeqZXL09ow
	Mb3Rcdp1KBQeUYRxkoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWf7W-00Gm8o-1l; Fri, 09 Sep 2022 14:36:38 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWf7S-00Glwd-LG
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2022 14:36:36 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1CAB068AA6; Fri,  9 Sep 2022 16:36:22 +0200 (CEST)
Date: Fri, 9 Sep 2022 16:36:20 +0200
From: ChristophHellwig <hch@lst.de>
To: Liwei Song <liwei.song@windriver.com>
Cc: ChristophHellwig <hch@lst.de>, MiquelRaynal <miquel.raynal@bootlin.com>,
	RichardWeinberger <richard@nod.at>,
	VigneshRaghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd_blkdevs: add mtd_table_mutex lock back to
 blktrans_{open, release} to avoid race condition
Message-ID: <20220909143620.GA9978@lst.de>
References: <20220809075753.21950-1-liwei.song@windriver.com> <20220809080809.GB14727@lst.de> <7f925359-69b0-49b1-cdbb-337912da4f9c@windriver.com> <4910c707-ad97-362f-911a-79e438e6e8ff@windriver.com> <cf66e306-f216-5247-7cff-36ce08eb4512@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf66e306-f216-5247-7cff-36ce08eb4512@windriver.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_073635_031140_909D9EAB 
X-CRM114-Status: GOOD (  17.52  )
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

Can you try this patch (it'll need to be split up into a few if it
works):

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 60b222799871e..9eda1dd98a406 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -24,24 +24,16 @@
 
 static LIST_HEAD(blktrans_majors);
 
-static void blktrans_dev_release(struct kref *kref)
+static void blktrans_free_disk(struct gendisk *disk)
 {
-	struct mtd_blktrans_dev *dev =
-		container_of(kref, struct mtd_blktrans_dev, ref);
+	struct mtd_blktrans_dev *dev = disk->private_data;
 
-	put_disk(dev->disk);
 	blk_mq_free_tag_set(dev->tag_set);
 	kfree(dev->tag_set);
 	list_del(&dev->list);
 	kfree(dev);
 }
 
-static void blktrans_dev_put(struct mtd_blktrans_dev *dev)
-{
-	kref_put(&dev->ref, blktrans_dev_release);
-}
-
-
 static blk_status_t do_blktrans_request(struct mtd_blktrans_ops *tr,
 			       struct mtd_blktrans_dev *dev,
 			       struct request *req)
@@ -187,63 +179,58 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	struct mtd_blktrans_dev *dev = bdev->bd_disk->private_data;
 	int ret = 0;
 
-	kref_get(&dev->ref);
+	if (disk_openers(bdev->bd_disk) > 0)
+		return 0;
 
-	mutex_lock(&dev->lock);
-
-	if (dev->open)
-		goto unlock;
+	mutex_lock(&mtd_table_mutex);
+	if (!dev->mtd) {
+		mutex_lock(&mtd_table_mutex);
+		return -EINVAL;
+	}
+	ret = __get_mtd_device(dev->mtd);
+	mutex_unlock(&mtd_table_mutex);
+	if (ret)
+		return ret;
 
+	mutex_lock(&dev->lock);
 	__module_get(dev->tr->owner);
-
-	if (!dev->mtd)
-		goto unlock;
-
 	if (dev->tr->open) {
 		ret = dev->tr->open(dev);
 		if (ret)
 			goto error_put;
 	}
-
-	ret = __get_mtd_device(dev->mtd);
-	if (ret)
-		goto error_release;
 	dev->file_mode = mode;
-
-unlock:
 	dev->open++;
 	mutex_unlock(&dev->lock);
-	return ret;
 
-error_release:
-	if (dev->tr->release)
-		dev->tr->release(dev);
+	return 0;
+
 error_put:
 	module_put(dev->tr->owner);
 	mutex_unlock(&dev->lock);
-	blktrans_dev_put(dev);
+
+	put_mtd_device(dev->mtd);
 	return ret;
 }
 
 static void blktrans_release(struct gendisk *disk, fmode_t mode)
 {
 	struct mtd_blktrans_dev *dev = disk->private_data;
+	struct mtd_info *mtd = NULL;
 
-	mutex_lock(&dev->lock);
-
-	if (--dev->open)
-		goto unlock;
+	if (disk_openers(disk) > 0)
+		return;
 
+	mutex_lock(&dev->lock);
+	dev->open--;
 	module_put(dev->tr->owner);
-
-	if (dev->mtd) {
-		if (dev->tr->release)
-			dev->tr->release(dev);
-		__put_mtd_device(dev->mtd);
-	}
-unlock:
+	mtd = dev->mtd;
+	if (mtd && dev->tr->release)
+		dev->tr->release(dev);
 	mutex_unlock(&dev->lock);
-	blktrans_dev_put(dev);
+
+	if (mtd)
+		put_mtd_device(dev->mtd);
 }
 
 static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
@@ -266,6 +253,7 @@ static const struct block_device_operations mtd_block_ops = {
 	.owner		= THIS_MODULE,
 	.open		= blktrans_open,
 	.release	= blktrans_release,
+	.free_disk	= blktrans_free_disk,
 	.getgeo		= blktrans_getgeo,
 };
 
@@ -318,7 +306,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
  added:
 
 	mutex_init(&new->lock);
-	kref_init(&new->ref);
 	if (!tr->writesect)
 		new->readonly = 1;
 
@@ -410,6 +397,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 
 int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 {
+	struct mtd_info *old_mtd = NULL;
 	unsigned long flags;
 
 	lockdep_assert_held(&mtd_table_mutex);
@@ -438,13 +426,14 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	if (old->open) {
 		if (old->tr->release)
 			old->tr->release(old);
-		__put_mtd_device(old->mtd);
+		old_mtd = old->mtd;
 	}
-
 	old->mtd = NULL;
-
 	mutex_unlock(&old->lock);
-	blktrans_dev_put(old);
+	put_disk(old->disk);
+
+	if (old->mtd)
+		put_mtd_device(old_mtd);
 	return 0;
 }
 
diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index 15cc9b95e32b5..41a81fc9f0462 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -7,7 +7,6 @@
 #define __MTD_TRANS_H__
 
 #include <linux/mutex.h>
-#include <linux/kref.h>
 #include <linux/sysfs.h>
 
 struct hd_geometry;
@@ -26,7 +25,6 @@ struct mtd_blktrans_dev {
 	unsigned long size;
 	int readonly;
 	int open;
-	struct kref ref;
 	struct gendisk *disk;
 	struct attribute_group *disk_attributes;
 	struct request_queue *rq;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
