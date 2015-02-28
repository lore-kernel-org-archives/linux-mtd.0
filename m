Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YReEx-0000AL-P1
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:03:20 +0000
Received: by pdno5 with SMTP id o5so26966586pdn.8
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:03:00 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/7] mtd: blkdevs: remove dead code
Date: Sat, 28 Feb 2015 02:02:29 -0800
Message-Id: <1425117750-22298-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The only exit (break) from the preceding loop is nested within a
condition which yields req == NULL. This code is dead.

Coverity CID #752669

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index d08229eb44d8..2b0c52870999 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -171,9 +171,6 @@ static void mtd_blktrans_work(struct work_struct *work)
 		background_done = 0;
 	}
 
-	if (req)
-		__blk_end_request_all(req, -EIO);
-
 	spin_unlock_irq(rq->queue_lock);
 }
 
-- 
2.1.0
