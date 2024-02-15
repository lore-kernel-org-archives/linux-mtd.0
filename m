Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B0FC4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 07:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ci1WTGt41TcLIYgdkui7MX3Z7T2ah4oz2vUA64QWTVQ=; b=NaWpcn0SGd7Vxx
	OzuBYY76PuayOTUVheIj4HOy/8lZtpCQc3SMtpBPLghjuzR0sIGMhOCzJw6yjyHucaI85QtQPq4vP
	yFCu/6u4Drdn7Xp3N+2SSBa9BJPAKW3Fd27QC5TEqcFM9BhycizyK10CVbqfmXKYskVd6xSZQX1Io
	wRPEXIfEqFyAQBn1J8ueF0lbLTg2FWWxAZpE2i/pkIUnWmFaAXDZCuv4wYX11hd48FDpm82MzV73X
	vyM4S/Vojpwon/nLc3bMXKCkpZw9LsfjDbTO7qR7npSSKM5vtnCJhFydUTxI2B9VPu4ouyZUh15Qp
	+rWkj+48qrNSDWkGV1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmS-0000000FAeI-2PLd;
	Thu, 15 Feb 2024 07:03:36 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVmN-0000000FAY2-0VaO;
	Thu, 15 Feb 2024 07:03:31 +0000
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
Subject: [PATCH 09/17] sunvdc: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:52 +0100
Message-Id: <20240215070300.2200308-10-hch@lst.de>
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

Pass the few limits sunvdc imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/sunvdc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index a1f74dd1eae5d5..c99dd6698977ea 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -784,6 +784,14 @@ static const struct blk_mq_ops vdc_mq_ops = {
 
 static int probe_disk(struct vdc_port *port)
 {
+	struct queue_limits lim = {
+		.physical_block_size		= port->vdisk_phys_blksz,
+		.max_hw_sectors			= port->max_xfer_size,
+		/* Each segment in a request is up to an aligned page in size. */
+		.seg_boundary_mask		= PAGE_SIZE - 1,
+		.max_segment_size		= PAGE_SIZE,
+		.max_segments			= port->ring_cookies,
+	};
 	struct request_queue *q;
 	struct gendisk *g;
 	int err;
@@ -824,7 +832,7 @@ static int probe_disk(struct vdc_port *port)
 	if (err)
 		return err;
 
-	g = blk_mq_alloc_disk(&port->tag_set, NULL, port);
+	g = blk_mq_alloc_disk(&port->tag_set, &lim, port);
 	if (IS_ERR(g)) {
 		printk(KERN_ERR PFX "%s: Could not allocate gendisk.\n",
 		       port->vio.name);
@@ -835,12 +843,6 @@ static int probe_disk(struct vdc_port *port)
 	port->disk = g;
 	q = g->queue;
 
-	/* Each segment in a request is up to an aligned page in size. */
-	blk_queue_segment_boundary(q, PAGE_SIZE - 1);
-	blk_queue_max_segment_size(q, PAGE_SIZE);
-
-	blk_queue_max_segments(q, port->ring_cookies);
-	blk_queue_max_hw_sectors(q, port->max_xfer_size);
 	g->major = vdc_major;
 	g->first_minor = port->vio.vdev->dev_no << PARTITION_SHIFT;
 	g->minors = 1 << PARTITION_SHIFT;
@@ -872,8 +874,6 @@ static int probe_disk(struct vdc_port *port)
 		}
 	}
 
-	blk_queue_physical_block_size(q, port->vdisk_phys_blksz);
-
 	pr_info(PFX "%s: %u sectors (%u MB) protocol %d.%d\n",
 	       g->disk_name,
 	       port->vdisk_size, (port->vdisk_size >> (20 - 9)),
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
