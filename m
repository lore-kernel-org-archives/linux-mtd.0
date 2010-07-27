Received: from mga14.intel.com ([143.182.124.37])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdbL9-0001go-0Y
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 04:00:27 +0000
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Tue, 27 Jul 2010 11:59:18 +0800
Subject: [PATCH 6/6] mtd: denali.c: fix reserved all check-patch errors
Message-ID: <5D8008F58939784290FAB48F549751981D4E9692BD@shsmsx502.ccr.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Yuan, Hang" <hang.yuan@intel.com>, "Woodhouse,
	David" <david.woodhouse@intel.com>, "Gao, Yunpeng" <yunpeng.gao@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 5394f3e2a28a01b2bb09d98e598be7085d7b713e Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Tue, 27 Jul 2010 11:32:21 +0800
Subject: [PATCH 6/6] mtd: denali.c: fix reserved all check-patch errors

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  102 +++++++++++++++++++++++------------------=
---
 1 files changed, 53 insertions(+), 49 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 3ce11cc..52278d8 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -119,7 +119,7 @@ static const uint32_t reset_complete[4] =3D {INTR_STATU=
S0__RST_COMP,
 							INTR_STATUS3__RST_COMP};
=20
 /* specifies the debug level of the driver */
-static int nand_debug_level =3D 0;
+static int nand_debug_level;
=20
 /* forward declarations */
 static void clear_interrupts(struct denali_nand_info *denali);
@@ -991,7 +991,7 @@ static void denali_irq_enable(struct denali_nand_info *=
denali,
  */
 static inline uint32_t denali_irq_detected(struct denali_nand_info *denali=
)
 {
-	return (read_interrupt_status(denali) & DENALI_IRQ_ALL);
+	return read_interrupt_status(denali) & DENALI_IRQ_ALL;
 }
=20
 /* Interrupts are cleared by writing a 1 to the appropriate status bit */
@@ -1172,9 +1172,12 @@ static int denali_send_pipeline_cmd(struct denali_na=
nd_info *denali,
 	uint32_t addr =3D 0x0, cmd =3D 0x0, page_count =3D 1, irq_status =3D 0,
 		 irq_mask =3D 0;
=20
-	if (op =3D=3D DENALI_READ) irq_mask =3D INTR_STATUS0__LOAD_COMP;
-	else if (op =3D=3D DENALI_WRITE) irq_mask =3D 0;
-	else BUG();
+	if (op =3D=3D DENALI_READ)
+		irq_mask =3D INTR_STATUS0__LOAD_COMP;
+	else if (op =3D=3D DENALI_WRITE)
+		irq_mask =3D 0;
+	else
+		BUG();
=20
 	setup_ecc_for_xfer(denali, ecc_en, transfer_spare);
=20
@@ -1448,7 +1451,8 @@ static void denali_enable_dma(struct denali_nand_info=
 *denali, bool en)
 {
 	uint32_t reg_val =3D 0x0;
=20
-	if (en) reg_val =3D DMA_ENABLE__FLAG;
+	if (en)
+		reg_val =3D DMA_ENABLE__FLAG;
=20
 	denali_write32(reg_val, denali->flash_reg + DMA_ENABLE);
 	ioread32(denali->flash_reg + DMA_ENABLE);
@@ -1721,47 +1725,47 @@ static void denali_cmdfunc(struct mtd_info *mtd, un=
signed int cmd, int col,
 	printk(KERN_INFO "cmdfunc: 0x%x %d %d\n", cmd, col, page);
 #endif
 	switch (cmd) {
-		case NAND_CMD_PAGEPROG:
-			break;
-		case NAND_CMD_STATUS:
-			read_status(denali);
-			break;
-		case NAND_CMD_READID:
-			reset_buf(denali);
-			if (denali->flash_bank < denali->total_used_banks) {
-				/* write manufacturer information into nand
-				   buffer for NAND subsystem to fetch.
-				   */
-				write_byte_to_buf(denali,
-						denali->dev_info.wDeviceMaker);
-				write_byte_to_buf(denali,
-						denali->dev_info.wDeviceID);
-				write_byte_to_buf(denali,
-						denali->dev_info.bDeviceParam0);
-				write_byte_to_buf(denali,
-						denali->dev_info.bDeviceParam1);
-				write_byte_to_buf(denali,
-						denali->dev_info.bDeviceParam2);
-			} else {
-				int i;
-				for (i =3D 0; i < 5; i++)
-					write_byte_to_buf(denali, 0xff);
-			}
-			break;
-		case NAND_CMD_READ0:
-		case NAND_CMD_SEQIN:
-			denali->page =3D page;
-			break;
-		case NAND_CMD_RESET:
-			reset_bank(denali);
-			break;
-		case NAND_CMD_READOOB:
-			/* TODO: Read OOB data */
-			break;
-		default:
-			printk(KERN_ERR ": unsupported command"
-					" received 0x%x\n", cmd);
-			break;
+	case NAND_CMD_PAGEPROG:
+		break;
+	case NAND_CMD_STATUS:
+		read_status(denali);
+		break;
+	case NAND_CMD_READID:
+		reset_buf(denali);
+		if (denali->flash_bank < denali->total_used_banks) {
+			/* write manufacturer information into nand
+			   buffer for NAND subsystem to fetch.
+			   */
+			write_byte_to_buf(denali,
+					denali->dev_info.wDeviceMaker);
+			write_byte_to_buf(denali,
+					denali->dev_info.wDeviceID);
+			write_byte_to_buf(denali,
+					denali->dev_info.bDeviceParam0);
+			write_byte_to_buf(denali,
+					denali->dev_info.bDeviceParam1);
+			write_byte_to_buf(denali,
+					denali->dev_info.bDeviceParam2);
+		} else {
+			int i;
+			for (i =3D 0; i < 5; i++)
+				write_byte_to_buf(denali, 0xff);
+		}
+		break;
+	case NAND_CMD_READ0:
+	case NAND_CMD_SEQIN:
+		denali->page =3D page;
+		break;
+	case NAND_CMD_RESET:
+		reset_bank(denali);
+		break;
+	case NAND_CMD_READOOB:
+		/* TODO: Read OOB data */
+		break;
+	default:
+		printk(KERN_ERR ": unsupported command"
+				" received 0x%x\n", cmd);
+		break;
 	}
 }
=20
@@ -1807,7 +1811,7 @@ static void denali_hw_init(struct denali_nand_info *d=
enali)
 }
=20
 /* ECC layout for SLC devices. Denali spec indicates SLC fixed at 4 bytes =
*/
-#define ECC_BYTES_SLC   4 * (2048 / ECC_SECTOR_SIZE)
+#define ECC_BYTES_SLC   (4 * (2048 / ECC_SECTOR_SIZE))
 static struct nand_ecclayout nand_oob_slc =3D {
 	.eccbytes =3D 4,
 	.eccpos =3D { 0, 1, 2, 3 }, /* not used */
@@ -1819,7 +1823,7 @@ static struct nand_ecclayout nand_oob_slc =3D {
 	}
 };
=20
-#define ECC_BYTES_MLC   14 * (2048 / ECC_SECTOR_SIZE)
+#define ECC_BYTES_MLC   (14 * (2048 / ECC_SECTOR_SIZE))
 static struct nand_ecclayout nand_oob_mlc_14bit =3D {
 	.eccbytes =3D 14,
 	.eccpos =3D { 0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13 }, /* not used */
--=20
1.6.6.1
