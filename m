From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Han Xu <han.xu@nxp.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>
Cc: linux-omap@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Zhou Wang <wangzhou1@hisilicon.com>, Alex Smith <alex.smith@imgtec.com>,
 Harvey Hunt <harvey.hunt@imgtec.com>
Subject: [PATCH 06/12] mtd: nand: gpmi: rely on generic DT parsing done in
 nand_scan_ident()
Date: Fri,  1 Apr 2016 14:54:26 +0200
Message-Id: <1459515272-31011-7-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1459515272-31011-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1459515272-31011-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The core now takes care of parsing generic DT properties in
nand_scan_ident() when nand_set_flash_node() has been called.
Rely on this initialization instead of calling of_get_nand_xxx()
manually.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 8122c69..c6e8a1c 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -25,7 +25,6 @@
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/of_mtd.h>
 #include "gpmi-nand.h"
 #include "bch-regs.h"
 
@@ -1914,16 +1913,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	/* Set up swap_block_mark, must be set before the gpmi_set_geometry() */
 	this->swap_block_mark = !GPMI_IS_MX23(this);
 
-	if (of_get_nand_on_flash_bbt(this->dev->of_node)) {
-		chip->bbt_options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
-
-		if (of_property_read_bool(this->dev->of_node,
-						"fsl,no-blockmark-swap"))
-			this->swap_block_mark = false;
-	}
-	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
-		this->swap_block_mark ? "en" : "dis");
-
 	/*
 	 * Allocate a temporary DMA buffer for reading ID in the
 	 * nand_scan_ident().
@@ -1938,6 +1927,16 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
+	if (chip->bbt_options & NAND_BBT_USE_FLASH) {
+		chip->bbt_options |= NAND_BBT_NO_OOB;
+
+		if (of_property_read_bool(this->dev->of_node,
+						"fsl,no-blockmark-swap"))
+			this->swap_block_mark = false;
+	}
+	dev_dbg(this->dev, "Blockmark swapping %sabled\n",
+		this->swap_block_mark ? "en" : "dis");
+
 	ret = gpmi_init_last(this);
 	if (ret)
 		goto err_out;
-- 
2.5.0
