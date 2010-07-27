From: chuanxiao.dong@intel.com (Chuanxiao Dong)
Date: Tue, 27 Jul 2010 10:30:48 +0800
Subject: [PATCH 2/6] mtd: denali.c: clean up whitespace in code indent
Message-ID: <mailman.86.1280203141.27306.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   59 ++++++++++++++++++++++-------------------=
----
 1 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 93cf8da..ca02838 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -56,7 +56,7 @@ MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONF=
I setting. -1 indicates
=20
 /* indicates whether or not the internal value for the flash bank is
    valid or not */
-#define CHIP_SELECT_INVALID 	-1
+#define CHIP_SELECT_INVALID	-1
=20
 #define SUPPORT_8BITECC		1
=20
@@ -100,23 +100,23 @@ static const struct pci_device_id denali_pci_ids[] =
=3D {
  */
 static const uint32_t intr_status_addresses[4] =3D {INTR_STATUS0,
 						  INTR_STATUS1,
-					     	  INTR_STATUS2,
+						  INTR_STATUS2,
 						  INTR_STATUS3};
=20
 static const uint32_t device_reset_banks[4] =3D {DEVICE_RESET__BANK0,
-                                               DEVICE_RESET__BANK1,
-                                               DEVICE_RESET__BANK2,
-                                               DEVICE_RESET__BANK3};
+							DEVICE_RESET__BANK1,
+							DEVICE_RESET__BANK2,
+							DEVICE_RESET__BANK3};
=20
 static const uint32_t operation_timeout[4] =3D {INTR_STATUS0__TIME_OUT,
-                        		      INTR_STATUS1__TIME_OUT,
-		                              INTR_STATUS2__TIME_OUT,
-		                              INTR_STATUS3__TIME_OUT};
+							INTR_STATUS1__TIME_OUT,
+							INTR_STATUS2__TIME_OUT,
+							INTR_STATUS3__TIME_OUT};
=20
 static const uint32_t reset_complete[4] =3D {INTR_STATUS0__RST_COMP,
-                		           INTR_STATUS1__RST_COMP,
-		                           INTR_STATUS2__RST_COMP,
-		                           INTR_STATUS3__RST_COMP};
+							INTR_STATUS1__RST_COMP,
+							INTR_STATUS2__RST_COMP,
+							INTR_STATUS3__RST_COMP};
=20
 /* specifies the debug level of the driver */
 static int nand_debug_level =3D 0;
@@ -641,7 +641,7 @@ static void find_valid_banks(struct denali_nand_info *d=
enali)
 	{
 		/* Platform limitations of the CE4100 device limit
 		 * users to a single chip solution for NAND.
-                 * Multichip support is not enabled.
+		 * Multichip support is not enabled.
 		 */
 		if (denali->total_used_banks !=3D 1)
 		{
@@ -1016,7 +1016,7 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 	spin_lock(&denali->irq_lock);
=20
 	/* check to see if a valid NAND chip has
-         * been selected.
+	 * been selected.
 	 */
 	if (is_flash_bank_valid(denali->flash_bank))
 	{
@@ -1081,7 +1081,7 @@ static uint32_t wait_for_irq(struct denali_nand_info =
*denali, uint32_t irq_mask)
 		else
 		{
 			/* these are not the interrupts you are looking for -
-		           need to wait again */
+			 * need to wait again */
 			spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
 			print_irq_log(denali);
@@ -1096,7 +1096,7 @@ static uint32_t wait_for_irq(struct denali_nand_info =
*denali, uint32_t irq_mask)
 	{
 		/* timeout */
 		printk(KERN_ERR "timeout occurred, status =3D 0x%x, mask =3D 0x%x\n",
-	       			intr_status, irq_mask);
+				intr_status, irq_mask);
=20
 		intr_status =3D 0;
 	}
@@ -1231,7 +1231,6 @@ static int read_data_from_flash_mem(struct denali_nan=
d_info *denali, uint8_t *bu
 	/* we assume that len will be a multiple of 4, if not
 	 * it would be nice to know about it ASAP rather than
 	 * have random failures...
-         *
 	 * This assumption is based on the fact that this
 	 * function is designed to be used to read flash pages,
 	 * which are typically multiples of 4...
@@ -1505,8 +1504,8 @@ static void write_page(struct mtd_info *mtd, struct n=
and_chip *chip,
 	{
 		printk(KERN_ERR "timeout on write_page (type =3D %d)\n", raw_xfer);
 		denali->status =3D
-	   	   (irq_status & INTR_STATUS0__PROGRAM_FAIL) ? NAND_STATUS_FAIL :
-						   	     PASS;
+			(irq_status & INTR_STATUS0__PROGRAM_FAIL) ? NAND_STATUS_FAIL :
+														PASS;
 	}
=20
 	denali_enable_dma(denali, false);
@@ -1522,7 +1521,7 @@ static void denali_write_page(struct mtd_info *mtd, s=
truct nand_chip *chip,
 				const uint8_t *buf)
 {
 	/* for regular page writes, we let HW handle all the ECC
-         * data written to the device. */
+	 * data written to the device. */
 	write_page(mtd, chip, buf, false);
 }
=20
@@ -1550,7 +1549,7 @@ static int denali_read_oob(struct mtd_info *mtd, stru=
ct nand_chip *chip,
 	read_oob_data(mtd, chip->oob_poi, page);
=20
 	return 0; /* notify NAND core to send command to
-                   * NAND device. */
+			   NAND device. */
 }
=20
 static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
@@ -1722,12 +1721,12 @@ static void denali_cmdfunc(struct mtd_info *mtd, un=
signed int cmd, int col,
 			{
 				/* write manufacturer information into nand
 				   buffer for NAND subsystem to fetch.
-  			         */
-	                        write_byte_to_buf(denali, denali->dev_info.wDevic=
eMaker);
-	                        write_byte_to_buf(denali, denali->dev_info.wDevic=
eID);
-	                        write_byte_to_buf(denali, denali->dev_info.bDevic=
eParam0);
-	                        write_byte_to_buf(denali, denali->dev_info.bDevic=
eParam1);
-	                        write_byte_to_buf(denali, denali->dev_info.bDevic=
eParam2);
+				   */
+				write_byte_to_buf(denali, denali->dev_info.wDeviceMaker);
+				write_byte_to_buf(denali, denali->dev_info.wDeviceID);
+				write_byte_to_buf(denali, denali->dev_info.bDeviceParam0);
+				write_byte_to_buf(denali, denali->dev_info.bDeviceParam1);
+				write_byte_to_buf(denali, denali->dev_info.bDeviceParam2);
 			}
 			else
 			{
@@ -1977,7 +1976,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 	NAND_Read_Device_ID(denali);
=20
 	/* MTD supported page sizes vary by kernel. We validate our
-           kernel supports the device here.
+	 * kernel supports the device here.
 	 */
 	if (denali->dev_info.wPageSize > NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE)
 	{
@@ -2020,7 +2019,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
=20
 	/* second stage of the NAND scan
 	 * this stage requires information regarding ECC and
-         * bad block management. */
+	 * bad block management. */
=20
 	/* Bad block management */
 	denali->nand.bbt_td =3D &bbt_main_descr;
@@ -2042,8 +2041,8 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 	}
=20
 	/* These functions are required by the NAND core framework, otherwise,
-           the NAND core will assert. However, we don't need them, so we'l=
l stub
-           them out. */
+	 * the NAND core will assert. However, we don't need them, so we'll stub
+	 * them out. */
 	denali->nand.ecc.calculate =3D denali_ecc_calculate;
 	denali->nand.ecc.correct =3D denali_ecc_correct;
 	denali->nand.ecc.hwctl =3D denali_ecc_hwctl;
--=20
1.6.6.1
