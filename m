Received: from mail-bn1bon0136.outbound.protection.outlook.com
 ([157.56.111.136] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8eEQ-0006zv-Cm
 for linux-mtd@lists.infradead.org; Sat, 27 Jun 2015 00:44:31 +0000
From: Scott Wood <scottwood@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: Fix NAND_USE_BOUNCE_BUFFER flag conflict
Date: Fri, 26 Jun 2015 19:43:58 -0500
Message-ID: <1435365838-10940-1-git-send-email-scottwood@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Scott Wood <scottwood@freescale.com>, Kamal Dasu <kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 66507c7bc8895f0da6b ("mtd: nand: Add support to use nand_base
poi databuf as bounce buffer") added a flag NAND_USE_BOUNCE_BUFFER
using the same bit value as the existing NAND_BUSWIDTH_AUTO.

Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Fixes: 66507c7bc8895f0da6b ("mtd: nand: Add support to use nand_base
	poi databuf as bounce buffer")
Signed-off-by: Scott Wood <scottwood@freescale.com>
---
 include/linux/mtd/nand.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3d4ea7e..12b75f3 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -176,17 +176,17 @@ typedef enum {
 /* Chip may not exist, so silence any errors in scan */
 #define NAND_SCAN_SILENT_NODEV	0x00040000
 /*
- * This option could be defined by controller drivers to protect against
- * kmap'ed, vmalloc'ed highmem buffers being passed from upper layers
- */
-#define NAND_USE_BOUNCE_BUFFER	0x00080000
-/*
  * Autodetect nand buswidth with readid/onfi.
  * This suppose the driver will configure the hardware in 8 bits mode
  * when calling nand_scan_ident, and update its configuration
  * before calling nand_scan_tail.
  */
 #define NAND_BUSWIDTH_AUTO      0x00080000
+/*
+ * This option could be defined by controller drivers to protect against
+ * kmap'ed, vmalloc'ed highmem buffers being passed from upper layers
+ */
+#define NAND_USE_BOUNCE_BUFFER	0x00100000
 
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
-- 
2.1.4
