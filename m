Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OiV9T-0001CV-Of
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 16:24:41 +0000
Date: Tue, 10 Aug 2010 00:22:17 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v1 2/4]nand/denali: use iowrite32() to replace denali_write32()
Message-ID: <20100809162217.GB10968@intel.com>
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


=46rom 4104cf1a8f6c2fa0bd4a82eeedb4f0a6d3b277ef Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Mon, 9 Aug 2010 23:59:23 +0800
Subject: [PATCH 2/4] nand/denali: use iowrite32() to replace denali_write32=
()

denali_write32() just implements a debug function for iowrite32(),
only print out the write value. Remove this function since it's useless

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  138 ++++++++++++++++++++---------------------=
----
 1 files changed, 62 insertions(+), 76 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index b8b7b93..b255b41 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -132,20 +132,6 @@ static uint32_t read_interrupt_status(struct denali_na=
nd_info *denali);
=20
 #define DEBUG_DENALI 0
=20
-/* This is a wrapper for writing to the denali registers.
- * this allows us to create debug information so we can
- * observe how the driver is programming the device.
- * it uses standard linux convention for (val, addr) */
-static void denali_write32(uint32_t value, void *addr)
-{
-	iowrite32(value, addr);
-
-#if DEBUG_DENALI
-	printk(KERN_INFO "wrote: 0x%x -> 0x%x\n", value,
-			(uint32_t)((uint32_t)addr & 0x1fff));
-#endif
-}
-
 /* Certain operations for the denali NAND controller use
  * an indexed mode to read/write data. The operation is
  * performed by writing the address value of the command
@@ -155,15 +141,15 @@ static void denali_write32(uint32_t value, void *addr)
 static void index_addr(struct denali_nand_info *denali,
 				uint32_t address, uint32_t data)
 {
-	denali_write32(address, denali->flash_mem);
-	denali_write32(data, denali->flash_mem + 0x10);
+	iowrite32(address, denali->flash_mem);
+	iowrite32(data, denali->flash_mem + 0x10);
 }
=20
 /* Perform an indexed read of the device */
 static void index_addr_read_data(struct denali_nand_info *denali,
 				 uint32_t address, uint32_t *pdata)
 {
-	denali_write32(address, denali->flash_mem);
+	iowrite32(address, denali->flash_mem);
 	*pdata =3D ioread32(denali->flash_mem + 0x10);
 }
=20
@@ -191,7 +177,7 @@ static void read_status(struct denali_nand_info *denali)
 	/* initiate a device status read */
 	cmd =3D MODE_11 | BANK(denali->flash_bank);
 	index_addr(denali, cmd | COMMAND_CYCLE, 0x70);
-	denali_write32(cmd | STATUS_CYCLE, denali->flash_mem);
+	iowrite32(cmd | STATUS_CYCLE, denali->flash_mem);
=20
 	/* update buffer with status value */
 	write_byte_to_buf(denali, ioread32(denali->flash_mem + 0x10));
@@ -213,7 +199,7 @@ static void reset_bank(struct denali_nand_info *denali)
 	clear_interrupts(denali);
=20
 	bank =3D device_reset_banks[denali->flash_bank];
-	denali_write32(bank, denali->flash_reg + DEVICE_RESET);
+	iowrite32(bank, denali->flash_reg + DEVICE_RESET);
=20
 	irq_status =3D wait_for_irq(denali, irq_mask);
=20
@@ -230,11 +216,11 @@ static uint16_t denali_nand_reset(struct denali_nand_=
info *denali)
 		       __FILE__, __LINE__, __func__);
=20
 	for (i =3D 0 ; i < LLD_MAX_FLASH_BANKS; i++)
-		denali_write32(reset_complete[i] | operation_timeout[i],
+		iowrite32(reset_complete[i] | operation_timeout[i],
 		denali->flash_reg + intr_status_addresses[i]);
=20
 	for (i =3D 0 ; i < LLD_MAX_FLASH_BANKS; i++) {
-		denali_write32(device_reset_banks[i],
+		iowrite32(device_reset_banks[i],
 				denali->flash_reg + DEVICE_RESET);
 		while (!(ioread32(denali->flash_reg +
 						intr_status_addresses[i]) &
@@ -247,7 +233,7 @@ static uint16_t denali_nand_reset(struct denali_nand_in=
fo *denali)
 	}
=20
 	for (i =3D 0; i < LLD_MAX_FLASH_BANKS; i++)
-		denali_write32(reset_complete[i] | operation_timeout[i],
+		iowrite32(reset_complete[i] | operation_timeout[i],
 			denali->flash_reg + intr_status_addresses[i]);
=20
 	return PASS;
@@ -345,14 +331,14 @@ static void nand_onfi_timing_set(struct denali_nand_i=
nfo *denali,
 		(ioread32(denali->flash_reg + DEVICE_ID) =3D=3D 0x88))
 		acc_clks =3D 6;
=20
-	denali_write32(acc_clks, denali->flash_reg + ACC_CLKS);
-	denali_write32(re_2_we, denali->flash_reg + RE_2_WE);
-	denali_write32(re_2_re, denali->flash_reg + RE_2_RE);
-	denali_write32(we_2_re, denali->flash_reg + WE_2_RE);
-	denali_write32(addr_2_data, denali->flash_reg + ADDR_2_DATA);
-	denali_write32(en_lo, denali->flash_reg + RDWR_EN_LO_CNT);
-	denali_write32(en_hi, denali->flash_reg + RDWR_EN_HI_CNT);
-	denali_write32(cs_cnt, denali->flash_reg + CS_SETUP_CNT);
+	iowrite32(acc_clks, denali->flash_reg + ACC_CLKS);
+	iowrite32(re_2_we, denali->flash_reg + RE_2_WE);
+	iowrite32(re_2_re, denali->flash_reg + RE_2_RE);
+	iowrite32(we_2_re, denali->flash_reg + WE_2_RE);
+	iowrite32(addr_2_data, denali->flash_reg + ADDR_2_DATA);
+	iowrite32(en_lo, denali->flash_reg + RDWR_EN_LO_CNT);
+	iowrite32(en_hi, denali->flash_reg + RDWR_EN_HI_CNT);
+	iowrite32(cs_cnt, denali->flash_reg + CS_SETUP_CNT);
 }
=20
 /* queries the NAND device to see what ONFI modes it supports. */
@@ -387,13 +373,13 @@ static void get_samsung_nand_para(struct denali_nand_=
info *denali,
 {
 	if (device_id =3D=3D 0xd3) { /* Samsung K9WAG08U1A */
 		/* Set timing register values according to datasheet */
-		denali_write32(5, denali->flash_reg + ACC_CLKS);
-		denali_write32(20, denali->flash_reg + RE_2_WE);
-		denali_write32(12, denali->flash_reg + WE_2_RE);
-		denali_write32(14, denali->flash_reg + ADDR_2_DATA);
-		denali_write32(3, denali->flash_reg + RDWR_EN_LO_CNT);
-		denali_write32(2, denali->flash_reg + RDWR_EN_HI_CNT);
-		denali_write32(2, denali->flash_reg + CS_SETUP_CNT);
+		iowrite32(5, denali->flash_reg + ACC_CLKS);
+		iowrite32(20, denali->flash_reg + RE_2_WE);
+		iowrite32(12, denali->flash_reg + WE_2_RE);
+		iowrite32(14, denali->flash_reg + ADDR_2_DATA);
+		iowrite32(3, denali->flash_reg + RDWR_EN_LO_CNT);
+		iowrite32(2, denali->flash_reg + RDWR_EN_HI_CNT);
+		iowrite32(2, denali->flash_reg + CS_SETUP_CNT);
 	}
 }
=20
@@ -405,15 +391,15 @@ static void get_toshiba_nand_para(struct denali_nand_=
info *denali)
 	/* spare area size for some kind of Toshiba NAND device */
 	if ((ioread32(denali->flash_reg + DEVICE_MAIN_AREA_SIZE) =3D=3D 4096) &&
 		(ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE) =3D=3D 64)) {
-		denali_write32(216, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
+		iowrite32(216, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
 		tmp =3D ioread32(denali->flash_reg + DEVICES_CONNECTED) *
 			ioread32(denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
-		denali_write32(tmp,
+		iowrite32(tmp,
 				denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);
 #if SUPPORT_15BITECC
-		denali_write32(15, denali->flash_reg + ECC_CORRECTION);
+		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
 #elif SUPPORT_8BITECC
-		denali_write32(8, denali->flash_reg + ECC_CORRECTION);
+		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
 #endif
 	}
 }
@@ -426,22 +412,22 @@ static void get_hynix_nand_para(struct denali_nand_in=
fo *denali,
 	switch (device_id) {
 	case 0xD5: /* Hynix H27UAG8T2A, H27UBG8U5A or H27UCG8VFA */
 	case 0xD7: /* Hynix H27UDG8VEM, H27UCG8UDM or H27UCG8V5A */
-		denali_write32(128, denali->flash_reg + PAGES_PER_BLOCK);
-		denali_write32(4096, denali->flash_reg + DEVICE_MAIN_AREA_SIZE);
-		denali_write32(224, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
+		iowrite32(128, denali->flash_reg + PAGES_PER_BLOCK);
+		iowrite32(4096, denali->flash_reg + DEVICE_MAIN_AREA_SIZE);
+		iowrite32(224, denali->flash_reg + DEVICE_SPARE_AREA_SIZE);
 		main_size =3D 4096 *
 			ioread32(denali->flash_reg + DEVICES_CONNECTED);
 		spare_size =3D 224 *
 			ioread32(denali->flash_reg + DEVICES_CONNECTED);
-		denali_write32(main_size,
+		iowrite32(main_size,
 				denali->flash_reg + LOGICAL_PAGE_DATA_SIZE);
-		denali_write32(spare_size,
+		iowrite32(spare_size,
 				denali->flash_reg + LOGICAL_PAGE_SPARE_SIZE);
-		denali_write32(0, denali->flash_reg + DEVICE_WIDTH);
+		iowrite32(0, denali->flash_reg + DEVICE_WIDTH);
 #if SUPPORT_15BITECC
-		denali_write32(15, denali->flash_reg + ECC_CORRECTION);
+		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
 #elif SUPPORT_8BITECC
-		denali_write32(8, denali->flash_reg + ECC_CORRECTION);
+		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
 #endif
 		break;
 	default:
@@ -586,9 +572,9 @@ static void denali_set_intr_modes(struct denali_nand_in=
fo *denali,
 		       __FILE__, __LINE__, __func__);
=20
 	if (INT_ENABLE)
-		denali_write32(1, denali->flash_reg + GLOBAL_INT_ENABLE);
+		iowrite32(1, denali->flash_reg + GLOBAL_INT_ENABLE);
 	else
-		denali_write32(0, denali->flash_reg + GLOBAL_INT_ENABLE);
+		iowrite32(0, denali->flash_reg + GLOBAL_INT_ENABLE);
 }
=20
 /* validation function to verify that the controlling software is making
@@ -609,10 +595,10 @@ static void denali_irq_init(struct denali_nand_info *=
denali)
 	int_mask =3D DENALI_IRQ_ALL;
=20
 	/* Clear all status bits */
-	denali_write32(0xFFFF, denali->flash_reg + INTR_STATUS0);
-	denali_write32(0xFFFF, denali->flash_reg + INTR_STATUS1);
-	denali_write32(0xFFFF, denali->flash_reg + INTR_STATUS2);
-	denali_write32(0xFFFF, denali->flash_reg + INTR_STATUS3);
+	iowrite32(0xFFFF, denali->flash_reg + INTR_STATUS0);
+	iowrite32(0xFFFF, denali->flash_reg + INTR_STATUS1);
+	iowrite32(0xFFFF, denali->flash_reg + INTR_STATUS2);
+	iowrite32(0xFFFF, denali->flash_reg + INTR_STATUS3);
=20
 	denali_irq_enable(denali, int_mask);
 }
@@ -626,10 +612,10 @@ static void denali_irq_cleanup(int irqnum, struct den=
ali_nand_info *denali)
 static void denali_irq_enable(struct denali_nand_info *denali,
 							uint32_t int_mask)
 {
-	denali_write32(int_mask, denali->flash_reg + INTR_EN0);
-	denali_write32(int_mask, denali->flash_reg + INTR_EN1);
-	denali_write32(int_mask, denali->flash_reg + INTR_EN2);
-	denali_write32(int_mask, denali->flash_reg + INTR_EN3);
+	iowrite32(int_mask, denali->flash_reg + INTR_EN0);
+	iowrite32(int_mask, denali->flash_reg + INTR_EN1);
+	iowrite32(int_mask, denali->flash_reg + INTR_EN2);
+	iowrite32(int_mask, denali->flash_reg + INTR_EN3);
 }
=20
 /* This function only returns when an interrupt that this driver cares abo=
ut
@@ -648,7 +634,7 @@ static inline void clear_interrupt(struct denali_nand_i=
nfo *denali,
=20
 	intr_status_reg =3D intr_status_addresses[denali->flash_bank];
=20
-	denali_write32(irq_mask, denali->flash_reg + intr_status_reg);
+	iowrite32(irq_mask, denali->flash_reg + intr_status_reg);
 }
=20
 static void clear_interrupts(struct denali_nand_info *denali)
@@ -800,8 +786,8 @@ static void setup_ecc_for_xfer(struct denali_nand_info =
*denali, bool ecc_en,
 	transfer_spare_flag =3D transfer_spare ? TRANSFER_SPARE_REG__FLAG : 0;
=20
 	/* Enable spare area/ECC per user's request. */
-	denali_write32(ecc_en_flag, denali->flash_reg + ECC_ENABLE);
-	denali_write32(transfer_spare_flag,
+	iowrite32(ecc_en_flag, denali->flash_reg + ECC_ENABLE);
+	iowrite32(transfer_spare_flag,
 			denali->flash_reg + TRANSFER_SPARE_REG);
 }
=20
@@ -844,14 +830,14 @@ static int denali_send_pipeline_cmd(struct denali_nan=
d_info *denali,
=20
 	if (op =3D=3D DENALI_WRITE && access_type !=3D SPARE_ACCESS) {
 		cmd =3D MODE_01 | addr;
-		denali_write32(cmd, denali->flash_mem);
+		iowrite32(cmd, denali->flash_mem);
 	} else if (op =3D=3D DENALI_WRITE && access_type =3D=3D SPARE_ACCESS) {
 		/* read spare area */
 		cmd =3D MODE_10 | addr;
 		index_addr(denali, (uint32_t)cmd, access_type);
=20
 		cmd =3D MODE_01 | addr;
-		denali_write32(cmd, denali->flash_mem);
+		iowrite32(cmd, denali->flash_mem);
 	} else if (op =3D=3D DENALI_READ) {
 		/* setup page read request for access type */
 		cmd =3D MODE_10 | addr;
@@ -863,7 +849,7 @@ static int denali_send_pipeline_cmd(struct denali_nand_=
info *denali,
 		 */
 		if (access_type =3D=3D SPARE_ACCESS) {
 			cmd =3D MODE_01 | addr;
-			denali_write32(cmd, denali->flash_mem);
+			iowrite32(cmd, denali->flash_mem);
 		} else {
 			index_addr(denali, (uint32_t)cmd,
 					0x2000 | op | page_count);
@@ -881,7 +867,7 @@ static int denali_send_pipeline_cmd(struct denali_nand_=
info *denali,
 				status =3D FAIL;
 			} else {
 				cmd =3D MODE_01 | addr;
-				denali_write32(cmd, denali->flash_mem);
+				iowrite32(cmd, denali->flash_mem);
 			}
 		}
 	}
@@ -902,7 +888,7 @@ static int write_data_to_flash_mem(struct denali_nand_i=
nfo *denali,
 	/* write the data to the flash memory */
 	buf32 =3D (uint32_t *)buf;
 	for (i =3D 0; i < len / 4; i++)
-		denali_write32(*buf32++, denali->flash_mem + 0x10);
+		iowrite32(*buf32++, denali->flash_mem + 0x10);
 	return i*4; /* intent is to return the number of bytes read */
 }
=20
@@ -1100,7 +1086,7 @@ static void denali_enable_dma(struct denali_nand_info=
 *denali, bool en)
 	if (en)
 		reg_val =3D DMA_ENABLE__FLAG;
=20
-	denali_write32(reg_val, denali->flash_reg + DMA_ENABLE);
+	iowrite32(reg_val, denali->flash_reg + DMA_ENABLE);
 	ioread32(denali->flash_reg + DMA_ENABLE);
 }
=20
@@ -1447,16 +1433,16 @@ static void denali_hw_init(struct denali_nand_info =
*denali)
 						SPARE_AREA_SKIP_BYTES);
 	denali_irq_init(denali);
 	denali_nand_reset(denali);
-	denali_write32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
-	denali_write32(CHIP_EN_DONT_CARE__FLAG,
+	iowrite32(0x0F, denali->flash_reg + RB_PIN_ENABLED);
+	iowrite32(CHIP_EN_DONT_CARE__FLAG,
 			denali->flash_reg + CHIP_ENABLE_DONT_CARE);
=20
-	denali_write32(0x0, denali->flash_reg + SPARE_AREA_SKIP_BYTES);
-	denali_write32(0xffff, denali->flash_reg + SPARE_AREA_MARKER);
+	iowrite32(0x0, denali->flash_reg + SPARE_AREA_SKIP_BYTES);
+	iowrite32(0xffff, denali->flash_reg + SPARE_AREA_MARKER);
=20
 	/* Should set value for these registers when init */
-	denali_write32(0, denali->flash_reg + TWO_ROW_ADDR_CYCLES);
-	denali_write32(1, denali->flash_reg + ECC_ENABLE);
+	iowrite32(0, denali->flash_reg + TWO_ROW_ADDR_CYCLES);
+	iowrite32(1, denali->flash_reg + ECC_ENABLE);
 }
=20
 /* Althogh controller spec said SLC ECC is forceb to be 4bit,
@@ -1718,7 +1704,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 		/* if MLC OOB size is large enough, use 15bit ECC*/
 		denali->nand.ecc.layout =3D &nand_15bit_oob;
 		denali->nand.ecc.bytes =3D ECC_15BITS;
-		denali_write32(15, denali->flash_reg + ECC_CORRECTION);
+		iowrite32(15, denali->flash_reg + ECC_CORRECTION);
 	} else if (denali->mtd.oobsize < (denali->bbtskipbytes +
 			ECC_8BITS * (denali->mtd.writesize /
 			ECC_SECTOR_SIZE))) {
@@ -1728,7 +1714,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 	} else {
 		denali->nand.ecc.layout =3D &nand_8bit_oob;
 		denali->nand.ecc.bytes =3D ECC_8BITS;
-		denali_write32(8, denali->flash_reg + ECC_CORRECTION);
+		iowrite32(8, denali->flash_reg + ECC_CORRECTION);
 	}
=20
 	denali->nand.ecc.bytes *=3D denali->devnum;
--=20
1.6.6.1
