Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdbJw-0000hv-Qa
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 03:59:14 +0000
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Tue, 27 Jul 2010 11:59:07 +0800
Subject: [PATCH 4/6] mtd: denali.c: add and update KERN_ facility level in
	printk()
Message-ID: <5D8008F58939784290FAB48F549751981D4E9692BA@shsmsx502.ccr.corp.intel.com>
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

>From f1ccbae296ef39324fcfb26b86f4fa5ece528ec5 Mon Sep 17 00:00:00 2001
From: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Tue, 27 Jul 2010 10:48:34 +0800
Subject: [PATCH 4/6] mtd: denali.c: add and update KERN_ facility level in =
printk()

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
=20
 #if DEBUG_DENALI
-	printk(KERN_ERR "wrote: 0x%x -> 0x%x\n", value, (uint32_t)((uint32_t)addr=
 & 0x1fff));
+	printk(KERN_INFO "wrote: 0x%x -> 0x%x\n", value, (uint32_t)((uint32_t)add=
r & 0x1fff));
 #endif
 }
=20
@@ -191,7 +191,7 @@ static void read_status(struct denali_nand_info *denali=
)
 	write_byte_to_buf(denali, ioread32(denali->flash_mem + 0x10));
=20
 #if DEBUG_DENALI
-	printk("device reporting status value of 0x%2x\n", denali->buf.buf[0]);
+	printk(KERN_INFO "device reporting status value of 0x%2x\n", denali->buf.=
buf[0]);
 #endif
 }
=20
@@ -989,9 +989,9 @@ static void print_irq_log(struct denali_nand_info *dena=
li)
 {
 	int i =3D 0;
=20
-	printk("ISR debug log index =3D %X\n", denali->idx);
+	printk(KERN_INFO "ISR debug log index =3D %X\n", denali->idx);
 	for (i =3D 0; i < 32; i++)
-		printk("%08X: %08X\n", i, denali->irq_debug_array[i]);
+		printk(KERN_INFO "%08X: %08X\n", i, denali->irq_debug_array[i]);
 }
 #endif
=20
@@ -1018,7 +1018,7 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 			denali->irq_debug_array[denali->idx++] =3D 0x10000000 | irq_status;
 			denali->idx %=3D 32;
=20
-			printk("IRQ status =3D 0x%04x\n", irq_status);
+			printk(KERN_INFO "IRQ status =3D 0x%04x\n", irq_status);
 #endif
 			/* handle interrupt */
 			/* first acknowledge it */
@@ -1046,7 +1046,7 @@ static uint32_t wait_for_irq(struct denali_nand_info =
*denali, uint32_t irq_mask)
=20
 	do {
 #if DEBUG_DENALI
-		printk("waiting for 0x%x\n", irq_mask);
+		printk(KERN_INFO "waiting for 0x%x\n", irq_mask);
 #endif
 		comp_res =3D wait_for_completion_timeout(&denali->complete, timeout);
 		spin_lock_irq(&denali->irq_lock);
@@ -1061,7 +1061,7 @@ static uint32_t wait_for_irq(struct denali_nand_info =
*denali, uint32_t irq_mask)
 			denali->irq_status &=3D ~irq_mask;
 			spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
-			if (retry) printk("status on retry =3D 0x%x\n", intr_status);
+			if (retry) printk(KERN_INFO "status on retry =3D 0x%x\n", intr_status);
 #endif
 			/* our interrupt was detected */
 			break;
@@ -1071,7 +1071,7 @@ static uint32_t wait_for_irq(struct denali_nand_info =
*denali, uint32_t irq_mask)
 			spin_unlock_irq(&denali->irq_lock);
 #if DEBUG_DENALI
 			print_irq_log(denali);
-			printk("received irq nobody cared: irq_status =3D 0x%x,"
+			printk(KERN_INFO "received irq nobody cared: irq_status =3D 0x%x,"
 				" irq_mask =3D 0x%x, timeout =3D %ld\n", intr_status, irq_mask, comp_r=
es);
 #endif
 			retry =3D true;
@@ -1263,7 +1263,7 @@ static void read_oob_data(struct mtd_info *mtd, uint8=
_t *buf, int page)
 	denali->page =3D page;
=20
 #if DEBUG_DENALI
-	printk("read_oob %d\n", page);
+	printk(KERN_INFO "read_oob %d\n", page);
 #endif
 	if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
 							DENALI_READ) =3D=3D PASS) {
@@ -1364,7 +1364,7 @@ static bool handle_ecc(struct denali_nand_info *denal=
i, uint8_t *buf,
 			}
=20
 #if DEBUG_DENALI
-			printk("Detected ECC error in page %d: err_addr =3D 0x%08x,"
+			printk(KERN_INFO "Detected ECC error in page %d: err_addr =3D 0x%08x,"
 				" info to fix is 0x%08x\n", denali->page, err_address,
 				err_correction_info);
 #endif
@@ -1589,7 +1589,7 @@ static uint8_t denali_read_byte(struct mtd_info *mtd)
 		result =3D denali->buf.buf[denali->buf.head++];
=20
 #if DEBUG_DENALI
-	printk("read byte -> 0x%02x\n", result);
+	printk(KERN_INFO "read byte -> 0x%02x\n", result);
 #endif
 	return result;
 }
@@ -1598,7 +1598,7 @@ static void denali_select_chip(struct mtd_info *mtd, =
int chip)
 {
 	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
 #if DEBUG_DENALI
-	printk("denali select chip %d\n", chip);
+	printk(KERN_INFO "denali select chip %d\n", chip);
 #endif
 	spin_lock_irq(&denali->irq_lock);
 	denali->flash_bank =3D chip;
@@ -1612,7 +1612,7 @@ static int denali_waitfunc(struct mtd_info *mtd, stru=
ct nand_chip *chip)
 	denali->status =3D 0;
=20
 #if DEBUG_DENALI
-	printk("waitfunc %d\n", status);
+	printk(KERN_INFO "waitfunc %d\n", status);
 #endif
 	return status;
 }
@@ -1624,7 +1624,7 @@ static void denali_erase(struct mtd_info *mtd, int pa=
ge)
 	uint32_t cmd =3D 0x0, irq_status =3D 0;
=20
 #if DEBUG_DENALI
-	printk("erase page: %d\n", page);
+	printk(KERN_INFO "erase page: %d\n", page);
 #endif
 	/* clear interrupts */
 	clear_interrupts(denali);
@@ -1647,7 +1647,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsi=
gned int cmd, int col,
 	struct denali_nand_info *denali =3D mtd_to_denali(mtd);
=20
 #if DEBUG_DENALI
-	printk("cmdfunc: 0x%x %d %d\n", cmd, col, page);
+	printk(KERN_INFO "cmdfunc: 0x%x %d %d\n", cmd, col, page);
 #endif
 	switch (cmd) {
 		case NAND_CMD_PAGEPROG:
@@ -1824,7 +1824,7 @@ static int denali_pci_probe(struct pci_dev *dev, cons=
t struct pci_device_id *id)
 		 * ONFI timing mode 1 and below.
 		 */
 		if (onfi_timing_mode < -1 || onfi_timing_mode > 1) {
-			printk("Intel CE4100 only supports ONFI timing mode 1 "
+			printk(KERN_ERR "Intel CE4100 only supports ONFI timing mode 1 "
 				"or below\n");
 			ret =3D -EINVAL;
 			goto failed_enable;
--=20
1.6.6.1
