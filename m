Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC78C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 06:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23FCF61B2B
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 06:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23FCF61B2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsCBag2MXobnVf4+jtc9291JkS2UTyzhNjU4GVLFJgk=; b=kLF6WNQf/CbZUK
	9f1zjdcOH14IGLmvri23xZaRPa40lJgXXONjJ1457DTaf1cUiXoyRrI2FmMYGmSgm/MzJBAGJLYXl
	QBUZtdPUbkCLHg206g9+1vqN/V17Ont+PrSAclSdoHgYwq/7DvawadPRNh+/S3Ng4Rh91GpRfV+0u
	054QKL+CTPVRkhrW1wqtFk2FDTlkwP8yw9TqIosH0VBTqkb3pX2T1XhOHJhaBzIzne9Zw4okr9Q9q
	Di1qZPognVpFHpHOnjKE0dx0Ckv/AZUSqHkV0F4aAW8wUQb0wPSsaCYWxPvY7Gzw0CgfTDEh9v6G6
	moLjNM2DIjd6oC5m6cnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnEDN-003Q4I-9V; Wed, 17 Nov 2021 06:14:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnECx-003Pxp-EI
 for linux-mtd@bombadil.infradead.org; Wed, 17 Nov 2021 06:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=LjB+PW6droKOhO2mj2A/+eYS7xjIK3FEJ790igEy5r8=; b=AlqY5MsRheu/bSJmGs+30xVC25
 rAvzNtaIjwPTM0j5hsCxtXTsvzL7kjEIhKYivvjaMQp9uoaIrnnIrHMQDexNSkT0dSCIDpBd4Hr9M
 QoCvg8p6I7DuCpMq1rSiORlguB+rzdeS6OMMctRCr0TnOgNldxStgv/tRyJzeMLTcJDusBV7/sslb
 5c7/N2I/3d3Bh6kP3fpsWRa4AqtGIAwSIigY0qY9IXVO/BvBK3keqUhkCW2eIX9X4m60pvNVlwI9O
 3J1SHAdmh8xaF7LWVLe3cYMsLXMCD13WLSEANEb2tTqk9iry7rUQPTHhWFBpzU8qJkN00kKAq1A9X
 xzlgs5Gg==;
Received: from 213-225-5-109.nat.highway.a1.net ([213.225.5.109]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnECu-007MER-Q0; Wed, 17 Nov 2021 06:14:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 02/11] block: remove rq_flush_dcache_pages
Date: Wed, 17 Nov 2021 07:13:55 +0100
Message-Id: <20211117061404.331732-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117061404.331732-1-hch@lst.de>
References: <20211117061404.331732-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

This function is trivial, and flush_dcache_page is always defined, so
just open code it in the 2.5 callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c          | 19 -------------------
 drivers/mtd/mtd_blkdevs.c | 10 ++++++++--
 drivers/mtd/ubi/block.c   |  6 +++++-
 include/linux/blk-mq.h    | 10 ----------
 4 files changed, 13 insertions(+), 32 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index e27a659973965..f1ca31a89493a 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1297,25 +1297,6 @@ void blk_steal_bios(struct bio_list *list, struct request *rq)
 }
 EXPORT_SYMBOL_GPL(blk_steal_bios);
 
-#if ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE
-/**
- * rq_flush_dcache_pages - Helper function to flush all pages in a request
- * @rq: the request to be flushed
- *
- * Description:
- *     Flush all pages in @rq.
- */
-void rq_flush_dcache_pages(struct request *rq)
-{
-	struct req_iterator iter;
-	struct bio_vec bvec;
-
-	rq_for_each_segment(bvec, rq, iter)
-		flush_dcache_page(bvec.bv_page);
-}
-EXPORT_SYMBOL_GPL(rq_flush_dcache_pages);
-#endif
-
 /**
  * blk_lld_busy - Check if underlying low-level drivers of a device are busy
  * @q : the queue of the device being checked
diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 4eaba6f4ec680..66f81d42fe778 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -46,6 +46,8 @@ static blk_status_t do_blktrans_request(struct mtd_blktrans_ops *tr,
 			       struct mtd_blktrans_dev *dev,
 			       struct request *req)
 {
+	struct req_iterator iter;
+	struct bio_vec bvec;
 	unsigned long block, nsect;
 	char *buf;
 
@@ -76,13 +78,17 @@ static blk_status_t do_blktrans_request(struct mtd_blktrans_ops *tr,
 			}
 		}
 		kunmap(bio_page(req->bio));
-		rq_flush_dcache_pages(req);
+
+		rq_for_each_segment(bvec, req, iter)
+			flush_dcache_page(bvec.bv_page);
 		return BLK_STS_OK;
 	case REQ_OP_WRITE:
 		if (!tr->writesect)
 			return BLK_STS_IOERR;
 
-		rq_flush_dcache_pages(req);
+		rq_for_each_segment(bvec, req, iter)
+			flush_dcache_page(bvec.bv_page);
+
 		buf = kmap(bio_page(req->bio)) + bio_offset(req->bio);
 		for (; nsect > 0; nsect--, block++, buf += tr->blksize) {
 			if (tr->writesect(dev, block, buf)) {
diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 062e6c2c45f5f..302426ab30f8d 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -294,6 +294,8 @@ static void ubiblock_do_work(struct work_struct *work)
 	int ret;
 	struct ubiblock_pdu *pdu = container_of(work, struct ubiblock_pdu, work);
 	struct request *req = blk_mq_rq_from_pdu(pdu);
+	struct req_iterator iter;
+	struct bio_vec bvec;
 
 	blk_mq_start_request(req);
 
@@ -305,7 +307,9 @@ static void ubiblock_do_work(struct work_struct *work)
 	blk_rq_map_sg(req->q, req, pdu->usgl.sg);
 
 	ret = ubiblock_read(pdu);
-	rq_flush_dcache_pages(req);
+
+	rq_for_each_segment(bvec, req, iter)
+		flush_dcache_page(bvec.bv_page);
 
 	blk_mq_end_request(req, errno_to_blk_status(ret));
 }
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index a78d9a0f2a1be..308edc2a4925b 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -1132,14 +1132,4 @@ static inline bool blk_req_can_dispatch_to_zone(struct request *rq)
 }
 #endif /* CONFIG_BLK_DEV_ZONED */
 
-#ifndef ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE
-# error	"You should define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE for your platform"
-#endif
-#if ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE
-void rq_flush_dcache_pages(struct request *rq);
-#else
-static inline void rq_flush_dcache_pages(struct request *rq)
-{
-}
-#endif /* ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE */
 #endif /* BLK_MQ_H */
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
