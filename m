Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAADFC48BF1
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8a8DoE719tsYNTXR/rrwfGiByeciAySzVUqBHVrIp4=; b=Rx6dkyWDL/dDVB
	7w4fhThCtitMZNV68oPQNcSf0yalq5t+oUlSrGK5g3cdPuCdoxCFBvmkb4sPy3j97YT7K9se2Bj36
	/jZ2cZLoy3c1cjje+r8jGfYoPbR8rp/Q06DTn4ji4juOaLKUjafCd/GkvFl01Q6B8CnzZOdrL2NTT
	9p6RnGK/AekP5N808f+s/FgxC7qZCnK/RiocQOg9YgEfeCUATEGttkW3fd7l8pRVeDSgHY+2z8EWb
	Ht4wwHxAZPL9gR4VI4Kur2lto31wke1aV16wV+SS1Yd1KHHbpNOLQsq48+JR8AeXm+x62UOB/YJxb
	HcEePadNdtmEiUyZ9I4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmC-0000000FARc-1tXn;
	Thu, 15 Feb 2024 07:03:20 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVm9-0000000FAPj-290B;
	Thu, 15 Feb 2024 07:03:18 +0000
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
Subject: [PATCH 04/17] mtip: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:47 +0100
Message-Id: <20240215070300.2200308-5-hch@lst.de>
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

Pass the few limits mtip imposes directly to blk_mq_alloc_disk instead
of setting them one at a time and drop the pointless setting of a io_min
that is equal to the physical block size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/mtip32xx/mtip32xx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index ac08dea73552f4..43a187609ef794 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -3401,6 +3401,12 @@ static const struct blk_mq_ops mtip_mq_ops = {
  */
 static int mtip_block_initialize(struct driver_data *dd)
 {
+	struct queue_limits lim = {
+		.physical_block_size	= 4096,
+		.max_hw_sectors		= 0xffff,
+		.max_segments		= MTIP_MAX_SG,
+		.max_segment_size	= 0x400000,
+	};
 	int rv = 0, wait_for_rebuild = 0;
 	sector_t capacity;
 	unsigned int index = 0;
@@ -3431,7 +3437,7 @@ static int mtip_block_initialize(struct driver_data *dd)
 		goto block_queue_alloc_tag_error;
 	}
 
-	dd->disk = blk_mq_alloc_disk(&dd->tags, NULL, dd);
+	dd->disk = blk_mq_alloc_disk(&dd->tags, &lim, dd);
 	if (IS_ERR(dd->disk)) {
 		dev_err(&dd->pdev->dev,
 			"Unable to allocate request queue\n");
@@ -3481,12 +3487,7 @@ static int mtip_block_initialize(struct driver_data *dd)
 	/* Set device limits. */
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, dd->queue);
 	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, dd->queue);
-	blk_queue_max_segments(dd->queue, MTIP_MAX_SG);
-	blk_queue_physical_block_size(dd->queue, 4096);
-	blk_queue_max_hw_sectors(dd->queue, 0xffff);
-	blk_queue_max_segment_size(dd->queue, 0x400000);
 	dma_set_max_seg_size(&dd->pdev->dev, 0x400000);
-	blk_queue_io_min(dd->queue, 4096);
 
 	/* Set the capacity of the device in 512 byte sectors. */
 	if (!(mtip_hw_get_capacity(dd, &capacity))) {
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
