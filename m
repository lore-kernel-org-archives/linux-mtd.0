Received: from mo31.po.2iij.net ([210.128.50.54])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8S5x-0001SE-1U
	for linux-mtd@lists.infradead.org; Tue, 10 Jul 2007 22:38:26 -0400
Date: Wed, 11 Jul 2007 11:36:56 +0900
From: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] MTD: remove Ocelot G support
Message-Id: <20070711113656.1e34cfda.yoichi_yuasa@tripeaks.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Ralf Baechle <ralf@linux-mips.org>, yoichi_yuasa@tripeaks.co.jp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This patch has removed Ocelot G support from MTD.
Ocelot G support has already removed since May 2007.

Signed-off-by: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>

---
diff -pruN -X generic/Documentation/dontdiff generic-orig/drivers/mtd/devices/docprobe.c generic/drivers/mtd/devices/docprobe.c
--- generic-orig/drivers/mtd/devices/docprobe.c	2007-07-11 10:56:21.860678500 +0900
+++ generic/drivers/mtd/devices/docprobe.c	2007-07-11 11:06:49.270809000 +0900
@@ -84,8 +84,6 @@ static unsigned long __initdata doc_loca
 #elif defined(CONFIG_MOMENCO_OCELOT)
 	0x2f000000,
         0xff000000,
-#elif defined(CONFIG_MOMENCO_OCELOT_G)
-        0xff000000,
 ##else
 #warning Unknown architecture for DiskOnChip. No default probe locations defined
 #endif
diff -pruN -X generic/Documentation/dontdiff generic-orig/drivers/mtd/nand/diskonchip.c generic/drivers/mtd/nand/diskonchip.c
--- generic-orig/drivers/mtd/nand/diskonchip.c	2007-07-11 10:56:26.096943250 +0900
+++ generic/drivers/mtd/nand/diskonchip.c	2007-07-11 11:06:15.204680000 +0900
@@ -59,8 +59,6 @@ static unsigned long __initdata doc_loca
 #elif defined(CONFIG_MOMENCO_OCELOT)
 	0x2f000000,
 	0xff000000,
-#elif defined(CONFIG_MOMENCO_OCELOT_G)
-	0xff000000,
 #else
 #warning Unknown architecture for DiskOnChip. No default probe locations defined
 #endif
