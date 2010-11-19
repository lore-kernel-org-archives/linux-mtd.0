Received: from devils.ext.ti.com ([198.47.26.153])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PJSDY-0007j3-Rb
	for linux-mtd@lists.infradead.org; Fri, 19 Nov 2010 14:45:39 +0000
From: Sukumar Ghorai <s-ghorai@ti.com>
To: linux-omap@vger.kernel.org
Subject: [PATCH V2] omap: nand: remove hardware ECC as default
Date: Fri, 19 Nov 2010 20:15:26 +0530
Message-Id: <1290177926-3526-1-git-send-email-s-ghorai@ti.com>
Cc: linux-mtd@lists.infradead.org, Sukumar Ghorai <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CONFIG_MTD_NAND_OMAP_HWECC defined wrongly in patch submitted for 2.6.36.
This flag enables hw ecc by default. Boards like beagle and pandora uses
sw ecc for write (e.g. binary flushed from u-boot) and read from kernel.
https://patchwork.kernel.org/patch/111036/

Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>
---
 drivers/mtd/nand/omap2.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index cd41c58..15682ec 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -7,7 +7,6 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
  */
-#define CONFIG_MTD_NAND_OMAP_HWECC
 
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
-- 
1.7.0.4
