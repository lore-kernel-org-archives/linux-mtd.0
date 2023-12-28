Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3C6C3DA6E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 07:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLOOJr0h8yF27a4LkLh0Twph8cr4utTVsZD7RANQ3ew=; b=oTfoZZ1d7OfX26
	hNtdqXk2j83zvZ2UA/mf1SXXbRrC7mqDxhJkoZ/L5ZW+LeFe6Blm2vfYKLQBxZAmCbKV6fNoSyyl9
	zZeX5gdXzb1trnolFCJb02VX5DT2E23PWId2xWTL33q/NgrqPBRJ7tWjKS7oMIjkdHNcGVPZt7IDR
	xSCEcpRm5/vUz/wdb6kYY612z3jVuRIMs3j1kGEkk8q69P9cJ6iAV2Q0L7k0wc+HfH/i0yDoTR7fX
	jY9AqZv+QdCVE4/3OD6pSCd7ko86858+4hj11gUcLJtE2WXlXPKoYIk+oqI/NC/m2fcFmzDgPepcR
	lQb95C+KWKZYGckt+SXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIlFx-00GNF3-0U;
	Thu, 28 Dec 2023 07:56:41 +0000
Received: from 213-147-167-209.nat.highway.webapn.at ([213.147.167.209] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rIlFt-00GN9z-2s;
	Thu, 28 Dec 2023 07:56:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Coly Li <colyli@suse.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 9/9] mtd_blkdevs: use the default discard granularity
Date: Thu, 28 Dec 2023 07:55:45 +0000
Message-Id: <20231228075545.362768-10-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231228075545.362768-1-hch@lst.de>
References: <20231228075545.362768-1-hch@lst.de>
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

The discard granularity now defaults to a single sector, so don't set
that value explicitly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/mtd_blkdevs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index ff18636e088973..0da7b33849471a 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -376,10 +376,8 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, new->rq);
 	blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, new->rq);
 
-	if (tr->discard) {
+	if (tr->discard)
 		blk_queue_max_discard_sectors(new->rq, UINT_MAX);
-		new->rq->limits.discard_granularity = tr->blksize;
-	}
 
 	gd->queue = new->rq;
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
