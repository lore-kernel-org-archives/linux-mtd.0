Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D6BC4708F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:08:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40ED1601FF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40ED1601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkF7W5fIsSOeDY29JjtVhXG3p99f8vX+uYXkpnkNQ84=; b=lDETcHE7e3kaQe
	S6LUv/aRZs170sotHjKit/+LM2zKtpztuVnXPW3A/i4uQEUdMOCArKYfB7aKKUnlSRjuO8xdJe61E
	57UVPOciP+o3Nndb67WYFs8/ROegbbq+FWhaYfXxyKqe0yk047iFEzVNKfXb9Y0XjyQs99qJptwmy
	edwbKMgK7anyvAlkkLeeXlDs+RNSyLRcSRW2lynpDlyflgIlY3jrC0WKKTNP5DPbeyRwNhe0zYRHz
	pwHFveQVN92e9D2t5Sv4agu6rOwXyrFM+sAKhLSqnnqZajf4dlF/8OFf2OzAdLJGnUCW3B2Gji0EN
	GWS9yxaAQlYBa1Q5g9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKy9-002BkY-0q; Wed, 02 Jun 2021 07:07:13 +0000
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKly-0025TX-SP; Wed, 02 Jun 2021 06:54:39 +0000
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
Subject: [PATCH 09/30] mtd_blkdevs: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:24 +0300
Message-Id: <20210602065345.355274-10-hch@lst.de>
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

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/mtd_blkdevs.c | 48 ++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index fb8e12d590a1..5dc4c966ea73 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -30,11 +30,9 @@ static void blktrans_dev_release(struct kref *kref)
 	struct mtd_blktrans_dev *dev =
 		container_of(kref, struct mtd_blktrans_dev, ref);
 
-	dev->disk->private_data = NULL;
-	blk_cleanup_queue(dev->rq);
+	blk_cleanup_disk(dev->disk);
 	blk_mq_free_tag_set(dev->tag_set);
 	kfree(dev->tag_set);
-	put_disk(dev->disk);
 	list_del(&dev->list);
 	kfree(dev);
 }
@@ -354,7 +352,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	if (new->devnum > (MINORMASK >> tr->part_bits) ||
 	    (tr->part_bits && new->devnum >= 27 * 26)) {
 		mutex_unlock(&blktrans_ref_mutex);
-		goto error1;
+		return ret;
 	}
 
 	list_add_tail(&new->list, &tr->devs);
@@ -366,17 +364,28 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	if (!tr->writesect)
 		new->readonly = 1;
 
-	/* Create gendisk */
 	ret = -ENOMEM;
-	gd = alloc_disk(1 << tr->part_bits);
+	new->tag_set = kzalloc(sizeof(*new->tag_set), GFP_KERNEL);
+	if (!new->tag_set)
+		goto out_list_del;
 
-	if (!gd)
-		goto error2;
+	ret = blk_mq_alloc_sq_tag_set(new->tag_set, &mtd_mq_ops, 2,
+			BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
+	if (ret)
+		goto out_kfree_tag_set;
+
+	/* Create gendisk */
+	gd = blk_mq_alloc_disk(new->tag_set, new);
+	if (IS_ERR(gd)) {
+		ret = PTR_ERR(gd);
+		goto out_free_tag_set;
+	}
 
 	new->disk = gd;
 	gd->private_data = new;
 	gd->major = tr->major;
 	gd->first_minor = (new->devnum) << tr->part_bits;
+	gd->minors = 1 << tr->part_bits;
 	gd->fops = &mtd_block_ops;
 
 	if (tr->part_bits)
@@ -398,22 +407,9 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	spin_lock_init(&new->queue_lock);
 	INIT_LIST_HEAD(&new->rq_list);
 
-	new->tag_set = kzalloc(sizeof(*new->tag_set), GFP_KERNEL);
-	if (!new->tag_set)
-		goto error3;
-
-	new->rq = blk_mq_init_sq_queue(new->tag_set, &mtd_mq_ops, 2,
-				BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
-	if (IS_ERR(new->rq)) {
-		ret = PTR_ERR(new->rq);
-		new->rq = NULL;
-		goto error4;
-	}
-
 	if (tr->flush)
 		blk_queue_write_cache(new->rq, true, false);
 
-	new->rq->queuedata = new;
 	blk_queue_logical_block_size(new->rq, tr->blksize);
 
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, new->rq);
@@ -437,13 +433,13 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 		WARN_ON(ret);
 	}
 	return 0;
-error4:
+
+out_free_tag_set:
+	blk_mq_free_tag_set(new->tag_set);
+out_kfree_tag_set:
 	kfree(new->tag_set);
-error3:
-	put_disk(new->disk);
-error2:
+out_list_del:
 	list_del(&new->list);
-error1:
 	return ret;
 }
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
