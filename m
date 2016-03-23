Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiftC-0004uC-Mb
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2016 10:19:51 +0000
Received: by mail-lb0-x22c.google.com with SMTP id oe12so6749647lbc.0
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2016 03:19:26 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2 2/4] of: mtd: prepare helper reading NAND ECC algo from DT
Date: Wed, 23 Mar 2016 11:19:01 +0100
Message-Id: <1458728343-1234-3-git-send-email-zajec5@gmail.com>
In-Reply-To: <1458728343-1234-1-git-send-email-zajec5@gmail.com>
References: <1458728343-1234-1-git-send-email-zajec5@gmail.com>
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

NAND subsystem is being slightly reworked to store ECC details in
separated fields. In future we'll want to add support for more DT
properties as specifying every possible setup with a single
"nand-ecc-mode" is a pretty bad idea.
To allow this let's add a helper that will support something like
"nand-ecc-algo" in future. Right now we use it for keeping backward
compatibility.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/of/of_mtd.c    | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/of_mtd.h |  6 ++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index b7361ed..15d056e 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -50,6 +50,42 @@ int of_get_nand_ecc_mode(struct device_node *np)
 EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);
 
 /**
+ * of_get_nand_ecc_algo - Get nand ecc algorithm for given device_node
+ * @np:	Pointer to the given device_node
+ *
+ * The function gets ecc algorithm and returns its enum value, or errno in error
+ * case.
+ */
+int of_get_nand_ecc_algo(struct device_node *np)
+{
+	const char *pm;
+	int err;
+
+	/*
+	 * TODO: Read ECC algo OF property and map it to enum nand_ecc_algo.
+	 * It's not implemented yet as currently NAND subsystem ignores
+	 * algorithm explicitly set this way. Once it's handled we should
+	 * document & support new property.
+	 */
+
+	/*
+	 * For backward compatibility we also read "nand-ecc-mode" checking
+	 * for some obsoleted values that were specifying ECC algorithm.
+	 */
+	err = of_property_read_string(np, "nand-ecc-mode", &pm);
+	if (err < 0)
+		return err;
+
+	if (!strcasecmp(pm, "soft"))
+		return NAND_ECC_HAMMING;
+	else if (!strcasecmp(pm, "soft_bch"))
+		return NAND_ECC_BCH;
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(of_get_nand_ecc_algo);
+
+/**
  * of_get_nand_ecc_step_size - Get ECC step size associated to
  * the required ECC strength (see below).
  * @np:	Pointer to the given device_node
diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
index e266caa..0f6aca5 100644
--- a/include/linux/of_mtd.h
+++ b/include/linux/of_mtd.h
@@ -13,6 +13,7 @@
 
 #include <linux/of.h>
 int of_get_nand_ecc_mode(struct device_node *np);
+int of_get_nand_ecc_algo(struct device_node *np);
 int of_get_nand_ecc_step_size(struct device_node *np);
 int of_get_nand_ecc_strength(struct device_node *np);
 int of_get_nand_bus_width(struct device_node *np);
@@ -25,6 +26,11 @@ static inline int of_get_nand_ecc_mode(struct device_node *np)
 	return -ENOSYS;
 }
 
+static inline int of_get_nand_ecc_algo(struct device_node *np)
+{
+	return -ENOSYS;
+}
+
 static inline int of_get_nand_ecc_step_size(struct device_node *np)
 {
 	return -ENOSYS;
-- 
1.8.4.5
