Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7F6C4708F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:33:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 466AD61376
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 466AD61376
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KdfhlAs0OxHtFKcgAqScx8v8hC0t4nGy2e2kQXFa7VA=; b=c4n+yTnCBuXdhX
	7k7KfAvINlrYXGfK4AcpJDMyBOB2U5iPeBCVvUgf0049MGsofGbjr4CYmHvyPUOrsdaMmnqUrJcVD
	q4Bi2SMsJYysGpq0LAesTmMpRqMuJp6l/XccmAFoBj1609PffSQQ6HZBqrl96uHkORa6BtLlIGQHl
	f5TAG/kjomb+i5psHN08lnHlySD098JFZj6zFnvqFRjgAZdTvdCKfUSrFQNXFPXj8mZ83T+OLF6s3
	iNG+pLU78cI6EsjH583/jQRwkDZKiG9XaSZlw0RKLEhyfCWZW84+ZHI7jLwy5yIDGVVgTEtcTEazD
	1rXEFfa4GC/aJiW0rASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loLNK-002KDY-Bd; Wed, 02 Jun 2021 07:33:14 +0000
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKms-00269K-Qr; Wed, 02 Jun 2021 06:55:35 +0000
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
Subject: [PATCH 22/30] rbd: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:37 +0300
Message-Id: <20210602065345.355274-23-hch@lst.de>
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
 drivers/block/rbd.c | 52 ++++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 34 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index bbb88eb009e0..531d390902dd 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -4750,9 +4750,8 @@ static blk_status_t rbd_queue_rq(struct blk_mq_hw_ctx *hctx,
 
 static void rbd_free_disk(struct rbd_device *rbd_dev)
 {
-	blk_cleanup_queue(rbd_dev->disk->queue);
+	blk_cleanup_disk(rbd_dev->disk);
 	blk_mq_free_tag_set(&rbd_dev->tag_set);
-	put_disk(rbd_dev->disk);
 	rbd_dev->disk = NULL;
 }
 
@@ -4922,22 +4921,6 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	    rbd_dev->layout.object_size * rbd_dev->layout.stripe_count;
 	int err;
 
-	/* create gendisk info */
-	disk = alloc_disk(single_major ?
-			  (1 << RBD_SINGLE_MAJOR_PART_SHIFT) :
-			  RBD_MINORS_PER_MAJOR);
-	if (!disk)
-		return -ENOMEM;
-
-	snprintf(disk->disk_name, sizeof(disk->disk_name), RBD_DRV_NAME "%d",
-		 rbd_dev->dev_id);
-	disk->major = rbd_dev->major;
-	disk->first_minor = rbd_dev->minor;
-	if (single_major)
-		disk->flags |= GENHD_FL_EXT_DEVT;
-	disk->fops = &rbd_bd_ops;
-	disk->private_data = rbd_dev;
-
 	memset(&rbd_dev->tag_set, 0, sizeof(rbd_dev->tag_set));
 	rbd_dev->tag_set.ops = &rbd_mq_ops;
 	rbd_dev->tag_set.queue_depth = rbd_dev->opts->queue_depth;
@@ -4948,13 +4931,26 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 
 	err = blk_mq_alloc_tag_set(&rbd_dev->tag_set);
 	if (err)
-		goto out_disk;
+		return err;
 
-	q = blk_mq_init_queue(&rbd_dev->tag_set);
-	if (IS_ERR(q)) {
-		err = PTR_ERR(q);
+	disk = blk_mq_alloc_disk(&rbd_dev->tag_set, rbd_dev);
+	if (IS_ERR(disk)) {
+		err = PTR_ERR(disk);
 		goto out_tag_set;
 	}
+	q = disk->queue;
+
+	snprintf(disk->disk_name, sizeof(disk->disk_name), RBD_DRV_NAME "%d",
+		 rbd_dev->dev_id);
+	disk->major = rbd_dev->major;
+	disk->first_minor = rbd_dev->minor;
+	if (single_major) {
+		disk->minors = (1 << RBD_SINGLE_MAJOR_PART_SHIFT);
+		disk->flags |= GENHD_FL_EXT_DEVT;
+	} else {
+		disk->minors = RBD_MINORS_PER_MAJOR;
+	}
+	disk->fops = &rbd_bd_ops;
 
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
 	/* QUEUE_FLAG_ADD_RANDOM is off by default for blk-mq */
@@ -4976,21 +4972,11 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	if (!ceph_test_opt(rbd_dev->rbd_client->client, NOCRC))
 		blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, q);
 
-	/*
-	 * disk_release() expects a queue ref from add_disk() and will
-	 * put it.  Hold an extra ref until add_disk() is called.
-	 */
-	WARN_ON(!blk_get_queue(q));
-	disk->queue = q;
-	q->queuedata = rbd_dev;
-
 	rbd_dev->disk = disk;
 
 	return 0;
 out_tag_set:
 	blk_mq_free_tag_set(&rbd_dev->tag_set);
-out_disk:
-	put_disk(disk);
 	return err;
 }
 
@@ -7088,8 +7074,6 @@ static ssize_t do_rbd_add(struct bus_type *bus,
 		goto err_out_image_lock;
 
 	device_add_disk(&rbd_dev->dev, rbd_dev->disk, NULL);
-	/* see rbd_init_disk() */
-	blk_put_queue(rbd_dev->disk->queue);
 
 	spin_lock(&rbd_dev_list_lock);
 	list_add_tail(&rbd_dev->node, &rbd_dev_list);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
