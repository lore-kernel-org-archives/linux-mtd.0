Received: from mga03.intel.com ([143.182.124.21])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OiV9c-0001EZ-9l
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 16:24:49 +0000
Date: Tue, 10 Aug 2010 00:22:25 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v1 3/4]nand/denali: Fixed handle ECC error bugs
Message-ID: <20100809162225.GC10968@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


=46rom 3e40d412afda3d5ec508b8ee66e468bcc79cb710 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Tue, 10 Aug 2010 00:07:01 +0800
Subject: [PATCH 3/4] nand/denali: Fixed handle ECC error bugs

Once the last ECC error was handled, controller will triger an
interrupt. If this interrupt can not be clean on time, controller
may corrupt.

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   45 +++++++++++++++++++++++++++++------------=
----
 1 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index b255b41..0416fc7 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -643,6 +643,7 @@ static void clear_interrupts(struct denali_nand_info *d=
enali)
 	spin_lock_irq(&denali->irq_lock);
=20
 	status =3D read_interrupt_status(denali);
+	clear_interrupt(denali, status);
=20
 #if DEBUG_DENALI
 	denali->irq_debug_array[denali->idx++] =3D 0x30000000 | status;
@@ -1015,12 +1016,12 @@ bool is_erased(uint8_t *buf, int len)
 #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
 #define ECC_BYTE(x)	(((x) & ECC_ERROR_ADDRESS__OFFSET))
 #define ECC_CORRECTION_VALUE(x) ((x) & ERR_CORRECTION_INFO__BYTEMASK)
-#define ECC_ERROR_CORRECTABLE(x) (!((x) & ERR_CORRECTION_INFO))
-#define ECC_ERR_DEVICE(x)	((x) & ERR_CORRECTION_INFO__DEVICE_NR >> 8)
+#define ECC_ERROR_CORRECTABLE(x) (!((x) & ERR_CORRECTION_INFO__ERROR_TYPE))
+#define ECC_ERR_DEVICE(x)	(((x) & ERR_CORRECTION_INFO__DEVICE_NR) >> 8)
 #define ECC_LAST_ERR(x)		((x) & ERR_CORRECTION_INFO__LAST_ERR_INFO)
=20
 static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
-			uint8_t *oobbuf, uint32_t irq_status)
+					uint32_t irq_status)
 {
 	bool check_erased_page =3D false;
=20
@@ -1029,6 +1030,7 @@ static bool handle_ecc(struct denali_nand_info *denal=
i, uint8_t *buf,
 		uint32_t err_address =3D 0, err_correction_info =3D 0;
 		uint32_t err_byte =3D 0, err_sector =3D 0, err_device =3D 0;
 		uint32_t err_correction_value =3D 0;
+		denali_set_intr_modes(denali, false);
=20
 		do {
 			err_address =3D ioread32(denali->flash_reg +
@@ -1036,7 +1038,6 @@ static bool handle_ecc(struct denali_nand_info *denal=
i, uint8_t *buf,
 			err_sector =3D ECC_SECTOR(err_address);
 			err_byte =3D ECC_BYTE(err_address);
=20
-
 			err_correction_info =3D ioread32(denali->flash_reg +
 						ERR_CORRECTION_INFO);
 			err_correction_value =3D
@@ -1044,20 +1045,23 @@ static bool handle_ecc(struct denali_nand_info *den=
ali, uint8_t *buf,
 			err_device =3D ECC_ERR_DEVICE(err_correction_info);
=20
 			if (ECC_ERROR_CORRECTABLE(err_correction_info)) {
-				/* offset in our buffer is computed as:
-				   sector number * sector size + offset in
-				   sector
-				 */
-				int offset =3D err_sector * ECC_SECTOR_SIZE +
-								err_byte;
-				if (offset < denali->mtd.writesize) {
+				/* If err_byte is larger than ECC_SECTOR_SIZE,
+				 * means error happend in OOB, so we ignore
+				 * it. It's no need for us to correct it
+				 * err_device is represented the NAND error
+				 * bits are happened in if there are more
+				 * than one NAND connected.
+				 * */
+				if (err_byte < ECC_SECTOR_SIZE) {
+					int offset;
+					offset =3D (err_sector *
+							ECC_SECTOR_SIZE +
+							err_byte) *
+							denali->devnum +
+							err_device;
 					/* correct the ECC error */
 					buf[offset] ^=3D err_correction_value;
 					denali->mtd.ecc_stats.corrected++;
-				} else {
-					/* bummer, couldn't correct the error */
-					printk(KERN_ERR "ECC offset invalid\n");
-					denali->mtd.ecc_stats.failed++;
 				}
 			} else {
 				/* if the error is not correctable, need to
@@ -1074,6 +1078,15 @@ static bool handle_ecc(struct denali_nand_info *dena=
li, uint8_t *buf,
 					err_correction_info);
 #endif
 		} while (!ECC_LAST_ERR(err_correction_info));
+		/* Once handle all ecc errors, controller will triger
+		 * a ECC_TRANSACTION_DONE interrupt, so here just wait
+		 * for a while for this interrupt
+		 * */
+		while (!(read_interrupt_status(denali) &
+				INTR_STATUS0__ECC_TRANSACTION_DONE))
+			cpu_relax();
+		clear_interrupts(denali);
+		denali_set_intr_modes(denali, true);
 	}
 	return check_erased_page;
 }
@@ -1237,7 +1250,7 @@ static int denali_read_page(struct mtd_info *mtd, str=
uct nand_chip *chip,
=20
 	memcpy(buf, denali->buf.buf, mtd->writesize);
=20
-	check_erased_page =3D handle_ecc(denali, buf, chip->oob_poi, irq_status);
+	check_erased_page =3D handle_ecc(denali, buf, irq_status);
 	denali_enable_dma(denali, false);
=20
 	if (check_erased_page) {
--=20
1.6.6.1
