Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B60C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 12:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Wrk7cB5mJaOYwO9zgpdz3Gkb0AWcMWRmMt/4uw50xQ=; b=nYxHZbpb2f/QkQ
	VOzzuIwXc4FNamToifHpMNU35qYQpd/pYKiN9xUZXygXz1vVMw0CXp1MkgJUMbwfVVTiyYpTjMHTe
	n1SpjI27m+k7732Pj9SbbFd0epTZQSPJnZy0frU5qqoJUSA+a/TITwz8V3n2fHiWLMwy2pUhiZ9G3
	K18816axVKl3zQ9lsJ7kTUX59tNt/8eyZTEjBx/UlD8A69DGWnrPuTysfKuDk2F9bprK7eCdN1237
	9neT+26R8Z7zHGq/kUyoDUWPzMkz35cXDqhpayf1UCcZv3HQf1db54wwuX4pGzZkNKGnxfNLI2iog
	e483PV3V1vod8BigHKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqaOO-00ANnj-Ve; Fri, 26 Nov 2021 12:31:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqaB6-00AKH8-FN
 for linux-mtd@bombadil.infradead.org; Fri, 26 Nov 2021 12:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=omV7umfU0SfN4gJAlLuf/OnKHKv3dm26gHxXCXe8nS8=; b=Tbz3SoxwzD3bGr3KUBnoUGxCzp
 +rR9KYzCDEgwuD7uEdP85Ga/IuybyPHx91pU0T3SD3/CD9+1x7h3KPrSgvVvMlZMrdApiFYzl7dL+
 8B4dNXFzFd46+oaAjz9+wKaCU9wdy2zrpEfcvrBQaSi3BGMzu0B+mEqg68vYDJYyUvrXtOhmbsrp7
 yOEpYS7ZeutAb1IOJBLqUGCTAUKIdq2jLSp/nJMRr4c+0rXcKqY2k9Vep2yFlAAv8O07QHiMgSQ3K
 /EkpxdnR8WhGne1arU6FftK1JRhRTOokMtyRzynO2GpOghchK24BfuhR76L94ArhtULyA+aUY9uYU
 FbJqqziw==;
Received: from [2001:4bb8:191:f9ce:bae8:5658:102a:5491] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqaB3-00AWGM-Gx; Fri, 26 Nov 2021 12:18:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org
Subject: [PATCH 2/5] block: don't check ->rq_disk in merges
Date: Fri, 26 Nov 2021 13:17:59 +0100
Message-Id: <20211126121802.2090656-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211126121802.2090656-1-hch@lst.de>
References: <20211126121802.2090656-1-hch@lst.de>
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

There is a 1:1 relationship between request_queues and gendisks now, so
no need for these extra checks.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-merge.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/block/blk-merge.c b/block/blk-merge.c
index e07f5a1ae86e2..4de34a332c9fd 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -777,8 +777,7 @@ static struct request *attempt_merge(struct request_queue *q,
 	if (req_op(req) != req_op(next))
 		return NULL;
 
-	if (rq_data_dir(req) != rq_data_dir(next)
-	    || req->rq_disk != next->rq_disk)
+	if (rq_data_dir(req) != rq_data_dir(next))
 		return NULL;
 
 	if (req_op(req) == REQ_OP_WRITE_SAME &&
@@ -905,10 +904,6 @@ bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
 	if (bio_data_dir(bio) != rq_data_dir(rq))
 		return false;
 
-	/* must be same device */
-	if (rq->rq_disk != bio->bi_bdev->bd_disk)
-		return false;
-
 	/* only merge integrity protected bio into ditto rq */
 	if (blk_integrity_merge_bio(rq->q, rq, bio) == false)
 		return false;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
