Date: Fri, 15 Aug 2014 19:47:39 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Message-ID: <251532766.70336.1408150059026.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <2056273149.70335.1408150004992.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH 2/2] mtd: fsl_ifc_nand: Probe partitions OF node
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

Previously, the OF node defining the IFC NAND controller was being
passed to mtd_device_parse_register(), not the node defining the
partitions. This resulted in no OF-defined partitions being created.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 7861909..9aeb146 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -1029,7 +1029,6 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	struct device_node *node = dev->dev.of_node;
 	struct mtd_part_parser_data ppdata;
 
-	ppdata.of_node = dev->dev.of_node;
 	if (!fsl_ifc_ctrl_dev || !fsl_ifc_ctrl_dev->regs)
 		return -ENODEV;
 	ifc = fsl_ifc_ctrl_dev->regs;
@@ -1126,9 +1125,13 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 
 	/* First look for RedBoot table or partitions on the command
 	 * line, these take precedence over device tree information */
+	ppdata.of_node = of_get_next_child(dev->dev.of_node, NULL);
 	mtd_device_parse_register(&priv->mtd, part_probe_types, &ppdata,
 						NULL, 0);
 
+	if (ppdata.of_node)
+		of_node_put(ppdata.of_node);
+
 	dev_info(priv->dev, "IFC NAND device at 0x%llx, bank %d\n",
 		 (unsigned long long)res.start, priv->bank);
 	return 0;
-- 
1.9.1
