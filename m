Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349D7C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:09:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F353460F9C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F353460F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQt1/pxIMplTUWIl+ZAoTexZB4cN107zseEWb1N0ga4=; b=vA+2m5/DqXcfEG
	qPjmgBV+XRcGHBPYneR0QVsZVSEy/hRf3sw5+szuUPSZikkoNuR0imucUrMlgaoo3rS4v7AXm3P6C
	zypnvsyi5Tgm409s3ARAQcRryJSu/Px684S9Ivw9OJdDHEFYtinKgD2A6EUXpoRvQ61gXioCHSMIe
	wBpTjGnWMF/faPH4Ix8MLzFbN8l2rUMv2FxnYiq2+rr36ZaGknScrxI/C+8MoWgSmDOcjmndjN9z3
	esnMrfn1LFZTFpZ6b/bp8vcpnjoSeyFfpF75FrDWLwAfXrf/YmyEwsN7UWY7PgEx+bPZto8vVchCh
	d7s28GYzPotnmyRgL47w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meu6G-00FVvx-Ud; Mon, 25 Oct 2021 07:08:53 +0000
Received: from [2001:4bb8:184:6dcb:6093:467a:cccc:351c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meu37-00FUUT-EG; Mon, 25 Oct 2021 07:05:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 07/12] block: move blk_rq_init to blk-mq.c
Date: Mon, 25 Oct 2021 09:05:12 +0200
Message-Id: <20211025070517.1548584-8-hch@lst.de>
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

blk_rq_init deals with a request structure, so move it to blk-mq.c

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 17 -----------------
 block/blk-mq.c   | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 8ae6ba9ec1050..1ee942266df8d 100644
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
index 923231023fe84..a0505099b2ce2 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -316,6 +316,23 @@ void blk_mq_wake_waiters(struct request_queue *q)
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
 		unsigned int tag, u64 alloc_time_ns)
 {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
