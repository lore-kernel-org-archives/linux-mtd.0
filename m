Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547BAC4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXQBKQ0VvyaAXqIh5sCYghc+OMKNe95t2QKQLVOvvKw=; b=KsJQFV9w+7rwH2
	j5dkQNDhma4YR20jcrfnYa2zBPXEoFGCx4hYYLTsBjAAkP1AxwTKQIaIUW9W5iFjReAUWhW5I/UX3
	ca34EEhryBe7ctXKyqjxhScYyG4CEvynLKaAe6zExODCEuoOIW8jidzhs6ATV/QvqKg3hLcN2Lw6X
	mUcPSxYCq+pMF1fNBerqTGYTN59/PFveEuAqR+/8jPvIWzCNefMgpGpMJz+7iPI8rG+uwSpNm0TCZ
	ZMDAfQL3hUQSntSB982CeDpprkfwxbKDM51Kh6zCcuAnIL3xmIx0FQgzLnfXKwyrkgRFSBQAxkXEu
	H4SQzRbWzsCr6STJjVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmO-0000000FAbU-3YS8;
	Thu, 15 Feb 2024 07:03:32 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmK-0000000FAUd-0tPX;
	Thu, 15 Feb 2024 07:03:28 +0000
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
Subject: [PATCH 08/17] rnbd-clt: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:51 +0100
Message-Id: <20240215070300.2200308-9-hch@lst.de>
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

Pass the limits rnbd-clt imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

While at it don't set an explicit number of discard segments, as 1 is
the default (which most drivers rely on).

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rnbd/rnbd-clt.c | 64 ++++++++++++++---------------------
 1 file changed, 25 insertions(+), 39 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index d51be4f2df61a3..b7ffe03c61606d 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -1329,43 +1329,6 @@ static void rnbd_init_mq_hw_queues(struct rnbd_clt_dev *dev)
 	}
 }
 
-static void setup_request_queue(struct rnbd_clt_dev *dev,
-				struct rnbd_msg_open_rsp *rsp)
-{
-	blk_queue_logical_block_size(dev->queue,
-				     le16_to_cpu(rsp->logical_block_size));
-	blk_queue_physical_block_size(dev->queue,
-				      le16_to_cpu(rsp->physical_block_size));
-	blk_queue_max_hw_sectors(dev->queue,
-				 dev->sess->max_io_size / SECTOR_SIZE);
-
-	/*
-	 * we don't support discards to "discontiguous" segments
-	 * in on request
-	 */
-	blk_queue_max_discard_segments(dev->queue, 1);
-
-	blk_queue_max_discard_sectors(dev->queue,
-				      le32_to_cpu(rsp->max_discard_sectors));
-	dev->queue->limits.discard_granularity =
-					le32_to_cpu(rsp->discard_granularity);
-	dev->queue->limits.discard_alignment =
-					le32_to_cpu(rsp->discard_alignment);
-	if (le16_to_cpu(rsp->secure_discard))
-		blk_queue_max_secure_erase_sectors(dev->queue,
-					le32_to_cpu(rsp->max_discard_sectors));
-	blk_queue_flag_set(QUEUE_FLAG_SAME_COMP, dev->queue);
-	blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, dev->queue);
-	blk_queue_max_segments(dev->queue, dev->sess->max_segments);
-	blk_queue_io_opt(dev->queue, dev->sess->max_io_size);
-	blk_queue_virt_boundary(dev->queue, SZ_4K - 1);
-	blk_queue_write_cache(dev->queue,
-			      !!(rsp->cache_policy & RNBD_WRITEBACK),
-			      !!(rsp->cache_policy & RNBD_FUA));
-	blk_queue_max_write_zeroes_sectors(dev->queue,
-					   le32_to_cpu(rsp->max_write_zeroes_sectors));
-}
-
 static int rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev,
 				   struct rnbd_msg_open_rsp *rsp, int idx)
 {
@@ -1403,18 +1366,41 @@ static int rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev,
 static int rnbd_client_setup_device(struct rnbd_clt_dev *dev,
 				    struct rnbd_msg_open_rsp *rsp)
 {
+	struct queue_limits lim = {
+		.logical_block_size	= le16_to_cpu(rsp->logical_block_size),
+		.physical_block_size	= le16_to_cpu(rsp->physical_block_size),
+		.io_opt			= dev->sess->max_io_size,
+		.max_hw_sectors		= dev->sess->max_io_size / SECTOR_SIZE,
+		.max_hw_discard_sectors	= le32_to_cpu(rsp->max_discard_sectors),
+		.discard_granularity	= le32_to_cpu(rsp->discard_granularity),
+		.discard_alignment	= le32_to_cpu(rsp->discard_alignment),
+		.max_segments		= dev->sess->max_segments,
+		.virt_boundary_mask	= SZ_4K - 1,
+		.max_write_zeroes_sectors =
+			le32_to_cpu(rsp->max_write_zeroes_sectors),
+	};
 	int idx = dev->clt_device_id;
 
 	dev->size = le64_to_cpu(rsp->nsectors) *
 			le16_to_cpu(rsp->logical_block_size);
 
-	dev->gd = blk_mq_alloc_disk(&dev->sess->tag_set, NULL, dev);
+	if (rsp->secure_discard) {
+		lim.max_secure_erase_sectors =
+			le32_to_cpu(rsp->max_discard_sectors);
+	}
+
+	dev->gd = blk_mq_alloc_disk(&dev->sess->tag_set, &lim, dev);
 	if (IS_ERR(dev->gd))
 		return PTR_ERR(dev->gd);
 	dev->queue = dev->gd->queue;
 	rnbd_init_mq_hw_queues(dev);
 
-	setup_request_queue(dev, rsp);
+	blk_queue_flag_set(QUEUE_FLAG_SAME_COMP, dev->queue);
+	blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, dev->queue);
+	blk_queue_write_cache(dev->queue,
+			      !!(rsp->cache_policy & RNBD_WRITEBACK),
+			      !!(rsp->cache_policy & RNBD_FUA));
+
 	return rnbd_clt_setup_gen_disk(dev, rsp, idx);
 }
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
