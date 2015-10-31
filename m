Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsMvf-0005Dx-JY
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 03:34:10 +0000
Received: by pasz6 with SMTP id z6so91124794pas.2
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 20:33:47 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
Subject: [PATCH v2 04/11] mtd: nand: convert to nand_set_flash_node()
Date: Fri, 30 Oct 2015 20:33:23 -0700
Message-Id: <1446262410-45754-5-git-send-email-computersforpeace@gmail.com>
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
struct nand_chip *c;
struct device_node *d;
@@
-(c)->flash_node = (d)
+nand_set_flash_node(c, d)
---8<----

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: new

 drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
 drivers/mtd/nand/fsmc_nand.c         | 2 +-
 drivers/mtd/nand/sunxi_nand.c        | 2 +-
 drivers/mtd/nand/vf610_nfc.c         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 12c6190c6e33..7bd4102fde42 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1925,7 +1925,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
 	mtd = &host->mtd;
 	chip = &host->chip;
 
-	chip->flash_node = dn;
+	nand_set_flash_node(chip, dn);
 	chip->priv = host;
 	mtd->priv = chip;
 	mtd->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "brcmnand.%d",
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 07af3dc7a4d2..6f9e422e947e 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1033,7 +1033,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand->options = pdata->options;
 	nand->select_chip = fsmc_select_chip;
 	nand->badblockbits = 7;
-	nand->flash_node = np;
+	nand_set_flash_node(nand, np);
 
 	if (pdata->width == FSMC_NAND_BW16)
 		nand->options |= NAND_BUSWIDTH_16;
diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index ef46ac66248b..df62c637c25e 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1330,7 +1330,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	 * in the DT.
 	 */
 	nand->ecc.mode = NAND_ECC_HW;
-	nand->flash_node = np;
+	nand_set_flash_node(nand, np);
 	nand->select_chip = sunxi_nfc_select_chip;
 	nand->cmd_ctrl = sunxi_nfc_cmd_ctrl;
 	nand->read_buf = sunxi_nfc_read_buf;
diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 8805d6325579..7b952abf4722 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -714,7 +714,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 				goto error;
 			}
 
-			chip->flash_node = child;
+			nand_set_flash_node(chip, child);
 		}
 	}
 
-- 
2.6.0.rc2.230.g3dd15c0
