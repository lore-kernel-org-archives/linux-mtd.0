Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95871C47083
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:06:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64268610CB
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64268610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRo7gYoZQ8+Wst5aW0MXlyY1JODxdnWAJzxXmdtSDxc=; b=ilff/ChaL9VYAX
	un8VDajUUTAiNsi55Tuy0HiDdNe6lNYzqMhZTyEW/76cIBCC/Neyk98AlYxK6HWp5Ua/C5K48p1Lm
	Jn0VvDAsVCqqqA3fOPS1mZ1rY2ru33IfjkP8RcLFCjIpsecEfo8PW/ASSYaU7nRBxO5EydXJvFAgo
	HiYJQFEb46ssGvx2vX+ZQoh510l/veMBmezl3s2wZ5lCR4a1ON0GRr+PBv1huSsTvQgkctCvn8B45
	3rsLrzEEouXQs9sZrCATym5+nMuiIdiOE3qpPmvGhjRYvBnHLBjdG5yO/kBMgYCbcxcuJh2j3yTVb
	ifqztS2JVGtScpPenUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKwQ-002Ar5-4v; Wed, 02 Jun 2021 07:05:26 +0000
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKls-0025R4-W9; Wed, 02 Jun 2021 06:54:33 +0000
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
Subject: [PATCH 08/30] mspro: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:23 +0300
Message-Id: <20210602065345.355274-9-hch@lst.de>
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
 drivers/memstick/core/mspro_block.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index cf7fe0d58ee7..22778d0e24f5 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -1205,21 +1205,17 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 	if (disk_id < 0)
 		return disk_id;
 
-	msb->disk = alloc_disk(1 << MSPRO_BLOCK_PART_SHIFT);
-	if (!msb->disk) {
-		rc = -ENOMEM;
+	rc = blk_mq_alloc_sq_tag_set(&msb->tag_set, &mspro_mq_ops, 2,
+				     BLK_MQ_F_SHOULD_MERGE);
+	if (rc)
 		goto out_release_id;
-	}
 
-	msb->queue = blk_mq_init_sq_queue(&msb->tag_set, &mspro_mq_ops, 2,
-						BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(msb->queue)) {
-		rc = PTR_ERR(msb->queue);
-		msb->queue = NULL;
-		goto out_put_disk;
+	msb->disk = blk_mq_alloc_disk(&msb->tag_set, card);
+	if (IS_ERR(msb->disk)) {
+		rc = PTR_ERR(msb->disk);
+		goto out_free_tag_set;
 	}
-
-	msb->queue->queuedata = card;
+	msb->queue = msb->disk->queue;
 
 	blk_queue_max_hw_sectors(msb->queue, MSPRO_BLOCK_MAX_PAGES);
 	blk_queue_max_segments(msb->queue, MSPRO_BLOCK_MAX_SEGS);
@@ -1228,10 +1224,10 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 
 	msb->disk->major = major;
 	msb->disk->first_minor = disk_id << MSPRO_BLOCK_PART_SHIFT;
+	msb->disk->minors = 1 << MSPRO_BLOCK_PART_SHIFT;
 	msb->disk->fops = &ms_block_bdops;
 	msb->usage_count = 1;
 	msb->disk->private_data = msb;
-	msb->disk->queue = msb->queue;
 
 	sprintf(msb->disk->disk_name, "mspblk%d", disk_id);
 
@@ -1247,8 +1243,8 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 	msb->active = 1;
 	return 0;
 
-out_put_disk:
-	put_disk(msb->disk);
+out_free_tag_set:
+	blk_mq_free_tag_set(&msb->tag_set);
 out_release_id:
 	mutex_lock(&mspro_block_disk_lock);
 	idr_remove(&mspro_block_disk_idr, disk_id);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
