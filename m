Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJsMn-0002Xv-B4
	for linux-mtd@lists.infradead.org; Fri, 18 Jul 2008 15:59:33 +0000
Date: Sat, 19 Jul 2008 01:01:22 +0900 (JST)
Message-Id: <20080719.010122.11964325.anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: [PATCH 4/5] [MTD][MTDPART] Fix a division by zero bug
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: joern@logfs.org, linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When detecting a partition beyond the end of the device, skip most of
the initialisation, in particular those bits causing a division by zero.

Signed-off-by: Joern Engel <joern@logfs.org>
Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
This is a patch against mtd-2.6 tree.

 drivers/mtd/mtdpart.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 5aac59c..edb90b5 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -411,11 +411,12 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 
 	/* let's do some sanity checks */
 	if (slave->offset >= master->size) {
-			/* let's register it anyway to preserve ordering */
+		/* let's register it anyway to preserve ordering */
 		slave->offset = 0;
 		slave->mtd.size = 0;
 		printk(KERN_ERR"mtd: partition \"%s\" is out of reach -- disabled\n",
 			part->name);
+		goto out_register;
 	}
 	if (slave->offset + slave->mtd.size > master->size) {
 		slave->mtd.size = master->size - slave->offset;
@@ -475,6 +476,7 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		}
 	}
 
+out_register:
 	if (part->mtdp) {
 		/* store the object pointer (caller may or may not register it*/
 		*part->mtdp = &slave->mtd;
