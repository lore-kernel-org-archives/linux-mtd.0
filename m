Date: Fri, 15 Aug 2014 19:46:44 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Message-ID: <2056273149.70335.1408150004992.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH 1/2] mtd: fsl_ifc_nand: Use devm_* throughout driver
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For consistency, use managed resources for allocations and remaps
throughout the driver.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 2338124..7861909 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -997,9 +997,6 @@ static int fsl_ifc_chip_remove(struct fsl_ifc_mtd *priv)
 
 	kfree(priv->mtd.name);
 
-	if (priv->vbase)
-		iounmap(priv->vbase);
-
 	ifc_nand_ctrl->chips[priv->bank] = NULL;
 
 	return 0;
@@ -1062,7 +1059,8 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 
 	mutex_lock(&fsl_ifc_nand_mutex);
 	if (!fsl_ifc_ctrl_dev->nand) {
-		ifc_nand_ctrl = kzalloc(sizeof(*ifc_nand_ctrl), GFP_KERNEL);
+		ifc_nand_ctrl = devm_kzalloc(&dev->dev,
+					sizeof(*ifc_nand_ctrl), GFP_KERNEL);
 		if (!ifc_nand_ctrl) {
 			mutex_unlock(&fsl_ifc_nand_mutex);
 			return -ENOMEM;
@@ -1085,7 +1083,7 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	priv->ctrl = fsl_ifc_ctrl_dev;
 	priv->dev = &dev->dev;
 
-	priv->vbase = ioremap(res.start, resource_size(&res));
+	priv->vbase = devm_ioremap(priv->dev, res.start, resource_size(&res));
 	if (!priv->vbase) {
 		dev_err(priv->dev, "%s: failed to map chip region\n", __func__);
 		ret = -ENOMEM;
@@ -1148,10 +1146,8 @@ static int fsl_ifc_nand_remove(struct platform_device *dev)
 
 	mutex_lock(&fsl_ifc_nand_mutex);
 	ifc_nand_ctrl->counter--;
-	if (!ifc_nand_ctrl->counter) {
+	if (!ifc_nand_ctrl->counter)
 		fsl_ifc_ctrl_dev->nand = NULL;
-		kfree(ifc_nand_ctrl);
-	}
 	mutex_unlock(&fsl_ifc_nand_mutex);
 
 	return 0;
-- 
1.9.1
