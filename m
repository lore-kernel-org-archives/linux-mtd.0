Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C964C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:12:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 606AB6008E
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 606AB6008E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQ4mYjKmJyVZQyuZrCtHiwt95y+5XlOLQsxhxQUgS+Y=; b=vXjeTnv/0u2UhZ
	5zYeX9Vox+yKzEosniS/n9/4wkT17/Lh4G1T6ZU+ZEZ0ZpJusJ1MMHULOOWZv9IeTGuwVZnbKoodJ
	hGqAm51qbX2TRYS3OZ8DfCzs4O/sfBMyExtlertLkckF/Yg+U/DI7XbxWhrd5Aj8hspOPLDhbrhUt
	QBsQh8yfMbkqLUDZl/WcVd1GG0D3XXTaIXRFUu4dWyBpbWxhxe+xl/nu7cINHpfkNHEm26SbAzi3d
	cEDm7ezKXswPpl32Gi1gXKqHt5bpHhHVsiCZFPNFI1egZD/9cRF/61pgcV4QcrlyPzPETBX69iegZ
	rFYoaR04JAbCMxHpmS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meu9L-00FX4K-Pj; Mon, 25 Oct 2021 07:12:03 +0000
Received: from [2001:4bb8:184:6dcb:6093:467a:cccc:351c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meu3F-00FUYp-6y; Mon, 25 Oct 2021 07:05:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 10/12] block: move blk_dump_rq_flags to blk-mq.c
Date: Mon, 25 Oct 2021 09:05:15 +0200
Message-Id: <20211025070517.1548584-11-hch@lst.de>
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

blk_dump_rq_flags deals with a request, so move it to blk-mq.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 14 --------------
 block/blk-mq.c   | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 5ca47d25a2ef2..9547a75e7a7aa 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -217,20 +217,6 @@ void blk_print_req_error(struct request *req, blk_status_t status)
 		IOPRIO_PRIO_CLASS(req->ioprio));
 }
 
-void blk_dump_rq_flags(struct request *rq, char *msg)
-{
-	printk(KERN_INFO "%s: dev %s: flags=%llx\n", msg,
-		rq->rq_disk ? rq->rq_disk->disk_name : "?",
-		(unsigned long long) rq->cmd_flags);
-
-	printk(KERN_INFO "  sector %llu, nr/cnr %u/%u\n",
-	       (unsigned long long)blk_rq_pos(rq),
-	       blk_rq_sectors(rq), blk_rq_cur_sectors(rq));
-	printk(KERN_INFO "  bio %p, biotail %p, len %u\n",
-	       rq->bio, rq->biotail, blk_rq_bytes(rq));
-}
-EXPORT_SYMBOL(blk_dump_rq_flags);
-
 /**
  * blk_sync_queue - cancel any pending callbacks on a queue
  * @q: the queue
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 7df80c4da3777..425cd134ac358 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -648,6 +648,20 @@ void blk_mq_free_plug_rqs(struct blk_plug *plug)
 	}
 }
 
+void blk_dump_rq_flags(struct request *rq, char *msg)
+{
+	printk(KERN_INFO "%s: dev %s: flags=%llx\n", msg,
+		rq->rq_disk ? rq->rq_disk->disk_name : "?",
+		(unsigned long long) rq->cmd_flags);
+
+	printk(KERN_INFO "  sector %llu, nr/cnr %u/%u\n",
+	       (unsigned long long)blk_rq_pos(rq),
+	       blk_rq_sectors(rq), blk_rq_cur_sectors(rq));
+	printk(KERN_INFO "  bio %p, biotail %p, len %u\n",
+	       rq->bio, rq->biotail, blk_rq_bytes(rq));
+}
+EXPORT_SYMBOL(blk_dump_rq_flags);
+
 static void req_bio_endio(struct request *rq, struct bio *bio,
 			  unsigned int nbytes, blk_status_t error)
 {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
