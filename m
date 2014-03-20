Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQXJB-000527-Uh
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 07:22:35 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v7 2/4] mtd: devices: elm: clean elm_load_syndrome
Date: Thu, 20 Mar 2014 12:51:56 +0530
Message-ID: <1395300118-32202-3-git-send-email-pekon@ti.com>
In-Reply-To: <1395300118-32202-1-git-send-email-pekon@ti.com>
References: <1395300118-32202-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 - replace ECC_BYTES* macros with ecc->bytes
 - Add scalability for future ecc-schemes

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/devices/elm.c         | 18 +++++++++++-------
 include/linux/platform_data/elm.h |  7 -------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index 1dcfe86..a19a833 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -84,6 +84,7 @@ struct elm_info {
 	struct list_head list;
 	enum bch_ecc bch_type;
 	struct elm_registers elm_regs;
+	int ecc_step_bytes;
 };
 
 static LIST_HEAD(elm_devices);
@@ -126,7 +127,8 @@ int elm_config(struct device *dev, enum bch_ecc bch_type,
 
 	reg_val = (bch_type & ECC_BCH_LEVEL_MASK) | (ELM_ECC_SIZE << 16);
 	elm_write_reg(info, ELM_LOCATION_CONFIG, reg_val);
-	info->bch_type = bch_type;
+	info->bch_type		= bch_type;
+	info->ecc_step_bytes	= ecc_step_bytes;
 
 	return 0;
 }
@@ -175,10 +177,8 @@ static void elm_load_syndrome(struct elm_info *info,
 			elm_configure_page_mode(info, i, true);
 			offset = ELM_SYNDROME_FRAGMENT_0 +
 				SYNDROME_FRAGMENT_REG_SIZE * i;
-
-			/* BCH8 */
-			if (info->bch_type) {
-
+			switch (info->bch_type) {
+			case BCH8_ECC:
 				/* syndrome fragment 0 = ecc[9-12B] */
 				val = cpu_to_be32(*(u32 *) &ecc[9]);
 				elm_write_reg(info, offset, val);
@@ -197,7 +197,8 @@ static void elm_load_syndrome(struct elm_info *info,
 				offset += 4;
 				val = ecc[0];
 				elm_write_reg(info, offset, val);
-			} else {
+				break;
+			case BCH4_ECC:
 				/* syndrome fragment 0 = ecc[20-52b] bits */
 				val = (cpu_to_be32(*(u32 *) &ecc[3]) >> 4) |
 					((ecc[2] & 0xf) << 28);
@@ -207,11 +208,14 @@ static void elm_load_syndrome(struct elm_info *info,
 				offset += 4;
 				val = cpu_to_be32(*(u32 *) &ecc[0]) >> 12;
 				elm_write_reg(info, offset, val);
+				break;
+			default:
+				pr_err("invalid config bch_type\n");
 			}
 		}
 
 		/* Update ecc pointer with ecc byte size */
-		ecc += info->bch_type ? BCH8_SIZE : BCH4_SIZE;
+		ecc += info->ecc_step_bytes;
 	}
 }
 
diff --git a/include/linux/platform_data/elm.h b/include/linux/platform_data/elm.h
index b824ff3..dc0218d 100644
--- a/include/linux/platform_data/elm.h
+++ b/include/linux/platform_data/elm.h
@@ -26,13 +26,6 @@ enum bch_ecc {
 /* ELM support 8 error syndrome process */
 #define ERROR_VECTOR_MAX		8
 
-#define BCH8_ECC_OOB_BYTES		13
-#define BCH4_ECC_OOB_BYTES		7
-/* RBL requires 14 byte even though BCH8 uses only 13 byte */
-#define BCH8_SIZE			(BCH8_ECC_OOB_BYTES + 1)
-/* Uses 1 extra byte to handle erased pages */
-#define BCH4_SIZE			(BCH4_ECC_OOB_BYTES + 1)
-
 /**
  * struct elm_errorvec - error vector for elm
  * @error_reported:		set true for vectors error is reported
-- 
1.8.5.1.163.gd7aced9
