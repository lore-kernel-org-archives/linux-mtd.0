Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C3DC48BEF
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVi6g6gjLbcHaatyW5em6vtKyfjfozLCQ9U39C0ZCOw=; b=a11LTR0JPYyStB
	K6nf6nwFrzq7ka0A8IoP8FoUzCHsaTy073Kj6V5FM2iyRLcq+B+RdBnwLPauMGOpedIpYqRq0d0Sp
	eBvZNYGJJBEvOK2QGDN6ssvHHp8RYn0C42ni3dFCtlWVVA8A7GX8RTvWwIYsuUd/9o0j1h19oTHal
	1kkSsx1zz2g9DwVgPhq2N2LYZTFLeWsPZsLQvGyMOKSGJTsQsbbRKe5jjZZN9ZZytBRcNoz9I3EKO
	B9A9R1NMP5MGjjh1SsiXaEtK8q+gGPcI334mgmTr5q3Yo+zx70XbEmv9MyPCMJMFi3Z6fo/MwhTMB
	B/4JdnQ+uJnFKfKdjFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmE-0000000FASV-12tj;
	Thu, 15 Feb 2024 07:03:22 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmC-0000000FAQx-0hfK;
	Thu, 15 Feb 2024 07:03:20 +0000
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
Subject: [PATCH 05/17] nbd: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:48 +0100
Message-Id: <20240215070300.2200308-6-hch@lst.de>
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

Pass the few limits nbd imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 30ae3cc12e7787..1038311462d083 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1783,6 +1783,12 @@ static const struct blk_mq_ops nbd_mq_ops = {
 
 static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 {
+	struct queue_limits lim = {
+		.max_hw_sectors		= 65536,
+		.max_user_sectors	= 256,
+		.max_segments		= USHRT_MAX,
+		.max_segment_size	= UINT_MAX,
+	};
 	struct nbd_device *nbd;
 	struct gendisk *disk;
 	int err = -ENOMEM;
@@ -1823,7 +1829,7 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	if (err < 0)
 		goto out_free_tags;
 
-	disk = blk_mq_alloc_disk(&nbd->tag_set, NULL, NULL);
+	disk = blk_mq_alloc_disk(&nbd->tag_set, &lim, NULL);
 	if (IS_ERR(disk)) {
 		err = PTR_ERR(disk);
 		goto out_free_idr;
@@ -1843,11 +1849,6 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	 * Tell the block layer that we are not a rotational device
 	 */
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
-	blk_queue_max_discard_sectors(disk->queue, 0);
-	blk_queue_max_segment_size(disk->queue, UINT_MAX);
-	blk_queue_max_segments(disk->queue, USHRT_MAX);
-	blk_queue_max_hw_sectors(disk->queue, 65536);
-	disk->queue->limits.max_sectors = 256;
 
 	mutex_init(&nbd->config_lock);
 	refcount_set(&nbd->config_refs, 0);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
