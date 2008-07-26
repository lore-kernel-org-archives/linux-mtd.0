Subject: [PATCH 3/3] [MTD] mtdoops: Fix a bug where block may not be erased
From: Richard Purdie <rpurdie@rpsys.net>
To: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Sat, 26 Jul 2008 10:08:41 +0100
Message-Id: <1217063321.5463.18.camel@dax.rpnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This makes the driver erase a block when it doesn't find any
existing saved log messages which is safer than assuming the
flash was already erased.

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/mtd/mtdoops.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 6f6b2f3..aebb3b2 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -258,9 +258,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 	if (maxcount == 0xffffffff) {
 		cxt->nextpage = 0;
 		cxt->nextcount = 1;
-		cxt->ready = 1;
-		printk(KERN_DEBUG "mtdoops: Ready %d, %d (first init)\n",
-				cxt->nextpage, cxt->nextcount);
+		schedule_work(&cxt->work_erase);
 		return;
 	}
 
-- 
1.5.4.4
