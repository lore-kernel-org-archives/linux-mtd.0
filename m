Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DA1C56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:20:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7B7021D1A
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:20:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1yObL9oH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ps46omJJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7B7021D1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C17hI8GVvdYYebXGrn/GaYetEwHtGcxc4J8YRf08HVA=; b=1yObL9oHeas2Hyhmt42mBWrWe
	+J8Mb2Qivqv/32tsBdcKFAuqzUJCiYlI/DnrZTHpKFkSYsJ+fr9EWNiqbanoIM1kDn0NsuszzYMP5
	Z8dNxDOsYAUrmeX7MAD/R+h8i0c4h7EboVpN/jisfPVVJKMlZ3jGOi0+VnQvka76qG7W1coX5YO6j
	+P+9vQDnv/jPqWUSFFpKkD2K4L+fQHu2rK63FKDgYYHF1OuviwLkCw6Xa/mXA5uMbcvnrpO14scx2
	N0Pwt12ATZZX3STUo1+m8uU3j2g0LD2/c4e1o70u00Zz+T+GjgWgjOMRk8IOHzwdpFwTRhisQp1Zn
	Fk2+j4kJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiHBS-0003KA-95; Thu, 26 Nov 2020 13:19:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzk-0008J1-CI
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=iazboObhpRQdXc4RZ3Z2xK5xBt9YYa2ViLJzmnoL+94=; b=Ps46omJJtF22CamxjjwC6dUdRb
 xQI6S5cYvUoOUo66OCOAghh7MfxTKAjOflxIy05K2Lo4XpZxkXe8AqXAwrZYq8syv7GPule4CTa55
 hxqPQs17t63UtRYI79VnS8uysK/1mH8NfQmbNBEueb25mxmALpgmPpsCAAFymLc7Ev6Glt9v1Gt97
 VuFcGw3NXCtZrdmecHp2i9RnW7Ng5+oQI7sEXPLUXYMSmk4O5vP90EXX1ULOy45g/RusLso9BYTv9
 i79QGkZ33g8nfIBzUpCNv9JEtuRf9ViNdkbKqkLykiKXIz2IISS71BNU1W7GK+aPfPTqDbwdfNa1P
 aaiqFDpA==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzi-0004AA-8h; Thu, 26 Nov 2020 13:07:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 39/44] block: pass a block_device to blk_alloc_devt
Date: Thu, 26 Nov 2020 14:04:17 +0100
Message-Id: <20201126130422.92945-40-hch@lst.de>
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

Pass the block_device actually needed instead of the hd_struct.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk.h             |  2 +-
 block/genhd.c           | 14 +++++++-------
 block/partitions/core.c |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/blk.h b/block/blk.h
index d5bf8f3a078186..9657c6da7c770c 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -350,7 +350,7 @@ static inline void blk_queue_free_zone_bitmaps(struct request_queue *q) {}
 
 struct block_device *disk_map_sector_rcu(struct gendisk *disk, sector_t sector);
 
-int blk_alloc_devt(struct hd_struct *part, dev_t *devt);
+int blk_alloc_devt(struct block_device *part, dev_t *devt);
 void blk_free_devt(dev_t devt);
 char *disk_name(struct gendisk *hd, int partno, char *buf);
 #define ADDPART_FLAG_NONE	0
diff --git a/block/genhd.c b/block/genhd.c
index a85ffd7385718d..89cd0ba8e3b84a 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -559,8 +559,8 @@ static int blk_mangle_minor(int minor)
 }
 
 /**
- * blk_alloc_devt - allocate a dev_t for a partition
- * @part: partition to allocate dev_t for
+ * blk_alloc_devt - allocate a dev_t for a block device
+ * @bdev: block device to allocate dev_t for
  * @devt: out parameter for resulting dev_t
  *
  * Allocate a dev_t for block device.
@@ -572,14 +572,14 @@ static int blk_mangle_minor(int minor)
  * CONTEXT:
  * Might sleep.
  */
-int blk_alloc_devt(struct hd_struct *part, dev_t *devt)
+int blk_alloc_devt(struct block_device *bdev, dev_t *devt)
 {
-	struct gendisk *disk = part_to_disk(part);
+	struct gendisk *disk = bdev->bd_disk;
 	int idx;
 
 	/* in consecutive minor range? */
-	if (part->bdev->bd_partno < disk->minors) {
-		*devt = MKDEV(disk->major, disk->first_minor + part->bdev->bd_partno);
+	if (bdev->bd_partno < disk->minors) {
+		*devt = MKDEV(disk->major, disk->first_minor + bdev->bd_partno);
 		return 0;
 	}
 
@@ -735,7 +735,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 
 	disk->flags |= GENHD_FL_UP;
 
-	retval = blk_alloc_devt(disk->part0->bd_part, &devt);
+	retval = blk_alloc_devt(disk->part0, &devt);
 	if (retval) {
 		WARN_ON(1);
 		return;
diff --git a/block/partitions/core.c b/block/partitions/core.c
index ecc3228a086956..4f823c4c733518 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -392,7 +392,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 	pdev->type = &part_type;
 	pdev->parent = ddev;
 
-	err = blk_alloc_devt(p, &devt);
+	err = blk_alloc_devt(bdev, &devt);
 	if (err)
 		goto out_bdput;
 	pdev->devt = devt;
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
