Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C037EC4708F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:28:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F92761376
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F92761376
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YWfvJwQO6JX36MgsFh7iBoqW0Ou1InAVHZqMQsV3Vh4=; b=HuCQUDJ0aWsYVc
	Ma0rfIwOzera/giXhJleNTXtxx5C5iXARAn6tUli6oxrugYpbJa92aBL6zsz2jMpOdKVDeD0k6lwv
	Nq3uksSS0ZqP0dpYiH/5Bk7t/cD/0/kZVTkmgJklDDoLHKYaclb7C00TPJZAHH+ySIZAd7fRk63pG
	3l97dYQ2DQM0O6AxpUpPYOXLfm96f1Dgp8VceG02N9LE1p4YGaKbulv/LrvfAFS/tYESQSSwwe1pd
	+20XgKKPPMnPwzm0oZhtDN/uQyKDe5BfP9xZ5k1KscYaVKy+kPFaIz4QIfiClqtDHQrE0zF34ldJL
	TseFqRYuXBdAXPRmQtGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loLIO-002IUF-00; Wed, 02 Jun 2021 07:28:08 +0000
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKme-0025w6-S0; Wed, 02 Jun 2021 06:55:21 +0000
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
Subject: [PATCH 19/30] nbd: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:34 +0300
Message-Id: <20210602065345.355274-20-hch@lst.de>
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
 drivers/block/nbd.c | 53 ++++++++++++++++++---------------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 45d2c28c8fc8..614d82e7fae4 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -219,15 +219,11 @@ static const struct device_attribute pid_attr = {
 static void nbd_dev_remove(struct nbd_device *nbd)
 {
 	struct gendisk *disk = nbd->disk;
-	struct request_queue *q;
 
 	if (disk) {
-		q = disk->queue;
 		del_gendisk(disk);
-		blk_cleanup_queue(q);
 		blk_mq_free_tag_set(&nbd->tag_set);
-		disk->private_data = NULL;
-		put_disk(disk);
+		blk_cleanup_disk(disk);
 	}
 
 	/*
@@ -1646,15 +1642,24 @@ static int nbd_dev_add(int index)
 {
 	struct nbd_device *nbd;
 	struct gendisk *disk;
-	struct request_queue *q;
 	int err = -ENOMEM;
 
 	nbd = kzalloc(sizeof(struct nbd_device), GFP_KERNEL);
 	if (!nbd)
 		goto out;
 
-	disk = alloc_disk(1 << part_shift);
-	if (!disk)
+	nbd->tag_set.ops = &nbd_mq_ops;
+	nbd->tag_set.nr_hw_queues = 1;
+	nbd->tag_set.queue_depth = 128;
+	nbd->tag_set.numa_node = NUMA_NO_NODE;
+	nbd->tag_set.cmd_size = sizeof(struct nbd_cmd);
+	nbd->tag_set.flags = BLK_MQ_F_SHOULD_MERGE |
+		BLK_MQ_F_BLOCKING;
+	nbd->tag_set.driver_data = nbd;
+	nbd->destroy_complete = NULL;
+
+	err = blk_mq_alloc_tag_set(&nbd->tag_set);
+	if (err)
 		goto out_free_nbd;
 
 	if (index >= 0) {
@@ -1668,30 +1673,15 @@ static int nbd_dev_add(int index)
 			index = err;
 	}
 	if (err < 0)
-		goto out_free_disk;
-
+		goto out_free_tags;
 	nbd->index = index;
-	nbd->disk = disk;
-	nbd->tag_set.ops = &nbd_mq_ops;
-	nbd->tag_set.nr_hw_queues = 1;
-	nbd->tag_set.queue_depth = 128;
-	nbd->tag_set.numa_node = NUMA_NO_NODE;
-	nbd->tag_set.cmd_size = sizeof(struct nbd_cmd);
-	nbd->tag_set.flags = BLK_MQ_F_SHOULD_MERGE |
-		BLK_MQ_F_BLOCKING;
-	nbd->tag_set.driver_data = nbd;
-	nbd->destroy_complete = NULL;
 
-	err = blk_mq_alloc_tag_set(&nbd->tag_set);
-	if (err)
+	disk = blk_mq_alloc_disk(&nbd->tag_set, NULL);
+	if (IS_ERR(disk)) {
+		err = PTR_ERR(disk);
 		goto out_free_idr;
-
-	q = blk_mq_init_queue(&nbd->tag_set);
-	if (IS_ERR(q)) {
-		err = PTR_ERR(q);
-		goto out_free_tags;
 	}
-	disk->queue = q;
+	nbd->disk = disk;
 
 	/*
 	 * Tell the block layer that we are not a rotational device
@@ -1712,6 +1702,7 @@ static int nbd_dev_add(int index)
 	INIT_LIST_HEAD(&nbd->list);
 	disk->major = NBD_MAJOR;
 	disk->first_minor = index << part_shift;
+	disk->minors = 1 << part_shift;
 	disk->fops = &nbd_fops;
 	disk->private_data = nbd;
 	sprintf(disk->disk_name, "nbd%d", index);
@@ -1719,12 +1710,10 @@ static int nbd_dev_add(int index)
 	nbd_total_devices++;
 	return index;
 
-out_free_tags:
-	blk_mq_free_tag_set(&nbd->tag_set);
 out_free_idr:
 	idr_remove(&nbd_index_idr, index);
-out_free_disk:
-	put_disk(disk);
+out_free_tags:
+	blk_mq_free_tag_set(&nbd->tag_set);
 out_free_nbd:
 	kfree(nbd);
 out:
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
