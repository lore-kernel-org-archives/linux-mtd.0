Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WI3xi-0004hA-8E
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 22:25:23 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 1/2] of_mtd: Add helpers to get ECC strength and ECC step
 size
Date: Mon, 24 Feb 2014 19:24:48 -0300
Message-Id: <1393280689-24267-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1393280689-24267-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393280689-24267-1-git-send-email-ezequiel.garcia@free-electrons.com>
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

Acked-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
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
index cb32d9c..e266caa 100644
--- a/include/linux/of_mtd.h
+++ b/include/linux/of_mtd.h
@@ -13,6 +13,8 @@
 
 #include <linux/of.h>
 int of_get_nand_ecc_mode(struct device_node *np);
+int of_get_nand_ecc_step_size(struct device_node *np);
+int of_get_nand_ecc_strength(struct device_node *np);
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
