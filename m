Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14D3C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:06:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2FB660F9C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2FB660F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JqO7a7miGYal5BG0t2Z8wQM42Ej47H9tlUNR6NWZ78=; b=iyx4wTas9b+LSo
	kN26sIm5u/alguhgNk647eh6cjYLhkqAtTWLnOt90TSPGtQh2tMHAwO04286JBKjzAaR2KrW9gt+9
	L1YBVEoIJgXAG69ealmV9W7r9MDiouUVG3YjgnhLd9tqvYPYQPT/bzKAtxfNpCRXnScDOP/haTa3o
	ga0vtqRM1CJIRuxmRCMvTloEM+BQTyelJANd6ApuwjxU71ubIY+IIAPM/eomuQLQjtlFa+AQaXQLV
	nuYxJ8blr+eHPvmxfBBBQlZihBcEhIgxyUmG/tio6JGLWt/HZ9ozyLlRFQh9K+1ocnh3oe8VzgQdW
	iVid9f2l310mq0PgDU2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meu3c-00FUiU-56; Mon, 25 Oct 2021 07:06:08 +0000
Received: from [2001:4bb8:184:6dcb:6093:467a:cccc:351c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meu2w-00FUQE-Vw; Mon, 25 Oct 2021 07:05:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 03/12] block: remove rq_flush_dcache_pages
Date: Mon, 25 Oct 2021 09:05:08 +0200
Message-Id: <20211025070517.1548584-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025070517.1548584-1-hch@lst.de>
References: <20211025070517.1548584-1-hch@lst.de>
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
index 0d267cfb71484..08c6077365ac9 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1324,25 +1324,6 @@ void blk_steal_bios(struct bio_list *list, struct request *rq)
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
index b8ae1ec14e178..356b5bb4db51a 100644
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
index e003b4b44ffa2..99e17ee13feb7 100644
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
index 850ecfdebe595..047ce54fca96c 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -1131,14 +1131,4 @@ static inline bool blk_req_can_dispatch_to_zone(struct request *rq)
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
