Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VyOYN-0006UG-U9
 for linux-mtd@lists.infradead.org; Wed, 01 Jan 2014 16:21:56 +0000
Received: by mail-pa0-f43.google.com with SMTP id bj1so13686207pad.16
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jan 2014 08:21:32 -0800 (PST)
From: Roman Pen <r.peniaev@gmail.com>
To: 
Subject: [PATCH 1/1] mtd: mtd_blkdevs: handle REQ_FLUSH request and do
 explicit flush of writeback buffer
Date: Thu,  2 Jan 2014 01:21:21 +0900
Message-Id: <1388593281-22613-1-git-send-email-r.peniaev@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Roman Peniaev <r.peniaev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roman Peniaev <r.peniaev@gmail.com>

mtd_blkdevs is device with volatile cache (writeback buffer), so it should support
REQ_FLUSH to do explicit flush.

Without this patch 'sync' does not guarantee that writeback buffer will be flushed
on disk in case of power off, e.g.:

  $ cp some_file /mnt
  $ sync

  ### POWER OFF

In case of this sequence writeback buffer will not be flushed on disk.

This patch fixes this behaviour and explicitly reports to block layer that flush
requests are being supported.

Signed-off-by: Roman Peniaev <r.peniaev@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 drivers/mtd/mtd_blkdevs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 5073cbc..feafe5c 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -89,6 +89,12 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
 	if (req->cmd_type != REQ_TYPE_FS)
 		return -EIO;
 
+	if (req->cmd_flags & REQ_FLUSH) {
+		if (tr->flush)
+			return tr->flush(dev);
+		return 0;
+	}
+
 	if (blk_rq_pos(req) + blk_rq_cur_sectors(req) >
 	    get_capacity(req->rq_disk))
 		return -EIO;
@@ -409,6 +415,8 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	if (!new->rq)
 		goto error3;
 
+	blk_queue_flush(new->rq, REQ_FLUSH);
+
 	new->rq->queuedata = new;
 	blk_queue_logical_block_size(new->rq, tr->blksize);
 
-- 
1.8.5.2
