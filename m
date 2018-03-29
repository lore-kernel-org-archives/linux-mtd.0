From: Peter Rosin <peda@axentia.se>
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mtd: nand: raw: atmel: add module param to avoid using dma
Date: Thu, 29 Mar 2018 15:10:54 +0200
Message-Id: <20180329131054.22506-1-peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On a sama5d31 with a Full-HD dual LVDS panel (132MHz pixel clock) NAND
flash accesses have a tendency to cause display disturbances. Add a
module param to disable DMA from the NAND controller, since that fixes
the display problem for me.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index b2f00b398490..2ff7a77c7b8e 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -129,6 +129,11 @@
 #define DEFAULT_TIMEOUT_MS			1000
 #define MIN_DMA_LEN				128
 
+static bool atmel_nand_avoid_dma __read_mostly;
+
+MODULE_PARM_DESC(avoiddma, "Avoid using DMA");
+module_param_named(avoiddma, atmel_nand_avoid_dma, bool, 0400);
+
 enum atmel_nand_rb_type {
 	ATMEL_NAND_NO_RB,
 	ATMEL_NAND_NATIVE_RB,
@@ -1977,7 +1982,7 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 		return ret;
 	}
 
-	if (nc->caps->has_dma) {
+	if (nc->caps->has_dma && !atmel_nand_avoid_dma) {
 		dma_cap_mask_t mask;
 
 		dma_cap_zero(mask);
-- 
2.11.0
