Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg1AN-0003t5-L0
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 03:31:05 +0000
Received: by mail-pg0-x242.google.com with SMTP id s67so5215980pgb.1
 for <linux-mtd@lists.infradead.org>; Mon, 20 Feb 2017 19:30:42 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: f.fainelli@gmail.com, richard@nod.at, marek.vasut@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, cyrille.pitchen@atmel.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH V3,
 1/2] mtd: nand: brcmnand: Change brcmnand_set_wp() prototype
Date: Mon, 20 Feb 2017 22:30:31 -0500
Message-Id: <1487647832-10544-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changing brcmnand_set_wp() prototype in prepration for refactoring the nand
write protect logic to add flash status byte check for the protection bit.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 42ebd73..c7c4efe 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -765,11 +765,14 @@ enum {
 	CS_SELECT_AUTO_DEVICE_ID_CFG		= BIT(30),
 };
 
-static inline void brcmnand_set_wp(struct brcmnand_controller *ctrl, bool en)
+static int brcmnand_set_wp(struct brcmnand_host *host, int en)
 {
+	struct brcmnand_controller *ctrl = host->ctrl;
 	u32 val = en ? CS_SELECT_NAND_WP : 0;
 
 	brcmnand_rmw_reg(ctrl, BRCMNAND_CS_SELECT, CS_SELECT_NAND_WP, 0, val);
+
+	return 0;
 }
 
 /***********************************************************************
@@ -1029,7 +1032,7 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
 			dev_dbg(ctrl->dev, "WP %s\n", wp ? "on" : "off");
 			old_wp = wp;
 		}
-		brcmnand_set_wp(ctrl, wp);
+		brcmnand_set_wp(host, wp);
 	}
 }
 
@@ -2462,14 +2465,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	/* Disable XOR addressing */
 	brcmnand_rmw_reg(ctrl, BRCMNAND_CS_XOR, 0xff, 0, 0);
 
-	if (ctrl->features & BRCMNAND_HAS_WP) {
-		/* Permanently disable write protection */
-		if (wp_on == 2)
-			brcmnand_set_wp(ctrl, false);
-	} else {
-		wp_on = 0;
-	}
-
 	/* IRQ */
 	ctrl->irq = platform_get_irq(pdev, 0);
 	if ((int)ctrl->irq < 0) {
@@ -2522,6 +2517,18 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			}
 
 			list_add_tail(&host->node, &ctrl->host_list);
+
+			if (ctrl->features & BRCMNAND_HAS_WP) {
+				/* Permanently disable write protection */
+				if (wp_on == 2) {
+					ret = brcmnand_set_wp(host, false);
+					if (ret)
+						goto err;
+				}
+			} else {
+				wp_on = 0;
+			}
+
 		}
 	}
 
-- 
1.9.1
