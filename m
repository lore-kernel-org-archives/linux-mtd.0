Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568DEC3DA6E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 07:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9q78/Dgstc7uIvbaF5sF+uiyUQAk3LGDxVLmkAQUwg=; b=yfUfpUhOH/XA8F
	jTMLbuCaW6C+RgKkP2qYsUi6yFu5MEcJPWigYxW+ISAeRrJjlefukDJGuFG+TLSRC7vFIU82iSA37
	rive8SA1z4e7FfjgqBAostr3CY2jPgM712/5IvlaNu/q3kpmGZox8lA7cYOZIx+eAEufnKsRuIdqb
	ZeON+wj77wKzXSo5hlAL29hprlV0td7YpAnkkQF1ODqZYFR7GbbFjQ5ByS3BzK/oCoG7Jz/5YdX0R
	Q9pqxVbDG+E7wnHeqh7ON1uNpukx8tWOYjg2UCa9EoXUoMFJ9+P1Dq5+fZayUoiEqhuhjRDEov0jO
	Sd2FQE23Ik6lofjrJAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIlFd-00GMyx-1V;
	Thu, 28 Dec 2023 07:56:21 +0000
Received: from 213-147-167-209.nat.highway.webapn.at ([213.147.167.209] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rIlFZ-00GMvn-2n;
	Thu, 28 Dec 2023 07:56:18 +0000
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
Subject: [PATCH 5/9] nbd: use the default discard granularity
Date: Thu, 28 Dec 2023 07:55:41 +0000
Message-Id: <20231228075545.362768-6-hch@lst.de>
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
that value explicitly.  Also don't bother clearing it as a discard
granularity without discard_sectors doesn't mean anything.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b6414e1e645b76..4e72ec4e25ac5a 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -334,10 +334,8 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 	if (!nbd->pid)
 		return 0;
 
-	if (nbd->config->flags & NBD_FLAG_SEND_TRIM) {
-		nbd->disk->queue->limits.discard_granularity = blksize;
+	if (nbd->config->flags & NBD_FLAG_SEND_TRIM)
 		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
-	}
 	blk_queue_logical_block_size(nbd->disk->queue, blksize);
 	blk_queue_physical_block_size(nbd->disk->queue, blksize);
 
@@ -1357,7 +1355,6 @@ static void nbd_config_put(struct nbd_device *nbd)
 		nbd->config = NULL;
 
 		nbd->tag_set.timeout = 0;
-		nbd->disk->queue->limits.discard_granularity = 0;
 		blk_queue_max_discard_sectors(nbd->disk->queue, 0);
 
 		mutex_unlock(&nbd->config_lock);
@@ -1850,7 +1847,6 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	 * Tell the block layer that we are not a rotational device
 	 */
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
-	disk->queue->limits.discard_granularity = 0;
 	blk_queue_max_discard_sectors(disk->queue, 0);
 	blk_queue_max_segment_size(disk->queue, UINT_MAX);
 	blk_queue_max_segments(disk->queue, USHRT_MAX);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
