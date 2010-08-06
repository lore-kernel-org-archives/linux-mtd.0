Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OhKVu-0001n9-Aa
	for linux-mtd@lists.infradead.org; Fri, 06 Aug 2010 10:50:59 +0000
Date: Fri, 6 Aug 2010 18:48:49 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com, dwmw2@infradead.org
Subject: [PATCH v1 2/4]mtd: denali: Remove unuseful code in
	get_xx_nand_para functions
Message-ID: <20100806104849.GB7326@intel.com>
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


=46rom 8c5c497457f5d7a5c6064a366f6551c9fd3c3019 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Fri, 6 Aug 2010 15:45:19 +0800
Subject: [PATCH 2/4] mtd: denali: Remove unuseful code in get_xx_nand_para =
functions

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   81 ++++-------------------------------------=
----
 1 files changed, 7 insertions(+), 74 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 22d7ba3..e67a9d3 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -369,63 +369,9 @@ static void set_ecc_config(struct denali_nand_info *de=
nali)
 static uint16_t get_onfi_nand_para(struct denali_nand_info *denali)
 {
 	int i;
-
-	denali_write32(DEVICE_RESET__BANK0, denali->flash_reg + DEVICE_RESET);
-
-	while (!((ioread32(denali->flash_reg + INTR_STATUS0) &
-			INTR_STATUS0__RST_COMP) |
-			(ioread32(denali->flash_reg + INTR_STATUS0) &
-			INTR_STATUS0__TIME_OUT)))
-		;
-
-	if (ioread32(denali->flash_reg + INTR_STATUS0) &
-			INTR_STATUS0__RST_COMP) {
-		denali_write32(DEVICE_RESET__BANK1,
-				denali->flash_reg + DEVICE_RESET);
-		while (!((ioread32(denali->flash_reg + INTR_STATUS1) &
-			INTR_STATUS1__RST_COMP) |
-			(ioread32(denali->flash_reg + INTR_STATUS1) &
-			INTR_STATUS1__TIME_OUT)))
-			;
-
-		if (ioread32(denali->flash_reg + INTR_STATUS1) &
-			INTR_STATUS1__RST_COMP) {
-			denali_write32(DEVICE_RESET__BANK2,
-				denali->flash_reg + DEVICE_RESET);
-			while (!((ioread32(denali->flash_reg + INTR_STATUS2) &
-				INTR_STATUS2__RST_COMP) |
-				(ioread32(denali->flash_reg + INTR_STATUS2) &
-				INTR_STATUS2__TIME_OUT)))
-				;
-
-			if (ioread32(denali->flash_reg + INTR_STATUS2) &
-				INTR_STATUS2__RST_COMP) {
-				denali_write32(DEVICE_RESET__BANK3,
-					denali->flash_reg + DEVICE_RESET);
-				while (!((ioread32(denali->flash_reg +
-						INTR_STATUS3) &
-						INTR_STATUS3__RST_COMP) |
-						(ioread32(denali->flash_reg +
-						INTR_STATUS3) &
-						INTR_STATUS3__TIME_OUT)))
-					;
-			} else {
-				printk(KERN_ERR "Getting a time out for bank 2!\n");
-			}
-		} else {
-			printk(KERN_ERR "Getting a time out for bank 1!\n");
-		}
-	}
-
-	denali_write32(INTR_STATUS0__TIME_OUT,
-			denali->flash_reg + INTR_STATUS0);
-	denali_write32(INTR_STATUS1__TIME_OUT,
-			denali->flash_reg + INTR_STATUS1);
-	denali_write32(INTR_STATUS2__TIME_OUT,
-			denali->flash_reg + INTR_STATUS2);
-	denali_write32(INTR_STATUS3__TIME_OUT,
-			denali->flash_reg + INTR_STATUS3);
-
+	/* we needn't to do a reset here because driver has already
+	 * reset all the banks before
+	 * */
 	if (!(ioread32(denali->flash_reg + ONFI_TIMING_MODE) &
 		ONFI_TIMING_MODE__VALUE))
 		return FAIL;
@@ -446,23 +392,10 @@ static uint16_t get_onfi_nand_para(struct denali_nand=
_info *denali)
 	return PASS;
 }
=20
-static void get_samsung_nand_para(struct denali_nand_info *denali)
+static void get_samsung_nand_para(struct denali_nand_info *denali,
+							uint8_t device_id)
 {
-	uint32_t id_bytes[5];
-	int i;
-
-	index_addr(denali, (uint32_t)(MODE_11 | 0), 0x90);
-	index_addr(denali, (uint32_t)(MODE_11 | 1), 0);
-	for (i =3D 0; i < 5; i++)
-		index_addr_read_data(denali, (uint32_t)(MODE_11 | 2),
-							&id_bytes[i]);
-
-	nand_dbg_print(NAND_DBG_DEBUG,
-		"ID bytes: 0x%x, 0x%x, 0x%x, 0x%x, 0x%x\n",
-		id_bytes[0], id_bytes[1], id_bytes[2],
-		id_bytes[3], id_bytes[4]);
-
-	if ((id_bytes[1] & 0xff) =3D=3D 0xd3) { /* Samsung K9WAG08U1A */
+	if (device_id =3D=3D 0xd3) { /* Samsung K9WAG08U1A */
 		/* Set timing register values according to datasheet */
 		denali_write32(5, denali->flash_reg + ACC_CLKS);
 		denali_write32(20, denali->flash_reg + RE_2_WE);
@@ -624,7 +557,7 @@ static uint16_t denali_nand_timing_set(struct denali_na=
nd_info *denali)
 		if (FAIL =3D=3D get_onfi_nand_para(denali))
 			return FAIL;
 	} else if (maf_id =3D=3D 0xEC) { /* Samsung NAND */
-		get_samsung_nand_para(denali);
+		get_samsung_nand_para(denali, device_id);
 	} else if (maf_id =3D=3D 0x98) { /* Toshiba NAND */
 		get_toshiba_nand_para(denali);
 	} else if (maf_id =3D=3D 0xAD) { /* Hynix NAND */
--=20
1.6.6.1
