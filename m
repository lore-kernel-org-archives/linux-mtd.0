Received: from xes-mad.com ([216.165.139.218])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMQ45-00075o-Tp
 for linux-mtd@lists.infradead.org; Tue, 26 Aug 2014 23:22:14 +0000
Date: Tue, 26 Aug 2014 18:18:33 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Message-ID: <264587069.465984.1409095113566.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <1560704347.463292.1409093361997.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH v3] fsl_ifc: Support all 8 IFC chip selects
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Scott Wood <scottwood@freescale.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Freescale's QorIQ T Series processors support 8 IFC chip selects
within a memory map backward compatible with previous P Series
processors which supported only 4 chip selects.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 Note: v1 and v2 patches were submitted to Linux PPC mailing list

 v3: * IFC version register read only once
     * fsl_ifc_version and fsl_ifc_bank_count inline functions replaced
       by version and banks members of struct fsl_ifc_ctrl
     * IFC version print moved from fsl_ifc_nand.c to fsl_ifc.c

 drivers/memory/fsl_ifc.c        | 13 +++++++++++--
 drivers/mtd/nand/fsl_ifc_nand.c | 10 ++++------
 include/linux/fsl_ifc.h         | 21 ++++++++++++++++-----
 3 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index 3d5d792..410c397 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -61,7 +61,7 @@ int fsl_ifc_find(phys_addr_t addr_base)
 	if (!fsl_ifc_ctrl_dev || !fsl_ifc_ctrl_dev->regs)
 		return -ENODEV;
 
-	for (i = 0; i < ARRAY_SIZE(fsl_ifc_ctrl_dev->regs->cspr_cs); i++) {
+	for (i = 0; i < fsl_ifc_ctrl_dev->banks; i++) {
 		u32 cspr = in_be32(&fsl_ifc_ctrl_dev->regs->cspr_cs[i].cspr);
 		if (cspr & CSPR_V && (cspr & CSPR_BA) ==
 				convert_ifc_address(addr_base))
@@ -213,7 +213,7 @@ static irqreturn_t fsl_ifc_ctrl_irq(int irqno, void *data)
 static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 {
 	int ret = 0;
-
+	int version, banks;
 
 	dev_info(&dev->dev, "Freescale Integrated Flash Controller\n");
 
@@ -231,6 +231,15 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 		goto err;
 	}
 
+	version = ioread32be(&fsl_ifc_ctrl_dev->regs->ifc_rev) &
+			FSL_IFC_VERSION_MASK;
+	banks = (version == FSL_IFC_VERSION_1_0_0) ? 4 : 8;
+	dev_info(&dev->dev, "IFC version %d.%d, %d banks\n",
+		version >> 24, (version >> 16) & 0xf, banks);
+
+	fsl_ifc_ctrl_dev->version = version;
+	fsl_ifc_ctrl_dev->banks = banks;
+
 	/* get the Controller level irq */
 	fsl_ifc_ctrl_dev->irq = irq_of_parse_and_map(dev->dev.of_node, 0);
 	if (fsl_ifc_ctrl_dev->irq == NO_IRQ) {
diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 2338124..4d40fdb 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -31,7 +31,6 @@
 #include <linux/mtd/nand_ecc.h>
 #include <linux/fsl_ifc.h>
 
-#define FSL_IFC_V1_1_0	0x01010000
 #define ERR_BYTE		0xFF /* Value returned for read
 					bytes when read failed	*/
 #define IFC_TIMEOUT_MSECS	500  /* Maximum number of mSecs to wait
@@ -877,7 +876,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	struct fsl_ifc_regs __iomem *ifc = ctrl->regs;
 	struct nand_chip *chip = &priv->chip;
 	struct nand_ecclayout *layout;
-	u32 csor, ver;
+	u32 csor;
 
 	/* Fill in fsl_ifc_mtd structure */
 	priv->mtd.priv = chip;
@@ -984,8 +983,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 		chip->ecc.mode = NAND_ECC_SOFT;
 	}
 
-	ver = ioread32be(&ifc->ifc_rev);
-	if (ver == FSL_IFC_V1_1_0)
+	if (ctrl->version == FSL_IFC_VERSION_1_1_0)
 		fsl_ifc_sram_init(priv);
 
 	return 0;
@@ -1045,12 +1043,12 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 	}
 
 	/* find which chip select it is connected to */
-	for (bank = 0; bank < FSL_IFC_BANK_COUNT; bank++) {
+	for (bank = 0; bank < fsl_ifc_ctrl_dev->banks; bank++) {
 		if (match_bank(ifc, bank, res.start))
 			break;
 	}
 
-	if (bank >= FSL_IFC_BANK_COUNT) {
+	if (bank >= fsl_ifc_ctrl_dev->banks) {
 		dev_err(&dev->dev, "%s: address did not match any chip selects\n",
 			__func__);
 		return -ENODEV;
diff --git a/include/linux/fsl_ifc.h b/include/linux/fsl_ifc.h
index 84d60cb..bf0321e 100644
--- a/include/linux/fsl_ifc.h
+++ b/include/linux/fsl_ifc.h
@@ -29,7 +29,16 @@
 #include <linux/of_platform.h>
 #include <linux/interrupt.h>
 
-#define FSL_IFC_BANK_COUNT 4
+/*
+ * The actual number of banks implemented depends on the IFC version
+ *    - IFC version 1.0 implements 4 banks.
+ *    - IFC version 1.1 onward implements 8 banks.
+ */
+#define FSL_IFC_BANK_COUNT 8
+
+#define FSL_IFC_VERSION_MASK	0x0F0F0000
+#define FSL_IFC_VERSION_1_0_0	0x01000000
+#define FSL_IFC_VERSION_1_1_0	0x01010000
 
 /*
  * CSPR - Chip Select Property Register
@@ -776,23 +785,23 @@ struct fsl_ifc_regs {
 		__be32 cspr;
 		u32 res2;
 	} cspr_cs[FSL_IFC_BANK_COUNT];
-	u32 res3[0x19];
+	u32 res3[0xd];
 	struct {
 		__be32 amask;
 		u32 res4[0x2];
 	} amask_cs[FSL_IFC_BANK_COUNT];
-	u32 res5[0x18];
+	u32 res5[0xc];
 	struct {
 		__be32 csor;
 		__be32 csor_ext;
 		u32 res6;
 	} csor_cs[FSL_IFC_BANK_COUNT];
-	u32 res7[0x18];
+	u32 res7[0xc];
 	struct {
 		__be32 ftim[4];
 		u32 res8[0x8];
 	} ftim_cs[FSL_IFC_BANK_COUNT];
-	u32 res9[0x60];
+	u32 res9[0x30];
 	__be32 rb_stat;
 	u32 res10[0x2];
 	__be32 ifc_gcr;
@@ -827,6 +836,8 @@ struct fsl_ifc_ctrl {
 	int				nand_irq;
 	spinlock_t			lock;
 	void				*nand;
+	int				version;
+	int				banks;
 
 	u32 nand_stat;
 	wait_queue_head_t nand_wait;
-- 
1.9.1
