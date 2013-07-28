Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3Ge6-0006pB-3U
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2013 02:23:44 +0000
Received: by mail-pd0-f170.google.com with SMTP id x11so4254239pdj.1
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2013 19:23:19 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/6] mtd: nandsim: remove unused ns->geom.oobshift
Date: Sun, 28 Jul 2013 11:21:58 +0900
Message-Id: <1374978118-11418-6-git-send-email-akinobu.mita@gmail.com>
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

ns->geom.oobshift holds bits number in OOB size, but OOB size is not
always power of two.  So it is useless and it actually isn't used in
this driver except for just printing the value at module loading.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/nandsim.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index ce90990..9e04de0 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -336,7 +336,6 @@ struct nandsim {
 		uint pgsec;         /* number of pages per sector */
 		uint secshift;      /* bits number in sector size */
 		uint pgshift;       /* bits number in page size */
-		uint oobshift;      /* bits number in OOB size */
 		uint pgaddrbytes;   /* bytes per page address */
 		uint secaddrbytes;  /* bytes per sector address */
 		uint idbytes;       /* the number ID bytes that this chip outputs */
@@ -689,7 +688,6 @@ static int init_nandsim(struct mtd_info *mtd)
 	ns->geom.totszoob = ns->geom.totsz + (uint64_t)ns->geom.pgnum * ns->geom.oobsz;
 	ns->geom.secshift = ffs(ns->geom.secsz) - 1;
 	ns->geom.pgshift  = chip->page_shift;
-	ns->geom.oobshift = ffs(ns->geom.oobsz) - 1;
 	ns->geom.pgsec    = ns->geom.secsz / ns->geom.pgsz;
 	ns->geom.secszoob = ns->geom.secsz + ns->geom.oobsz * ns->geom.pgsec;
 	ns->options = 0;
@@ -773,7 +771,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	printk("bus width: %u\n",               ns->busw);
 	printk("bits in sector size: %u\n",     ns->geom.secshift);
 	printk("bits in page size: %u\n",       ns->geom.pgshift);
-	printk("bits in OOB size: %u\n",	ns->geom.oobshift);
+	printk("bits in OOB size: %u\n",	ffs(ns->geom.oobsz) - 1);
 	printk("flash size with OOB: %llu KiB\n",
 			(unsigned long long)ns->geom.totszoob >> 10);
 	printk("page address bytes: %u\n",      ns->geom.pgaddrbytes);
-- 
1.8.3.1
