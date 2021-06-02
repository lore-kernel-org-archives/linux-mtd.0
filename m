Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5938C47093
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:19:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78F99613AD
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78F99613AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyvkZV5fNt4D+Y9axnI0zelJ2J3Xkl9bY4CFfFJcsZQ=; b=HIyI/UwUA7FDFF
	f8WXTrRm/yFr1E1yPg8mNTTkeclEUQkfTOAVvHK9iPl3rNfIJlUQPCDGbEynN+zEpg6N7PaA37ITD
	kAZTN1ueYHqIl4+nVCbooa5hLwR5ByJoNhcgVy4hSElrhaGzm8i8WtKtYKzf+rGFOP1xYi0cdsKFk
	1vvhN1t6N43GHov1Tfes2Tybm5ExU2f1yrFwcM27yp65SIBphfRfIC7Fu7rGUqn0SoCV80dAufL1o
	K2XZEYn3mbrI5bCXyh3+UxiNbmpR8dcO9vm4Yq3Pp/2cQMRtHJpUFkfallGcm9oJjJH14teJRORsX
	zI3Ug5uAkWrDgrIq1dSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loL9F-002G66-Tw; Wed, 02 Jun 2021 07:18:42 +0000
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKmI-0025hI-AR; Wed, 02 Jun 2021 06:54:58 +0000
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
Subject: [PATCH 14/30] gdrom: use blk_mq_alloc_disk
Date: Wed,  2 Jun 2021 09:53:29 +0300
Message-Id: <20210602065345.355274-15-hch@lst.de>
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
 drivers/cdrom/gdrom.c | 45 ++++++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index c6d8c0f59722..8e1fe75af93f 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -772,53 +772,50 @@ static int probe_gdrom(struct platform_device *devptr)
 		goto probe_fail_no_mem;
 	}
 	probe_gdrom_setupcd();
-	gd.disk = alloc_disk(1);
-	if (!gd.disk) {
-		err = -ENODEV;
-		goto probe_fail_no_disk;
+
+	err = blk_mq_alloc_sq_tag_set(&gd.tag_set, &gdrom_mq_ops, 1,
+				BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
+	if (err)
+		goto probe_fail_free_cd_info;
+
+	gd.disk = blk_mq_alloc_disk(&gd.tag_set, NULL);
+	if (IS_ERR(gd.disk)) {
+		err = PTR_ERR(gd.disk);
+		goto probe_fail_free_tag_set;
 	}
+	gd.gdrom_rq = gd.disk->queue;
 	probe_gdrom_setupdisk();
 	if (register_cdrom(gd.disk, gd.cd_info)) {
 		err = -ENODEV;
-		goto probe_fail_cdrom_register;
+		goto probe_fail_cleanup_disk;
 	}
 	gd.disk->fops = &gdrom_bdops;
 	gd.disk->events = DISK_EVENT_MEDIA_CHANGE;
 	/* latch on to the interrupt */
 	err = gdrom_set_interrupt_handlers();
 	if (err)
-		goto probe_fail_cmdirq_register;
-
-	gd.gdrom_rq = blk_mq_init_sq_queue(&gd.tag_set, &gdrom_mq_ops, 1,
-				BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
-	if (IS_ERR(gd.gdrom_rq)) {
-		err = PTR_ERR(gd.gdrom_rq);
-		gd.gdrom_rq = NULL;
-		goto probe_fail_requestq;
-	}
+		goto probe_fail_cleanup_disk;
 
 	err = probe_gdrom_setupqueue();
 	if (err)
-		goto probe_fail_toc;
+		goto probe_fail_free_irqs;
 
 	gd.toc = kzalloc(sizeof(struct gdromtoc), GFP_KERNEL);
 	if (!gd.toc) {
 		err = -ENOMEM;
-		goto probe_fail_toc;
+		goto probe_fail_free_irqs;
 	}
 	add_disk(gd.disk);
 	return 0;
 
-probe_fail_toc:
-	blk_cleanup_queue(gd.gdrom_rq);
-	blk_mq_free_tag_set(&gd.tag_set);
-probe_fail_requestq:
+probe_fail_free_irqs:
 	free_irq(HW_EVENT_GDROM_DMA, &gd);
 	free_irq(HW_EVENT_GDROM_CMD, &gd);
-probe_fail_cmdirq_register:
-probe_fail_cdrom_register:
-	del_gendisk(gd.disk);
-probe_fail_no_disk:
+probe_fail_cleanup_disk:
+	blk_cleanup_disk(gd.disk);
+probe_fail_free_tag_set:
+	blk_mq_free_tag_set(&gd.tag_set);
+probe_fail_free_cd_info:
 	kfree(gd.cd_info);
 probe_fail_no_mem:
 	unregister_blkdev(gdrom_major, GDROM_DEV_NAME);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
