Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C29FC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 06:16:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E87461B2B
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 06:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E87461B2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbDlrErSkcUnI9+Twvl+kBFRS+XtufmxUdnm3y6fa5s=; b=sD/R30de28cBrh
	HGfR624KWEEoYi7Mhni/S/P5WEWensz3pDBuZ8uYaC/IOaZdg80yuM7MecU1AwuiYV1EQ4u+PdQED
	0LJ9fn6LgXO84uiQPsyzRTjB+H7Rs9awSkq2YLpPiQxvNxRUsJuXZavUZ1LPU3I6ksuZRLAy8km7d
	uoIl0M2BXmsEj4SbimxMFgoiJGNGMb/nRNjTfGIu25bCf8tcVAHhyP+TSh2O1rcVQzn6Idr0an1Yk
	oUx5nEr3lQxyr5VqiBtglfhcVfgd/VSp3kxcDEfhFl9G+5R26nr7gpqrc1QVhQwRGv9IRP1lQTOHN
	8/XOUA3zBJ4hbBbbtQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnEEY-003QUg-PA; Wed, 17 Nov 2021 06:15:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnED3-003PyX-Ko
 for linux-mtd@bombadil.infradead.org; Wed, 17 Nov 2021 06:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=sj4m7qIW4XnTc8yJ1sHaocTSvUI4MlzH3MUnD0CWBjQ=; b=oAcoHClEmyaFmZ64D1tZFg74Ug
 CGkqUPJk7YrjmFkgBcKkNTWXzuiNAGEIXaf5FQo65kLfXAeDZxVkbI7OQYxvb9fLrcNpfq1lbACOX
 xV/b+QdnQH7Bjyn3bqFD++QoqauB9/tD33xRPD2YlINHtRDnY6IkWE1V0ouA1OkxijsogSZ+a87BA
 s9GQqSW6kvGiH9odK5Bji4wfwB/R2pJqq9NeNUE2qNorMoroXfgjByPLXdh93cwphbF+rH9lAvVs6
 aMIgC9bjYKVW18RefONMvFAK83nbg8Rox4AV+FzUI8JVPSxZml50tJboIGkIUcwR4SkPvMV3rtKHW
 VYmFdqrw==;
Received: from 213-225-5-109.nat.highway.a1.net ([213.225.5.109]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnED1-007MFn-7c; Wed, 17 Nov 2021 06:14:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 06/11] block: move blk_rq_init to blk-mq.c
Date: Wed, 17 Nov 2021 07:13:59 +0100
Message-Id: <20211117061404.331732-7-hch@lst.de>
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

blk_rq_init deals with a request structure, so move it to blk-mq.c

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 17 -----------------
 block/blk-mq.c   | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index e1c928ec92946..a3384c85074e3 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -109,23 +109,6 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q)
 }
 EXPORT_SYMBOL_GPL(blk_queue_flag_test_and_set);
 
-void blk_rq_init(struct request_queue *q, struct request *rq)
-{
-	memset(rq, 0, sizeof(*rq));
-
-	INIT_LIST_HEAD(&rq->queuelist);
-	rq->q = q;
-	rq->__sector = (sector_t) -1;
-	INIT_HLIST_NODE(&rq->hash);
-	RB_CLEAR_NODE(&rq->rb_node);
-	rq->tag = BLK_MQ_NO_TAG;
-	rq->internal_tag = BLK_MQ_NO_TAG;
-	rq->start_time_ns = ktime_get_ns();
-	rq->part = NULL;
-	blk_crypto_rq_set_defaults(rq);
-}
-EXPORT_SYMBOL(blk_rq_init);
-
 #define REQ_OP_NAME(name) [REQ_OP_##name] = #name
 static const char *const blk_op_name[] = {
 	REQ_OP_NAME(READ),
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 0362ec9ad4d14..8d0d18ef07d09 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -328,6 +328,23 @@ void blk_mq_wake_waiters(struct request_queue *q)
 			blk_mq_tag_wakeup_all(hctx->tags, true);
 }
 
+void blk_rq_init(struct request_queue *q, struct request *rq)
+{
+	memset(rq, 0, sizeof(*rq));
+
+	INIT_LIST_HEAD(&rq->queuelist);
+	rq->q = q;
+	rq->__sector = (sector_t) -1;
+	INIT_HLIST_NODE(&rq->hash);
+	RB_CLEAR_NODE(&rq->rb_node);
+	rq->tag = BLK_MQ_NO_TAG;
+	rq->internal_tag = BLK_MQ_NO_TAG;
+	rq->start_time_ns = ktime_get_ns();
+	rq->part = NULL;
+	blk_crypto_rq_set_defaults(rq);
+}
+EXPORT_SYMBOL(blk_rq_init);
+
 static struct request *blk_mq_rq_ctx_init(struct blk_mq_alloc_data *data,
 		struct blk_mq_tags *tags, unsigned int tag, u64 alloc_time_ns)
 {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
