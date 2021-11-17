Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E56C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 06:18:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 909CC61B66
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 06:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 909CC61B66
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEQp0Jm5a1Xi7ZlhEq/ML0S7H85Czo8IluJhdXTMsJ8=; b=4SFK07/VNgNnUr
	nj53CFqj1AWkc4kbyAYkWFQw9WyfB4Nt4bdo7Hi/QfSxFvPXT3xVsrfYnWirDilCD0ARQVVI7UrVt
	wtZCJLO6F7mcbit2JXF5KyJImSkpbI9mzT8xKDg8JUVmQaAT4x5MPc6S5HbBLp1xwLv7NvSPf81up
	fcKUVsXk/FDHfCN1ungZ3+RP6wkI02gM+23QS52G6Rzbdw100cN6McmD9Qq7PY2STDPnPoPusfRGU
	O0qC2ryB+bYuqGhG8EO46Gb6I7IJ+MZNrjk4OZLfIthoysHdJBGFYqzPebc22Yb3G2lwZorPfSWFt
	iRkFuHUzdHFZgHZDrlKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnEGk-003RJs-9u; Wed, 17 Nov 2021 06:18:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnED8-003Pyt-FE
 for linux-mtd@bombadil.infradead.org; Wed, 17 Nov 2021 06:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5Y57JG7VXaoFWW1akQPI6hTMWlsbyIej2L4X3VlG1LE=; b=EWByrGMG+/If75tDNJKhTRfVCs
 8wmJEu33W62TXmRsyr2sJE7UB0/H6rgMJq6/naMYCMVc0hGTlAAJURaRmiSnC/bnOYrp79rbGutil
 nleJTeHxJYdm/VaoVyRkuuNYS4q8ydLUz0PiNxIOfrBCfpdzrB+jbHREtOfi5zNzKGbzSnKEMiIJO
 dsGrwD/ME6GTH7RhEHRkCmPsLS55YGh3enE4+7FSRwIOpsdHUXtCW7dHq6dQkgKck1zVCasr23MFV
 4IxjnmFzX9Scqr2yT/29aRFUO3dP8K9T3zeLLBgSBDCF0Dwticqzv19aotFn6izACPL6CMoCRRDZ/
 EKBaTgiQ==;
Received: from 213-225-5-109.nat.highway.a1.net ([213.225.5.109]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnED6-007MGe-9r; Wed, 17 Nov 2021 06:14:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 09/11] block: move blk_dump_rq_flags to blk-mq.c
Date: Wed, 17 Nov 2021 07:14:02 +0100
Message-Id: <20211117061404.331732-10-hch@lst.de>
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

blk_dump_rq_flags deals with a request, so move it to blk-mq.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 14 --------------
 block/blk-mq.c   | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 60cc44418ce79..89971630f092f 100644
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
index 8b7edfc9623dd..f8a39f4fce01e 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -667,6 +667,20 @@ void blk_mq_free_plug_rqs(struct blk_plug *plug)
 		blk_mq_free_request(rq);
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
