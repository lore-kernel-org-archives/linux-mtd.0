Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh256-0001CY-2A
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:10:05 +0000
Received: by pxi13 with SMTP id 13so2837414pxi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 08:10:02 -0700 (PDT)
Date: Thu, 5 Aug 2010 23:10:07 +0800
From: Chuanxiao <chuanxiao.dong@gmail.com>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com,
	david.woodhouse@intel.com
Subject: [PATCH v2 5/5]nand/denali fix reserved all check patch errors
Message-ID: <20100805151007.GD6650@infernal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: chuanxiao.dong@intel.com, yunpeng.gao@intel.com, hang.yuan@intel.com
Reply-To: Chuanxiao <chuanxiao.dong@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From eb144a9c6615dc87bc4a57813742317012f4e44b Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Tue, 27 Jul 2010 11:32:21 +0800
Subject: [PATCH 5/5] mtd: denali.c: fix reserved all check-patch errors

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |  102 +++++++++++++++++++++++---------------------
 1 files changed, 53 insertions(+), 49 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 3ce11cc..52278d8 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -119,7 +119,7 @@ static const uint32_t reset_complete[4] = {INTR_STATUS0__RST_COMP,
 							INTR_STATUS3__RST_COMP};
 
 /* specifies the debug level of the driver */
-static int nand_debug_level = 0;
+static int nand_debug_level;
 
 /* forward declarations */
 static void clear_interrupts(struct denali_nand_info *denali);
@@ -991,7 +991,7 @@ static void denali_irq_enable(struct denali_nand_info *denali,
  */
 static inline uint32_t denali_irq_detected(struct denali_nand_info *denali)
 {
-	return (read_interrupt_status(denali) & DENALI_IRQ_ALL);
+	return read_interrupt_status(denali) & DENALI_IRQ_ALL;
 }
 
 /* Interrupts are cleared by writing a 1 to the appropriate status bit */
@@ -1172,9 +1172,12 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 	uint32_t addr = 0x0, cmd = 0x0, page_count = 1, irq_status = 0,
 		 irq_mask = 0;
 
-	if (op == DENALI_READ) irq_mask = INTR_STATUS0__LOAD_COMP;
-	else if (op == DENALI_WRITE) irq_mask = 0;
-	else BUG();
+	if (op == DENALI_READ)
+		irq_mask = INTR_STATUS0__LOAD_COMP;
+	else if (op == DENALI_WRITE)
+		irq_mask = 0;
+	else
+		BUG();
 
 	setup_ecc_for_xfer(denali, ecc_en, transfer_spare);
 
@@ -1448,7 +1451,8 @@ static void denali_enable_dma(struct denali_nand_info *denali, bool en)
 {
 	uint32_t reg_val = 0x0;
 
-	if (en) reg_val = DMA_ENABLE__FLAG;
+	if (en)
+		reg_val = DMA_ENABLE__FLAG;
 
 	denali_write32(reg_val, denali->flash_reg + DMA_ENABLE);
 	ioread32(denali->flash_reg + DMA_ENABLE);
@@ -1721,47 +1725,47 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
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
-				for (i = 0; i < 5; i++)
-					write_byte_to_buf(denali, 0xff);
-			}
-			break;
-		case NAND_CMD_READ0:
-		case NAND_CMD_SEQIN:
-			denali->page = page;
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
+			for (i = 0; i < 5; i++)
+				write_byte_to_buf(denali, 0xff);
+		}
+		break;
+	case NAND_CMD_READ0:
+	case NAND_CMD_SEQIN:
+		denali->page = page;
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
 
@@ -1807,7 +1811,7 @@ static void denali_hw_init(struct denali_nand_info *denali)
 }
 
 /* ECC layout for SLC devices. Denali spec indicates SLC fixed at 4 bytes */
-#define ECC_BYTES_SLC   4 * (2048 / ECC_SECTOR_SIZE)
+#define ECC_BYTES_SLC   (4 * (2048 / ECC_SECTOR_SIZE))
 static struct nand_ecclayout nand_oob_slc = {
 	.eccbytes = 4,
 	.eccpos = { 0, 1, 2, 3 }, /* not used */
@@ -1819,7 +1823,7 @@ static struct nand_ecclayout nand_oob_slc = {
 	}
 };
 
-#define ECC_BYTES_MLC   14 * (2048 / ECC_SECTOR_SIZE)
+#define ECC_BYTES_MLC   (14 * (2048 / ECC_SECTOR_SIZE))
 static struct nand_ecclayout nand_oob_mlc_14bit = {
 	.eccbytes = 14,
 	.eccpos = { 0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13 }, /* not used */
-- 
1.6.6.1
