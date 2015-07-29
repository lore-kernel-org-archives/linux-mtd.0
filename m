Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKVYY-0004K5-99
 for linux-mtd@lists.infradead.org; Wed, 29 Jul 2015 17:54:19 +0000
From: Hans de Goede <hdegoede@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sunxi@googlegroups.com, Michal Suchanek <hramrach@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/4] mtd: nand: Fix NAND_* options to use unique values.
Date: Wed, 29 Jul 2015 19:53:51 +0200
Message-Id: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Michal Suchanek <hramrach@gmail.com>

NAND_BUSWIDTH_AUTO (64b37b2a6) and NAND_USE_BOUNCE_BUFFER (66507c7bc)
are the same value. Change the later introduced NAND_USE_BOUNCE_BUFFER
to a different value.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/linux/mtd/nand.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index e2d3219..67caec2 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -178,17 +178,17 @@ typedef enum {
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
-#define NAND_BUSWIDTH_AUTO      0x00080000
+#define NAND_BUSWIDTH_AUTO	0x00080000
+/*
+ * This option could be defined by controller drivers to protect against
+ * kmap'ed, vmalloc'ed highmem buffers being passed from upper layers
+ */
+#define NAND_USE_BOUNCE_BUFFER	0x00100000
 
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
-- 
2.4.3
