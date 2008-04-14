Received: from smtp5.pp.htv.fi ([213.243.153.39])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlPYn-0003QA-8f
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 14:21:29 +0000
Date: Mon, 14 Apr 2008 17:20:24 +0300
From: Adrian Bunk <bunk@kernel.org>
To: dwmw2@infradead.org
Subject: [2.6 patch] mtd/ftl.c: make code static
Message-ID: <20080414142024.GS6695@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch makes the following needlessly global code static:
- ftl_freepart()
- struct ftl_tr

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

 drivers/mtd/ftl.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

febd03449dbd4d03eb0e9a73b47815c9a63255b9 diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index c815d0f..4a79b18 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -136,8 +136,6 @@ typedef struct partition_t {
 #endif
 } partition_t;
 
-void ftl_freepart(partition_t *part);
-
 /* Partition state flags */
 #define FTL_FORMATTED	0x01
 
@@ -1014,7 +1012,7 @@ static int ftl_writesect(struct mtd_blktrans_dev *dev,
 
 /*====================================================================*/
 
-void ftl_freepart(partition_t *part)
+static void ftl_freepart(partition_t *part)
 {
 	vfree(part->VirtualBlockMap);
 	part->VirtualBlockMap = NULL;
@@ -1069,7 +1067,7 @@ static void ftl_remove_dev(struct mtd_blktrans_dev *dev)
 	kfree(dev);
 }
 
-struct mtd_blktrans_ops ftl_tr = {
+static struct mtd_blktrans_ops ftl_tr = {
 	.name		= "ftl",
 	.major		= FTL_MAJOR,
 	.part_bits	= PART_BITS,
