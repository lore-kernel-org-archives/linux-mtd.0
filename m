Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFpll-0002Yc-7t
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 18:51:50 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 1/2] of_mtd: Add helpers to get ECC strength and ECC step
 size
Date: Tue, 18 Feb 2014 15:51:13 -0300
Message-Id: <1392749474-12936-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1392749474-12936-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1392749474-12936-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Grant Likely <grant.likely@secretlab.ca>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adds simple helpers to obtain the devicetree properties
that specify the ECC strength and ECC step size to use on a given
NAND controller.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/of/of_mtd.c    | 34 ++++++++++++++++++++++++++++++++++
 include/linux/of_mtd.h | 12 ++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index a27ec94..b7361ed 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -50,6 +50,40 @@ int of_get_nand_ecc_mode(struct device_node *np)
 EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);
 
 /**
+ * of_get_nand_ecc_step_size - Get ECC step size associated to
+ * the required ECC strength (see below).
+ * @np:	Pointer to the given device_node
+ *
+ * return the ECC step size, or errno in error case.
+ */
+int of_get_nand_ecc_step_size(struct device_node *np)
+{
+	int ret;
+	u32 val;
+
+	ret = of_property_read_u32(np, "nand-ecc-step-size", &val);
+	return ret ? ret : val;
+}
+EXPORT_SYMBOL_GPL(of_get_nand_ecc_step_size);
+
+/**
+ * of_get_nand_ecc_strength - Get required ECC strength over the
+ * correspnding step size as defined by 'nand-ecc-size'
+ * @np:	Pointer to the given device_node
+ *
+ * return the ECC strength, or errno in error case.
+ */
+int of_get_nand_ecc_strength(struct device_node *np)
+{
+	int ret;
+	u32 val;
+
+	ret = of_property_read_u32(np, "nand-ecc-strength", &val);
+	return ret ? ret : val;
+}
+EXPORT_SYMBOL_GPL(of_get_nand_ecc_strength);
+
+/**
  * of_get_nand_bus_width - Get nand bus witdh for given device_node
  * @np:	Pointer to the given device_node
  *
diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
index cb32d9c..c078f99 100644
--- a/include/linux/of_mtd.h
+++ b/include/linux/of_mtd.h
@@ -13,6 +13,8 @@
 
 #include <linux/of.h>
 int of_get_nand_ecc_mode(struct device_node *np);
+int of_get_nand_ecc_step_size(struct device_node *np)
+int of_get_nand_ecc_strength(struct device_node *np)
 int of_get_nand_bus_width(struct device_node *np);
 bool of_get_nand_on_flash_bbt(struct device_node *np);
 
@@ -23,6 +25,16 @@ static inline int of_get_nand_ecc_mode(struct device_node *np)
 	return -ENOSYS;
 }
 
+static inline int of_get_nand_ecc_step_size(struct device_node *np)
+{
+	return -ENOSYS;
+}
+
+static inline int of_get_nand_ecc_strength(struct device_node *np)
+{
+	return -ENOSYS;
+}
+
 static inline int of_get_nand_bus_width(struct device_node *np)
 {
 	return -ENOSYS;
-- 
1.8.1.5
