Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjNU4-0000wx-Kz
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 02:25:34 +0000
Date: Thu, 12 Aug 2010 10:23:01 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v1 1/5]nand/denali: Fixed check patch warnings
Message-ID: <20100812022301.GA25657@intel.com>
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


=46rom f7d5d7447b24bf4a1de025d5d6aa55dac64914e4 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Wed, 11 Aug 2010 17:46:00 +0800
Subject: [PATCH 1/5] nand/denali: Fixed check patch warnings

waring: no space for starting a line

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   25 +++++++++++++------------
 1 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index f59dd03..3ba8952 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -56,7 +56,7 @@ MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONF=
I setting."
 			INTR_STATUS0__ERASE_COMP)
=20
 /* indicates whether or not the internal value for the flash bank is
-   valid or not */
+ * valid or not */
 #define CHIP_SELECT_INVALID	-1
=20
 #define SUPPORT_8BITECC		1
@@ -71,7 +71,7 @@ MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONF=
I setting."
 #define mtd_to_denali(m) container_of(m, struct denali_nand_info, mtd)
=20
 /* These constants are defined by the driver to enable common driver
-   configuration options. */
+ * configuration options. */
 #define SPARE_ACCESS		0x41
 #define MAIN_ACCESS		0x42
 #define MAIN_SPARE_ACCESS	0x43
@@ -97,7 +97,7 @@ static const struct pci_device_id denali_pci_ids[] =3D {
=20
=20
 /* these are static lookup tables that give us easy access to
-   registers in the NAND controller.
+ * registers in the NAND controller.
  */
 static const uint32_t intr_status_addresses[4] =3D {INTR_STATUS0,
 						  INTR_STATUS1,
@@ -429,7 +429,7 @@ static void get_hynix_nand_para(struct denali_nand_info=
 *denali,
 }
=20
 /* determines how many NAND chips are connected to the controller. Note for
-   Intel CE4100 devices we don't support more than one device.
+ * Intel CE4100 devices we don't support more than one device.
  */
 static void find_valid_banks(struct denali_nand_info *denali)
 {
@@ -572,7 +572,7 @@ static void denali_set_intr_modes(struct denali_nand_in=
fo *denali,
 }
=20
 /* validation function to verify that the controlling software is making
-   a valid request
+ * a valid request
  */
 static inline bool is_flash_bank_valid(int flash_bank)
 {
@@ -726,7 +726,7 @@ static uint32_t wait_for_irq(struct denali_nand_info *d=
enali, uint32_t irq_mask)
 }
=20
 /* This helper function setups the registers for ECC and whether or not
-   the spare area will be transfered. */
+ * the spare area will be transfered. */
 static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_e=
n,
 				bool transfer_spare)
 {
@@ -743,7 +743,7 @@ static void setup_ecc_for_xfer(struct denali_nand_info =
*denali, bool ecc_en,
 }
=20
 /* sends a pipeline command operation to the controller. See the Denali NA=
ND
-   controller's user guide for more information (section 4.2.3.6).
+ * controller's user guide for more information (section 4.2.3.6).
  */
 static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 							bool ecc_en,
@@ -1042,7 +1042,7 @@ static void denali_setup_dma(struct denali_nand_info =
*denali, int op)
 }
=20
 /* writes a page. user specifies type, and this function handles the
-   configuration details. */
+ * configuration details. */
 static void write_page(struct mtd_info *mtd, struct nand_chip *chip,
 			const uint8_t *buf, bool raw_xfer)
 {
@@ -1099,8 +1099,9 @@ static void write_page(struct mtd_info *mtd, struct n=
and_chip *chip,
 /* NAND core entry points */
=20
 /* this is the callback that the NAND core calls to write a page. Since
-   writing a page with ECC or without is similar, all the work is done
-   by write_page above.   */
+ * writing a page with ECC or without is similar, all the work is done
+ * by write_page above.
+ * */
 static void denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 				const uint8_t *buf)
 {
@@ -1110,8 +1111,8 @@ static void denali_write_page(struct mtd_info *mtd, s=
truct nand_chip *chip,
 }
=20
 /* This is the callback that the NAND core calls to write a page without E=
CC.
-   raw access is similiar to ECC page writes, so all the work is done in t=
he
-   write_page() function above.
+ * raw access is similiar to ECC page writes, so all the work is done in t=
he
+ * write_page() function above.
  */
 static void denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *=
chip,
 					const uint8_t *buf)
--=20
1.6.6.1
