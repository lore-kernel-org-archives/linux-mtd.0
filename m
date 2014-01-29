From: Boris BREZILLON <b.brezillon.dev@gmail.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 Grant Likely <grant.likely@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [RFC PATCH v2 02/14] of: mtd: add NAND ECC level requirements
 retrieval
Date: Wed, 29 Jan 2014 15:34:12 +0100
Message-Id: <1391006064-28890-3-git-send-email-b.brezillon.dev@gmail.com>
In-Reply-To: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
Cc: devicetree@vger.kernel.org, Boris BREZILLON <b.brezillon.dev@gmail.com>,
 linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some chip do not support automatic retrieval of ECC level requirements.
Provide an helper function to retrieve these requirements from DT.

Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
---
 drivers/of/of_mtd.c    |   25 +++++++++++++++++++++++++
 include/linux/of_mtd.h |    7 +++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index a27ec94..e8ced61 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -50,6 +50,31 @@ int of_get_nand_ecc_mode(struct device_node *np)
 EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);
 
 /**
+ * of_get_nand_ecc_level - Get nand ecc level for the given device_node
+ * @np:	Pointer to the given device_node
+ * @strengh: ECC strength
+ * @blk_size: ECC block size
+ *
+ * The function gets ecc level requirements from property 'nand-ecc-level'.
+ * Return 0 on success, -errno otherwise.
+ */
+int of_get_nand_ecc_level(struct device_node *np, u32 *strengh, u32 *blk_size)
+{
+	int err;
+
+	err = of_property_read_u32_index(np, "nand-ecc-level", 0, strengh);
+	if (err < 0)
+		return err;
+
+	err = of_property_read_u32_index(np, "nand-ecc-level", 1, blk_size);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_get_nand_ecc_level);
+
+/**
  * of_get_nand_bus_width - Get nand bus witdh for given device_node
  * @np:	Pointer to the given device_node
  *
diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
index 6f10e93..3bd8c3b 100644
--- a/include/linux/of_mtd.h
+++ b/include/linux/of_mtd.h
@@ -13,6 +13,7 @@
 
 #include <linux/of.h>
 int of_get_nand_ecc_mode(struct device_node *np);
+int of_get_nand_ecc_level(struct device_node *np, u32 *strengh, u32 *blk_size);
 int of_get_nand_bus_width(struct device_node *np);
 bool of_get_nand_on_flash_bbt(struct device_node *np);
 
@@ -23,6 +24,12 @@ static inline int of_get_nand_ecc_mode(struct device_node *np)
 	return -ENOSYS;
 }
 
+static inline int of_get_nand_ecc_level(struct device_node *np, u32 *strengh,
+					u32 *blk_size)
+{
+	return -ENOSYS;
+}
+
 static inline int of_get_nand_bus_width(struct device_node *np)
 {
 	return -ENOSYS;
-- 
1.7.9.5
