Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E62C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlQV6SJqzKe0eVLMcgMjW6mlKob55ObTSGfb3Rz8Bao=; b=Vl0qE5tdOUFwvO
	OisoK//E70BRDpCKvjwceUlMS4QDM4RuUG5Pws2zZdZCKxxqQIk486rWnxvhPk/WcskpAWCreF4MW
	1OPKbsvIOzCXBxg3oE0b/Ba3aG/jJFI8Xkl8iSwthUdQ0pjRL9djzSgt0VhOc4Lr9CL3ZEn+JPWNa
	PfbpsCgJuIxXimka2UikATjO4KoyolOB0rRsAGYCJQthCw8rQm7qQS748LeirlXE2kRQH3ANPgE87
	J9lTDAC4DDkfqo/z/o/8xgQRe4h0g44zKcuPwCRuGeWauQhSAhyjVBPGYArDz5TrmFMU3O79zUetI
	WiiZ88HIgAJBWu77tD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqaMj-00ANRi-JK; Fri, 26 Nov 2021 12:30:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqaB6-00AKH9-FP
 for linux-mtd@bombadil.infradead.org; Fri, 26 Nov 2021 12:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=HaxtvZRNx4zf6RCep8t0FSuXHJUOaGajJ5JwpULYqBo=; b=djG5ee3I2MMTIVE6esArj2PeQf
 OOFPk5gxp9RdJ7WonNr22W5hahpcz9EV0hehMn4ZcUnOtmIQaRJ3kJ5fRY3ogg8OHGkv3DE8rSnsr
 r5f/bo0Ed7AJls8Iz/SdapWdceUtZMaRZ8c/apIhP7n6ZbhODNEfvLKtF+IhELCI9cFEQWntSthD4
 MvAxcIDqccMhfxmCTU6snjmkxzn0wOgGTuiihEXWGk0Hd/yyQm/CgvWat0xZzVmBNqtAWCbn34CYU
 AkYQyygfZDnfCpuCQC17U9iSNgHEN68vkHXec77X/1qvd81FRQJgtRERhZtXywxI7A+EnORp+1K+M
 F6B8Sqdw==;
Received: from [2001:4bb8:191:f9ce:bae8:5658:102a:5491] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqaB2-00AWG5-6p; Fri, 26 Nov 2021 12:18:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org
Subject: [PATCH 1/5] mtd_blkdevs: remove the sector out of range check in
 do_blktrans_request
Date: Fri, 26 Nov 2021 13:17:58 +0100
Message-Id: <20211126121802.2090656-2-hch@lst.de>
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

The block layer already performs this check, no need to duplicate it in
the driver.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/mtd_blkdevs.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 66f81d42fe778..113f86df76038 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -54,17 +54,11 @@ static blk_status_t do_blktrans_request(struct mtd_blktrans_ops *tr,
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
