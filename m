Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeCo-0006oJ-RH
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:52:43 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Mathias Kresin <dev@kresin.me>, Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 26/46] mtd: nandsim: use the existing output macros
Date: Wed, 21 Sep 2016 11:52:24 +0200
Message-Id: <15ae05cf4d4508dbd20d9f2ccf45a9ce6b633264.1474450296.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mathias Kresin <dev@kresin.me>

Without using the output macros, it isn't possible to suppress these
messages on the console by specifying an appropriate console log level.

Signed-off-by: Mathias Kresin <dev@kresin.me>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index f8e5687..7a95802 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -957,22 +957,22 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 	if (ns->busw == 16)
 		NS_WARN("16-bit flashes support wasn't tested\n");
 
-	printk("flash size: %llu MiB\n",
+	NS_INFO("flash size: %llu MiB\n",
 			(unsigned long long)ns->geom.totsz >> 20);
-	printk("page size: %u bytes\n",         ns->geom.pgsz);
-	printk("OOB area size: %u bytes\n",     ns->geom.oobsz);
-	printk("sector size: %u KiB\n",         ns->geom.secsz >> 10);
-	printk("pages number: %u\n",            ns->geom.pgnum);
-	printk("pages per sector: %u\n",        ns->geom.pgsec);
-	printk("bus width: %u\n",               ns->busw);
-	printk("bits in sector size: %u\n",     ns->geom.secshift);
-	printk("bits in page size: %u\n",       ns->geom.pgshift);
-	printk("bits in OOB size: %u\n",	ffs(ns->geom.oobsz) - 1);
-	printk("flash size with OOB: %llu KiB\n",
+	NS_INFO("page size: %u bytes\n",         ns->geom.pgsz);
+	NS_INFO("OOB area size: %u bytes\n",     ns->geom.oobsz);
+	NS_INFO("sector size: %u KiB\n",         ns->geom.secsz >> 10);
+	NS_INFO("pages number: %u\n",            ns->geom.pgnum);
+	NS_INFO("pages per sector: %u\n",        ns->geom.pgsec);
+	NS_INFO("bus width: %u\n",               ns->busw);
+	NS_INFO("bits in sector size: %u\n",     ns->geom.secshift);
+	NS_INFO("bits in page size: %u\n",       ns->geom.pgshift);
+	NS_INFO("bits in OOB size: %u\n",	ffs(ns->geom.oobsz) - 1);
+	NS_INFO("flash size with OOB: %llu KiB\n",
 			(unsigned long long)ns->geom.totszoob >> 10);
-	printk("page address bytes: %u\n",      ns->geom.pgaddrbytes);
-	printk("sector address bytes: %u\n",    ns->geom.secaddrbytes);
-	printk("options: %#x\n",                ns->options);
+	NS_INFO("page address bytes: %u\n",      ns->geom.pgaddrbytes);
+	NS_INFO("sector address bytes: %u\n",    ns->geom.secaddrbytes);
+	NS_INFO("options: %#x\n",                ns->options);
 
 	ns->bops = nsparam->bops;
 
-- 
2.8.3
