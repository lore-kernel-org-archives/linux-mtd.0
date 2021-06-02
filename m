Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92ABC4708F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:23:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6D76101B
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6D76101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7ym2ChQfbE0mMGpwN8otT/fzKXWsFJeQM7o0h0UKWA=; b=xLHf3HHD2+NYRW
	+msUzlCY/uEe7XSXCiu9d2CIMnbDhUupY3bD8lwkTtXW3/OwiY7mRqpzykAB2afaylJfmMFHAEwo2
	/glZY6BOj17KYJmLO7f+wyBPpf6mGTRazQzYo0SmUeVpdRXStFIm4p9Vxp7xd83ftcOSRtN4O2Tcd
	il3858WK8Ge3x2Dt7z/JHahsRyFgm3dexddCIKY5aZWwIXCbe8+y6vfv4L8+2wp16l/SAb79qzLNY
	FrMianMgy0fhHq3feH/zDYQfZYIQNirZ3ZIT0QypTeJmEFx8KiejuKMb1oUX4xXe3WzFWw2tewm9N
	cX+7u1CZhohTVRTbRnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loLD3-002H6Z-To; Wed, 02 Jun 2021 07:22:38 +0000
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKmR-0025lm-Ax; Wed, 02 Jun 2021 06:55:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>,
 Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>,
 Geoff Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Jack Wang <jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Mike Snitzer <snitzer@redhat.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: [PATCH 16/30] aoe: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:31 +0300
Message-Id: <20210602065345.355274-17-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
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

Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/aoe/aoeblk.c | 33 ++++++++++++---------------------
 drivers/block/aoe/aoedev.c |  3 +--
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/block/aoe/aoeblk.c b/drivers/block/aoe/aoeblk.c
index c34e71b0c4a9..06b360f7123a 100644
--- a/drivers/block/aoe/aoeblk.c
+++ b/drivers/block/aoe/aoeblk.c
@@ -338,14 +338,13 @@ static const struct blk_mq_ops aoeblk_mq_ops = {
 	.queue_rq	= aoeblk_queue_rq,
 };
 
-/* alloc_disk and add_disk can sleep */
+/* blk_mq_alloc_disk and add_disk can sleep */
 void
 aoeblk_gdalloc(void *vp)
 {
 	struct aoedev *d = vp;
 	struct gendisk *gd;
 	mempool_t *mp;
-	struct request_queue *q;
 	struct blk_mq_tag_set *set;
 	ulong flags;
 	int late = 0;
@@ -362,19 +361,12 @@ aoeblk_gdalloc(void *vp)
 	if (late)
 		return;
 
-	gd = alloc_disk(AOE_PARTITIONS);
-	if (gd == NULL) {
-		pr_err("aoe: cannot allocate disk structure for %ld.%d\n",
-			d->aoemajor, d->aoeminor);
-		goto err;
-	}
-
 	mp = mempool_create(MIN_BUFS, mempool_alloc_slab, mempool_free_slab,
 		buf_pool_cache);
 	if (mp == NULL) {
 		printk(KERN_ERR "aoe: cannot allocate bufpool for %ld.%d\n",
 			d->aoemajor, d->aoeminor);
-		goto err_disk;
+		goto err;
 	}
 
 	set = &d->tag_set;
@@ -391,12 +383,11 @@ aoeblk_gdalloc(void *vp)
 		goto err_mempool;
 	}
 
-	q = blk_mq_init_queue(set);
-	if (IS_ERR(q)) {
+	gd = blk_mq_alloc_disk(set, d);
+	if (IS_ERR(gd)) {
 		pr_err("aoe: cannot allocate block queue for %ld.%d\n",
 			d->aoemajor, d->aoeminor);
-		blk_mq_free_tag_set(set);
-		goto err_mempool;
+		goto err_tagset;
 	}
 
 	spin_lock_irqsave(&d->lock, flags);
@@ -405,16 +396,16 @@ aoeblk_gdalloc(void *vp)
 	WARN_ON(d->flags & DEVFL_TKILL);
 	WARN_ON(d->gd);
 	WARN_ON(d->flags & DEVFL_UP);
-	blk_queue_max_hw_sectors(q, BLK_DEF_MAX_SECTORS);
-	blk_queue_io_opt(q, SZ_2M);
+	blk_queue_max_hw_sectors(gd->queue, BLK_DEF_MAX_SECTORS);
+	blk_queue_io_opt(gd->queue, SZ_2M);
 	d->bufpool = mp;
-	d->blkq = gd->queue = q;
-	q->queuedata = d;
+	d->blkq = gd->queue;
 	d->gd = gd;
 	if (aoe_maxsectors)
-		blk_queue_max_hw_sectors(q, aoe_maxsectors);
+		blk_queue_max_hw_sectors(gd->queue, aoe_maxsectors);
 	gd->major = AOE_MAJOR;
 	gd->first_minor = d->sysminor;
+	gd->minors = AOE_PARTITIONS;
 	gd->fops = &aoe_bdops;
 	gd->private_data = d;
 	set_capacity(gd, d->ssize);
@@ -435,10 +426,10 @@ aoeblk_gdalloc(void *vp)
 	spin_unlock_irqrestore(&d->lock, flags);
 	return;
 
+err_tagset:
+	blk_mq_free_tag_set(set);
 err_mempool:
 	mempool_destroy(mp);
-err_disk:
-	put_disk(gd);
 err:
 	spin_lock_irqsave(&d->lock, flags);
 	d->flags &= ~DEVFL_GD_NOW;
diff --git a/drivers/block/aoe/aoedev.c b/drivers/block/aoe/aoedev.c
index e2ea2356da06..c5753c6bfe80 100644
--- a/drivers/block/aoe/aoedev.c
+++ b/drivers/block/aoe/aoedev.c
@@ -277,9 +277,8 @@ freedev(struct aoedev *d)
 	if (d->gd) {
 		aoedisk_rm_debugfs(d);
 		del_gendisk(d->gd);
-		put_disk(d->gd);
+		blk_cleanup_disk(d->gd);
 		blk_mq_free_tag_set(&d->tag_set);
-		blk_cleanup_queue(d->blkq);
 	}
 	t = d->targets;
 	e = t + d->ntargets;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
