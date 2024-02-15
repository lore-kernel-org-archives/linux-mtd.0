Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7E6C4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mvRpXHlKi5qwoQF8OltWQy6ARVTBtVDgnZHNS9GqHq0=; b=IUcZNL+Unh0nYU
	U1W+MyWIGRMqjj5tXh7N0h2EoIgunD/m1R097witRRDjlZO5JVh1JTdU+Y/UxxHET1jqjT+x6DKC6
	IteBUxd1QyDpyhbmA3INnt4BQOvOcAn91Y9TWGhFOZCOQMxjd9VVN4TeEiAssyRxXX9zK/Ex4VLrj
	9Ud+4q1jDoEHD2YLBM2tw8IKKVn5HDxOrRAWIEmaw7n6K+nNWLdI4nLOJ9PIyhwj4L2fHfXCuIxlq
	QnpV64ie/UT5EpWcslCr8MytBzpmNTUy0Gx/m+Pk+bdOZjtO/rN9HBpFfK3A+gMQhwR1/y6Hyy1Oj
	PhVDkjLjn/T/qbnkxLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmi-0000000FAss-2UiC;
	Thu, 15 Feb 2024 07:03:52 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmV-0000000FAgD-1jEO;
	Thu, 15 Feb 2024 07:03:40 +0000
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
Subject: [PATCH 12/17] mspro_block: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:55 +0100
Message-Id: <20240215070300.2200308-13-hch@lst.de>
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

Pass the few limits mspro_block imposes directly to blk_mq_alloc_disk
instead of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/memstick/core/mspro_block.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index db0e2a42ca3c32..49accfdc89d616 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -1103,6 +1103,12 @@ static const struct blk_mq_ops mspro_mq_ops = {
 static int mspro_block_init_disk(struct memstick_dev *card)
 {
 	struct mspro_block_data *msb = memstick_get_drvdata(card);
+	struct queue_limits lim = {
+		.logical_block_size	= msb->page_size,
+		.max_hw_sectors		= MSPRO_BLOCK_MAX_PAGES,
+		.max_segments		= MSPRO_BLOCK_MAX_SEGS,
+		.max_segment_size	= MSPRO_BLOCK_MAX_PAGES * msb->page_size,
+	};
 	struct mspro_devinfo *dev_info = NULL;
 	struct mspro_sys_info *sys_info = NULL;
 	struct mspro_sys_attr *s_attr = NULL;
@@ -1138,18 +1144,13 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 	if (rc)
 		goto out_release_id;
 
-	msb->disk = blk_mq_alloc_disk(&msb->tag_set, NULL, card);
+	msb->disk = blk_mq_alloc_disk(&msb->tag_set, &lim, card);
 	if (IS_ERR(msb->disk)) {
 		rc = PTR_ERR(msb->disk);
 		goto out_free_tag_set;
 	}
 	msb->queue = msb->disk->queue;
 
-	blk_queue_max_hw_sectors(msb->queue, MSPRO_BLOCK_MAX_PAGES);
-	blk_queue_max_segments(msb->queue, MSPRO_BLOCK_MAX_SEGS);
-	blk_queue_max_segment_size(msb->queue,
-				   MSPRO_BLOCK_MAX_PAGES * msb->page_size);
-
 	msb->disk->major = major;
 	msb->disk->first_minor = disk_id << MSPRO_BLOCK_PART_SHIFT;
 	msb->disk->minors = 1 << MSPRO_BLOCK_PART_SHIFT;
@@ -1158,8 +1159,6 @@ static int mspro_block_init_disk(struct memstick_dev *card)
 
 	sprintf(msb->disk->disk_name, "mspblk%d", disk_id);
 
-	blk_queue_logical_block_size(msb->queue, msb->page_size);
-
 	capacity = be16_to_cpu(sys_info->user_block_count);
 	capacity *= be16_to_cpu(sys_info->block_size);
 	capacity *= msb->page_size >> 9;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
