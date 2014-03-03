Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKQuq-00043Z-T8
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 11:20:14 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 2/4] mtd: devices: elm: clean elm_load_syndrome
Date: Mon, 3 Mar 2014 16:49:21 +0530
Message-ID: <1393845563-7800-3-git-send-email-pekon@ti.com>
In-Reply-To: <1393845563-7800-1-git-send-email-pekon@ti.com>
References: <1393845563-7800-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Felipe Balbi <balbi@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
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
 drivers/mtd/devices/elm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

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
 
-- 
1.8.5.1.163.gd7aced9
