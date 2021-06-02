Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A985C47083
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:44:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE8C661207
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 07:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE8C661207
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VovpcQqkAg2p6HVEb+Vrie8gqFrijY5XSLaZ58rk+w4=; b=TKlkZxgDo0QGDZ
	yBZ0guTADTCWjBRjyiAb1tO8zvgHermq2ULyFgSKgJ7vK61HzFPiCkuHGEe7jESj06H4WAgn/ZiSL
	G75u5yab4HGnqCiUKISon6ASzeh24apTQoekN4Kqvx4hO/zX2CFPseaOme9uXRoIqPcrUvREnVn7V
	IVtVI+hTZnv8+aBVZBBD9C1LhEcb1YV6fL6gcRHDH69/1by5cvoInKOVtDmpcOLCe4LS25Y8SPjhN
	6QmwqegHi3sZBgwNjaM70QkebGuDn9RkP0nuDCvwOYjqPTFcs18jzQPbfFxWMH5k/snoilEqVqmIl
	B9hvhh3DYxuhIrAa/hPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loLXj-002OBL-Ie; Wed, 02 Jun 2021 07:43:59 +0000
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKnE-0026TF-Pp; Wed, 02 Jun 2021 06:55:57 +0000
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
Subject: [PATCH 27/30] scm_blk: use blk_mq_alloc_disk and blk_cleanup_disk
Date: Wed,  2 Jun 2021 09:53:42 +0300
Message-Id: <20210602065345.355274-28-hch@lst.de>
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
 drivers/s390/block/scm_blk.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/s390/block/scm_blk.c b/drivers/s390/block/scm_blk.c
index a4f6f2e62b1d..88cba6212ee2 100644
--- a/drivers/s390/block/scm_blk.c
+++ b/drivers/s390/block/scm_blk.c
@@ -462,12 +462,12 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 	if (ret)
 		goto out;
 
-	rq = blk_mq_init_queue(&bdev->tag_set);
-	if (IS_ERR(rq)) {
-		ret = PTR_ERR(rq);
+	bdev->gendisk = blk_mq_alloc_disk(&bdev->tag_set, scmdev);
+	if (IS_ERR(bdev->gendisk)) {
+		ret = PTR_ERR(bdev->gendisk);
 		goto out_tag;
 	}
-	bdev->rq = rq;
+	rq = bdev->rq = bdev->gendisk->queue;
 	nr_max_blk = min(scmdev->nr_max_block,
 			 (unsigned int) (PAGE_SIZE / sizeof(struct aidaw)));
 
@@ -477,17 +477,11 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, rq);
 	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, rq);
 
-	bdev->gendisk = alloc_disk(SCM_NR_PARTS);
-	if (!bdev->gendisk) {
-		ret = -ENOMEM;
-		goto out_queue;
-	}
-	rq->queuedata = scmdev;
 	bdev->gendisk->private_data = scmdev;
 	bdev->gendisk->fops = &scm_blk_devops;
-	bdev->gendisk->queue = rq;
 	bdev->gendisk->major = scm_major;
 	bdev->gendisk->first_minor = devindex * SCM_NR_PARTS;
+	bdev->gendisk->minors = SCM_NR_PARTS;
 
 	len = snprintf(bdev->gendisk->disk_name, DISK_NAME_LEN, "scm");
 	if (devindex > 25) {
@@ -504,8 +498,6 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 	device_add_disk(&scmdev->dev, bdev->gendisk, NULL);
 	return 0;
 
-out_queue:
-	blk_cleanup_queue(rq);
 out_tag:
 	blk_mq_free_tag_set(&bdev->tag_set);
 out:
@@ -516,9 +508,8 @@ int scm_blk_dev_setup(struct scm_blk_dev *bdev, struct scm_device *scmdev)
 void scm_blk_dev_cleanup(struct scm_blk_dev *bdev)
 {
 	del_gendisk(bdev->gendisk);
-	blk_cleanup_queue(bdev->gendisk->queue);
+	blk_cleanup_disk(bdev->gendisk);
 	blk_mq_free_tag_set(&bdev->tag_set);
-	put_disk(bdev->gendisk);
 }
 
 void scm_blk_set_available(struct scm_blk_dev *bdev)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
