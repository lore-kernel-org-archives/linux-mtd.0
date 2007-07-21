Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ICGUZ-00062J-9P
	for linux-mtd@lists.infradead.org; Sat, 21 Jul 2007 11:03:37 -0400
Received: by ug-out-1314.google.com with SMTP id m2so770776ugc
	for <linux-mtd@lists.infradead.org>;
	Sat, 21 Jul 2007 08:03:33 -0700 (PDT)
From: Jesper Juhl <jesper.juhl@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH][11/37] Clean up duplicate includes in drivers/mtd/
Date: Sat, 21 Jul 2007 17:02:36 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200707211702.37086.jesper.juhl@gmail.com>
Cc: Jesper Juhl <jesper.juhl@gmail.com>, Thayne Harbaugh <tharbaugh@lnxi.com>,
	linux-mtd@lists.infradead.org, Mike Lavender <mike@steroidmicros.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Thies Moeller <thies.moeller@baslerweb.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch cleans up duplicate includes in
	drivers/mtd/


Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 58e561e..f8aa287 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -17,7 +17,6 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
-#include <linux/init.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 78c2511..474a55e 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -19,7 +19,6 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
-#include <linux/interrupt.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/spi/spi.h>
diff --git a/drivers/mtd/nand/excite_nandflash.c b/drivers/mtd/nand/excite_nandflash.c
index 7e9afc4..bed8729 100644
--- a/drivers/mtd/nand/excite_nandflash.c
+++ b/drivers/mtd/nand/excite_nandflash.c
@@ -27,7 +27,6 @@
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/kernel.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
