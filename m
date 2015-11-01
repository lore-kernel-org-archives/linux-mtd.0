Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zt1fO-0002ot-9a
 for linux-mtd@lists.infradead.org; Sun, 01 Nov 2015 23:04:03 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>,
 Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 12/11] mtd: nand: convert to nand_get_flash_node()
Date: Mon,  2 Nov 2015 00:03:38 +0100
Message-Id: <1446419018-31435-1-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Used semantic patch with 'make coccicheck MODE=patch COCCI=script.cocci':

---8<----
virtual patch

@@
struct nand_chip c;
struct nand_chip *cp;
@@
(
-(cp)->flash_node
+nand_get_flash_node(cp)
|
-(c).flash_node
+nand_get_flash_node(&c)
)
---8<----

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
Hi Brian,

I think this patch could be part of your series too.

Best Regards,

Boris

 drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
 drivers/mtd/nand/nand_base.c         | 6 +++---
 drivers/mtd/nand/vf610_nfc.c         | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index a37659d..2a437c7 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1816,7 +1816,7 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 
 	memset(cfg, 0, sizeof(*cfg));
 
-	ret = of_property_read_u32(chip->flash_node,
+	ret = of_property_read_u32(nand_get_flash_node(chip),
 				   "brcm,nand-oob-sector-size",
 				   &oob_sector);
 	if (ret) {
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 939ab3d..4ac4efe 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3989,11 +3989,11 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	struct nand_flash_dev *type;
 	int ret;
 
-	if (chip->flash_node) {
+	if (nand_get_flash_node(chip)) {
 		/* MTD can automatically handle DT partitions, etc. */
-		mtd_set_of_node(mtd, chip->flash_node);
+		mtd_set_of_node(mtd, nand_get_flash_node(chip));
 
-		ret = nand_dt_init(mtd, chip, chip->flash_node);
+		ret = nand_dt_init(mtd, chip, nand_get_flash_node(chip));
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index b6df4c6..1c86c6b 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -707,7 +707,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	for_each_available_child_of_node(nfc->dev->of_node, child) {
 		if (of_device_is_compatible(child, "fsl,vf610-nfc-nandcs")) {
 
-			if (chip->flash_node) {
+			if (nand_get_flash_node(chip)) {
 				dev_err(nfc->dev,
 					"Only one NAND chip supported!\n");
 				err = -EINVAL;
@@ -718,7 +718,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (!chip->flash_node) {
+	if (!nand_get_flash_node(chip)) {
 		dev_err(nfc->dev, "NAND chip sub-node missing!\n");
 		err = -ENODEV;
 		goto err_clk;
@@ -814,7 +814,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	return mtd_device_register(mtd, NULL, 0);
 
 error:
-	of_node_put(chip->flash_node);
+	of_node_put(nand_get_flash_node(chip));
 err_clk:
 	clk_disable_unprepare(nfc->clk);
 	return err;
-- 
2.1.4
