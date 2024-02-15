Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9B5C4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7k9/TRAC50zK5oW0I6lCYxuSmSAedRGQqtv32M5MME=; b=iibSL4wOA0CD2L
	oV9vxWeKj4Zqlaxul8Kd8s4XOlm9J2DOqVUOByTGozzxKT+VCAk9GkeLYm+i5MIGOAdiDdJqw/Wwm
	iM701gi2gw2bqIMNmzbxzTSX4vkqIfLNyr6XmN1I3jjyjUD53l+z+GjPlnEVO5S66zaVhjzYoeu2+
	QAbWN+CZoYoRx8jTCpTnohTjjLFg0B4Mnw3DFqguj2EYq+2IMYoPhpo7hvHaGRyJKh5rE55Tmd8ld
	hpT1P6PwrcSCp2ialatla2eqwG/nJ4N+fKBKBUY6DcqLjHCRYrqytWl7E4rkQby9QsI7cjxAXH1dg
	SzkBLISDTHoKs+3gB1oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmI-0000000FAUk-3DIR;
	Thu, 15 Feb 2024 07:03:26 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmH-0000000FATJ-1il1;
	Thu, 15 Feb 2024 07:03:25 +0000
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
Subject: [PATCH 07/17] rbd: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:50 +0100
Message-Id: <20240215070300.2200308-8-hch@lst.de>
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

Pass the limits rbd imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rbd.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 6b4f1898a722a3..26ff5cd2bf0abc 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -4952,6 +4952,14 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	struct request_queue *q;
 	unsigned int objset_bytes =
 	    rbd_dev->layout.object_size * rbd_dev->layout.stripe_count;
+	struct queue_limits lim = {
+		.max_hw_sectors		= objset_bytes >> SECTOR_SHIFT,
+		.max_user_sectors	= objset_bytes >> SECTOR_SHIFT,
+		.io_min			= rbd_dev->opts->alloc_size,
+		.io_opt			= rbd_dev->opts->alloc_size,
+		.max_segments		= USHRT_MAX,
+		.max_segment_size	= UINT_MAX,
+	};
 	int err;
 
 	memset(&rbd_dev->tag_set, 0, sizeof(rbd_dev->tag_set));
@@ -4966,7 +4974,13 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	if (err)
 		return err;
 
-	disk = blk_mq_alloc_disk(&rbd_dev->tag_set, NULL, rbd_dev);
+	if (rbd_dev->opts->trim) {
+		lim.discard_granularity = rbd_dev->opts->alloc_size;
+		lim.max_hw_discard_sectors = objset_bytes >> SECTOR_SHIFT;
+		lim.max_write_zeroes_sectors = objset_bytes >> SECTOR_SHIFT;
+	}
+
+	disk = blk_mq_alloc_disk(&rbd_dev->tag_set, &lim, rbd_dev);
 	if (IS_ERR(disk)) {
 		err = PTR_ERR(disk);
 		goto out_tag_set;
@@ -4987,19 +5001,6 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
 	/* QUEUE_FLAG_ADD_RANDOM is off by default for blk-mq */
 
-	blk_queue_max_hw_sectors(q, objset_bytes >> SECTOR_SHIFT);
-	q->limits.max_sectors = queue_max_hw_sectors(q);
-	blk_queue_max_segments(q, USHRT_MAX);
-	blk_queue_max_segment_size(q, UINT_MAX);
-	blk_queue_io_min(q, rbd_dev->opts->alloc_size);
-	blk_queue_io_opt(q, rbd_dev->opts->alloc_size);
-
-	if (rbd_dev->opts->trim) {
-		q->limits.discard_granularity = rbd_dev->opts->alloc_size;
-		blk_queue_max_discard_sectors(q, objset_bytes >> SECTOR_SHIFT);
-		blk_queue_max_write_zeroes_sectors(q, objset_bytes >> SECTOR_SHIFT);
-	}
-
 	if (!ceph_test_opt(rbd_dev->rbd_client->client, NOCRC))
 		blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, q);
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
