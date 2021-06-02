Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98160C47096
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:39:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CEB26138C
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CEB26138C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CSRFMvEIu4/wScjZYCpl/d//laDMDmAKlNzxyVFboE=; b=CcH6TJ2b+6gb8r
	pPYvKQPLxRcGy5XmpxMe9ji3t9NvlyfhcaIv8cadKnkjrnvH2ayIGULeLBCf9096JKhMr3NGRXRHV
	5Bnr+Q30aQ6+f+DU0BP+hmN/jftq3Cw8pZpU4oDOj4PuVkSh1NW+KNUKNHK/0jZXoljDSKckJ6dZW
	q7Gh1xEz1Eel+oxqfnpkCJDQ5g2YSyaUCWR1aHPARKcN+g4Cm2/usiiZJOdgeiu5OZAIlWXKPWtqp
	YDF6wnase8UJ+IqVcBCPghlxqfyUKJhwnSTb4RydsrlYmiPU2eftnwoXWZiu+Wwrz+ETyMIH34DXO
	2msbsl2OqJAlY6sn0GmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loLSQ-002MiU-A8; Wed, 02 Jun 2021 07:38:30 +0000
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKn1-0026HM-J4; Wed, 02 Jun 2021 06:55:44 +0000
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
Subject: [PATCH 24/30] sx8: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:39 +0300
Message-Id: <20210602065345.355274-25-hch@lst.de>
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

Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
request_queue allocation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/sx8.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/block/sx8.c b/drivers/block/sx8.c
index 2cdf2771f8e8..f01f860b0e62 100644
--- a/drivers/block/sx8.c
+++ b/drivers/block/sx8.c
@@ -1343,32 +1343,25 @@ static int carm_init_disk(struct carm_host *host, unsigned int port_no)
 {
 	struct carm_port *port = &host->port[port_no];
 	struct gendisk *disk;
-	struct request_queue *q;
 
 	port->host = host;
 	port->port_no = port_no;
 
-	disk = alloc_disk(CARM_MINORS_PER_MAJOR);
-	if (!disk)
-		return -ENOMEM;
+	disk = blk_mq_alloc_disk(&host->tag_set, port);
+	if (IS_ERR(disk))
+		return PTR_ERR(disk);
 
 	port->disk = disk;
 	sprintf(disk->disk_name, DRV_NAME "/%u",
 		(unsigned int)host->id * CARM_MAX_PORTS + port_no);
 	disk->major = host->major;
 	disk->first_minor = port_no * CARM_MINORS_PER_MAJOR;
+	disk->minors = CARM_MINORS_PER_MAJOR;
 	disk->fops = &carm_bd_ops;
 	disk->private_data = port;
 
-	q = blk_mq_init_queue(&host->tag_set);
-	if (IS_ERR(q))
-		return PTR_ERR(q);
-
-	blk_queue_max_segments(q, CARM_MAX_REQ_SG);
-	blk_queue_segment_boundary(q, CARM_SG_BOUNDARY);
-
-	q->queuedata = port;
-	disk->queue = q;
+	blk_queue_max_segments(disk->queue, CARM_MAX_REQ_SG);
+	blk_queue_segment_boundary(disk->queue, CARM_SG_BOUNDARY);
 	return 0;
 }
 
@@ -1382,9 +1375,7 @@ static void carm_free_disk(struct carm_host *host, unsigned int port_no)
 
 	if (disk->flags & GENHD_FL_UP)
 		del_gendisk(disk);
-	if (disk->queue)
-		blk_cleanup_queue(disk->queue);
-	put_disk(disk);
+	blk_cleanup_disk(disk);
 }
 
 static int carm_init_shm(struct carm_host *host)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
