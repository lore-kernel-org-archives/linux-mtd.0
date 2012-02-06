Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RuNHm-000722-Ll
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2012 12:03:12 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] mtd: remove junk pmc551.h
Date: Mon,  6 Feb 2012 14:03:09 +0200
Message-Id: <1328529789-2106-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1328529789-2106-1-git-send-email-dedekind1@gmail.com>
References: <1328529789-2106-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This header is tiny and contains only pmc551-private stuff, so it should
not live in 'include/linux' - let's just merge it with pmc551.c.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/devices/pmc551.c |   40 ++++++++++++++++++++-
 include/linux/mtd/pmc551.h   |   77 ------------------------------------------
 2 files changed, 38 insertions(+), 79 deletions(-)
 delete mode 100644 include/linux/mtd/pmc551.h

diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 725198d..ced47ce 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -95,9 +95,45 @@
 #include <asm/io.h>
 #include <asm/system.h>
 #include <linux/pci.h>
-
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/pmc551.h>
+
+#define PMC551_VERSION \
+       "Ramix PMC551 PCI Mezzanine Ram Driver. (C) 1999,2000 Nortel Networks.\n"
+
+#define PCI_VENDOR_ID_V3_SEMI             0x11b0
+#define PCI_DEVICE_ID_V3_SEMI_V370PDC     0x0200
+
+#define PMC551_PCI_MEM_MAP0	0x50
+#define PMC551_PCI_MEM_MAP1	0x54
+#define PMC551_PCI_MEM_MAP_MAP_ADDR_MASK	0x3ff00000
+#define PMC551_PCI_MEM_MAP_APERTURE_MASK	0x000000f0
+#define PMC551_PCI_MEM_MAP_REG_EN		0x00000002
+#define PMC551_PCI_MEM_MAP_ENABLE		0x00000001
+
+#define PMC551_SDRAM_MA		0x60
+#define PMC551_SDRAM_CMD	0x62
+#define PMC551_DRAM_CFG		0x64
+#define PMC551_SYS_CTRL_REG	0x78
+
+#define PMC551_DRAM_BLK0	0x68
+#define PMC551_DRAM_BLK1	0x6c
+#define PMC551_DRAM_BLK2	0x70
+#define PMC551_DRAM_BLK3	0x74
+#define PMC551_DRAM_BLK_GET_SIZE(x) (524288<<((x>>4)&0x0f))
+#define PMC551_DRAM_BLK_SET_COL_MUX(x,v) (((x) & ~0x00007000) | (((v) & 0x7) << 12))
+#define PMC551_DRAM_BLK_SET_ROW_MUX(x,v) (((x) & ~0x00000f00) | (((v) & 0xf) << 8))
+
+/*
+ * Our personal and private information
+ */
+struct mypriv {
+        struct pci_dev *dev;
+        u_char *start;
+        u32    base_map0;
+        u32    curr_map0;
+        u32    asize;
+	struct mtd_info *nextpmc551;
+};
 
 static struct mtd_info *pmc551list;
 
diff --git a/include/linux/mtd/pmc551.h b/include/linux/mtd/pmc551.h
deleted file mode 100644
index da8b98d..0000000
--- a/include/linux/mtd/pmc551.h
+++ /dev/null
@@ -1,77 +0,0 @@
-/*
- * PMC551 PCI Mezzanine Ram Device
- *
- * Author:
- *       Mark Ferrell
- *       Copyright 1999,2000 Nortel Networks
- *
- * License:
- *	 As part of this driver was derrived from the slram.c driver it falls
- *	 under the same license, which is GNU General Public License v2
- */
-
-#ifndef __MTD_PMC551_H__
-#define __MTD_PMC551_H__
-
-#include <linux/mtd/mtd.h>
-
-#define PMC551_VERSION \
-       "Ramix PMC551 PCI Mezzanine Ram Driver. (C) 1999,2000 Nortel Networks.\n"
-
-/*
- * Our personal and private information
- */
-struct mypriv {
-        struct pci_dev *dev;
-        u_char *start;
-        u32    base_map0;
-        u32    curr_map0;
-        u32    asize;
-	struct mtd_info *nextpmc551;
-};
-
-/*
- * Function Prototypes
- */
-static int pmc551_erase(struct mtd_info *, struct erase_info *);
-static int pmc551_point(struct mtd_info *mtd, loff_t from, size_t len,
-		size_t *retlen, void **virt, resource_size_t *phys);
-static int pmc551_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *);
-static int pmc551_write(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
-
-
-/*
- * Define the PCI ID's if the kernel doesn't define them for us
- */
-#ifndef PCI_VENDOR_ID_V3_SEMI
-#define PCI_VENDOR_ID_V3_SEMI             0x11b0
-#endif
-
-#ifndef PCI_DEVICE_ID_V3_SEMI_V370PDC
-#define PCI_DEVICE_ID_V3_SEMI_V370PDC     0x0200
-#endif
-
-
-#define PMC551_PCI_MEM_MAP0	0x50
-#define PMC551_PCI_MEM_MAP1	0x54
-#define PMC551_PCI_MEM_MAP_MAP_ADDR_MASK	0x3ff00000
-#define PMC551_PCI_MEM_MAP_APERTURE_MASK	0x000000f0
-#define PMC551_PCI_MEM_MAP_REG_EN		0x00000002
-#define PMC551_PCI_MEM_MAP_ENABLE		0x00000001
-
-#define PMC551_SDRAM_MA		0x60
-#define PMC551_SDRAM_CMD	0x62
-#define PMC551_DRAM_CFG		0x64
-#define PMC551_SYS_CTRL_REG	0x78
-
-#define PMC551_DRAM_BLK0	0x68
-#define PMC551_DRAM_BLK1	0x6c
-#define PMC551_DRAM_BLK2	0x70
-#define PMC551_DRAM_BLK3	0x74
-#define PMC551_DRAM_BLK_GET_SIZE(x) (524288<<((x>>4)&0x0f))
-#define PMC551_DRAM_BLK_SET_COL_MUX(x,v) (((x) & ~0x00007000) | (((v) & 0x7) << 12))
-#define PMC551_DRAM_BLK_SET_ROW_MUX(x,v) (((x) & ~0x00000f00) | (((v) & 0xf) << 8))
-
-
-#endif /* __MTD_PMC551_H__ */
-
-- 
1.7.9
