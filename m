Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yq3dQ-0004BQ-Ck
 for linux-mtd@lists.infradead.org; Wed, 06 May 2015 18:01:31 +0000
Received: by pabsx10 with SMTP id sx10so15942253pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 06 May 2015 11:01:09 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 07/10] mtd: brcsmtb_nand_soc: add support for BCM63138
Date: Wed,  6 May 2015 10:59:51 -0700
Message-Id: <1430935194-7579-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This SoC just has its custom interrupt status bits.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/brcmstb_nand_soc.c | 69 +++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/mtd/nand/brcmstb_nand_soc.c b/drivers/mtd/nand/brcmstb_nand_soc.c
index 970912c690a7..c878334edb1a 100644
--- a/drivers/mtd/nand/brcmstb_nand_soc.c
+++ b/drivers/mtd/nand/brcmstb_nand_soc.c
@@ -28,7 +28,76 @@ struct brcmnand_soc_ofdata {
 	void (*prepare_data_bus)(struct brcmnand_soc *soc, bool prepare);
 };
 
+struct bcm63138_nand_soc_priv {
+	void __iomem *base;
+};
+
+#define BCM63138_NAND_INT_STATUS		0x00
+#define BCM63138_NAND_INT_EN			0x04
+
+enum {
+	BCM63138_CTLRDY		= BIT(4),
+};
+
+static bool bcm63138_nand_intc_ack(struct brcmnand_soc *soc)
+{
+	struct bcm63138_nand_soc_priv *priv = soc->priv;
+	void __iomem *mmio = priv->base + BCM63138_NAND_INT_STATUS;
+	u32 val = __raw_readl(mmio);
+
+	if (val & BCM63138_CTLRDY) {
+		__raw_writel(val & ~BCM63138_CTLRDY, mmio);
+		return true;
+	}
+
+	return false;
+}
+
+static void bcm63138_nand_intc_set(struct brcmnand_soc *soc, bool en)
+{
+	struct bcm63138_nand_soc_priv *priv = soc->priv;
+	void __iomem *mmio = priv->base + BCM63138_NAND_INT_EN;
+	u32 val = __raw_readl(mmio);
+
+	if (en)
+		val |= BCM63138_CTLRDY;
+	else
+		val &= ~BCM63138_CTLRDY;
+
+	__raw_writel(val, mmio);
+}
+
+static int bcm63138_nand_soc_init(struct brcmnand_soc *soc)
+{
+	struct bcm63138_nand_soc_priv *priv;
+
+	priv = devm_kzalloc(soc->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = of_io_request_and_map(soc->dn, 0, DRV_NAME);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	soc->priv = priv;
+
+	/* Clear the interrupt */
+	bcm63138_nand_intc_ack(soc);
+
+	return 0;
+}
+
+static const struct brcmnand_soc_ofdata bcm63138_nand_soc = {
+	.init			= bcm63138_nand_soc_init,
+	.ctlrdy_ack		= bcm63138_nand_intc_ack,
+	.ctlrdy_set_enabled	= bcm63138_nand_intc_set,
+};
+
 static const struct of_device_id brcmnand_soc_ofmatch[] = {
+	{
+		.compatible	= "brcm,nand-soc-bcm63138",
+		.data		= &bcm63138_nand_soc,
+	},
 	{},
 };
 
-- 
1.9.1
