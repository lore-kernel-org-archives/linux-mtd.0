Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJ7zV-0002ZL-1G
	for linux-mtd@lists.infradead.org; Mon, 31 May 2010 16:37:29 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: mpc5121_nfc.c: Fix build failures
Date: Mon, 31 May 2010 18:37:15 +0200
Message-Id: <1275323836-15711-1-git-send-email-agust@denx.de>
Cc: Grant Likely <grant.likely@secretlab.ca>,
	Anatolij Gustschin <agust@denx.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes build errors caused by the:
 - OF device_node pointer being moved into struct device
 - removal of the match_table field from struct of_platform_driver

Signed-off-by: Anatolij Gustschin <agust@denx.de>
Cc: Grant Likely <grant.likely@secretlab.ca>
---
 drivers/mtd/nand/mpc5121_nfc.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 3d0867d..0a130dc 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -650,7 +650,7 @@ static void mpc5121_nfc_free(struct device *dev, struct mtd_info *mtd)
 static int __devinit mpc5121_nfc_probe(struct of_device *op,
 					const struct of_device_id *match)
 {
-	struct device_node *rootnode, *dn = op->node;
+	struct device_node *rootnode, *dn = op->dev.of_node;
 	struct device *dev = &op->dev;
 	struct mpc5121_nfc_prv *prv;
 	struct resource res;
@@ -889,12 +889,12 @@ static struct of_device_id mpc5121_nfc_match[] __devinitdata = {
 };
 
 static struct of_platform_driver mpc5121_nfc_driver = {
-	.match_table	= mpc5121_nfc_match,
 	.probe		= mpc5121_nfc_probe,
 	.remove		= __devexit_p(mpc5121_nfc_remove),
 	.driver		= {
-		.name	= DRV_NAME,
-		.owner	= THIS_MODULE,
+		.name = DRV_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table = mpc5121_nfc_match,
 	},
 };
 
-- 
1.7.0.4
