Received: from mail.karo-electronics.de ([81.173.242.67])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wv4xJ-0005At-PU
 for linux-mtd@lists.infradead.org; Thu, 12 Jun 2014 13:22:15 +0000
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Arnd Bergmann <arnd@arndb.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>,
 Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>,
 Russell King <linux@arm.linux.org.uk>,
 Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>, Jingoo Han <jg1.han@samsung.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>
Subject: [PATCHv4 4/5] of/mtd/nand: add generic binding and helper for
 NAND_BBT_NO_OOB_BBM
Date: Thu, 12 Jun 2014 15:20:44 +0200
Message-Id: <1402579245-13377-5-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1402579245-13377-4-git-send-email-LW@KARO-electronics.de>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-3-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-4-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

add a boolean property 'nand-no-oob-bbm' and helper function to be
able to set the NAND_BBT_NO_OOB_BBM flag in DT capable NAND drivers
and use it for i.MX and MXS nand drivers.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 Documentation/devicetree/bindings/mtd/nand.txt |    1 +
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c         |    3 +++
 drivers/mtd/nand/mxc_nand.c                    |    2 ++
 drivers/of/of_mtd.c                            |   12 ++++++++++++
 include/linux/of_mtd.h                         |    6 ++++++
 5 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index b53f92e..e46bfbe 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -5,6 +5,7 @@
   "soft_bch".
 - nand-bus-width : 8 or 16 bus width if not present 8
 - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
+- nand-no-oob-bbm: boolean to disable writing bad block markers to flash
 
 - nand-ecc-strength: integer representing the number of bits to correct
 		     per ECC step.
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 959cb9b..37537b4 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1724,6 +1724,9 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (of_get_nand_on_flash_bbt(this->dev->of_node)) {
 		chip->bbt_options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
 
+		if (of_get_nand_no_oob_bbm(this->dev->of_node))
+			chip->bbt_options |= NAND_BBT_NO_OOB_BBM;
+
 		if (of_property_read_bool(this->dev->of_node,
 						"fsl,no-blockmark-swap"))
 			this->swap_block_mark = false;
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index dba262b..bb54a2a 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1496,6 +1496,8 @@ static int mxcnd_probe(struct platform_device *pdev)
 		this->bbt_md = &bbt_mirror_descr;
 		/* update flash based bbt */
 		this->bbt_options |= NAND_BBT_USE_FLASH;
+		if (of_get_nand_no_oob_bbm(pdev->dev.of_node))
+			this->bbt_options |= NAND_BBT_NO_OOB_BBM;
 	}
 
 	init_completion(&host->op_completion);
diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index b7361ed..d947acc 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -117,3 +117,15 @@ bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return of_property_read_bool(np, "nand-on-flash-bbt");
 }
 EXPORT_SYMBOL_GPL(of_get_nand_on_flash_bbt);
+
+/**
+ * of_get_nand_no_oob_bbm - Get nand no oob bbm for given device_node
+ * @np:	Pointer to the given device_node
+ *
+ * return true if present, false otherwise
+ */
+bool of_get_nand_no_oob_bbm(struct device_node *np)
+{
+	return of_property_read_bool(np, "nand-no-oob-bbm");
+}
+EXPORT_SYMBOL_GPL(of_get_nand_no_oob_bbm);
diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
index e266caa..6ece1a9 100644
--- a/include/linux/of_mtd.h
+++ b/include/linux/of_mtd.h
@@ -17,6 +17,7 @@ int of_get_nand_ecc_step_size(struct device_node *np);
 int of_get_nand_ecc_strength(struct device_node *np);
 int of_get_nand_bus_width(struct device_node *np);
 bool of_get_nand_on_flash_bbt(struct device_node *np);
+bool of_get_nand_no_oob_bbm(struct device_node *np);
 
 #else /* CONFIG_OF_MTD */
 
@@ -45,6 +46,11 @@ static inline bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return false;
 }
 
+static inline bool of_get_nand_no_oob_bbm(struct device_node *np)
+{
+	return false;
+}
+
 #endif /* CONFIG_OF_MTD */
 
 #endif /* __LINUX_OF_MTD_H */
-- 
1.7.10.4
