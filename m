Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C08C48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sY5rH1OaoRUjzOh1McPHMDxeKpSDMtqK4jeXusXHS1A=; b=0bor/t+kKLg8+Y
	9w5lR5Mvfzxe3scI6q7aNU7b4MxTiCQl4CWv2iuMxHnu/toxKmT9gAut+1jPpGBC8YEMcugbsBPmx
	rNYjMMthWzetrAPI0TxqjEd2Nb078St70rD46sAZ3UYH//S3ynqKagWP6Nwd21j+www4ZKjjQfu77
	Z3dMnJRULYXSoACrRqMHBtXAnsnCYlUxw2W6isOOZhckGaMx6OPrqp6a89TWMpJFsqW5ixFq5+Sws
	JRTLHxRP8kxZTCyfsadaj7Hds06JA2qiPPdMGxC2+Islw37BVC4eNiBCjaopnbHTVkGvX4YGPDa3n
	6O0UE2p6AcSofmKatKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmd-0000000FAo1-1IjQ;
	Thu, 15 Feb 2024 07:03:47 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmS-0000000FAdC-1wnt;
	Thu, 15 Feb 2024 07:03:37 +0000
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
Subject: [PATCH 11/17] ms_block: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:54 +0100
Message-Id: <20240215070300.2200308-12-hch@lst.de>
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

Pass the few limits ms_block imposes directly to blk_mq_alloc_disk
instead of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/memstick/core/ms_block.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index d3277c901d16bb..47a314a4eb6faf 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -2078,6 +2078,12 @@ static const struct blk_mq_ops msb_mq_ops = {
 static int msb_init_disk(struct memstick_dev *card)
 {
 	struct msb_data *msb = memstick_get_drvdata(card);
+	struct queue_limits lim = {
+		.logical_block_size	= msb->page_size,
+		.max_hw_sectors		= MS_BLOCK_MAX_PAGES,
+		.max_segments		= MS_BLOCK_MAX_SEGS,
+		.max_segment_size	= MS_BLOCK_MAX_PAGES * msb->page_size,
+	};
 	int rc;
 	unsigned long capacity;
 
@@ -2093,19 +2099,13 @@ static int msb_init_disk(struct memstick_dev *card)
 	if (rc)
 		goto out_release_id;
 
-	msb->disk = blk_mq_alloc_disk(&msb->tag_set, NULL, card);
+	msb->disk = blk_mq_alloc_disk(&msb->tag_set, &lim, card);
 	if (IS_ERR(msb->disk)) {
 		rc = PTR_ERR(msb->disk);
 		goto out_free_tag_set;
 	}
 	msb->queue = msb->disk->queue;
 
-	blk_queue_max_hw_sectors(msb->queue, MS_BLOCK_MAX_PAGES);
-	blk_queue_max_segments(msb->queue, MS_BLOCK_MAX_SEGS);
-	blk_queue_max_segment_size(msb->queue,
-				   MS_BLOCK_MAX_PAGES * msb->page_size);
-	blk_queue_logical_block_size(msb->queue, msb->page_size);
-
 	sprintf(msb->disk->disk_name, "msblk%d", msb->disk_id);
 	msb->disk->fops = &msb_bdops;
 	msb->disk->private_data = msb;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
