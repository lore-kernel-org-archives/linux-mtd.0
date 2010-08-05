Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh22n-0007Pt-3z
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:07:42 +0000
Received: by pxi13 with SMTP id 13so2835655pxi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 08:07:40 -0700 (PDT)
Date: Thu, 5 Aug 2010 23:07:50 +0800
From: Chuanxiao <chuanxiao.dong@gmail.com>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com,
	david.woodhouse@intel.com
Subject: [PATCH v2 3/5]nand/denali add and update KERN_ facility level in
	printk()
Message-ID: <20100805150750.GB6650@infernal>
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

>From a213ea541adbb88319f2dd12fbc71fa56c61095f Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Tue, 27 Jul 2010 10:48:34 +0800
Subject: [PATCH 3/5] mtd: denali.c: add and update KERN_ facility level in printk()

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/denali.c |   32 ++++++++++++++++----------------
 1 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index f850a65..55a7a39 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -138,7 +138,7 @@ static void denali_write32(uint32_t value, void *addr)
 	iowrite32(value, addr);
 
 #if DEBUG_DENALI
-	printk(KERN_ERR "wrote: 0x%x -> 0x%x\n", value, (uint32_t)((uint32_t)addr & 0x1fff));
+	printk(KERN_INFO "wrote: 0x%x -> 0x%x\n", value, (uint32_t)((uint32_t)addr & 0x1fff));
 #endif
 }
 
@@ -191,7 +191,7 @@ static void read_status(struct denali_nand_info *denali)
 	write_byte_to_buf(denali, ioread32(denali->flash_mem + 0x10));
 
 #if DEBUG_DENALI
-	printk("device reporting status value of 0x%2x\n", denali->buf.buf[0]);
+	printk(KERN_INFO "device reporting status value of 0x%2x\n", denali->buf.buf[0]);
 #endif
 }
 
@@ -989,9 +989,9 @@ static void print_irq_log(struct denali_nand_info *denali)
 {
 	int i = 0;
 
-	printk("ISR debug log index = %X\n", denali->idx);
+	printk(KERN_INFO "ISR debug log index = %X\n", denali->idx);
 	for (i = 0; i < 32; i++)
-		printk("%08X: %08X\n", i, denali->irq_debug_array[i]);
+		printk(KERN_INFO "%08X: %08X\n", i, denali->irq_debug_array[i]);
 }
 #endif
 
@@ -1018,7 +1018,7 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 			denali->irq_debug_array[denali->idx++] = 0x10000000 | irq_status;
 			denali->idx %= 32;
 
-			printk("IRQ status = 0x%04x\n", irq_status);
+			printk(KERN_INFO "IRQ status = 0x%04x\n", irq_status);
 #endif
 			/* handle interrupt */
 			/* first acknowledge it */
@@ -1046,7 +1046,7 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 
 	do {
 #if DEBUG_DENALI
-		printk("waiting for 0x%x\n", irq_mask);
+		printk(KERN_INFO "waiting for 0x%x\n", irq_mask);
 #endif
 		comp_res = wait_for_completion_timeout(&denali->complete, timeout);
 		spin_lock_irq(&denali->irq_lock);
@@ -1061,7 +1061,7 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 			denali->irq_status &= ~irq_mask;
 			spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
-			if (retry) printk("status on retry = 0x%x\n", intr_status);
+			if (retry) printk(KERN_INFO "status on retry = 0x%x\n", intr_status);
 #endif
 			/* our interrupt was detected */
 			break;
@@ -1071,7 +1071,7 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 			spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
 			print_irq_log(denali);
-			printk("received irq nobody cared: irq_status = 0x%x,"
+			printk(KERN_INFO "received irq nobody cared: irq_status = 0x%x,"
 				" irq_mask = 0x%x, timeout = %ld\n", intr_status, irq_mask, comp_res);
 #endif
 			retry = true;
@@ -1263,7 +1263,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 	denali->page = page;
 
 #if DEBUG_DENALI
-	printk("read_oob %d\n", page);
+	printk(KERN_INFO "read_oob %d\n", page);
 #endif
 	if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
 							DENALI_READ) == PASS) {
@@ -1364,7 +1364,7 @@ static bool handle_ecc(struct denali_nand_info *denali, uint8_t *buf,
 			}
 
 #if DEBUG_DENALI
-			printk("Detected ECC error in page %d: err_addr = 0x%08x,"
+			printk(KERN_INFO "Detected ECC error in page %d: err_addr = 0x%08x,"
 				" info to fix is 0x%08x\n", denali->page, err_address,
 				err_correction_info);
 #endif
@@ -1589,7 +1589,7 @@ static uint8_t denali_read_byte(struct mtd_info *mtd)
 		result = denali->buf.buf[denali->buf.head++];
 
 #if DEBUG_DENALI
-	printk("read byte -> 0x%02x\n", result);
+	printk(KERN_INFO "read byte -> 0x%02x\n", result);
 #endif
 	return result;
 }
@@ -1598,7 +1598,7 @@ static void denali_select_chip(struct mtd_info *mtd, int chip)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 #if DEBUG_DENALI
-	printk("denali select chip %d\n", chip);
+	printk(KERN_INFO "denali select chip %d\n", chip);
 #endif
 	spin_lock_irq(&denali->irq_lock);
 	denali->flash_bank = chip;
@@ -1612,7 +1612,7 @@ static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
 	denali->status = 0;
 
 #if DEBUG_DENALI
-	printk("waitfunc %d\n", status);
+	printk(KERN_INFO "waitfunc %d\n", status);
 #endif
 	return status;
 }
@@ -1624,7 +1624,7 @@ static void denali_erase(struct mtd_info *mtd, int page)
 	uint32_t cmd = 0x0, irq_status = 0;
 
 #if DEBUG_DENALI
-	printk("erase page: %d\n", page);
+	printk(KERN_INFO "erase page: %d\n", page);
 #endif
 	/* clear interrupts */
 	clear_interrupts(denali);
@@ -1647,7 +1647,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
 #if DEBUG_DENALI
-	printk("cmdfunc: 0x%x %d %d\n", cmd, col, page);
+	printk(KERN_INFO "cmdfunc: 0x%x %d %d\n", cmd, col, page);
 #endif
 	switch (cmd) {
 		case NAND_CMD_PAGEPROG:
@@ -1824,7 +1824,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		 * ONFI timing mode 1 and below.
 		 */
 		if (onfi_timing_mode < -1 || onfi_timing_mode > 1) {
-			printk("Intel CE4100 only supports ONFI timing mode 1 "
+			printk(KERN_ERR "Intel CE4100 only supports ONFI timing mode 1 "
 				"or below\n");
 			ret = -EINVAL;
 			goto failed_enable;
-- 
1.6.6.1
