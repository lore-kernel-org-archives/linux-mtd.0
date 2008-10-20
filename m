Received: from ti-out-0910.google.com ([209.85.142.189])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ks3Jv-0007we-1p
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 22:33:51 +0000
Received: by ti-out-0910.google.com with SMTP id a21so1031754tia.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 15:33:48 -0700 (PDT)
Date: Tue, 21 Oct 2008 06:33:42 +0800
From: Huang Weiyi <weiyi.huang@gmail.com>
To: dwmw2@infradead.org,
 David.Woodhouse@intel.com
Subject: [MTD] [NAND] OMAP2: remove duplicated #include
Message-Id: <20081021063034.DBB4.WEIYI.HUANG@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Removed duplicated #include <asm/arch/gpmc.h> in 
drivers/mtd/onenand/omap2.c.

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 8387e05..e39b21d 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -38,7 +38,6 @@
 #include <asm/arch/gpmc.h>
 #include <asm/arch/onenand.h>
 #include <asm/arch/gpio.h>
-#include <asm/arch/gpmc.h>
 #include <asm/arch/pm.h>

 #include <linux/dma-mapping.h>
