Message-Id: <200807301935.m6UJZ4RT012312@imap1.linux-foundation.org>
Subject: [patch 12/13] drivers/mtd/nand/nandsim.c: fix printk warnings
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 30 Jul 2008 12:35:04 -0700
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Andrew Morton <akpm@linux-foundation.org>

Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/nandsim.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff -puN drivers/mtd/nand/nandsim.c~drivers-mtd-nand-nandsimc-fix-printk-warnings drivers/mtd/nand/nandsim.c
--- a/drivers/mtd/nand/nandsim.c~drivers-mtd-nand-nandsimc-fix-printk-warnings
+++ a/drivers/mtd/nand/nandsim.c
@@ -586,7 +586,8 @@ static int init_nandsim(struct mtd_info 
 	if (ns->busw == 16)
 		NS_WARN("16-bit flashes support wasn't tested\n");
 
-	printk("flash size: %llu MiB\n",        ns->geom.totsz >> 20);
+	printk("flash size: %llu MiB\n",
+			(unsigned long long)ns->geom.totsz >> 20);
 	printk("page size: %u bytes\n",         ns->geom.pgsz);
 	printk("OOB area size: %u bytes\n",     ns->geom.oobsz);
 	printk("sector size: %u KiB\n",         ns->geom.secsz >> 10);
@@ -595,8 +596,9 @@ static int init_nandsim(struct mtd_info 
 	printk("bus width: %u\n",               ns->busw);
 	printk("bits in sector size: %u\n",     ns->geom.secshift);
 	printk("bits in page size: %u\n",       ns->geom.pgshift);
-	printk("bits in OOB size: %u\n",        ns->geom.oobshift);
-	printk("flash size with OOB: %llu KiB\n", ns->geom.totszoob >> 10);
+	printk("bits in OOB size: %u\n",	ns->geom.oobshift);
+	printk("flash size with OOB: %llu KiB\n",
+			(unsigned long long)ns->geom.totszoob >> 10);
 	printk("page address bytes: %u\n",      ns->geom.pgaddrbytes);
 	printk("sector address bytes: %u\n",    ns->geom.secaddrbytes);
 	printk("options: %#x\n",                ns->options);
_
