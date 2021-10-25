Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F4CC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4C9C60FD7
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4C9C60FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKnFrVrK/hgYsZSxo9rxPY7ZeGHiq4AxHxy8+Jh2UwE=; b=Kb9BVYiBrZlR3J
	ImEKa3nF4yigxrCTuEKtWPyvx3Cpj9diBNj+XS+7ryHEm1kLGQ1GEwmgSi/pZDwiSx1OZRwm9JTzv
	wn9ClPOE9YRXQipkUMN94JDqioYGRJ5TIvWxNPodNMfmqjDWMBHDGXApP+3nNYtT2UVIpzNJY8m9u
	jh5zWczgERyivQ4v+rRFzJ+hy4TfDw5/6SwbqVYcHD8OzGJ1OVFhS4yc9ow4IrGBqFAplOI3YwLCF
	xZJzzNc7fawCX4NRMgVlbiU6yzNjke3j8aB9ofovGVGiXY0730clJ8g91I/wRn1sk0DkUzGwckuKR
	9y3MPyi6Fm6RS2Lq6JLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meu8H-00FWgi-Cm; Mon, 25 Oct 2021 07:10:57 +0000
Received: from [2001:4bb8:184:6dcb:6093:467a:cccc:351c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meu3C-00FUWo-KO; Mon, 25 Oct 2021 07:05:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 09/12] block: move blk_account_io_{start,done} to blk-mq.c
Date: Mon, 25 Oct 2021 09:05:14 +0200
Message-Id: <20211025070517.1548584-10-hch@lst.de>
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

These are only used for request based I/O, so move them where they are
used.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 27 +--------------------------
 block/blk-mq.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
 block/blk.h      | 21 +--------------------
 3 files changed, 44 insertions(+), 46 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 98cb9d69a4068..5ca47d25a2ef2 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1088,8 +1088,7 @@ int iocb_bio_iopoll(struct kiocb *kiocb, struct io_comp_batch *iob,
 }
 EXPORT_SYMBOL_GPL(iocb_bio_iopoll);
 
-static void update_io_ticks(struct block_device *part, unsigned long now,
-		bool end)
+void update_io_ticks(struct block_device *part, unsigned long now, bool end)
 {
 	unsigned long stamp;
 again:
@@ -1104,30 +1103,6 @@ static void update_io_ticks(struct block_device *part, unsigned long now,
 	}
 }
 
-void __blk_account_io_done(struct request *req, u64 now)
-{
-	const int sgrp = op_stat_group(req_op(req));
-
-	part_stat_lock();
-	update_io_ticks(req->part, jiffies, true);
-	part_stat_inc(req->part, ios[sgrp]);
-	part_stat_add(req->part, nsecs[sgrp], now - req->start_time_ns);
-	part_stat_unlock();
-}
-
-void __blk_account_io_start(struct request *rq)
-{
-	/* passthrough requests can hold bios that do not have ->bi_bdev set */
-	if (rq->bio && rq->bio->bi_bdev)
-		rq->part = rq->bio->bi_bdev;
-	else
-		rq->part = rq->rq_disk->part0;
-
-	part_stat_lock();
-	update_io_ticks(rq->part, jiffies, false);
-	part_stat_unlock();
-}
-
 static unsigned long __part_start_io_acct(struct block_device *part,
 					  unsigned int sectors, unsigned int op)
 {
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 06fb74166aded..7df80c4da3777 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -790,6 +790,48 @@ bool blk_update_request(struct request *req, blk_status_t error,
 }
 EXPORT_SYMBOL_GPL(blk_update_request);
 
+static void __blk_account_io_done(struct request *req, u64 now)
+{
+	const int sgrp = op_stat_group(req_op(req));
+
+	part_stat_lock();
+	update_io_ticks(req->part, jiffies, true);
+	part_stat_inc(req->part, ios[sgrp]);
+	part_stat_add(req->part, nsecs[sgrp], now - req->start_time_ns);
+	part_stat_unlock();
+}
+
+static inline void blk_account_io_done(struct request *req, u64 now)
+{
+	/*
+	 * Account IO completion.  flush_rq isn't accounted as a
+	 * normal IO on queueing nor completion.  Accounting the
+	 * containing request is enough.
+	 */
+	if (blk_do_io_stat(req) && req->part &&
+	    !(req->rq_flags & RQF_FLUSH_SEQ))
+		__blk_account_io_done(req, now);
+}
+
+static void __blk_account_io_start(struct request *rq)
+{
+	/* passthrough requests can hold bios that do not have ->bi_bdev set */
+	if (rq->bio && rq->bio->bi_bdev)
+		rq->part = rq->bio->bi_bdev;
+	else
+		rq->part = rq->rq_disk->part0;
+
+	part_stat_lock();
+	update_io_ticks(rq->part, jiffies, false);
+	part_stat_unlock();
+}
+
+static inline void blk_account_io_start(struct request *req)
+{
+	if (blk_do_io_stat(req))
+		__blk_account_io_start(req);
+}
+
 static inline void __blk_mq_end_request_acct(struct request *rq, u64 now)
 {
 	if (rq->rq_flags & RQF_STATS) {
diff --git a/block/blk.h b/block/blk.h
index c5fc3f97d1e5a..8bcca0538faac 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -222,9 +222,6 @@ bool blk_attempt_plug_merge(struct request_queue *q, struct bio *bio,
 bool blk_bio_list_merge(struct request_queue *q, struct list_head *list,
 			struct bio *bio, unsigned int nr_segs);
 
-void __blk_account_io_start(struct request *req);
-void __blk_account_io_done(struct request *req, u64 now);
-
 /*
  * Plug flush limits
  */
@@ -315,23 +312,7 @@ static inline bool blk_do_io_stat(struct request *rq)
 	return (rq->rq_flags & RQF_IO_STAT) && rq->rq_disk;
 }
 
-static inline void blk_account_io_done(struct request *req, u64 now)
-{
-	/*
-	 * Account IO completion.  flush_rq isn't accounted as a
-	 * normal IO on queueing nor completion.  Accounting the
-	 * containing request is enough.
-	 */
-	if (blk_do_io_stat(req) && req->part &&
-	    !(req->rq_flags & RQF_FLUSH_SEQ))
-		__blk_account_io_done(req, now);
-}
-
-static inline void blk_account_io_start(struct request *req)
-{
-	if (blk_do_io_stat(req))
-		__blk_account_io_start(req);
-}
+void update_io_ticks(struct block_device *part, unsigned long now, bool end);
 
 static inline void req_set_nomerge(struct request_queue *q, struct request *req)
 {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
