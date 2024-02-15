Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789E8C48BEF
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/kQJlCYlgDxY1N4nWJnyI1Otr5jGv16DqZYrB5hosk=; b=m54kPiHz3/zres
	crYi6+5VLhQ8h9imjQihEkN5KxZhAw+ZKUeNnj86Y2MiHr5B8L3j8U+O36U90wBMTTx0mTbAZuBGg
	vzZXeh3ciFi5kclX1LOxoW9iyq4ubrGMwkbn0p7jhqPEqG2sWuUbZSDGWdpB2NzwXI5eIByl8cZpy
	QvQvuFXTyzR7wRx7lzmRXTGUOWzh+bX4JeZrbleqcF86Ifv0HEO+KuDFn9NmBMDI0Zx88ZHFOYWpw
	BRgyOdWfMOx2XgRGR3tEyryy6JVuRcafFzlrs1MW1taUEpVIBQH8PLKoyJdBkwntg0OC1jXBKuRL+
	6ccqcFbjLhmUw9deMqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVn6-0000000FBGE-1g44;
	Thu, 15 Feb 2024 07:04:16 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVme-0000000FAoN-2DEF;
	Thu, 15 Feb 2024 07:03:49 +0000
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
Subject: [PATCH 15/17] scm_blk: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:58 +0100
Message-Id: <20240215070300.2200308-16-hch@lst.de>
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

Pass the few limits scm_block imposes directly to blk_mq_alloc_disk
instead of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/s390/block/scm_blk.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/s390/block/scm_blk.c b/drivers/s390/block/scm_blk.c
index d05b2e2799a47a..9f6fdd0daa74eb 100644
--- a/drivers/s390/block/scm_blk.c
+++ b/drivers/s390/block/scm_blk.c
@@ -435,10 +435,17 @@ static const struct blk_mq_ops scm_mq_ops = {
 
 int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 {
-	unsigned int devindex, nr_max_blk;
+	struct queue_limits lim = {
+		.logical_block_size	= 1 << 12,
+	};
+	unsigned int devindex;
 	struct request_queue *rq;
 	int len, ret;
 
+	lim.max_segments = min(scmdev->nr_max_block,
+		(unsigned int) (PAGE_SIZE / sizeof(struct aidaw)));
+	lim.max_hw_sectors = lim.max_segments << 3; /* 8 * 512 = blk_size */
+
 	devindex = atomic_inc_return(&nr_devices) - 1;
 	/* scma..scmz + scmaa..scmzz */
 	if (devindex > 701) {
@@ -462,18 +469,12 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 	if (ret)
 		goto out;
 
-	bdev->gendisk = blk_mq_alloc_disk(&bdev->tag_set, NULL, scmdev);
+	bdev->gendisk = blk_mq_alloc_disk(&bdev->tag_set, &lim, scmdev);
 	if (IS_ERR(bdev->gendisk)) {
 		ret = PTR_ERR(bdev->gendisk);
 		goto out_tag;
 	}
 	rq = bdev->rq = bdev->gendisk->queue;
-	nr_max_blk = min(scmdev->nr_max_block,
-			 (unsigned int) (PAGE_SIZE / sizeof(struct aidaw)));
-
-	blk_queue_logical_block_size(rq, 1 << 12);
-	blk_queue_max_hw_sectors(rq, nr_max_blk << 3); /* 8 * 512 = blk_size */
-	blk_queue_max_segments(rq, nr_max_blk);
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, rq);
 	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, rq);
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
