Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yu0hB-00015Z-D8
 for linux-mtd@lists.infradead.org; Sun, 17 May 2015 15:41:43 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: computersforpeace@gmail.com
Subject: [PATCH 2/7] mtd: brcmnand: do not make local variable static
Date: Sun, 17 May 2015 17:41:01 +0200
Message-Id: <1431877266-28566-3-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
 zajec5@gmail.com, linux-mtd@lists.infradead.org,
 Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove static in front of ctrl. This variable should not be shared
between different instances of brcmnand_probe(), it should be local to
this function and stored on the stack.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index bae30ab..a48ad49 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -2069,7 +2069,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *dn = dev->of_node, *child;
-	static struct brcmnand_controller *ctrl;
+	struct brcmnand_controller *ctrl;
 	struct resource *res;
 	int ret;
 
-- 
2.1.4
