Received: from arrakis.dune.hu ([78.24.191.176])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXdDN-00048I-EW
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2012 19:29:06 +0000
From: Luka Perkov <luka@openwrt.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: use SQUASHFS_MAGIC from uapi/linux/magic.h
Date: Sun, 11 Nov 2012 20:32:15 +0100
Message-Id: <1352662335-12028-1-git-send-email-luka@openwrt.org>
Cc: Luka Perkov <luka@openwrt.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Luka Perkov <luka@openwrt.org>
---
 drivers/mtd/ar7part.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ar7part.c b/drivers/mtd/ar7part.c
index 9453931..7c057a0 100644
--- a/drivers/mtd/ar7part.c
+++ b/drivers/mtd/ar7part.c
@@ -26,19 +26,16 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/bootmem.h>
-#include <linux/magic.h>
 #include <linux/module.h>
 
+#include <uapi/linux/magic.h>
+
 #define AR7_PARTS	4
 #define ROOT_OFFSET	0xe0000
 
 #define LOADER_MAGIC1	le32_to_cpu(0xfeedfa42)
 #define LOADER_MAGIC2	le32_to_cpu(0xfeed1281)
 
-#ifndef SQUASHFS_MAGIC
-#define SQUASHFS_MAGIC	0x73717368
-#endif
-
 struct ar7_bin_rec {
 	unsigned int checksum;
 	unsigned int length;
-- 
1.8.0
