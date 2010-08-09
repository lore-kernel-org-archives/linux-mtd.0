Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OiV9m-0001Ht-W2
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 16:25:01 +0000
Date: Tue, 10 Aug 2010 00:22:35 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v1 4/4]nand/denali: use dev_xx debug function to replace
	nand_dbg_print and some printk
Message-ID: <20100809162235.GD10968@intel.com>
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


=46rom 8ffbe22dfc30e4e91bfa9dcc06ccc835cd429d4b Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Tue, 10 Aug 2010 00:16:51 +0800
Subject: [PATCH 4/4] nand/denali: use dev_xx debug function to replace nand=
_dbg_print and some printk

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  208 +++++++++--------------------------------=
----
 drivers/mtd/nand/denali.h |   18 ----
 2 files changed, 42 insertions(+), 184 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 0416fc7..a08f566 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -119,9 +119,6 @@ static const uint32_t reset_complete[4] =3D {INTR_STATU=
S0__RST_COMP,
 							INTR_STATUS2__RST_COMP,
 							INTR_STATUS3__RST_COMP};
=20
-/* specifies the debug level of the driver */
-static int nand_debug_level;
-
 /* forward declarations */
 static void clear_interrupts(struct denali_nand_info *denali);
 static uint32_t wait_for_irq(struct denali_nand_info *denali,
@@ -130,8 +127,6 @@ static void denali_irq_enable(struct denali_nand_info *=
denali,
 							uint32_t int_mask);
 static uint32_t read_interrupt_status(struct denali_nand_info *denali);
=20
-#define DEBUG_DENALI 0
-
 /* Certain operations for the denali NAND controller use
  * an indexed mode to read/write data. The operation is
  * performed by writing the address value of the command
@@ -181,11 +176,6 @@ static void read_status(struct denali_nand_info *denal=
i)
=20
 	/* update buffer with status value */
 	write_byte_to_buf(denali, ioread32(denali->flash_mem + 0x10));
-
-#if DEBUG_DENALI
-	printk(KERN_INFO "device reporting status value of 0x%2x\n",
-			denali->buf.buf[0]);
-#endif
 }
=20
 /* resets a specific device connected to the core */
@@ -204,7 +194,7 @@ static void reset_bank(struct denali_nand_info *denali)
 	irq_status =3D wait_for_irq(denali, irq_mask);
=20
 	if (irq_status & operation_timeout[denali->flash_bank])
-		printk(KERN_ERR "reset bank failed.\n");
+		dev_err(&denali->dev->dev, "reset bank failed.\n");
 }
=20
 /* Reset the flash controller */
@@ -212,7 +202,7 @@ static uint16_t denali_nand_reset(struct denali_nand_in=
fo *denali)
 {
 	uint32_t i;
=20
-	nand_dbg_print(NAND_DBG_TRACE, "%s, Line %d, Function: %s\n",
+	dev_dbg(&denali->dev->dev, "%s, Line %d, Function: %s\n",
 		       __FILE__, __LINE__, __func__);
=20
 	for (i =3D 0 ; i < LLD_MAX_FLASH_BANKS; i++)
@@ -228,7 +218,7 @@ static uint16_t denali_nand_reset(struct denali_nand_in=
fo *denali)
 			;
 		if (ioread32(denali->flash_reg + intr_status_addresses[i]) &
 			operation_timeout[i])
-			nand_dbg_print(NAND_DBG_WARN,
+			dev_dbg(&denali->dev->dev,
 			"NAND Reset operation timed out on bank %d\n", i);
 	}
=20
@@ -266,7 +256,7 @@ static void nand_onfi_timing_set(struct denali_nand_inf=
o *denali,
 	uint16_t acc_clks;
 	uint16_t addr_2_data, re_2_we, re_2_re, we_2_re, cs_cnt;
=20
-	nand_dbg_print(NAND_DBG_TRACE, "%s, Line %d, Function: %s\n",
+	dev_dbg(&denali->dev->dev, "%s, Line %d, Function: %s\n",
 		       __FILE__, __LINE__, __func__);
=20
 	en_lo =3D CEIL_DIV(Trp[mode], CLK_X);
@@ -303,7 +293,7 @@ static void nand_onfi_timing_set(struct denali_nand_inf=
o *denali,
 		acc_clks++;
=20
 	if ((data_invalid - acc_clks * CLK_X) < 2)
-		nand_dbg_print(NAND_DBG_WARN, "%s, Line %d: Warning!\n",
+		dev_warn(&denali->dev->dev, "%s, Line %d: Warning!\n",
 			__FILE__, __LINE__);
=20
 	addr_2_data =3D CEIL_DIV(Tadl[mode], CLK_X);
@@ -431,7 +421,7 @@ static void get_hynix_nand_para(struct denali_nand_info=
 *denali,
 #endif
 		break;
 	default:
-		nand_dbg_print(NAND_DBG_WARN,
+		dev_warn(&denali->dev->dev,
 			"Spectra: Unknown Hynix NAND (Device ID: 0x%x)."
 			"Will use default parameter values instead.\n",
 			device_id);
@@ -453,7 +443,7 @@ static void find_valid_banks(struct denali_nand_info *d=
enali)
 		index_addr_read_data(denali,
 				(uint32_t)(MODE_11 | (i << 24) | 2), &id[i]);
=20
-		nand_dbg_print(NAND_DBG_DEBUG,
+		dev_dbg(&denali->dev->dev,
 			"Return 1st ID for bank[%d]: %x\n", i, id[i]);
=20
 		if (i =3D=3D 0) {
@@ -473,12 +463,13 @@ static void find_valid_banks(struct denali_nand_info =
*denali)
 		 * Multichip support is not enabled.
 		 */
 		if (denali->total_used_banks !=3D 1) {
-			printk(KERN_ERR "Sorry, Intel CE4100 only supports "
+			dev_err(&denali->dev->dev,
+					"Sorry, Intel CE4100 only supports "
 					"a single NAND device.\n");
 			BUG();
 		}
 	}
-	nand_dbg_print(NAND_DBG_DEBUG,
+	dev_dbg(&denali->dev->dev,
 		"denali->total_used_banks: %d\n", denali->total_used_banks);
 }
=20
@@ -512,8 +503,9 @@ static uint16_t denali_nand_timing_set(struct denali_na=
nd_info *denali)
 	uint32_t id_bytes[5], addr;
 	uint8_t i, maf_id, device_id;
=20
-	nand_dbg_print(NAND_DBG_TRACE, "%s, Line %d, Function: %s\n",
-		       __FILE__, __LINE__, __func__);
+	dev_dbg(&denali->dev->dev,
+			"%s, Line %d, Function: %s\n",
+			__FILE__, __LINE__, __func__);
=20
 	/* Use read id method to get device ID and other
 	 * params. For some NAND chips, controller can't
@@ -540,12 +532,14 @@ static uint16_t denali_nand_timing_set(struct denali_=
nand_info *denali)
 		get_hynix_nand_para(denali, device_id);
 	}
=20
-	nand_dbg_print(NAND_DBG_DEBUG, "Dump timing register values:"
-			"acc_clks: %d, re_2_we: %d, we_2_re: %d,"
-			"addr_2_data: %d, rdwr_en_lo_cnt: %d, "
+	dev_info(&denali->dev->dev,
+			"Dump timing register values:"
+			"acc_clks: %d, re_2_we: %d, re_2_re: %d\n"
+			"we_2_re: %d, addr_2_data: %d, rdwr_en_lo_cnt: %d\n"
 			"rdwr_en_hi_cnt: %d, cs_setup_cnt: %d\n",
 			ioread32(denali->flash_reg + ACC_CLKS),
 			ioread32(denali->flash_reg + RE_2_WE),
+			ioread32(denali->flash_reg + RE_2_RE),
 			ioread32(denali->flash_reg + WE_2_RE),
 			ioread32(denali->flash_reg + ADDR_2_DATA),
 			ioread32(denali->flash_reg + RDWR_EN_LO_CNT),
@@ -568,7 +562,7 @@ static uint16_t denali_nand_timing_set(struct denali_na=
nd_info *denali)
 static void denali_set_intr_modes(struct denali_nand_info *denali,
 					uint16_t INT_ENABLE)
 {
-	nand_dbg_print(NAND_DBG_TRACE, "%s, Line %d, Function: %s\n",
+	dev_dbg(&denali->dev->dev, "%s, Line %d, Function: %s\n",
 		       __FILE__, __LINE__, __func__);
=20
 	if (INT_ENABLE)
@@ -645,11 +639,6 @@ static void clear_interrupts(struct denali_nand_info *=
denali)
 	status =3D read_interrupt_status(denali);
 	clear_interrupt(denali, status);
=20
-#if DEBUG_DENALI
-	denali->irq_debug_array[denali->idx++] =3D 0x30000000 | status;
-	denali->idx %=3D 32;
-#endif
-
 	denali->irq_status =3D 0x0;
 	spin_unlock_irq(&denali->irq_lock);
 }
@@ -663,17 +652,6 @@ static uint32_t read_interrupt_status(struct denali_na=
nd_info *denali)
 	return ioread32(denali->flash_reg + intr_status_reg);
 }
=20
-#if DEBUG_DENALI
-static void print_irq_log(struct denali_nand_info *denali)
-{
-	int i =3D 0;
-
-	printk(KERN_INFO "ISR debug log index =3D %X\n", denali->idx);
-	for (i =3D 0; i < 32; i++)
-		printk(KERN_INFO "%08X: %08X\n", i, denali->irq_debug_array[i]);
-}
-#endif
-
 /* This is the interrupt service routine. It handles all interrupts
  * sent to this device. Note that on CE4100, this is a shared
  * interrupt.
@@ -694,13 +672,6 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 		 * the interrupt, since this is a shared interrupt */
 		irq_status =3D denali_irq_detected(denali);
 		if (irq_status !=3D 0) {
-#if DEBUG_DENALI
-			denali->irq_debug_array[denali->idx++] =3D
-				0x10000000 | irq_status;
-			denali->idx %=3D 32;
-
-			printk(KERN_INFO "IRQ status =3D 0x%04x\n", irq_status);
-#endif
 			/* handle interrupt */
 			/* first acknowledge it */
 			clear_interrupt(denali, irq_status);
@@ -726,41 +697,20 @@ static uint32_t wait_for_irq(struct denali_nand_info =
*denali, uint32_t irq_mask)
 	unsigned long timeout =3D msecs_to_jiffies(1000);
=20
 	do {
-#if DEBUG_DENALI
-		printk(KERN_INFO "waiting for 0x%x\n", irq_mask);
-#endif
 		comp_res =3D
 			wait_for_completion_timeout(&denali->complete, timeout);
 		spin_lock_irq(&denali->irq_lock);
 		intr_status =3D denali->irq_status;
=20
-#if DEBUG_DENALI
-		denali->irq_debug_array[denali->idx++] =3D
-			0x20000000 | (irq_mask << 16) | intr_status;
-		denali->idx %=3D 32;
-#endif
-
 		if (intr_status & irq_mask) {
 			denali->irq_status &=3D ~irq_mask;
 			spin_unlock_irq(&denali->irq_lock);
-#if DEBUG_DENALI
-			if (retry)
-				printk(KERN_INFO "status on retry =3D 0x%x\n",
-						intr_status);
-#endif
 			/* our interrupt was detected */
 			break;
 		} else {
 			/* these are not the interrupts you are looking for -
 			 * need to wait again */
 			spin_unlock_irq(&denali->irq_lock);
-#if DEBUG_DENALI
-			print_irq_log(denali);
-			printk(KERN_INFO "received irq nobody cared:"
-					" irq_status =3D 0x%x, irq_mask =3D 0x%x,"
-					" timeout =3D %ld\n", intr_status,
-					irq_mask, comp_res);
-#endif
 			retry =3D true;
 		}
 	} while (comp_res !=3D 0);
@@ -814,16 +764,6 @@ static int denali_send_pipeline_cmd(struct denali_nand=
_info *denali,
=20
 	setup_ecc_for_xfer(denali, ecc_en, transfer_spare);
=20
-#if DEBUG_DENALI
-	spin_lock_irq(&denali->irq_lock);
-	denali->irq_debug_array[denali->idx++] =3D
-		0x40000000 | ioread32(denali->flash_reg + ECC_ENABLE) |
-		(access_type << 4);
-	denali->idx %=3D 32;
-	spin_unlock_irq(&denali->irq_lock);
-#endif
-
-
 	/* clear interrupts */
 	clear_interrupts(denali);
=20
@@ -862,9 +802,10 @@ static int denali_send_pipeline_cmd(struct denali_nand=
_info *denali,
 			irq_status =3D wait_for_irq(denali, irq_mask);
=20
 			if (irq_status =3D=3D 0) {
-				printk(KERN_ERR "cmd, page, addr on timeout "
-					"(0x%x, 0x%x, 0x%x)\n", cmd,
-					denali->page, addr);
+				dev_err(&denali->dev->dev,
+						"cmd, page, addr on timeout "
+						"(0x%x, 0x%x, 0x%x)\n",
+						cmd, denali->page, addr);
 				status =3D FAIL;
 			} else {
 				cmd =3D MODE_01 | addr;
@@ -932,24 +873,15 @@ static int write_oob_data(struct mtd_info *mtd, uint8=
_t *buf, int page)
 							DENALI_WRITE) =3D=3D PASS) {
 		write_data_to_flash_mem(denali, buf, mtd->oobsize);
=20
-#if DEBUG_DENALI
-		spin_lock_irq(&denali->irq_lock);
-		denali->irq_debug_array[denali->idx++] =3D
-			0x80000000 | mtd->oobsize;
-		denali->idx %=3D 32;
-		spin_unlock_irq(&denali->irq_lock);
-#endif
-
-
 		/* wait for operation to complete */
 		irq_status =3D wait_for_irq(denali, irq_mask);
=20
 		if (irq_status =3D=3D 0) {
-			printk(KERN_ERR "OOB write failed\n");
+			dev_err(&denali->dev->dev, "OOB write failed\n");
 			status =3D -EIO;
 		}
 	} else {
-		printk(KERN_ERR "unable to send pipeline command\n");
+		dev_err(&denali->dev->dev, "unable to send pipeline command\n");
 		status =3D -EIO;
 	}
 	return status;
@@ -964,9 +896,6 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t=
 *buf, int page)
=20
 	denali->page =3D page;
=20
-#if DEBUG_DENALI
-	printk(KERN_INFO "read_oob %d\n", page);
-#endif
 	if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
 							DENALI_READ) =3D=3D PASS) {
 		read_data_from_flash_mem(denali, buf, mtd->oobsize);
@@ -977,7 +906,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t=
 *buf, int page)
 		irq_status =3D wait_for_irq(denali, irq_mask);
=20
 		if (irq_status =3D=3D 0)
-			printk(KERN_ERR "page on OOB timeout %d\n",
+			dev_err(&denali->dev->dev, "page on OOB timeout %d\n",
 					denali->page);
=20
 		/* We set the device back to MAIN_ACCESS here as I observed
@@ -989,14 +918,6 @@ static void read_oob_data(struct mtd_info *mtd, uint8_=
t *buf, int page)
 		addr =3D BANK(denali->flash_bank) | denali->page;
 		cmd =3D MODE_10 | addr;
 		index_addr(denali, (uint32_t)cmd, MAIN_ACCESS);
-
-#if DEBUG_DENALI
-		spin_lock_irq(&denali->irq_lock);
-		denali->irq_debug_array[denali->idx++] =3D
-			0x60000000 | mtd->oobsize;
-		denali->idx %=3D 32;
-		spin_unlock_irq(&denali->irq_lock);
-#endif
 	}
 }
=20
@@ -1070,13 +991,6 @@ static bool handle_ecc(struct denali_nand_info *denal=
i, uint8_t *buf,
 				 * */
 				check_erased_page =3D true;
 			}
-
-#if DEBUG_DENALI
-			printk(KERN_INFO "Detected ECC error in page %d:"
-					" err_addr =3D 0x%08x, info to fix is"
-					" 0x%08x\n", denali->page, err_address,
-					err_correction_info);
-#endif
 		} while (!ECC_LAST_ERR(err_correction_info));
 		/* Once handle all ecc errors, controller will triger
 		 * a ECC_TRANSACTION_DONE interrupt, so here just wait
@@ -1170,8 +1084,9 @@ static void write_page(struct mtd_info *mtd, struct n=
and_chip *chip,
 	irq_status =3D wait_for_irq(denali, irq_mask);
=20
 	if (irq_status =3D=3D 0) {
-		printk(KERN_ERR "timeout on write_page"
-				" (type =3D %d)\n", raw_xfer);
+		dev_err(&denali->dev->dev,
+				"timeout on write_page (type =3D %d)\n",
+				raw_xfer);
 		denali->status =3D
 			(irq_status & INTR_STATUS0__PROGRAM_FAIL) ?
 			NAND_STATUS_FAIL : PASS;
@@ -1308,18 +1223,13 @@ static uint8_t denali_read_byte(struct mtd_info *mt=
d)
 	if (denali->buf.head < denali->buf.tail)
 		result =3D denali->buf.buf[denali->buf.head++];
=20
-#if DEBUG_DENALI
-	printk(KERN_INFO "read byte -> 0x%02x\n", result);
-#endif
 	return result;
 }
=20
 static void denali_select_chip(struct mtd_info *mtd, int chip)
 {
 	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
-#if DEBUG_DENALI
-	printk(KERN_INFO "denali select chip %d\n", chip);
-#endif
+
 	spin_lock_irq(&denali->irq_lock);
 	denali->flash_bank =3D chip;
 	spin_unlock_irq(&denali->irq_lock);
@@ -1331,9 +1241,6 @@ static int denali_waitfunc(struct mtd_info *mtd, stru=
ct nand_chip *chip)
 	int status =3D denali->status;
 	denali->status =3D 0;
=20
-#if DEBUG_DENALI
-	printk(KERN_INFO "waitfunc %d\n", status);
-#endif
 	return status;
 }
=20
@@ -1343,9 +1250,6 @@ static void denali_erase(struct mtd_info *mtd, int pa=
ge)
=20
 	uint32_t cmd =3D 0x0, irq_status =3D 0;
=20
-#if DEBUG_DENALI
-	printk(KERN_INFO "erase page: %d\n", page);
-#endif
 	/* clear interrupts */
 	clear_interrupts(denali);
=20
@@ -1368,9 +1272,6 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsi=
gned int cmd, int col,
 	uint32_t addr, id;
 	int i;
=20
-#if DEBUG_DENALI
-	printk(KERN_INFO "cmdfunc: 0x%x %d %d\n", cmd, col, page);
-#endif
 	switch (cmd) {
 	case NAND_CMD_PAGEPROG:
 		break;
@@ -1414,7 +1315,9 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsi=
gned int cmd, int col,
 static int denali_ecc_calculate(struct mtd_info *mtd, const uint8_t *data,
 				uint8_t *ecc_code)
 {
-	printk(KERN_ERR "denali_ecc_calculate called unexpectedly\n");
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+	dev_err(&denali->dev->dev,
+			"denali_ecc_calculate called unexpectedly\n");
 	BUG();
 	return -EIO;
 }
@@ -1422,14 +1325,18 @@ static int denali_ecc_calculate(struct mtd_info *mt=
d, const uint8_t *data,
 static int denali_ecc_correct(struct mtd_info *mtd, uint8_t *data,
 				uint8_t *read_ecc, uint8_t *calc_ecc)
 {
-	printk(KERN_ERR "denali_ecc_correct called unexpectedly\n");
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+	dev_err(&denali->dev->dev,
+			"denali_ecc_correct called unexpectedly\n");
 	BUG();
 	return -EIO;
 }
=20
 static void denali_ecc_hwctl(struct mtd_info *mtd, int mode)
 {
-	printk(KERN_ERR "denali_ecc_hwctl called unexpectedly\n");
+	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
+	dev_err(&denali->dev->dev,
+			"denali_ecc_hwctl called unexpectedly\n");
 	BUG();
 }
 /* end NAND core entry points */
@@ -1525,9 +1432,6 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 	unsigned long csr_len, mem_len;
 	struct denali_nand_info *denali;
=20
-	nand_dbg_print(NAND_DBG_TRACE, "%s, Line %d, Function: %s\n",
-		       __FILE__, __LINE__, __func__);
-
 	denali =3D kzalloc(sizeof(*denali), GFP_KERNEL);
 	if (!denali)
 		return -ENOMEM;
@@ -1562,11 +1466,6 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
 		if (!mem_len) {
 			mem_base =3D csr_base + csr_len;
 			mem_len =3D csr_len;
-			nand_dbg_print(NAND_DBG_WARN,
-				       "Spectra: No second"
-					   " BAR for PCI device;"
-					   " assuming %08Lx\n",
-				       (uint64_t)csr_base);
 		}
 	}
=20
@@ -1583,7 +1482,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 						PCI_DMA_BIDIRECTIONAL);
=20
 	if (pci_dma_mapping_error(dev, denali->buf.dma_buf)) {
-		printk(KERN_ERR "Spectra: failed to map DMA buffer\n");
+		dev_err(&dev->dev, "Spectra: failed to map DMA buffer\n");
 		goto failed_enable_dev;
 	}
=20
@@ -1602,8 +1501,6 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 		ret =3D -ENOMEM;
 		goto failed_req_regions;
 	}
-	nand_dbg_print(NAND_DBG_DEBUG, "Spectra: CSR 0x%08Lx -> 0x%p (0x%lx)\n",
-		       (uint64_t)csr_base, denali->flash_reg, csr_len);
=20
 	denali->flash_mem =3D ioremap_nocache(mem_base, mem_len);
 	if (!denali->flash_mem) {
@@ -1612,15 +1509,9 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
 		goto failed_remap_reg;
 	}
=20
-	nand_dbg_print(NAND_DBG_WARN,
-		"Spectra: Remapped flash base address: "
-		"0x%p, len: %ld\n",
-		denali->flash_mem, csr_len);
-
 	denali_hw_init(denali);
 	denali_drv_init(denali);
=20
-	nand_dbg_print(NAND_DBG_DEBUG, "Spectra: IRQ %d\n", dev->irq);
 	if (request_irq(dev->irq, denali_isr, IRQF_SHARED,
 			DENALI_NAND_NAME, denali)) {
 		printk(KERN_ERR "Spectra: Unable to allocate IRQ\n");
@@ -1635,18 +1526,6 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
=20
 	denali_nand_timing_set(denali);
=20
-	nand_dbg_print(NAND_DBG_DEBUG, "Dump timing register values:"
-			"acc_clks: %d, re_2_we: %d, we_2_re: %d,"
-			"addr_2_data: %d, rdwr_en_lo_cnt: %d, "
-			"rdwr_en_hi_cnt: %d, cs_setup_cnt: %d\n",
-			ioread32(denali->flash_reg + ACC_CLKS),
-			ioread32(denali->flash_reg + RE_2_WE),
-			ioread32(denali->flash_reg + WE_2_RE),
-			ioread32(denali->flash_reg + ADDR_2_DATA),
-			ioread32(denali->flash_reg + RDWR_EN_LO_CNT),
-			ioread32(denali->flash_reg + RDWR_EN_HI_CNT),
-			ioread32(denali->flash_reg + CS_SETUP_CNT));
-
 	denali->mtd.name =3D "Denali NAND";
 	denali->mtd.owner =3D THIS_MODULE;
 	denali->mtd.priv =3D &denali->nand;
@@ -1772,8 +1651,8 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
=20
 	ret =3D add_mtd_device(&denali->mtd);
 	if (ret) {
-		printk(KERN_ERR "Spectra: Failed to register"
-				" MTD device: %d\n", ret);
+		dev_err(&dev->dev, "Spectra: Failed to register MTD: %d\n",
+				ret);
 		goto failed_req_irq;
 	}
 	return 0;
@@ -1801,9 +1680,6 @@ static void denali_pci_remove(struct pci_dev *dev)
 {
 	struct denali_nand_info *denali =3D pci_get_drvdata(dev);
=20
-	nand_dbg_print(NAND_DBG_WARN, "%s, Line %d, Function: %s\n",
-		       __FILE__, __LINE__, __func__);
-
 	nand_release(&denali->mtd);
 	del_mtd_device(&denali->mtd);
=20
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index b680474..3918bcb 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -635,24 +635,6 @@
 #define CLK_X  5
 #define CLK_MULTI 4
=20
-/* ffsport.h */
-#define VERBOSE    1
-
-#define NAND_DBG_WARN  1
-#define NAND_DBG_DEBUG 2
-#define NAND_DBG_TRACE 3
-
-#ifdef VERBOSE
-#define nand_dbg_print(level, args...)				\
-	do {							\
-			if (level <=3D nand_debug_level)		\
-				printk(KERN_ALERT args);	\
-	} while (0)
-#else
-#define nand_dbg_print(level, args...)
-#endif
-
-
 /* spectraswconfig.h */
 #define CMD_DMA 0
=20
--=20
1.6.6.1
