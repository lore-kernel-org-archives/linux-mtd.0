Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLqe5-0001nv-1J
 for linux-mtd@lists.infradead.org; Sun, 02 Aug 2015 10:37:33 +0000
Received: by pacgq8 with SMTP id gq8so2934849pac.3
 for <linux-mtd@lists.infradead.org>; Sun, 02 Aug 2015 03:37:11 -0700 (PDT)
From: Tomer Barletz <barletz@gmail.com>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tomer Barletz <barletz@gmail.com>
Subject: [PATCH] Avoid compiler warning by storing the result of rq_data_dir()
 in an int variable
Date: Sun,  2 Aug 2015 03:36:52 -0700
Message-Id: <1438511812-5270-1-git-send-email-barletz@gmail.com>
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
 drivers/mtd/mtd_blkdevs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 41acc50..8c3715c 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -79,6 +79,7 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
 {
 	unsigned long block, nsect;
 	char *buf;
+	int rq;
 
 	block = blk_rq_pos(req) << 9 >> tr->blkshift;
 	nsect = blk_rq_cur_bytes(req) >> tr->blkshift;
@@ -97,7 +98,8 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
 	if (req->cmd_flags & REQ_DISCARD)
 		return tr->discard(dev, block, nsect);
 
-	switch(rq_data_dir(req)) {
+	rq = rq_data_dir(req);
+	switch(rq) {
 	case READ:
 		for (; nsect > 0; nsect--, block++, buf += tr->blksize)
 			if (tr->readsect(dev, block, buf))
-- 
2.4.3
