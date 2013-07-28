Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3Ge0-0006ou-3x
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2013 02:23:38 +0000
Received: by mail-pa0-f50.google.com with SMTP id fb10so4113629pad.37
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2013 19:23:14 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] mtd: nandsim: use NS_RAW_OFFSET()
Date: Sun, 28 Jul 2013 11:21:56 +0900
Message-Id: <1374978118-11418-4-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1374978118-11418-1-git-send-email-akinobu.mita@gmail.com>
References: <1374978118-11418-1-git-send-email-akinobu.mita@gmail.com>
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

Use NS_RAW_OFFSET() to calculate the page offset in flash RAM image by
(row, column) address.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/nandsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 7aa7b19..0ff53ef 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -1489,7 +1489,7 @@ static void read_page(struct nandsim *ns, int num)
 				ns->regs.row, ns->regs.column + ns->regs.off);
 			if (do_read_error(ns, num))
 				return;
-			pos = (loff_t)ns->regs.row * ns->geom.pgszoob + ns->regs.column + ns->regs.off;
+			pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
 			tx = read_file(ns, ns->cfile, ns->buf.byte, num, pos);
 			if (tx != num) {
 				NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
@@ -1558,7 +1558,7 @@ static int prog_page(struct nandsim *ns, int num)
 
 		NS_DBG("prog_page: writing page %d\n", ns->regs.row);
 		pg_off = ns->file_buf + ns->regs.column + ns->regs.off;
-		off = (loff_t)ns->regs.row * ns->geom.pgszoob + ns->regs.column + ns->regs.off;
+		off = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
 		if (!test_bit(ns->regs.row, ns->pages_written)) {
 			all = 1;
 			memset(ns->file_buf, 0xff, ns->geom.pgszoob);
-- 
1.8.3.1
