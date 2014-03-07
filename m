Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLuQd-0008AQ-JU
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 13:03:10 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v6 3/4] mtd: devices: elm: configure parallel channels based
 on ecc_steps
Date: Fri, 7 Mar 2014 18:32:23 +0530
Message-ID: <1394197344-9468-4-git-send-email-pekon@ti.com>
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

Though ELM hardware can process upto maximum of 8 channels in parallel for
ECC error detection. But actual number of channels need to be processed in
parallel depends on ecc_steps (for page mode configuration).

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/devices/elm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index f59c100..43fd81d 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -174,7 +174,7 @@ static void elm_load_syndrome(struct elm_info *info,
 	int i, offset;
 	u32 val;
 
-	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
+	for (i = 0; i < info->ecc_steps; i++) {
 
 		/* Check error reported */
 		if (err_vec[i].error_reported) {
@@ -242,7 +242,7 @@ static void elm_start_processing(struct elm_info *info,
 	 * Set syndrome vector valid, so that ELM module
 	 * will process it for vectors error is reported
 	 */
-	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
+	for (i = 0; i < info->ecc_steps; i++) {
 		if (err_vec[i].error_reported) {
 			offset = ELM_SYNDROME_FRAGMENT_6 +
 				SYNDROME_FRAGMENT_REG_SIZE * i;
@@ -271,7 +271,7 @@ static void elm_error_correction(struct elm_info *info,
 	int offset;
 	u32 reg_val;
 
-	for (i = 0; i < ERROR_VECTOR_MAX; i++) {
+	for (i = 0; i < info->ecc_steps; i++) {
 
 		/* Check error reported */
 		if (err_vec[i].error_reported) {
-- 
1.8.5.1.163.gd7aced9
