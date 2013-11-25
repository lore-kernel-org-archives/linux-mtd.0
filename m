Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vkt6w-0001Fj-N8
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 10:09:53 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brain Norris <computersforpeace@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
Subject: [PATCH v4 4/4] mtd: devices: elm: add checks ELM H/W constrains,
 driver code cleanup
Date: Mon, 25 Nov 2013 15:39:01 +0530
Message-ID: <1385374141-10934-5-git-send-email-pekon@ti.com>
In-Reply-To: <1385374141-10934-1-git-send-email-pekon@ti.com>
References: <1385374141-10934-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 ezequiel.garcia@free-electrons.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ELM H/W engine is used by BCHx_ECC schemes for detecting and locating bit-flips.
However, ELM H/W engine has some constrains like:
- ELM can decode errors in chunks of 512 data bytes only
- ELM can operate max upto 8 such buffers in parallel

This patch
- add checks for above constrains
- fixes ELM register configs based on number of info->eccsteps
- cleans-up elm_load_syndrome()

Signed-off-by: Pekon Gupta <pekon@ti.com>
Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/devices/elm.c         | 127 +++++++++++++++++++++++---------------
 drivers/mtd/nand/omap2.c          |   2 +-
 include/linux/platform_data/elm.h |   6 +-
 3 files changed, 83 insertions(+), 52 deletions(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index d1dd6a3..10026ef 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -15,6 +15,9 @@
  *
  */
 
+#define	DRIVER_NAME	"omap-elm"
+#define pr_fmt(fmt)	DRIVER_NAME ": " fmt
+
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
@@ -22,6 +25,8 @@
 #include <linux/of.h>
 #include <linux/sched.h>
 #include <linux/pm_runtime.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/nand.h>
 #include <linux/platform_data/elm.h>
 
 #define ELM_SYSCONFIG			0x010
@@ -82,6 +87,7 @@ struct elm_info {
 	void __iomem *elm_base;
 	struct completion elm_completion;
 	struct list_head list;
+	struct mtd_info *mtd;
 	enum bch_ecc bch_type;
 	struct elm_registers elm_regs;
 };
@@ -103,19 +109,41 @@ static u32 elm_read_reg(struct elm_info *info, int offset)
  * @dev:	ELM device
  * @bch_type:	Type of BCH ecc
  */
-int elm_config(struct device *dev, enum bch_ecc bch_type)
+int elm_config(struct device *dev, struct mtd_info *mtd,
+		enum bch_ecc bch_type)
 {
 	u32 reg_val;
-	struct elm_info *info = dev_get_drvdata(dev);
-
+	struct elm_info	 *info;
+	struct nand_chip *nand_chip;
+	if (!dev) {
+		pr_err("ELM device not found\n");
+		return -ENODEV;
+	}
+	info = dev_get_drvdata(dev);
 	if (!info) {
-		dev_err(dev, "Unable to configure elm - device not probed?\n");
+		pr_err("ELM device data not found\n");
 		return -ENODEV;
 	}
-
+	if (!mtd) {
+		pr_err("MTD device not found\n");
+		return -ENODEV;
+	}
+	nand_chip = mtd->priv;
+	/* ELM supports error correction in chunks of 512bytes of data only
+	 * where each 512bytes of data has its own ECC syndrome */
+	if (nand_chip->ecc.size != 512) {
+		pr_err("invalid config ecc-size=%d", nand_chip->ecc.size);
+		return -EINVAL;
+	}
+	if (mtd->writesize > 4096) {
+		pr_err("unsupported page-size=%d > 4096", mtd->writesize);
+		return -EINVAL;
+	}
+	/* populate ELM driver configurations from MTD device data */
+	info->mtd	= mtd;
+	info->bch_type	= bch_type;
 	reg_val = (bch_type & ECC_BCH_LEVEL_MASK) | (ELM_ECC_SIZE << 16);
 	elm_write_reg(info, ELM_LOCATION_CONFIG, reg_val);
-	info->bch_type = bch_type;
 
 	return 0;
 }
@@ -152,55 +180,52 @@ static void elm_configure_page_mode(struct elm_info *info, int index,
  * Load syndrome fragment registers with calculated ecc in reverse order.
  */
 static void elm_load_syndrome(struct elm_info *info,
-		struct elm_errorvec *err_vec, u8 *ecc)
+		struct elm_errorvec *err_vec, u8 *ecc_calc)
 {
+	struct nand_chip *nand_chip	= info->mtd->priv;
+	unsigned int eccbytes		= nand_chip->ecc.bytes;
+	unsigned int eccsteps		= nand_chip->ecc.steps;
+	u8 *ecc = ecc_calc;
 	int i, offset;
 	u32 val;
 
-	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
-
+	for (i = 0; i < eccsteps; i++) {
 		/* Check error reported */
 		if (err_vec[i].error_reported) {
 			elm_configure_page_mode(info, i, true);
-			offset = ELM_SYNDROME_FRAGMENT_0 +
-				SYNDROME_FRAGMENT_REG_SIZE * i;
-
-			/* BCH8 */
-			if (info->bch_type) {
-
-				/* syndrome fragment 0 = ecc[9-12B] */
-				val = cpu_to_be32(*(u32 *) &ecc[9]);
-				elm_write_reg(info, offset, val);
-
-				/* syndrome fragment 1 = ecc[5-8B] */
-				offset += 4;
-				val = cpu_to_be32(*(u32 *) &ecc[5]);
-				elm_write_reg(info, offset, val);
-
-				/* syndrome fragment 2 = ecc[1-4B] */
-				offset += 4;
-				val = cpu_to_be32(*(u32 *) &ecc[1]);
-				elm_write_reg(info, offset, val);
-
-				/* syndrome fragment 3 = ecc[0B] */
-				offset += 4;
-				val = ecc[0];
-				elm_write_reg(info, offset, val);
-			} else {
-				/* syndrome fragment 0 = ecc[20-52b] bits */
-				val = (cpu_to_be32(*(u32 *) &ecc[3]) >> 4) |
-					((ecc[2] & 0xf) << 28);
-				elm_write_reg(info, offset, val);
-
-				/* syndrome fragment 1 = ecc[0-20b] bits */
-				offset += 4;
-				val = cpu_to_be32(*(u32 *) &ecc[0]) >> 12;
-				elm_write_reg(info, offset, val);
+			offset = SYNDROME_FRAGMENT_REG_SIZE * i;
+			ecc = ecc_calc + (i * eccbytes);
+			switch (info->bch_type) {
+			case BCH4_ECC:
+				val =	((*(ecc + 6) >>  4) & 0x0F) |
+					*(ecc +  5) <<  4 | *(ecc +  4) << 12 |
+					*(ecc +  3) << 20 | *(ecc +  2) << 28;
+				elm_write_reg(info, (ELM_SYNDROME_FRAGMENT_0 +
+						 offset), cpu_to_le32(val));
+				val =	((*(ecc + 2) >>  4) & 0x0F) |
+					*(ecc +  1) <<  4 | *(ecc +  0) << 12;
+				elm_write_reg(info, (ELM_SYNDROME_FRAGMENT_1 +
+						 offset), cpu_to_le32(val));
+				break;
+			case BCH8_ECC:
+				val =	*(ecc + 12) << 0  | *(ecc + 11) <<  8 |
+					*(ecc + 10) << 16 | *(ecc +  9) << 24;
+				elm_write_reg(info, (ELM_SYNDROME_FRAGMENT_0 +
+						 offset), cpu_to_le32(val));
+				val =	*(ecc +  8) <<  0 | *(ecc +  7) <<  8 |
+					*(ecc +  6) << 16 | *(ecc +  5) << 24;
+				elm_write_reg(info, (ELM_SYNDROME_FRAGMENT_1 +
+						 offset), cpu_to_le32(val));
+				val =	*(ecc +  4) <<  0 | *(ecc +  3) <<  8 |
+					*(ecc +  2) << 16 | *(ecc +  1) << 24;
+				elm_write_reg(info, (ELM_SYNDROME_FRAGMENT_2 +
+						 offset), cpu_to_le32(val));
+				val =	*(ecc +  0) <<  0 & 0x000000FF;
+				elm_write_reg(info, (ELM_SYNDROME_FRAGMENT_3 +
+						 offset), cpu_to_le32(val));
+				break;
 			}
 		}
-
-		/* Update ecc pointer with ecc byte size */
-		ecc += info->bch_type ? BCH8_SIZE : BCH4_SIZE;
 	}
 }
 
@@ -216,6 +241,8 @@ static void elm_load_syndrome(struct elm_info *info,
 static void elm_start_processing(struct elm_info *info,
 		struct elm_errorvec *err_vec)
 {
+	struct nand_chip *nand_chip	= info->mtd->priv;
+	unsigned int eccsteps		= nand_chip->ecc.steps;
 	int i, offset;
 	u32 reg_val;
 
@@ -223,7 +250,7 @@ static void elm_start_processing(struct elm_info *info,
 	 * Set syndrome vector valid, so that ELM module
 	 * will process it for vectors error is reported
 	 */
-	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
+	for (i = 0; i < eccsteps; i++) {
 		if (err_vec[i].error_reported) {
 			offset = ELM_SYNDROME_FRAGMENT_6 +
 				SYNDROME_FRAGMENT_REG_SIZE * i;
@@ -248,11 +275,13 @@ static void elm_start_processing(struct elm_info *info,
 static void elm_error_correction(struct elm_info *info,
 		struct elm_errorvec *err_vec)
 {
+	struct nand_chip *nand_chip	= info->mtd->priv;
+	unsigned int eccsteps		= nand_chip->ecc.steps;
 	int i, j, errors = 0;
 	int offset;
 	u32 reg_val;
 
-	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
+	for (i = 0; i < eccsteps; i++) {
 
 		/* Check error reported */
 		if (err_vec[i].error_reported) {
@@ -505,7 +534,7 @@ MODULE_DEVICE_TABLE(of, elm_of_match);
 
 static struct platform_driver elm_driver = {
 	.driver	= {
-		.name	= "elm",
+		.name	= DRIVER_NAME,
 		.owner	= THIS_MODULE,
 		.of_match_table = of_match_ptr(elm_of_match),
 		.pm	= &elm_pm_ops,
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index f34b99c..37852cda5 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1389,7 +1389,7 @@ static int is_elm_present(struct omap_nand_info *info,
 	}
 	/* ELM module available, now configure it */
 	info->elm_dev = &pdev->dev;
-	if (elm_config(info->elm_dev, bch_type))
+	if (elm_config(info->elm_dev, &info->mtd, bch_type))
 		return -ENODEV;
 	return 0;
 }
diff --git a/include/linux/platform_data/elm.h b/include/linux/platform_data/elm.h
index bf0a83b..d16465b 100644
--- a/include/linux/platform_data/elm.h
+++ b/include/linux/platform_data/elm.h
@@ -25,6 +25,7 @@ enum bch_ecc {
 
 /* ELM support 8 error syndrome process */
 #define ERROR_VECTOR_MAX		8
+#define ELM_MAX_DETECTABLE_ERRORS	16
 
 #define BCH8_ECC_OOB_BYTES		13
 #define BCH4_ECC_OOB_BYTES		7
@@ -45,10 +46,11 @@ struct elm_errorvec {
 	bool error_reported;
 	bool error_uncorrectable;
 	int error_count;
-	int error_loc[ERROR_VECTOR_MAX];
+	int error_loc[ELM_MAX_DETECTABLE_ERRORS];
 };
 
 void elm_decode_bch_error_page(struct device *dev, u8 *ecc_calc,
 		struct elm_errorvec *err_vec);
-int elm_config(struct device *dev, enum bch_ecc bch_type);
+int elm_config(struct device *dev, struct mtd_info *mtd,
+		enum bch_ecc bch_type);
 #endif /* __ELM_H */
-- 
1.8.1
