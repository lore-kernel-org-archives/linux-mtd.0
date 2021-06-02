Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE07C47083
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:17:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5634A610E5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5634A610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQILZa/+iQSiwQYNV1+FD4+hM7wVA1xvzJQc8NhZDHU=; b=jJyGmJ9QjRUfxS
	SzvUB5O2EULWrcawMeWA41OObVH8seMPubN2P8pO3sjmLGsrsq2dnBuirs2Z4eBAfVfudwed+B3ny
	LUYgrcuy/wDcoB8WhYE726w6/goYsSTtTA06gVvYG4u7Kv9XnqFTb0CoXQGwQfCynszyWYxPZpcr+
	okjZ5mlcpyrr+5e3Cl+QpvjOWeJkcS8xNIa+W8o2rkd3sdNzuuEDkjIZhTlbgCut/FB9dGlye3jhb
	/BwViM5bjHrsWGjCwpU7/Fh9xgE+OsO6u4Y//W5fNiTRDy9k1TERRRvDDBMP/vNpDLfdm/kY8vVwJ
	TvuZyN/yw3N2Tn9HCvfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loL7G-002FXQ-86; Wed, 02 Jun 2021 07:16:38 +0000
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKmD-0025eq-Jk; Wed, 02 Jun 2021 06:54:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>,
 Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>,
 Geoff Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Jack Wang <jinpu.wang@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Mike Snitzer <snitzer@redhat.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: [PATCH 13/30] sunvdc: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:28 +0300
Message-Id: <20210602065345.355274-14-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
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

Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/sunvdc.c | 47 ++++++++++++------------------------------
 1 file changed, 13 insertions(+), 34 deletions(-)

diff --git a/drivers/block/sunvdc.c b/drivers/block/sunvdc.c
index 39aeebc6837d..c53b38578bb7 100644
--- a/drivers/block/sunvdc.c
+++ b/drivers/block/sunvdc.c
@@ -780,27 +780,6 @@ static const struct blk_mq_ops vdc_mq_ops = {
 	.queue_rq	= vdc_queue_rq,
 };
 
-static void cleanup_queue(struct request_queue *q)
-{
-	struct vdc_port *port = q->queuedata;
-
-	blk_cleanup_queue(q);
-	blk_mq_free_tag_set(&port->tag_set);
-}
-
-static struct request_queue *init_queue(struct vdc_port *port)
-{
-	struct request_queue *q;
-
-	q = blk_mq_init_sq_queue(&port->tag_set, &vdc_mq_ops, VDC_TX_RING_SIZE,
-					BLK_MQ_F_SHOULD_MERGE);
-	if (IS_ERR(q))
-		return q;
-
-	q->queuedata = port;
-	return q;
-}
-
 static int probe_disk(struct vdc_port *port)
 {
 	struct request_queue *q;
@@ -838,21 +817,21 @@ static int probe_disk(struct vdc_port *port)
 				    (u64)geom.num_sec);
 	}
 
-	q = init_queue(port);
-	if (IS_ERR(q)) {
-		printk(KERN_ERR PFX "%s: Could not allocate queue.\n",
-		       port->vio.name);
-		return PTR_ERR(q);
-	}
-	g = alloc_disk(1 << PARTITION_SHIFT);
-	if (!g) {
+	err = blk_mq_alloc_sq_tag_set(&port->tag_set, &vdc_mq_ops,
+			VDC_TX_RING_SIZE, BLK_MQ_F_SHOULD_MERGE);
+	if (err)
+		return err;
+
+	g = blk_mq_alloc_disk(&port->tag_set, port);
+	if (IS_ERR(g)) {
 		printk(KERN_ERR PFX "%s: Could not allocate gendisk.\n",
 		       port->vio.name);
-		cleanup_queue(q);
-		return -ENOMEM;
+		blk_mq_free_tag_set(&port->tag_set);
+		return PTR_ERR(g);
 	}
 
 	port->disk = g;
+	q = g->queue;
 
 	/* Each segment in a request is up to an aligned page in size. */
 	blk_queue_segment_boundary(q, PAGE_SIZE - 1);
@@ -862,6 +841,7 @@ static int probe_disk(struct vdc_port *port)
 	blk_queue_max_hw_sectors(q, port->max_xfer_size);
 	g->major = vdc_major;
 	g->first_minor = port->vio.vdev->dev_no << PARTITION_SHIFT;
+	g->minors = 1 << PARTITION_SHIFT;
 	strcpy(g->disk_name, port->disk_name);
 
 	g->fops = &vdc_fops;
@@ -1083,9 +1063,8 @@ static int vdc_port_remove(struct vio_dev *vdev)
 		del_timer_sync(&port->vio.timer);
 
 		del_gendisk(port->disk);
-		cleanup_queue(port->disk->queue);
-		put_disk(port->disk);
-		port->disk = NULL;
+		blk_cleanup_disk(port->disk);
+		blk_mq_free_tag_set(&port->tag_set);
 
 		vdc_free_tx_ring(port);
 		vio_ldc_free(&port->vio);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
