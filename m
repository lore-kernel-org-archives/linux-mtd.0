Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R8mak-0000VU-Fw
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2011 05:21:59 +0000
Received: by gyg13 with SMTP id 13so7119794gyg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Sep 2011 22:21:56 -0700 (PDT)
From: Dan McGee <dpmcgee@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: mark block device queue as non-rotational
Date: Wed, 28 Sep 2011 00:21:42 -0500
Message-Id: <1317187302-13380-1-git-send-email-dpmcgee@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is similar to what the nbd driver does, among others.

Signed-off-by: Dan McGee <dpmcgee@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index ca38569..ed8b5e7 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -426,6 +426,8 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	new->rq->queuedata = new;
 	blk_queue_logical_block_size(new->rq, tr->blksize);
 
+	queue_flag_set_unlocked(QUEUE_FLAG_NONROT, new->rq);
+
 	if (tr->discard) {
 		queue_flag_set_unlocked(QUEUE_FLAG_DISCARD, new->rq);
 		new->rq->limits.max_discard_sectors = UINT_MAX;
-- 
1.7.6.4
