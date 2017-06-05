Received: from serv1.kernkonzept.com ([88.99.87.17] helo=mx.kernkonzept.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dHoTW-0008IR-Sm
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 09:39:05 +0000
From: Matthias Lange <matthias.lange@kernkonzept.com>
To: han.xu@nxp.com, boris.brezillon@free-electrons.com, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org
Cc: Matthias Lange <matthias.lange@kernkonzept.com>
Subject: [PATCH] mtd: nand: gpmi: Fix typo in data structure name
Date: Mon,  5 Jun 2017 11:33:51 +0200
Message-Id: <1496655231-3829-1-git-send-email-matthias.lange@kernkonzept.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This makes it easier to grep.

Signed-off-by: Matthias Lange <matthias.lange@kernkonzept.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 4 ++--
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 141bd70..57ff051 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -26,7 +26,7 @@
 #include "gpmi-regs.h"
 #include "bch-regs.h"
 
-static struct timing_threshod timing_default_threshold = {
+static struct timing_threshold timing_default_threshold = {
 	.max_data_setup_cycles       = (BM_GPMI_TIMING0_DATA_SETUP >>
 						BP_GPMI_TIMING0_DATA_SETUP),
 	.internal_data_setup_in_ns   = 0,
@@ -329,7 +329,7 @@ static unsigned int ns_to_cycles(unsigned int time,
 static int gpmi_nfc_compute_hardware_timing(struct gpmi_nand_data *this,
 					struct gpmi_nfc_hardware_timing *hw)
 {
-	struct timing_threshod *nfc = &timing_default_threshold;
+	struct timing_threshold *nfc = &timing_default_threshold;
 	struct resources *r = &this->resources;
 	struct nand_chip *nand = &this->nand;
 	struct nand_timing target = this->timing;
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index 4e49a1f..41f5917 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -231,7 +231,7 @@ struct gpmi_nfc_hardware_timing {
 };
 
 /**
- * struct timing_threshod - Timing threshold
+ * struct timing_threshold - Timing threshold
  * @max_data_setup_cycles:       The maximum number of data setup cycles that
  *                               can be expressed in the hardware.
  * @internal_data_setup_in_ns:   The time, in ns, that the NFC hardware requires
@@ -253,7 +253,7 @@ struct gpmi_nfc_hardware_timing {
  *                               progress, this is the clock frequency during
  *                               the most recent I/O transaction.
  */
-struct timing_threshod {
+struct timing_threshold {
 	const unsigned int      max_chip_count;
 	const unsigned int      max_data_setup_cycles;
 	const unsigned int      internal_data_setup_in_ns;
-- 
2.7.4
