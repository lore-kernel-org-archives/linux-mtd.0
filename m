Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B75CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:14:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7D0A60F9C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 07:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7D0A60F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMmWAvF45GXKUWz9PtW1t4AyHreS9Yay7oYd4GwLISw=; b=5AAMXVZyLsnk9K
	JBtXwO8XUqiwwD7TDbc98fl93rAu4HT7Aw5Xwptu064418tyBJg8rLxjIKGTb4Qrri/FR9f3qhRSN
	vu25hp7tIHqyTGIYW6MBAdASJ5HPRLO7tNo/tTOFNKBQvgaOWeKSEtV1fYCWblHSa/PT/ETClxoFk
	93Mfqp3uUO0RYbAMKHQyNX8HQOsUvRiNI8fp8cA7hpz0eE5HVjhxFjD2v4Sk1n+Do2+XSYN+uMXcq
	740KHDMwkelAAY3nEUSEBfXxn3i1vbWIfzCC4djyzrr1pRvbFq2h2BFhvKAHFLVhCW8PyFIJZjC5A
	thJhK0r9pcdq7wLr9fbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meuAo-00FXpQ-1X; Mon, 25 Oct 2021 07:13:34 +0000
Received: from [2001:4bb8:184:6dcb:6093:467a:cccc:351c] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meu3H-00FUZl-UG; Mon, 25 Oct 2021 07:05:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH 11/12] block: move blk_print_req_error to blk-mq.c
Date: Mon, 25 Oct 2021 09:05:16 +0200
Message-Id: <20211025070517.1548584-12-hch@lst.de>
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

This function is only used by the request completion path.  Factor out
a blk_status_to_str to keep blk_errors private in blk-core.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c | 15 +++------------
 block/blk-mq.c   | 13 +++++++++++++
 block/blk.h      |  2 +-
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 9547a75e7a7aa..ebcea0dac973d 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -199,22 +199,13 @@ int blk_status_to_errno(blk_status_t status)
 }
 EXPORT_SYMBOL_GPL(blk_status_to_errno);
 
-void blk_print_req_error(struct request *req, blk_status_t status)
+const char *blk_status_to_str(blk_status_t status)
 {
 	int idx = (__force int)status;
 
 	if (WARN_ON_ONCE(idx >= ARRAY_SIZE(blk_errors)))
-		return;
-
-	printk_ratelimited(KERN_ERR
-		"%s error, dev %s, sector %llu op 0x%x:(%s) flags 0x%x "
-		"phys_seg %u prio class %u\n",
-		blk_errors[idx].name,
-		req->rq_disk ? req->rq_disk->disk_name : "?",
-		blk_rq_pos(req), req_op(req), blk_op_str(req_op(req)),
-		req->cmd_flags & ~REQ_OP_MASK,
-		req->nr_phys_segments,
-		IOPRIO_PRIO_CLASS(req->ioprio));
+		return "<null>";
+	return blk_errors[idx].name;
 }
 
 /**
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 425cd134ac358..3edd4ee2007b0 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -698,6 +698,19 @@ static void blk_account_io_completion(struct request *req, unsigned int bytes)
 	}
 }
 
+static void blk_print_req_error(struct request *req, blk_status_t status)
+{
+	printk_ratelimited(KERN_ERR
+		"%s error, dev %s, sector %llu op 0x%x:(%s) flags 0x%x "
+		"phys_seg %u prio class %u\n",
+		blk_status_to_str(status),
+		req->rq_disk ? req->rq_disk->disk_name : "?",
+		blk_rq_pos(req), req_op(req), blk_op_str(req_op(req)),
+		req->cmd_flags & ~REQ_OP_MASK,
+		req->nr_phys_segments,
+		IOPRIO_PRIO_CLASS(req->ioprio));
+}
+
 /**
  * blk_update_request - Complete multiple bytes without completing the request
  * @req:      the request being processed
diff --git a/block/blk.h b/block/blk.h
index 8bcca0538faac..573e308851d27 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -215,7 +215,7 @@ static inline void blk_integrity_del(struct gendisk *disk)
 
 unsigned long blk_rq_timeout(unsigned long timeout);
 void blk_add_timer(struct request *req);
-void blk_print_req_error(struct request *req, blk_status_t status);
+const char *blk_status_to_str(blk_status_t status);
 
 bool blk_attempt_plug_merge(struct request_queue *q, struct bio *bio,
 		unsigned int nr_segs, bool *same_queue_rq);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
