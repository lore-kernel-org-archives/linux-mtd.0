Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C29C47077
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqj9la+5yVK4lzup0jA00h+HIZ619OD+THbBOLNw02E=; b=Sz0CcPPetCF87q
	47Qkchb470Jb+UEPLw323iux2Fq0wI2PDXHvPlZN6VSZQDgfGKSfAYdiHnjL77uYNKpzr/VAmisrX
	AR/vrtha7TFehvzbHr4BbT2lAP8dCLmmz7PFm+H5d0KYwemXFuArI3oXiZb/Y+QmWVlWpEK1jELf3
	2DtJ8F8D+/QtfnO+scPv+dC/y32ocdL4mHclLRbBn2BrKfwAW5uKW3szs3893Jb9rCa9/5S1KYPfW
	TGwWXtP57i3BTnYYMDer0PHqw3J3WDAcNC/K75hKcX+9ihYuKTStaVy5WSwAHyqkYS6awS6eiE/5F
	LmJ2UOkYKBlro1n2SwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIlFI-00GMrH-0I;
	Thu, 28 Dec 2023 07:56:00 +0000
Received: from 213-147-167-209.nat.highway.webapn.at ([213.147.167.209] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rIlFE-00GMqW-1v;
	Thu, 28 Dec 2023 07:55:57 +0000
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
Subject: [PATCH 1/9] block: remove two comments in bio_split_discard
Date: Thu, 28 Dec 2023 07:55:37 +0000
Message-Id: <20231228075545.362768-2-hch@lst.de>
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

A zero discard_granularity is not treated the same as a single-block one,
and not having any segments after taking alignment is perfectly fine
and does not need a warning.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-merge.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/block/blk-merge.c b/block/blk-merge.c
index 65e75efa9bd366..2d470cf2173e29 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -115,17 +115,13 @@ static struct bio *bio_split_discard(struct bio *bio,
 
 	*nsegs = 1;
 
-	/* Zero-sector (unknown) and one-sector granularities are the same.  */
 	granularity = max(lim->discard_granularity >> 9, 1U);
 
 	max_discard_sectors =
 		min(lim->max_discard_sectors, bio_allowed_max_sectors(lim));
 	max_discard_sectors -= max_discard_sectors % granularity;
-
-	if (unlikely(!max_discard_sectors)) {
-		/* XXX: warn */
+	if (unlikely(!max_discard_sectors))
 		return NULL;
-	}
 
 	if (bio_sectors(bio) <= max_discard_sectors)
 		return NULL;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
