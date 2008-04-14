Received: from smtp6.pp.htv.fi ([213.243.153.40])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlPYQ-0002mM-IV
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 14:21:06 +0000
Date: Mon, 14 Apr 2008 17:20:02 +0300
From: Adrian Bunk <bunk@kernel.org>
To: dwmw2@infradead.org
Subject: [2.6 patch] mtdram.c should #include <linux/mtd/mtdram.h>
Message-ID: <20080414142002.GQ6695@cs181133002.pp.htv.fi>
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

Every file should include the headers containing the externs for its 
global functions (in this case for mtdram_init_device()).

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
57fa07eda198d4f8a780000f99212ca7a83be2a1 diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index e427c82..bf485ff 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -17,6 +17,7 @@
 #include <linux/init.h>
 #include <linux/mtd/compatmac.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/mtdram.h>
 
 static unsigned long total_size = CONFIG_MTDRAM_TOTAL_SIZE;
 static unsigned long erase_size = CONFIG_MTDRAM_ERASE_SIZE;
