Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PozEm-000210-8g
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2011 14:17:13 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p1EEH9Uf008254
	for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2011 16:17:09 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd_blkdevs: Set the maximum discards size
Date: Mon, 14 Feb 2011 16:16:10 +0200
Message-Id: <1297692971-7399-3-git-send-email-jarkko.lavinen@nokia.com>
In-Reply-To: <1297692971-7399-1-git-send-email-jarkko.lavinen@nokia.com>
References: <1297692971-7399-1-git-send-email-jarkko.lavinen@nokia.com>
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Set max_discard_sectors to UINT_MAX.

Signed-off-by: Jarkko Lavinen <jarkko.lavinen@nokia.com>
---
 drivers/mtd/mtd_blkdevs.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 69d8c27..6ba450a 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -405,9 +405,10 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	new->rq->queuedata = new;
 	blk_queue_logical_block_size(new->rq, tr->blksize);
 
-	if (tr->discard)
-		queue_flag_set_unlocked(QUEUE_FLAG_DISCARD,
-					new->rq);
+	if (tr->discard) {
+		queue_flag_set_unlocked(QUEUE_FLAG_DISCARD, new->rq);
+		new->rq->limits.max_discard_sectors = UINT_MAX;
+	}
 
 	gd->queue = new->rq;
 
-- 
1.7.2.3
