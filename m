Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMpt9-0006eQ-Ha
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2015 04:01:12 +0000
Received: by padck2 with SMTP id ck2so24892606pad.0
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2015 21:00:50 -0700 (PDT)
From: Tomer Barletz <barletz@gmail.com>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tomer Barletz <barletz@gmail.com>
Subject: [PATCH] mtd: Fix switch-bool compilation warning
Date: Tue,  4 Aug 2015 21:00:24 -0700
Message-Id: <1438747224-14125-1-git-send-email-barletz@gmail.com>
In-Reply-To: <20150802134845.GA31982@virgo.local>
References: <20150802134845.GA31982@virgo.local>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With gcc 5.1 I get:
warning: switch condition has boolean value [-Wswitch-bool]

Signed-off-by: Tomer Barletz <barletz@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 41acc50..8830475 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -97,14 +97,13 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
 	if (req->cmd_flags & REQ_DISCARD)
 		return tr->discard(dev, block, nsect);
 
-	switch(rq_data_dir(req)) {
-	case READ:
+	if (rq_data_dir(req) == READ) {
 		for (; nsect > 0; nsect--, block++, buf += tr->blksize)
 			if (tr->readsect(dev, block, buf))
 				return -EIO;
 		rq_flush_dcache_pages(req);
 		return 0;
-	case WRITE:
+	} else {
 		if (!tr->writesect)
 			return -EIO;
 
@@ -113,9 +112,6 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
 			if (tr->writesect(dev, block, buf))
 				return -EIO;
 		return 0;
-	default:
-		printk(KERN_NOTICE "Unknown request %u\n", rq_data_dir(req));
-		return -EIO;
 	}
 }
 
-- 
2.4.3
