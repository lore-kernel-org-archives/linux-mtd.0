Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3Gds-0006oS-8Q
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2013 02:23:28 +0000
Received: by mail-pd0-f174.google.com with SMTP id 3so3205937pdj.33
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2013 19:23:03 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/6] mtd: nandsim: convert pages_written[] to bitmap
Date: Sun, 28 Jul 2013 11:21:53 +0900
Message-Id: <1374978118-11418-1-git-send-email-akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nandsim.pages_written[] is the array of unsigned char which is indexed
by the page number and used for identifying which pages have been written
when cache_file is used.  Each entry holds 0 (not written) or 1 (written),
so it can be converted to bitmap.  This reduces the allocation size of
pages_written[] by 1/8.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/nandsim.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index cb38f3d..a73dce0 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -363,7 +363,7 @@ struct nandsim {
 
 	/* Fields needed when using a cache file */
 	struct file *cfile; /* Open file */
-	unsigned char *pages_written; /* Which pages have been written */
+	unsigned long *pages_written; /* Which pages have been written */
 	void *file_buf;
 	struct page *held_pages[NS_MAX_HELD_PAGES];
 	int held_cnt;
@@ -586,7 +586,8 @@ static int alloc_device(struct nandsim *ns)
 			err = -EINVAL;
 			goto err_close;
 		}
-		ns->pages_written = vzalloc(ns->geom.pgnum);
+		ns->pages_written = vzalloc(BITS_TO_LONGS(ns->geom.pgnum) *
+					    sizeof(unsigned long));
 		if (!ns->pages_written) {
 			NS_ERR("alloc_device: unable to allocate pages written array\n");
 			err = -ENOMEM;
@@ -1479,7 +1480,7 @@ static void read_page(struct nandsim *ns, int num)
 	union ns_mem *mypage;
 
 	if (ns->cfile) {
-		if (!ns->pages_written[ns->regs.row]) {
+		if (!test_bit(ns->regs.row, ns->pages_written)) {
 			NS_DBG("read_page: page %d not written\n", ns->regs.row);
 			memset(ns->buf.byte, 0xFF, num);
 		} else {
@@ -1525,9 +1526,9 @@ static void erase_sector(struct nandsim *ns)
 
 	if (ns->cfile) {
 		for (i = 0; i < ns->geom.pgsec; i++)
-			if (ns->pages_written[ns->regs.row + i]) {
+			if (__test_and_clear_bit(ns->regs.row + i,
+						 ns->pages_written)) {
 				NS_DBG("erase_sector: freeing page %d\n", ns->regs.row + i);
-				ns->pages_written[ns->regs.row + i] = 0;
 			}
 		return;
 	}
@@ -1560,7 +1561,7 @@ static int prog_page(struct nandsim *ns, int num)
 		NS_DBG("prog_page: writing page %d\n", ns->regs.row);
 		pg_off = ns->file_buf + ns->regs.column + ns->regs.off;
 		off = (loff_t)ns->regs.row * ns->geom.pgszoob + ns->regs.column + ns->regs.off;
-		if (!ns->pages_written[ns->regs.row]) {
+		if (!test_bit(ns->regs.row, ns->pages_written)) {
 			all = 1;
 			memset(ns->file_buf, 0xff, ns->geom.pgszoob);
 		} else {
@@ -1580,7 +1581,7 @@ static int prog_page(struct nandsim *ns, int num)
 				NS_ERR("prog_page: write error for page %d ret %ld\n", ns->regs.row, (long)tx);
 				return -1;
 			}
-			ns->pages_written[ns->regs.row] = 1;
+			__set_bit(ns->regs.row, ns->pages_written);
 		} else {
 			tx = write_file(ns, ns->cfile, pg_off, num, off);
 			if (tx != num) {
-- 
1.8.3.1
