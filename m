From: chuanxiao.dong@intel.com (Chuanxiao Dong)
Date: Thu, 22 Jul 2010 17:24:41 +0800
Subject: [PATCH] include/linux/mtd/blktrans.h fix wrong #blocks value repor=
Message-ID: <mailman.83.1279791294.27306.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

ted by /proc/partitions

type of "size" in mtd_blktrans_dev structure is changed
from unsigned long to uint64_t

When nand has a partition whose size is larger than 0x100000000,
mtd_blkdev will lose the capcity when calling

	"348    set_capcity(gd, (new->size * tr->blksize) >> 9)"

in "add_mtd_blktrans_dev" function.

The result of "(new->size * tr->blksize)" will be limited to be a 32bits va=
lue
if the nand partition size is larger than 0x100000000.
So change the type of "size" to be uint64_t to support large nand.

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 include/linux/mtd/blktrans.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index b481ccd..bdae196 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -24,7 +24,7 @@ struct mtd_blktrans_dev {
 	struct mtd_info *mtd;
 	struct mutex lock;
 	int devnum;
-	unsigned long size;
+	uint64_t size;
 	int readonly;
 	int open;
 	struct kref ref;
--=20
1.6.6.1
