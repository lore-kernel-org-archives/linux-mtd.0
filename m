Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B478C48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkT6pTZHIBvbFpXXnr+8oU7tMeXS6c1NHAAQotNTses=; b=gcGlihBEJsxM82
	5NKo+HI/tDb4K9rZ5rx+b1Sm2y/U5BPydJX5iXZq1XRVt09GLCobf0z6ggHiuDD80xAlE9c+vaBJ3
	OikmP4qvY+KKSF0z3RmxJPx2DzTt/g74Xs1llZfDRqefCbPjhe5ucjLeEnTimxxmbbyAa3VMoePRC
	xJFUe1o1QAntwORMBMgle5hqgKSP9pKIH+a5PHLaC1P3kzJVEG20TnDO9wEbIgaVybpZ/p3bOKqSy
	AS3Jz93IfUAqIRS+lwOw2NuDDv/jv8C4mYgxASx5DA/+w2Uu8CrxJH0p5+1Z47ZAGufVcbFjoZhFX
	CdQvxgZvYfyrpOvRo4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmG-0000000FATg-3WrT;
	Thu, 15 Feb 2024 07:03:24 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmE-0000000FASA-3Iy0;
	Thu, 15 Feb 2024 07:03:23 +0000
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
Subject: [PATCH 06/17] ps3disk: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:49 +0100
Message-Id: <20240215070300.2200308-7-hch@lst.de>
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

Pass the few limits ps3disk imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/ps3disk.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
index dfd3860df4f880..b810ac0a5c4b97 100644
--- a/drivers/block/ps3disk.c
+++ b/drivers/block/ps3disk.c
@@ -382,6 +382,14 @@ static int ps3disk_probe(struct ps3_system_bus_device *_dev)
 	struct ps3disk_private *priv;
 	int error;
 	unsigned int devidx;
+	struct queue_limits lim = {
+		.logical_block_size	= dev->blk_size,
+		.max_hw_sectors		= dev->bounce_size >> 9,
+		.max_segments		= -1,
+		.max_segment_size	= dev->bounce_size,
+		.dma_alignment		= dev->blk_size - 1,
+	};
+
 	struct request_queue *queue;
 	struct gendisk *gendisk;
 
@@ -431,7 +439,7 @@ static int ps3disk_probe(struct ps3_system_bus_device *_dev)
 	if (error)
 		goto fail_teardown;
 
-	gendisk = blk_mq_alloc_disk(&priv->tag_set, NULL, dev);
+	gendisk = blk_mq_alloc_disk(&priv->tag_set, &lim, dev);
 	if (IS_ERR(gendisk)) {
 		dev_err(&dev->sbd.core, "%s:%u: blk_mq_alloc_disk failed\n",
 			__func__, __LINE__);
@@ -441,15 +449,8 @@ static int ps3disk_probe(struct ps3_system_bus_device *_dev)
 
 	queue = gendisk->queue;
 
-	blk_queue_max_hw_sectors(queue, dev->bounce_size >> 9);
-	blk_queue_dma_alignment(queue, dev->blk_size-1);
-	blk_queue_logical_block_size(queue, dev->blk_size);
-
 	blk_queue_write_cache(queue, true, false);
 
-	blk_queue_max_segments(queue, -1);
-	blk_queue_max_segment_size(queue, dev->bounce_size);
-
 	priv->gendisk = gendisk;
 	gendisk->major = ps3disk_major;
 	gendisk->first_minor = devidx * PS3DISK_MINORS;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
