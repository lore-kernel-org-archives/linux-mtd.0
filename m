Received: from svenfoo.org ([82.94.215.22] helo=mail.zonque.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCImY-0005fF-3g
 for linux-mtd@lists.infradead.org; Sun, 03 Mar 2013 23:57:37 +0000
From: Daniel Mack <zonque@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: devices: elm: check for device's presence before
 configuration
Date: Mon,  4 Mar 2013 00:57:20 +0100
Message-Id: <1362355040-27344-1-git-send-email-zonque@gmail.com>
Cc: dwmw2@infradead.org, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Daniel Mack <zonque@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In case the driver is not probed - due to config mismatches or errors
in the DTS files - dev_get_drvdata() returns NULL, leading to an Ooops
during boot.

Make elm_config() return an error in such cases to propagate the error
up to the user, so it can fall back to software mode.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Cc: Philip Avinash <avinashphilip@ti.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: Peter Korsgaard <jacmet@sunsite.dk>
---
 drivers/mtd/devices/elm.c         | 9 ++++++++-
 drivers/mtd/nand/omap2.c          | 5 +++--
 include/linux/platform_data/elm.h | 2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index 2ec5da9..dccef9f 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -81,14 +81,21 @@ static u32 elm_read_reg(struct elm_info *info, int offset)
  * @dev:	ELM device
  * @bch_type:	Type of BCH ecc
  */
-void elm_config(struct device *dev, enum bch_ecc bch_type)
+int elm_config(struct device *dev, enum bch_ecc bch_type)
 {
 	u32 reg_val;
 	struct elm_info *info = dev_get_drvdata(dev);
 
+	if (!info) {
+		dev_err(dev, "Unable to configure elm - device not probed?\n");
+		return -ENODEV;
+	}
+
 	reg_val = (bch_type & ECC_BCH_LEVEL_MASK) | (ELM_ECC_SIZE << 16);
 	elm_write_reg(info, ELM_LOCATION_CONFIG, reg_val);
 	info->bch_type = bch_type;
+
+	return 0;
 }
 EXPORT_SYMBOL(elm_config);
 
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 8e820dd..b97ef3b 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1701,8 +1701,9 @@ static int omap3_init_bch(struct mtd_info *mtd, int ecc_opt)
 		elm_node = of_find_node_by_phandle(be32_to_cpup(parp));
 		pdev = of_find_device_by_node(elm_node);
 		info->elm_dev = &pdev->dev;
-		elm_config(info->elm_dev, bch_type);
-		info->is_elm_used = true;
+
+		if (elm_config(info->elm_dev, bch_type) == 0)
+			info->is_elm_used = true;
 	}
 
 	if (info->is_elm_used && (mtd->writesize <= 4096)) {
diff --git a/include/linux/platform_data/elm.h b/include/linux/platform_data/elm.h
index 1bd5244..bf0a83b 100644
--- a/include/linux/platform_data/elm.h
+++ b/include/linux/platform_data/elm.h
@@ -50,5 +50,5 @@ struct elm_errorvec {
 
 void elm_decode_bch_error_page(struct device *dev, u8 *ecc_calc,
 		struct elm_errorvec *err_vec);
-void elm_config(struct device *dev, enum bch_ecc bch_type);
+int elm_config(struct device *dev, enum bch_ecc bch_type);
 #endif /* __ELM_H */
-- 
1.8.1.4
