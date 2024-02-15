Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DAAC4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhaG68od0bhk5SV5quKk2l7wgWTU82BOR6HyOO/f/K0=; b=HFY2BfiLAIVwhQ
	e7LU2LDZU2iT1mhh80ayUS7AmYjEFKVxk4UjajiZDmami9lM/22e6G5bDtxDhRXVdS57wvf1/mBYR
	Gq/uw9BWnOt0xbM2UlfhTF2VxfIOTmVVW/StyEZl2Si2o3PZVdTfAew4kMadTL5F0KNHxH3rKPAmg
	aelIycAaasuOnideZk7CNMgyL/hvpIO3zDKFxAxipOxdXK52iCvUDs4mJFVIqcG8VxexdcZaDfY+F
	nELvOdw+nMqn28mi/MKsRaUtvgT8i8WbVTSYr7zkAPf/cVzC3q0tc7sstl+1YDim1GI7xJ74utxLw
	BWAcmee/m3AJvPxrLArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raWuP-0000000FIqB-2NAJ;
	Thu, 15 Feb 2024 08:15:53 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmk-0000000FAup-2ONv;
	Thu, 15 Feb 2024 07:03:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Ming Lei <ming.lei@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:03:00 +0100
Message-Id: <20240215070300.2200308-18-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
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

Pass the queue limit set at initialization time directly to
blk_mq_alloc_disk instead of updating it right after the allocation.

This requires refactoring the code a bit so that what was mmc_setup_queue
before also allocates the gendisk now and actually sets all limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mmc/core/queue.c | 97 +++++++++++++++++++++-------------------
 1 file changed, 52 insertions(+), 45 deletions(-)

diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
index 67ad186d132a69..2ae60d208cdf1e 100644
--- a/drivers/mmc/core/queue.c
+++ b/drivers/mmc/core/queue.c
@@ -174,8 +174,8 @@ static struct scatterlist *mmc_alloc_sg(unsigned short sg_len, gfp_t gfp)
 	return sg;
 }
 
-static void mmc_queue_setup_discard(struct request_queue *q,
-				    struct mmc_card *card)
+static void mmc_queue_setup_discard(struct mmc_card *card,
+		struct queue_limits *lim)
 {
 	unsigned max_discard;
 
@@ -183,15 +183,17 @@ static void mmc_queue_setup_discard(struct request_queue *q,
 	if (!max_discard)
 		return;
 
-	blk_queue_max_discard_sectors(q, max_discard);
-	q->limits.discard_granularity = card->pref_erase << 9;
-	/* granularity must not be greater than max. discard */
-	if (card->pref_erase > max_discard)
-		q->limits.discard_granularity = SECTOR_SIZE;
+	lim->max_hw_discard_sectors = max_discard;
 	if (mmc_can_secure_erase_trim(card))
-		blk_queue_max_secure_erase_sectors(q, max_discard);
+		lim->max_secure_erase_sectors = max_discard;
 	if (mmc_can_trim(card) && card->erased_byte == 0)
-		blk_queue_max_write_zeroes_sectors(q, max_discard);
+		lim->max_write_zeroes_sectors = max_discard;
+
+	/* granularity must not be greater than max. discard */
+	if (card->pref_erase > max_discard)
+		lim->discard_granularity = SECTOR_SIZE;
+	else
+		lim->discard_granularity = card->pref_erase << 9;
 }
 
 static unsigned short mmc_get_max_segments(struct mmc_host *host)
@@ -341,40 +343,53 @@ static const struct blk_mq_ops mmc_mq_ops = {
 	.timeout	= mmc_mq_timed_out,
 };
 
-static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
+static struct gendisk *mmc_alloc_disk(struct mmc_queue *mq,
+		struct mmc_card *card)
 {
 	struct mmc_host *host = card->host;
-	unsigned block_size = 512;
+	struct queue_limits lim = { };
+	struct gendisk *disk;
 
-	blk_queue_flag_set(QUEUE_FLAG_NONROT, mq->queue);
-	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
 	if (mmc_can_erase(card))
-		mmc_queue_setup_discard(mq->queue, card);
+		mmc_queue_setup_discard(card, &lim);
 
 	if (!mmc_dev(host)->dma_mask || !*mmc_dev(host)->dma_mask)
-		blk_queue_bounce_limit(mq->queue, BLK_BOUNCE_HIGH);
-	blk_queue_max_hw_sectors(mq->queue,
-		min(host->max_blk_count, host->max_req_size / 512));
-	if (host->can_dma_map_merge)
-		WARN(!blk_queue_can_use_dma_map_merging(mq->queue,
-							mmc_dev(host)),
-		     "merging was advertised but not possible");
-	blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));
-
-	if (mmc_card_mmc(card) && card->ext_csd.data_sector_size) {
-		block_size = card->ext_csd.data_sector_size;
-		WARN_ON(block_size != 512 && block_size != 4096);
-	}
+		lim.bounce = BLK_BOUNCE_HIGH;
+
+	lim.max_hw_sectors = min(host->max_blk_count, host->max_req_size / 512);
+
+	if (mmc_card_mmc(card) && card->ext_csd.data_sector_size)
+		lim.logical_block_size = card->ext_csd.data_sector_size;
+	else
+		lim.logical_block_size = 512;
+
+	WARN_ON_ONCE(lim.logical_block_size != 512 &&
+		     lim.logical_block_size != 4096);
 
-	blk_queue_logical_block_size(mq->queue, block_size);
 	/*
-	 * After blk_queue_can_use_dma_map_merging() was called with succeed,
-	 * since it calls blk_queue_virt_boundary(), the mmc should not call
-	 * both blk_queue_max_segment_size().
+	 * Setting a virt_boundary implicity sets a max_segment_size, so try
+	 * to set the hardware one here.
 	 */
-	if (!host->can_dma_map_merge)
-		blk_queue_max_segment_size(mq->queue,
-			round_down(host->max_seg_size, block_size));
+	if (host->can_dma_map_merge) {
+		lim.virt_boundary_mask = dma_get_merge_boundary(mmc_dev(host));
+		lim.max_segments = MMC_DMA_MAP_MERGE_SEGMENTS;
+	} else {
+		lim.max_segment_size =
+			round_down(host->max_seg_size, lim.logical_block_size);
+		lim.max_segments = host->max_segs;
+	}
+
+	disk = blk_mq_alloc_disk(&mq->tag_set, &lim, mq);
+	if (IS_ERR(disk))
+		return disk;
+	mq->queue = disk->queue;
+
+	if (mmc_host_is_spi(host) && host->use_spi_crc)
+		blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, mq->queue);
+	blk_queue_rq_timeout(mq->queue, 60 * HZ);
+
+	blk_queue_flag_set(QUEUE_FLAG_NONROT, mq->queue);
+	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
 
 	dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->queue));
 
@@ -386,6 +401,7 @@ static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
 	init_waitqueue_head(&mq->wait);
 
 	mmc_crypto_setup_queue(mq->queue, host);
+	return disk;
 }
 
 static inline bool mmc_merge_capable(struct mmc_host *host)
@@ -447,18 +463,9 @@ struct gendisk *mmc_init_queue(struct mmc_queue *mq, struct mmc_card *card)
 		return ERR_PTR(ret);
 		
 
-	disk = blk_mq_alloc_disk(&mq->tag_set, NULL, mq);
-	if (IS_ERR(disk)) {
+	disk = mmc_alloc_disk(mq, card);
+	if (IS_ERR(disk))
 		blk_mq_free_tag_set(&mq->tag_set);
-		return disk;
-	}
-	mq->queue = disk->queue;
-
-	if (mmc_host_is_spi(host) && host->use_spi_crc)
-		blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, mq->queue);
-	blk_queue_rq_timeout(mq->queue, 60 * HZ);
-
-	mmc_setup_queue(mq, card);
 	return disk;
 }
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
