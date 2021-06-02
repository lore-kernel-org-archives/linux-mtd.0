Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF567C47083
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:43:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEE4B6138C
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEE4B6138C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1wd8Ty53TLpDDfsEpv7Ao9VESwz7cXpCCT1px0QMQk=; b=pN6BvYNz7fF03c
	bX9J520mV0DEFjlMxtyaQtoB3iVN05/8qlzQm7ZTGzIMcPuN8PQObh4rcqeKTzJ1c1sx6IcD8wPsP
	w5dvnyunQfnij7zCJ4UuhoMv8rSsHZFkPJ1sXLFML3u+cvLWV4sKMzkhkVolHShR4pL9ynrQ1vS47
	9fyIHrrZlSNyCUm3Lmc7dPst++l/mpq4qXFLVqSYY83/TI56IT6DZ1ZJoeAEQ9Ok28pRp6+AN1IXD
	715ONFftCL6nZic80tNXzRiBUDCo3ufF/dKW5iqoGTUOCakFGKbSmK9c16mhSIzJlKJqGfgmMDSTV
	d9s45HgbvxZpR/h9gqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loLVy-002NgA-As; Wed, 02 Jun 2021 07:42:10 +0000
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKnA-0026PT-6J; Wed, 02 Jun 2021 06:55:53 +0000
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
Subject: [PATCH 26/30] ubi: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:41 +0300
Message-Id: <20210602065345.355274-27-hch@lst.de>
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
 drivers/mtd/ubi/block.c | 68 ++++++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index e1a2ae21dfd3..e003b4b44ffa 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -394,53 +394,46 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	dev->vol_id = vi->vol_id;
 	dev->leb_size = vi->usable_leb_size;
 
+	dev->tag_set.ops = &ubiblock_mq_ops;
+	dev->tag_set.queue_depth = 64;
+	dev->tag_set.numa_node = NUMA_NO_NODE;
+	dev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
+	dev->tag_set.cmd_size = sizeof(struct ubiblock_pdu);
+	dev->tag_set.driver_data = dev;
+	dev->tag_set.nr_hw_queues = 1;
+
+	ret = blk_mq_alloc_tag_set(&dev->tag_set);
+	if (ret) {
+		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
+		goto out_free_dev;;
+	}
+
+
 	/* Initialize the gendisk of this ubiblock device */
-	gd = alloc_disk(1);
-	if (!gd) {
-		pr_err("UBI: block: alloc_disk failed\n");
-		ret = -ENODEV;
-		goto out_free_dev;
+	gd = blk_mq_alloc_disk(&dev->tag_set, dev);
+	if (IS_ERR(gd)) {
+		ret = PTR_ERR(gd);
+		goto out_free_tags;
 	}
 
 	gd->fops = &ubiblock_ops;
 	gd->major = ubiblock_major;
+	gd->minors = 1;
 	gd->first_minor = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
 	if (gd->first_minor < 0) {
 		dev_err(disk_to_dev(gd),
 			"block: dynamic minor allocation failed");
 		ret = -ENODEV;
-		goto out_put_disk;
+		goto out_cleanup_disk;
 	}
 	gd->private_data = dev;
 	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
 	set_capacity(gd, disk_capacity);
 	dev->gd = gd;
 
-	dev->tag_set.ops = &ubiblock_mq_ops;
-	dev->tag_set.queue_depth = 64;
-	dev->tag_set.numa_node = NUMA_NO_NODE;
-	dev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
-	dev->tag_set.cmd_size = sizeof(struct ubiblock_pdu);
-	dev->tag_set.driver_data = dev;
-	dev->tag_set.nr_hw_queues = 1;
-
-	ret = blk_mq_alloc_tag_set(&dev->tag_set);
-	if (ret) {
-		dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
-		goto out_remove_minor;
-	}
-
-	dev->rq = blk_mq_init_queue(&dev->tag_set);
-	if (IS_ERR(dev->rq)) {
-		dev_err(disk_to_dev(gd), "blk_mq_init_queue failed");
-		ret = PTR_ERR(dev->rq);
-		goto out_free_tags;
-	}
+	dev->rq = gd->queue;
 	blk_queue_max_segments(dev->rq, UBI_MAX_SG_COUNT);
 
-	dev->rq->queuedata = dev;
-	dev->gd->queue = dev->rq;
-
 	/*
 	 * Create one workqueue per volume (per registered block device).
 	 * Rembember workqueues are cheap, they're not threads.
@@ -448,7 +441,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	dev->wq = alloc_workqueue("%s", 0, 0, gd->disk_name);
 	if (!dev->wq) {
 		ret = -ENOMEM;
-		goto out_free_queue;
+		goto out_remove_minor;
 	}
 
 	list_add_tail(&dev->list, &ubiblock_devices);
@@ -460,14 +453,12 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	mutex_unlock(&devices_mutex);
 	return 0;
 
-out_free_queue:
-	blk_cleanup_queue(dev->rq);
-out_free_tags:
-	blk_mq_free_tag_set(&dev->tag_set);
 out_remove_minor:
 	idr_remove(&ubiblock_minor_idr, gd->first_minor);
-out_put_disk:
-	put_disk(dev->gd);
+out_cleanup_disk:
+	blk_cleanup_disk(dev->gd);
+out_free_tags:
+	blk_mq_free_tag_set(&dev->tag_set);
 out_free_dev:
 	kfree(dev);
 out_unlock:
@@ -483,11 +474,10 @@ static void ubiblock_cleanup(struct ubiblock *dev)
 	/* Flush pending work */
 	destroy_workqueue(dev->wq);
 	/* Finally destroy the blk queue */
-	blk_cleanup_queue(dev->rq);
-	blk_mq_free_tag_set(&dev->tag_set);
 	dev_info(disk_to_dev(dev->gd), "released");
+	blk_cleanup_disk(dev->gd);
+	blk_mq_free_tag_set(&dev->tag_set);
 	idr_remove(&ubiblock_minor_idr, dev->gd->first_minor);
-	put_disk(dev->gd);
 }
 
 int ubiblock_remove(struct ubi_volume_info *vi)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
