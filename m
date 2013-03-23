Received: from arrakis.dune.hu ([78.24.191.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UJOAu-0001rw-UB
 for linux-mtd@lists.infradead.org; Sat, 23 Mar 2013 13:07:58 +0000
From: Jonas Gorski <jogo@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] MTD: bcm63xxpart: use size macro for CFE block size
Date: Sat, 23 Mar 2013 14:07:47 +0100
Message-Id: <1364044070-10486-2-git-send-email-jogo@openwrt.org>
In-Reply-To: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
References: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Maxime Bizon <mbizon@freebox.fr>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
 drivers/mtd/bcm63xxpart.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 6eeb84c..fc3d7d0 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -27,6 +27,7 @@
 #include <linux/crc32.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include <linux/mtd/mtd.h>
@@ -37,7 +38,7 @@
 
 #define BCM63XX_EXTENDED_SIZE	0xBFC00000	/* Extended flash address */
 
-#define BCM63XX_CFE_BLOCK_SIZE	0x10000		/* always at least 64KiB */
+#define BCM63XX_CFE_BLOCK_SIZE	SZ_64K		/* always at least 64KiB */
 
 #define BCM63XX_CFE_MAGIC_OFFSET 0x4e0
 
-- 
1.7.10.4
