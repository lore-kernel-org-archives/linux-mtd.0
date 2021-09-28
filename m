Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF75C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 05:24:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05CA060F4F
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 05:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05CA060F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jUJIlpiVQUkljuV+I3noj+b8wG0PBFNECV6VmBsayk=; b=z+Rhc7QKxWtl5s
	axdYZmaY2ZBqOMHCh8gdpTeN3diW1g5qAHY/iuhqWleIzpipqBf/0YoFz6j0lE4p2hX2zB7BVlFLY
	1JkSmCDn+isbniYsM3jekIKe4Zp7OdTVa67IvjAWQ96NqB7oPsdqfyJDEkboP6Drb/2teThE1Mdz0
	oHn23iob7X8mZABvSzClK28HIXTAwPRxfSb+d3NrgqrMdEIKhvyFjMwlyv3XCYNVrJsTWYTSvwbgR
	d9Ub2X0tHdyqv8c6or4wXjRFvFNBArbmqAMHtq+SDwwuyws0Gj3LCT/QJ2EaY9O2jsRoLm7vWbwr5
	4yNBWynwnIbFG7HPeoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV5aV-005cNH-S2; Tue, 28 Sep 2021 05:23:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV5aU-005cMr-CK
 for linux-mtd@bombadil.infradead.org; Tue, 28 Sep 2021 05:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qyVVyX6iwsSVfVlLizJ/p3RKDKLEZPsrZosyweOO2yw=; b=dE2g5H4jLJm9J1v7Q2ve3YhEX7
 gtXxx7bSIKRbTqli5RP19ydQk12CiXOyPhaYaDpISOIHB+/qjkK5LTSxG/60vS9PlR6mwJO59Mxfg
 /zP2kkX7dn4M0HCOG0+ZM4HZVbErR1HgSWJrCNQdreDPCByL395wrPxWFX9g2tsH1Q4PYjRrAJ80m
 cyWBPeCzVFTyRLYHKULCXo8e7K5qk6KNcFmWvUSTdCCznjHLU0CWyl32Be+fIeRi/6j4oM0vjYrf6
 VAp1+16iSGPxvhyfBUIgf/PEFAhgDzetNGBshk91xbvcikY4rpqYx+Cc8+t00f8RI9zZZXyWzUWCp
 JbHuRIcw==;
Received: from p4fdb05cb.dip0.t-ipconnect.de ([79.219.5.203] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV5a1-00AW8S-Ej; Tue, 28 Sep 2021 05:23:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org
Subject: [PATCH 2/5] block: don't check ->rq_disk in merges
Date: Tue, 28 Sep 2021 07:22:08 +0200
Message-Id: <20210928052211.112801-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928052211.112801-1-hch@lst.de>
References: <20210928052211.112801-1-hch@lst.de>
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
index 5b4f23014df8a..6b62415452f82 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -756,8 +756,7 @@ static struct request *attempt_merge(struct request_queue *q,
 	if (req_op(req) != req_op(next))
 		return NULL;
 
-	if (rq_data_dir(req) != rq_data_dir(next)
-	    || req->rq_disk != next->rq_disk)
+	if (rq_data_dir(req) != rq_data_dir(next))
 		return NULL;
 
 	if (req_op(req) == REQ_OP_WRITE_SAME &&
@@ -884,10 +883,6 @@ bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
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
