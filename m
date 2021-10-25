Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558C9C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FF6260F9C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FF6260F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHu469OROWoCru7Q3fLcwDhmW5yyuqsuAdAr1XRKLdk=; b=JlJCmXc0vdZPAD
	2Cl8nI5EizSOySrNR7/m19vE3n4UfAaK+aFcnstFkqMJt5N5zR8XP5ww4z74D7RafXkXuda66YU+S
	LEIPFYcZm7qOyh7zEgtPhVUnp8nyFePWYpdBDAzGXQiCisHQxR/o9dht+HlwSZPYP548E6MT5pufI
	2Bwo3ca4gnnVP8Ml2blJfrL6mrYyGAshSwz9L0NKC5Gc2DDIFe9vMq1+ycfgcxV0hudK+zuN8bOj2
	HL2e2RfkmltcEqr4h8u9Tw96PHRjsfBxY3XckpO+h94Qb2Pzv1Z+T3Ih6ywNNJwzUX+jw5EAc3yF9
	oK61rYxRtMjyT9nhLFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meu7K-00FWKb-OL; Mon, 25 Oct 2021 07:09:58 +0000
Received: from [2001:4bb8:184:6dcb:6093:467a:cccc:351c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meu3A-00FUVj-2G; Mon, 25 Oct 2021 07:05:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 08/12] block: move blk_steal_bios to blk-mq.c
Date: Mon, 25 Oct 2021 09:05:13 +0200
Message-Id: <20211025070517.1548584-9-hch@lst.de>
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

Keep all the request based code together.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 21 ---------------------
 block/blk-mq.c   | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 1ee942266df8d..98cb9d69a4068 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1191,27 +1191,6 @@ void disk_end_io_acct(struct gendisk *disk, unsigned int op,
 }
 EXPORT_SYMBOL(disk_end_io_acct);
 
-/*
- * Steal bios from a request and add them to a bio list.
- * The request must not have been partially completed before.
- */
-void blk_steal_bios(struct bio_list *list, struct request *rq)
-{
-	if (rq->bio) {
-		if (list->tail)
-			list->tail->bi_next = rq->bio;
-		else
-			list->head = rq->bio;
-		list->tail = rq->biotail;
-
-		rq->bio = NULL;
-		rq->biotail = NULL;
-	}
-
-	rq->__data_len = 0;
-}
-EXPORT_SYMBOL_GPL(blk_steal_bios);
-
 /**
  * blk_lld_busy - Check if underlying low-level drivers of a device are busy
  * @q : the queue of the device being checked
diff --git a/block/blk-mq.c b/block/blk-mq.c
index a0505099b2ce2..06fb74166aded 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2910,6 +2910,27 @@ int blk_rq_prep_clone(struct request *rq, struct request *rq_src,
 }
 EXPORT_SYMBOL_GPL(blk_rq_prep_clone);
 
+/*
+ * Steal bios from a request and add them to a bio list.
+ * The request must not have been partially completed before.
+ */
+void blk_steal_bios(struct bio_list *list, struct request *rq)
+{
+	if (rq->bio) {
+		if (list->tail)
+			list->tail->bi_next = rq->bio;
+		else
+			list->head = rq->bio;
+		list->tail = rq->biotail;
+
+		rq->bio = NULL;
+		rq->biotail = NULL;
+	}
+
+	rq->__data_len = 0;
+}
+EXPORT_SYMBOL_GPL(blk_steal_bios);
+
 static size_t order_to_size(unsigned int order)
 {
 	return (size_t)PAGE_SIZE << order;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
