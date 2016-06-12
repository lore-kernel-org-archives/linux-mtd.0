Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bC2Tk-0001nw-TZ
 for linux-mtd@lists.infradead.org; Sun, 12 Jun 2016 10:18:53 +0000
Received: by mail-wm0-x242.google.com with SMTP id r5so8235445wmr.0
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jun 2016 03:18:32 -0700 (PDT)
Received: from desktop.wvd.kresin.me (p5DDC653E.dip0.t-ipconnect.de.
 [93.220.101.62])
 by smtp.gmail.com with ESMTPSA id j2sm14088901wjz.15.2016.06.12.03.18.30
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 12 Jun 2016 03:18:30 -0700 (PDT)
From: Mathias Kresin <dev@kresin.me>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nandsim: use the existing output macros
Date: Sun, 12 Jun 2016 12:18:26 +0200
Message-Id: <1465726706-12630-1-git-send-email-dev@kresin.me>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Without using the output macros, it isn't possible to suppress these
messages on the console by specifying an appropriate console log level.

Signed-off-by: Mathias Kresin <dev@kresin.me>
---
 drivers/mtd/nand/nandsim.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 1eb9344..3cfcc5e 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -769,22 +769,22 @@ static int __init init_nandsim(struct mtd_info *mtd)
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
 
 	if ((ret = alloc_device(ns)) != 0)
 		return ret;
-- 
1.9.1
