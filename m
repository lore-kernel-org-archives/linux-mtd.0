Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3Gdw-0006oj-Ob
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2013 02:23:34 +0000
Received: by mail-pa0-f43.google.com with SMTP id hz10so3610173pad.2
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2013 19:23:11 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/6] mtd: nandsim: simplify NS_RAW_OFFSET()
Date: Sun, 28 Jul 2013 11:21:55 +0900
Message-Id: <1374978118-11418-3-git-send-email-akinobu.mita@gmail.com>
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

Simplify the definision of NS_RAW_OFFSET() by using (ns)->geom.pgszoob
which holds the sum of page size and OOB size.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/nandsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index ac1b46c..7aa7b19 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -205,7 +205,7 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 
 /* Calculate the page offset in flash RAM image by (row, column) address */
 #define NS_RAW_OFFSET(ns) \
-	(((ns)->regs.row << (ns)->geom.pgshift) + ((ns)->regs.row * (ns)->geom.oobsz) + (ns)->regs.column)
+	(((ns)->regs.row * (ns)->geom.pgszoob) + (ns)->regs.column)
 
 /* Calculate the OOB offset in flash RAM image by (row, column) address */
 #define NS_RAW_OFFSET_OOB(ns) (NS_RAW_OFFSET(ns) + ns->geom.pgsz)
-- 
1.8.3.1
