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
Subject: [PATCH 07/12] mtd: nand: hisi504: rely on generic DT parsing done in
 nand_scan_ident()
Date: Fri,  1 Apr 2016 14:54:27 +0200
Message-Id: <1459515272-31011-8-git-send-email-boris.brezillon@free-electrons.com>
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
 drivers/mtd/nand/hisi504_nand.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
index 96502b6..38cdc84 100644
--- a/drivers/mtd/nand/hisi504_nand.c
+++ b/drivers/mtd/nand/hisi504_nand.c
@@ -19,7 +19,6 @@
  * GNU General Public License for more details.
  */
 #include <linux/of.h>
-#include <linux/of_mtd.h>
 #include <linux/mtd/mtd.h>
 #include <linux/sizes.h>
 #include <linux/clk.h>
@@ -642,10 +641,9 @@ static int hisi_nfc_ecc_probe(struct hinfc_host *host)
 	struct device *dev = host->dev;
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct device_node *np = host->dev->of_node;
 
-	size = of_get_nand_ecc_step_size(np);
-	strength = of_get_nand_ecc_strength(np);
+	size = chip->ecc.size;
+	strength = chip->ecc.strength;
 	if (size != 1024) {
 		dev_err(dev, "error ecc size: %d\n", size);
 		return -EINVAL;
@@ -695,7 +693,7 @@ static int hisi_nfc_ecc_probe(struct hinfc_host *host)
 
 static int hisi_nfc_probe(struct platform_device *pdev)
 {
-	int ret = 0, irq, buswidth, flag, max_chips = HINFC504_MAX_CHIP;
+	int ret = 0, irq, flag, max_chips = HINFC504_MAX_CHIP;
 	struct device *dev = &pdev->dev;
 	struct hinfc_host *host;
 	struct nand_chip  *chip;
@@ -747,12 +745,6 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	chip->read_buf		= hisi_nfc_read_buf;
 	chip->chip_delay	= HINFC504_CHIP_DELAY;
 
-	chip->ecc.mode = of_get_nand_ecc_mode(np);
-
-	buswidth = of_get_nand_bus_width(np);
-	if (buswidth == 16)
-		chip->options |= NAND_BUSWIDTH_16;
-
 	hisi_nfc_host_init(host);
 
 	ret = devm_request_irq(dev, irq, hinfc_irq_handle, 0x0, "nandc", host);
-- 
2.5.0
