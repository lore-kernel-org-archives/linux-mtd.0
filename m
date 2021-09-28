Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB09C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 05:23:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF00560FC2
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 05:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF00560FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQSsQgBNzwR74NcQMT0zvqNYURiP4cXlrZ9FnrfUR2U=; b=X2HzaJiupzQRy0
	lMrKkpdK1gMaqdKKBXz/ZsEP+to/G74WOO0NhWFknbC00vuTvw2mDv0ZD2DBe9yIUQ0y6fHmPFQCT
	yjcZXkQNeQ3nMWiznfGeMzkCfckz3CCU6wF9oa31IOKMfOmJpuhwb0+iTBfbUaP1Qq8Bbb07yp2JY
	sJAEuK81JCAn1VE/96WHcy+lYr8wS+R3Ekpr7PCLXY2wn6K+nW+k0xIz9Xkln7dqNwqdDYwWV3NbE
	mV4UwP4VvsZ0goMLDB6UiYXrqOec8QvrZIVMxyuTr+PJ9pvNWe99EqBaDpcXwTG4p+O3WH/5yuNNr
	evlPsPmEXIyvjC1CCPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV5a3-005cIN-34; Tue, 28 Sep 2021 05:23:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV5a1-005cIF-Vn
 for linux-mtd@bombadil.infradead.org; Tue, 28 Sep 2021 05:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lmHEDTWGofeDOwHsn0RpYTE0PMMmj0L5m+XiC3VnX2w=; b=mld55F53YIGAnwfDfJb1dpucQE
 DQeivNpnLZgobDKZWtBQGX2JzkHqC2GFdR/7SofbBXFoRfBIGVlqBxjh1dOIOjLEfx25zcMmvLige
 +ygr040OwDq3n7tJ+uWWssNbsEJhWjehCfcP7JqE5++m5jXgNAtsGyIwXxqwTbdyxb8DqmpCHUs1h
 AVzb/F5l7OwQNzHh8e3dp7T0uuNQ6bPPODq9jNBCwZm8fv7fAFouxF80P8o0Zd2jiJgRnD8ZpsVJw
 vsleMY54A0LlhHhoo1rVUbLziYmmA9Q502Xl23vY+f9zi/i9/VByppiDdENanm0yDaqAEI4ScpWaS
 WxzNk15g==;
Received: from p4fdb05cb.dip0.t-ipconnect.de ([79.219.5.203] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV5Zg-00AW6x-4a; Tue, 28 Sep 2021 05:22:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org
Subject: [PATCH 1/5] mtd_blkdevs: remove the sector out of range check in
 do_blktrans_request
Date: Tue, 28 Sep 2021 07:22:07 +0200
Message-Id: <20210928052211.112801-2-hch@lst.de>
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

The block layer already performs this check, no need to duplicate it in
the driver.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/mtd_blkdevs.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index b8ae1ec14e178..5ce5da705ac00 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -52,17 +52,11 @@ static blk_status_t do_blktrans_request(struct mtd_blktrans_ops *tr,
 	block = blk_rq_pos(req) << 9 >> tr->blkshift;
 	nsect = blk_rq_cur_bytes(req) >> tr->blkshift;
 
-	if (req_op(req) == REQ_OP_FLUSH) {
+	switch (req_op(req)) {
+	case REQ_OP_FLUSH:
 		if (tr->flush(dev))
 			return BLK_STS_IOERR;
 		return BLK_STS_OK;
-	}
-
-	if (blk_rq_pos(req) + blk_rq_cur_sectors(req) >
-	    get_capacity(req->rq_disk))
-		return BLK_STS_IOERR;
-
-	switch (req_op(req)) {
 	case REQ_OP_DISCARD:
 		if (tr->discard(dev, block, nsect))
 			return BLK_STS_IOERR;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
