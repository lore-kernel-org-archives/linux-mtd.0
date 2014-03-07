Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLuQd-0008AP-Cx
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 13:03:09 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v6 2/4] mtd: devices: elm: clean elm_load_syndrome
Date: Fri, 7 Mar 2014 18:32:22 +0530
Message-ID: <1394197344-9468-3-git-send-email-pekon@ti.com>
In-Reply-To: <1394197344-9468-1-git-send-email-pekon@ti.com>
References: <1394197344-9468-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: avinashphilipk@gmail.com, Felipe Balbi <balbi@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Roese <sr@denx.de>
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
 drivers/mtd/devices/elm.c         | 14 ++++++++------
 include/linux/platform_data/elm.h |  7 -------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index 7fda50f..f59c100 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -181,10 +181,8 @@ static void elm_load_syndrome(struct elm_info *info,
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
@@ -203,7 +201,8 @@ static void elm_load_syndrome(struct elm_info *info,
 				offset += 4;
 				val = ecc[0];
 				elm_write_reg(info, offset, val);
-			} else {
+				break;
+			case BCH4_ECC:
 				/* syndrome fragment 0 = ecc[20-52b] bits */
 				val = (cpu_to_be32(*(u32 *) &ecc[3]) >> 4) |
 					((ecc[2] & 0xf) << 28);
@@ -213,11 +212,14 @@ static void elm_load_syndrome(struct elm_info *info,
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
