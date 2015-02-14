Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YMcqG-0003Fh-8a
 for linux-mtd@lists.infradead.org; Sat, 14 Feb 2015 13:33:06 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 3/3] mtd: nand: sunxi: define NAND controller ops instead
 of assigning chip functions
Date: Sat, 14 Feb 2015 14:32:38 +0100
Message-Id: <1423920758-1556-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1423920758-1556-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1423920758-1556-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that we have NAND controller operations we can assign them once in
the NAND controller probe function and rely on these ops for all NAND
chips attached to this controller.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/sunxi_nand.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
index ccaa8e2..43fb2ab 100644
--- a/drivers/mtd/nand/sunxi_nand.c
+++ b/drivers/mtd/nand/sunxi_nand.c
@@ -1235,11 +1235,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	/* Default tR value specified in the ONFI spec (chapter 4.15.1) */
 	nand->chip_delay = 200;
 	nand->controller = &nfc->controller;
-	nand->select_chip = sunxi_nfc_select_chip;
-	nand->cmd_ctrl = sunxi_nfc_cmd_ctrl;
-	nand->read_buf = sunxi_nfc_read_buf;
-	nand->write_buf = sunxi_nfc_write_buf;
-	nand->read_byte = sunxi_nfc_read_byte;
 
 	if (of_get_nand_on_flash_bbt(np))
 		nand->bbt_options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
@@ -1317,6 +1312,15 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 	}
 }
 
+static const struct nand_controller_ops sunxi_nfc_ops = {
+	.select_chip = sunxi_nfc_select_chip,
+	.cmd_ctrl = sunxi_nfc_cmd_ctrl,
+	.read_buf = sunxi_nfc_read_buf,
+	.write_buf = sunxi_nfc_write_buf,
+	.read_byte = sunxi_nfc_read_byte,
+	.waitfunc = nand_wait,
+};
+
 static int sunxi_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1330,6 +1334,7 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	nfc->dev = dev;
+	nfc->controller.ops = &sunxi_nfc_ops;
 	spin_lock_init(&nfc->controller.lock);
 	init_waitqueue_head(&nfc->controller.wq);
 	INIT_LIST_HEAD(&nfc->chips);
-- 
1.9.1
