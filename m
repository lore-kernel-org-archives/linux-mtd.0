Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F22C56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:18:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F5C21D1A
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bUwgCMpD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y4k4lRn+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90F5C21D1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J520fGbVqkll2NXNXu1C7ogI5yrOyvSF41zDN1Cl4BY=; b=bUwgCMpDTjudWksSjZziR/WN7
	S42LEz1MGOjLu4r6D7BbhD2QKvrVqMOz2JD4/8GzHMSPpWOiChsA7e2Hu6ynKqQy18HCEAS2boYNu
	prYiVZxLp15OIJQdEzzP+MDr9xRnHtpbxJ04LkHwDNu/ec0YwrEUNKQXIqxBIfQLBMnedrcVjKTvY
	VPXg1D2AWi73w8yNzLxkaQI7docaGAwOX4HoU1MX2ip/oGi2QpWwq/1BxJQzn510xq9RiizcvcMBh
	aBikIhlVyTAuYxESy5iGqg5CMb6Pi3/RuWQRSnHiyFVNqlKTOUIhoWDgqbo/FEw15mEUrNGvTr4AH
	nrM7TFe9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiH9C-0002FC-MO; Thu, 26 Nov 2020 13:17:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGza-0008EM-Rq
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ICghRbLAKGP61jmz95MnV9Lcn2pp7mW8VqqlXSx3DXQ=; b=Y4k4lRn+LNJexgb4M5plOdxokT
 ZLK/VVMCyi5BmEK2ymf+rsQ8sxvkmW5CJOyq/xjq9zoKYaqT8LffoLUNtz4L7JsPHRKFK3XCnpgT4
 xxvzJ73Ma0wd39bFQhtKZEgKn0SdGBu+jscDv4JdAEseSezqU2POPHkXXue6xWF6Zvaa03ZvG72L6
 Qa9/3UagXmOIksvzMy22sVcvDA+hDrY2C8wNtaRWwhAwcSP7iyCrGbdhi4iMooTSd+iXgerVeT6AL
 aWVGjICKpnugxaR0hKEBWSZqviQMLD/Yrsmy7AS4qIVTtIDXmyj7UIqVYq8xUhXtU7wsazLCL5RWa
 n/b0zPAw==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzY-00046z-IP; Thu, 26 Nov 2020 13:07:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 33/44] block: move holder_dir to struct block_device
Date: Thu, 26 Nov 2020 14:04:11 +0100
Message-Id: <20201126130422.92945-34-hch@lst.de>
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

Move the holder_dir field to struct block_device in preparation for
kill struct hd_struct.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c             |  5 +++--
 block/partitions/core.c   |  8 ++++----
 fs/block_dev.c            | 11 +++++------
 include/linux/blk_types.h |  1 +
 include/linux/genhd.h     |  1 -
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index fe202a12eec096..a964e7532fedd5 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -673,7 +673,8 @@ static void register_disk(struct device *parent, struct gendisk *disk,
 	 */
 	pm_runtime_set_memalloc_noio(ddev, true);
 
-	disk->part0.holder_dir = kobject_create_and_add("holders", &ddev->kobj);
+	disk->part0.bdev->bd_holder_dir =
+			kobject_create_and_add("holders", &ddev->kobj);
 	disk->slave_dir = kobject_create_and_add("slaves", &ddev->kobj);
 
 	if (disk->flags & GENHD_FL_HIDDEN) {
@@ -879,7 +880,7 @@ void del_gendisk(struct gendisk *disk)
 
 	blk_unregister_queue(disk);
 
-	kobject_put(disk->part0.holder_dir);
+	kobject_put(disk->part0.bdev->bd_holder_dir);
 	kobject_put(disk->slave_dir);
 
 	part_stat_set_all(&disk->part0, 0);
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 224a22d82fb86f..d1093adf2570e2 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -344,7 +344,7 @@ void delete_partition(struct hd_struct *part)
 	 */
 	get_device(disk_to_dev(disk));
 	rcu_assign_pointer(ptbl->part[part->partno], NULL);
-	kobject_put(part->holder_dir);
+	kobject_put(part->bdev->bd_holder_dir);
 	device_del(part_to_dev(part));
 
 	/*
@@ -452,8 +452,8 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 		goto out_put;
 
 	err = -ENOMEM;
-	p->holder_dir = kobject_create_and_add("holders", &pdev->kobj);
-	if (!p->holder_dir)
+	bdev->bd_holder_dir = kobject_create_and_add("holders", &pdev->kobj);
+	if (!bdev->bd_holder_dir)
 		goto out_del;
 
 	dev_set_uevent_suppress(pdev, 0);
@@ -487,7 +487,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 out_remove_file:
 	device_remove_file(pdev, &dev_attr_whole_disk);
 out_del:
-	kobject_put(p->holder_dir);
+	kobject_put(bdev->bd_holder_dir);
 	device_del(pdev);
 out_put:
 	put_device(pdev);
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 62fae6a0e8aa56..2c91c35149787a 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1138,7 +1138,7 @@ int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk)
 	WARN_ON_ONCE(!bdev->bd_holder);
 
 	/* FIXME: remove the following once add_disk() handles errors */
-	if (WARN_ON(!disk->slave_dir || !bdev->bd_part->holder_dir))
+	if (WARN_ON(!disk->slave_dir || !bdev->bd_holder_dir))
 		goto out_unlock;
 
 	holder = bd_find_holder_disk(bdev, disk);
@@ -1161,14 +1161,14 @@ int bd_link_disk_holder(struct block_device *bdev, struct gendisk *disk)
 	if (ret)
 		goto out_free;
 
-	ret = add_symlink(bdev->bd_part->holder_dir, &disk_to_dev(disk)->kobj);
+	ret = add_symlink(bdev->bd_holder_dir, &disk_to_dev(disk)->kobj);
 	if (ret)
 		goto out_del;
 	/*
 	 * bdev could be deleted beneath us which would implicitly destroy
 	 * the holder directory.  Hold on to it.
 	 */
-	kobject_get(bdev->bd_part->holder_dir);
+	kobject_get(bdev->bd_holder_dir);
 
 	list_add(&holder->list, &bdev->bd_holder_disks);
 	goto out_unlock;
@@ -1203,9 +1203,8 @@ void bd_unlink_disk_holder(struct block_device *bdev, struct gendisk *disk)
 
 	if (!WARN_ON_ONCE(holder == NULL) && !--holder->refcnt) {
 		del_symlink(disk->slave_dir, bdev_kobj(bdev));
-		del_symlink(bdev->bd_part->holder_dir,
-			    &disk_to_dev(disk)->kobj);
-		kobject_put(bdev->bd_part->holder_dir);
+		del_symlink(bdev->bd_holder_dir, &disk_to_dev(disk)->kobj);
+		kobject_put(bdev->bd_holder_dir);
 		list_del_init(&holder->list);
 		kfree(holder);
 	}
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 2f8ede04e5a94c..c0591e52d7d7ce 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -35,6 +35,7 @@ struct block_device {
 #ifdef CONFIG_SYSFS
 	struct list_head	bd_holder_disks;
 #endif
+	struct kobject		*bd_holder_dir;
 	u8			bd_partno;
 	struct hd_struct *	bd_part;
 	/* number of times partitions within this device have been opened. */
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 30d7076155b4d2..b4a5c05593b99c 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -55,7 +55,6 @@ struct hd_struct {
 
 	struct block_device *bdev;
 	struct device __dev;
-	struct kobject *holder_dir;
 	int policy, partno;
 #ifdef CONFIG_FAIL_MAKE_REQUEST
 	int make_it_fail;
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
