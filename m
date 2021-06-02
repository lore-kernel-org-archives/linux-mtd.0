Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E051DC4708F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:25:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A52BD61396
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A52BD61396
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lptuqnUK9/zLBBDVSTc9YaAmTz6/Nmz2e7XciAwlPtc=; b=ucfAuRmDXgmt0P
	8YlEz9oOV+tnYVOVy3KdO4tPdITXn0aPNCftlHfHFD6fkGJZdgN6e2AzZXXSFXZ32KzOVy1Pwew3M
	tWXFIWb3F0Wignsl9Yhaw8kCelTaZxjDI/UZk3V4nJrbVbIwZriAARPoeHjBY9DaJOZXqaww+NorM
	mJ5ISQgfGCcsuHlOVK20VbYiP1G0+tZLJF7pSdfM8RXpjkGunbVT/7cXOfX1egELdOAOEnot/3Rdq
	bLXU84+8X75fox5xu2x0dhxLm0VfGl6G/sCbNET3bA9xZXQHL264yy7Dwvr1H6KPGyCJzMGsXLaEn
	Jl+33wbCtSjDHZfXHeDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loLEz-002HYs-CA; Wed, 02 Jun 2021 07:24:37 +0000
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKmW-0025pH-8N; Wed, 02 Jun 2021 06:55:12 +0000
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
Subject: [PATCH 17/30] floppy: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:32 +0300
Message-Id: <20210602065345.355274-18-hch@lst.de>
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
 drivers/block/floppy.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 8a9d22207c59..cbed9776f285 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4491,23 +4491,15 @@ static bool floppy_available(int drive)
 static int floppy_alloc_disk(unsigned int drive, unsigned int type)
 {
 	struct gendisk *disk;
-	int err;
-
-	disk = alloc_disk(1);
-	if (!disk)
-		return -ENOMEM;
 
-	disk->queue = blk_mq_init_queue(&tag_sets[drive]);
-	if (IS_ERR(disk->queue)) {
-		err = PTR_ERR(disk->queue);
-		disk->queue = NULL;
-		put_disk(disk);
-		return err;
-	}
+	disk = blk_mq_alloc_disk(&tag_sets[drive], NULL);
+	if (IS_ERR(disk))
+		return PTR_ERR(disk);
 
 	blk_queue_max_hw_sectors(disk->queue, 64);
 	disk->major = FLOPPY_MAJOR;
 	disk->first_minor = TOMINOR(drive) | (type << 2);
+	disk->minors = 1;
 	disk->fops = &floppy_fops;
 	disk->events = DISK_EVENT_MEDIA_CHANGE;
 	if (type)
@@ -4727,10 +4719,8 @@ static int __init do_floppy_init(void)
 		if (!disks[drive][0])
 			break;
 		del_timer_sync(&motor_off_timer[drive]);
-		blk_cleanup_queue(disks[drive][0]->queue);
-		disks[drive][0]->queue = NULL;
+		blk_cleanup_disk(disks[drive][0]);
 		blk_mq_free_tag_set(&tag_sets[drive]);
-		put_disk(disks[drive][0]);
 	}
 	return err;
 }
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
