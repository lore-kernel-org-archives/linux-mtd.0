Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQXJ9-000528-1z
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 07:22:32 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>
Subject: [PATCH v7 3/4] mtd: devices: elm: configure parallel channels based
 on ecc_steps
Date: Thu, 20 Mar 2014 12:51:57 +0530
Message-ID: <1395300118-32202-4-git-send-email-pekon@ti.com>
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

ELM hardware can process up to maximum of 8 hannels in parallel for
ECC error detection. Currently the number of channels getting configured for
processing is static determined by macro ERROR_VECTOR_MAX. However, the actual
number of channels that need to be processed is the ECC step number.
This patch just avoids configuring extra unused channels.

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/devices/elm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index a19a833..271da6e 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -84,6 +84,7 @@ struct elm_info {
 	struct list_head list;
 	enum bch_ecc bch_type;
 	struct elm_registers elm_regs;
+	int ecc_steps;
 	int ecc_step_bytes;
 };
 
@@ -128,6 +129,7 @@ int elm_config(struct device *dev, enum bch_ecc bch_type,
 	reg_val = (bch_type & ECC_BCH_LEVEL_MASK) | (ELM_ECC_SIZE << 16);
 	elm_write_reg(info, ELM_LOCATION_CONFIG, reg_val);
 	info->bch_type		= bch_type;
+	info->ecc_steps		= ecc_steps;
 	info->ecc_step_bytes	= ecc_step_bytes;
 
 	return 0;
@@ -170,7 +172,7 @@ static void elm_load_syndrome(struct elm_info *info,
 	int i, offset;
 	u32 val;
 
-	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
+	for (i = 0; i < info->ecc_steps; i++) {
 
 		/* Check error reported */
 		if (err_vec[i].error_reported) {
@@ -238,7 +240,7 @@ static void elm_start_processing(struct elm_info *info,
 	 * Set syndrome vector valid, so that ELM module
 	 * will process it for vectors error is reported
 	 */
-	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
+	for (i = 0; i < info->ecc_steps; i++) {
 		if (err_vec[i].error_reported) {
 			offset = ELM_SYNDROME_FRAGMENT_6 +
 				SYNDROME_FRAGMENT_REG_SIZE * i;
@@ -267,7 +269,7 @@ static void elm_error_correction(struct elm_info *info,
 	int offset;
 	u32 reg_val;
 
-	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
+	for (i = 0; i < info->ecc_steps; i++) {
 
 		/* Check error reported */
 		if (err_vec[i].error_reported) {
-- 
1.8.5.1.163.gd7aced9
