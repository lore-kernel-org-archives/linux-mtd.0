Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmIPy-0008Su-HE
 for linux-mtd@lists.infradead.org; Mon, 19 May 2014 07:55:31 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Tony Lindgren
 <tony@atomide.com>
Subject: [PATCH v4 2/4] mtd: nand: omap: add support for BCH16_ECC - ELM
 driver updates
Date: Mon, 19 May 2014 13:24:40 +0530
Message-ID: <1400486082-4345-3-git-send-email-pekon@ti.com>
In-Reply-To: <1400486082-4345-1-git-send-email-pekon@ti.com>
References: <1400486082-4345-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-omap <linux-omap@vger.kernel.org>, Felipe Balbi <balbi@ti.com>,
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

ELM hardware engine is used to detect ECC errors for BCHx ecc-schemes
(like BCH4/BCH8/BCH16). This patch extends configuration of ELM registers
for adding support of BCH16_HW ecc-scheme.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/devices/elm.c         | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/platform_data/elm.h |  3 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index 1fd4a0f..8c55e0d 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -213,6 +213,28 @@ static void elm_load_syndrome(struct elm_info *info,
 				val = cpu_to_be32(*(u32 *) &ecc[0]) >> 12;
 				elm_write_reg(info, offset, val);
 				break;
+			case BCH16_ECC:
+				val = cpu_to_be32(*(u32 *) &ecc[22]);
+				elm_write_reg(info, offset, val);
+				offset += 4;
+				val = cpu_to_be32(*(u32 *) &ecc[18]);
+				elm_write_reg(info, offset, val);
+				offset += 4;
+				val = cpu_to_be32(*(u32 *) &ecc[14]);
+				elm_write_reg(info, offset, val);
+				offset += 4;
+				val = cpu_to_be32(*(u32 *) &ecc[10]);
+				elm_write_reg(info, offset, val);
+				offset += 4;
+				val = cpu_to_be32(*(u32 *) &ecc[6]);
+				elm_write_reg(info, offset, val);
+				offset += 4;
+				val = cpu_to_be32(*(u32 *) &ecc[2]);
+				elm_write_reg(info, offset, val);
+				offset += 4;
+				val = cpu_to_be32(*(u32 *) &ecc[0]) >> 16;
+				elm_write_reg(info, offset, val);
+				break;
 			default:
 				pr_err("invalid config bch_type\n");
 			}
@@ -435,6 +457,13 @@ static int elm_context_save(struct elm_info *info)
 	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
 		offset = i * SYNDROME_FRAGMENT_REG_SIZE;
 		switch (bch_type) {
+		case BCH16_ECC:
+			regs->elm_syndrome_fragment_6[i] = elm_read_reg(info,
+					ELM_SYNDROME_FRAGMENT_6 + offset);
+			regs->elm_syndrome_fragment_5[i] = elm_read_reg(info,
+					ELM_SYNDROME_FRAGMENT_5 + offset);
+			regs->elm_syndrome_fragment_4[i] = elm_read_reg(info,
+					ELM_SYNDROME_FRAGMENT_4 + offset);
 		case BCH8_ECC:
 			regs->elm_syndrome_fragment_3[i] = elm_read_reg(info,
 					ELM_SYNDROME_FRAGMENT_3 + offset);
@@ -473,6 +502,13 @@ static int elm_context_restore(struct elm_info *info)
 	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
 		offset = i * SYNDROME_FRAGMENT_REG_SIZE;
 		switch (bch_type) {
+		case BCH16_ECC:
+			elm_write_reg(info, ELM_SYNDROME_FRAGMENT_6 + offset,
+					regs->elm_syndrome_fragment_6[i]);
+			elm_write_reg(info, ELM_SYNDROME_FRAGMENT_5 + offset,
+					regs->elm_syndrome_fragment_5[i]);
+			elm_write_reg(info, ELM_SYNDROME_FRAGMENT_4 + offset,
+					regs->elm_syndrome_fragment_4[i]);
 		case BCH8_ECC:
 			elm_write_reg(info, ELM_SYNDROME_FRAGMENT_3 + offset,
 					regs->elm_syndrome_fragment_3[i]);
diff --git a/include/linux/platform_data/elm.h b/include/linux/platform_data/elm.h
index 4edb406..780d1e9 100644
--- a/include/linux/platform_data/elm.h
+++ b/include/linux/platform_data/elm.h
@@ -21,6 +21,7 @@
 enum bch_ecc {
 	BCH4_ECC = 0,
 	BCH8_ECC,
+	BCH16_ECC,
 };
 
 /* ELM support 8 error syndrome process */
@@ -38,7 +39,7 @@ struct elm_errorvec {
 	bool error_reported;
 	bool error_uncorrectable;
 	int error_count;
-	int error_loc[ERROR_VECTOR_MAX];
+	int error_loc[16];
 };
 
 void elm_decode_bch_error_page(struct device *dev, u8 *ecc_calc,
-- 
1.8.5.1.163.gd7aced9
