Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5489C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:07:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3E4860F6F
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3E4860F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JvbuQDO+pNoPOMkmW6mgNCfPzkAeNQmLkE1xs6Gx6o=; b=WsZebX4jwA0XTK
	iS2mrYCjl+XO2HQ5L0hOy6qlqQby85+1sXKB2Vpy1qG9SKaYPf+1xW/4kqgnVKCp+2an6pL4v/GdO
	M1tcgOSFjgBsMIXW//cZXSvfvBfPTiXlgzMTpkCPEgg+4PH1IRjYAM+ae2zgE1mG51N7YhyGwwgmn
	VArQeJ8FF+wROrWPGqex0ShNELtM5wnU1GC5Vi4i++aH7IziQVtil3eMs1V6UYDQV6jSgX2XnbW/A
	xIh7usRXbfRwQuqM46hAyU/lzVRn+XmAml2Jv9vHTsMx8rgHbXTu8GDyeul+3OTrAxLCEznECAl5p
	9rVHGSjIc5gsvZOWRNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meu4m-00FVJG-KD; Mon, 25 Oct 2021 07:07:20 +0000
Received: from [2001:4bb8:184:6dcb:6093:467a:cccc:351c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meu32-00FUSR-6T; Mon, 25 Oct 2021 07:05:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 05/12] blk-mq: move blk_mq_flush_plug_list
Date: Mon, 25 Oct 2021 09:05:10 +0200
Message-Id: <20211025070517.1548584-6-hch@lst.de>
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

Move blk_mq_flush_plug_list and blk_mq_plug_issue_direct down in blk-mq.c
to prepare for marking blk_mq_request_issue_directly static without the
need of a forward declaration.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq.c | 184 ++++++++++++++++++++++++-------------------------
 1 file changed, 92 insertions(+), 92 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index d8f17b54e2c73..f46d41a760106 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2277,98 +2277,6 @@ static void blk_mq_commit_rqs(struct blk_mq_hw_ctx *hctx, int *queued,
 	*queued = 0;
 }
 
-static void blk_mq_plug_issue_direct(struct blk_plug *plug, bool from_schedule)
-{
-	struct blk_mq_hw_ctx *hctx = NULL;
-	struct request *rq;
-	int queued = 0;
-	int errors = 0;
-
-	while ((rq = rq_list_pop(&plug->mq_list))) {
-		bool last = rq_list_empty(plug->mq_list);
-		blk_status_t ret;
-
-		if (hctx != rq->mq_hctx) {
-			if (hctx)
-				blk_mq_commit_rqs(hctx, &queued, from_schedule);
-			hctx = rq->mq_hctx;
-		}
-
-		ret = blk_mq_request_issue_directly(rq, last);
-		switch (ret) {
-		case BLK_STS_OK:
-			queued++;
-			break;
-		case BLK_STS_RESOURCE:
-		case BLK_STS_DEV_RESOURCE:
-			blk_mq_request_bypass_insert(rq, false, last);
-			blk_mq_commit_rqs(hctx, &queued, from_schedule);
-			return;
-		default:
-			blk_mq_end_request(rq, ret);
-			errors++;
-			break;
-		}
-	}
-
-	/*
-	 * If we didn't flush the entire list, we could have told the driver
-	 * there was more coming, but that turned out to be a lie.
-	 */
-	if (errors)
-		blk_mq_commit_rqs(hctx, &queued, from_schedule);
-}
-
-void blk_mq_flush_plug_list(struct blk_plug *plug, bool from_schedule)
-{
-	struct blk_mq_hw_ctx *this_hctx;
-	struct blk_mq_ctx *this_ctx;
-	unsigned int depth;
-	LIST_HEAD(list);
-
-	if (rq_list_empty(plug->mq_list))
-		return;
-	plug->rq_count = 0;
-
-	if (!plug->multiple_queues && !plug->has_elevator) {
-		blk_mq_plug_issue_direct(plug, from_schedule);
-		if (rq_list_empty(plug->mq_list))
-			return;
-	}
-
-	this_hctx = NULL;
-	this_ctx = NULL;
-	depth = 0;
-	do {
-		struct request *rq;
-
-		rq = rq_list_pop(&plug->mq_list);
-
-		if (!this_hctx) {
-			this_hctx = rq->mq_hctx;
-			this_ctx = rq->mq_ctx;
-		} else if (this_hctx != rq->mq_hctx || this_ctx != rq->mq_ctx) {
-			trace_block_unplug(this_hctx->queue, depth,
-						!from_schedule);
-			blk_mq_sched_insert_requests(this_hctx, this_ctx,
-						&list, from_schedule);
-			depth = 0;
-			this_hctx = rq->mq_hctx;
-			this_ctx = rq->mq_ctx;
-
-		}
-
-		list_add(&rq->queuelist, &list);
-		depth++;
-	} while (!rq_list_empty(plug->mq_list));
-
-	if (!list_empty(&list)) {
-		trace_block_unplug(this_hctx->queue, depth, !from_schedule);
-		blk_mq_sched_insert_requests(this_hctx, this_ctx, &list,
-						from_schedule);
-	}
-}
-
 static void blk_mq_bio_to_request(struct request *rq, struct bio *bio,
 		unsigned int nr_segs)
 {
@@ -2508,6 +2416,98 @@ blk_status_t blk_mq_request_issue_directly(struct request *rq, bool last)
 	return ret;
 }
 
+static void blk_mq_plug_issue_direct(struct blk_plug *plug, bool from_schedule)
+{
+	struct blk_mq_hw_ctx *hctx = NULL;
+	struct request *rq;
+	int queued = 0;
+	int errors = 0;
+
+	while ((rq = rq_list_pop(&plug->mq_list))) {
+		bool last = rq_list_empty(plug->mq_list);
+		blk_status_t ret;
+
+		if (hctx != rq->mq_hctx) {
+			if (hctx)
+				blk_mq_commit_rqs(hctx, &queued, from_schedule);
+			hctx = rq->mq_hctx;
+		}
+
+		ret = blk_mq_request_issue_directly(rq, last);
+		switch (ret) {
+		case BLK_STS_OK:
+			queued++;
+			break;
+		case BLK_STS_RESOURCE:
+		case BLK_STS_DEV_RESOURCE:
+			blk_mq_request_bypass_insert(rq, false, last);
+			blk_mq_commit_rqs(hctx, &queued, from_schedule);
+			return;
+		default:
+			blk_mq_end_request(rq, ret);
+			errors++;
+			break;
+		}
+	}
+
+	/*
+	 * If we didn't flush the entire list, we could have told the driver
+	 * there was more coming, but that turned out to be a lie.
+	 */
+	if (errors)
+		blk_mq_commit_rqs(hctx, &queued, from_schedule);
+}
+
+void blk_mq_flush_plug_list(struct blk_plug *plug, bool from_schedule)
+{
+	struct blk_mq_hw_ctx *this_hctx;
+	struct blk_mq_ctx *this_ctx;
+	unsigned int depth;
+	LIST_HEAD(list);
+
+	if (rq_list_empty(plug->mq_list))
+		return;
+	plug->rq_count = 0;
+
+	if (!plug->multiple_queues && !plug->has_elevator) {
+		blk_mq_plug_issue_direct(plug, from_schedule);
+		if (rq_list_empty(plug->mq_list))
+			return;
+	}
+
+	this_hctx = NULL;
+	this_ctx = NULL;
+	depth = 0;
+	do {
+		struct request *rq;
+
+		rq = rq_list_pop(&plug->mq_list);
+
+		if (!this_hctx) {
+			this_hctx = rq->mq_hctx;
+			this_ctx = rq->mq_ctx;
+		} else if (this_hctx != rq->mq_hctx || this_ctx != rq->mq_ctx) {
+			trace_block_unplug(this_hctx->queue, depth,
+						!from_schedule);
+			blk_mq_sched_insert_requests(this_hctx, this_ctx,
+						&list, from_schedule);
+			depth = 0;
+			this_hctx = rq->mq_hctx;
+			this_ctx = rq->mq_ctx;
+
+		}
+
+		list_add(&rq->queuelist, &list);
+		depth++;
+	} while (!rq_list_empty(plug->mq_list));
+
+	if (!list_empty(&list)) {
+		trace_block_unplug(this_hctx->queue, depth, !from_schedule);
+		blk_mq_sched_insert_requests(this_hctx, this_ctx, &list,
+						from_schedule);
+	}
+}
+
 void blk_mq_try_issue_list_directly(struct blk_mq_hw_ctx *hctx,
 		struct list_head *list)
 {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
