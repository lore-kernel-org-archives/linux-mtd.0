Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTVPO-0000iE-DW
 for linux-mtd@lists.infradead.org; Thu, 05 Mar 2015 13:01:50 +0000
Received: by wghl18 with SMTP id l18so5965663wgh.5
 for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2015 05:01:22 -0800 (PST)
From: Valentin Rothberg <valentinrothberg@gmail.com>
To: akpm@linux-foundation.org
Subject: [PATCH] Remove deprecated IRQF_DISABLED flag entirely
Date: Thu,  5 Mar 2015 13:59:39 +0100
Message-Id: <1425560442-13367-1-git-send-email-valentinrothberg@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, linux-mips@linux-mips.org,
 Quentin Lambert <lambert.quentin@gmail.com>, Jiri Kosina <jkosina@suse.cz>,
 Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Sricharan R <r.sricharan@ti.com>, linux-mtd@lists.infradead.org,
 Felipe Balbi <balbi@ti.com>, Huacai Chen <chenhc@lemote.com>,
 Christoph Hellwig <hch@lst.de>, Kukjin Kim <kgene.kim@samsung.com>,
 iss_storagedev@hp.com, Jonathan Corbet <corbet@lwn.net>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Ewan Milne <emilne@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Afzal Mohammed <afzal@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Rajendra Nayak <rnayak@ti.com>,
 Eyal Perry <eyalpe@mellanox.com>, Hannes Reinecke <hare@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Valentin Rothberg <valentinrothberg@gmail.com>,
 Paul Bolle <pebolle@tiscali.nl>, Keerthy <j-keerthy@ti.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Zhou Wang <wangzhou1@hisilicon.com>, linux-usb@vger.kernel.org,
 Santosh Shilimkar <santosh.shilimkar@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hongliang Tao <taohl@lemote.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The IRQF_DISABLED is a NOOP and has been scheduled for removal since
Linux v2.6.36 by commit 6932bf37bed4 ("genirq: Remove IRQF_DISABLED from
core code").

According to commit e58aa3d2d0cc ("genirq: Run irq handlers with
interrupts disabled") running IRQ handlers with interrupts enabled can
cause stack overflows when the interrupt line of the issuing device is
still active.

This patch ends the grace period for IRQF_DISABLED (i.e., SA_INTERRUPT
in older versions of Linux) and removes the definition and all remaining
usages of this flag.

Signed-off-by: Valentin Rothberg <valentinrothberg@gmail.com>
---
The bigger hunk in Documentation/scsi/ncr53c8xx.txt is removed entirely
as IRQF_DISABLED is gone now; the usage in older kernel versions
(including the old SA_INTERRUPT flag) should be discouraged.  The
trouble of using IRQF_SHARED is a general problem and not specific to
any driver.

I left the reference in Documentation/PCI/MSI-HOWTO.txt untouched since
it has already been removed in linux-next by commit b0e1ee8e1405
("MSI-HOWTO.txt: remove reference on IRQF_DISABLED").

All remaining references are changelogs that I suggest to keep.
---
 Documentation/scsi/ncr53c8xx.txt     | 25 -------------------------
 Documentation/scsi/tmscsim.txt       |  4 ----
 arch/mips/loongson/loongson-3/hpet.c |  2 +-
 drivers/block/cpqarray.c             |  4 ++--
 drivers/bus/omap_l3_noc.c            |  4 ++--
 drivers/bus/omap_l3_smx.c            | 10 ++++------
 drivers/mtd/nand/hisi504_nand.c      |  3 +--
 drivers/usb/isp1760/isp1760-core.c   |  3 +--
 drivers/usb/isp1760/isp1760-udc.c    |  4 ++--
 include/linux/interrupt.h            |  3 ---
 10 files changed, 13 insertions(+), 49 deletions(-)

diff --git a/Documentation/scsi/ncr53c8xx.txt b/Documentation/scsi/ncr53c8xx.txt
index 1d508dcbf859..8586efff1e99 100644
--- a/Documentation/scsi/ncr53c8xx.txt
+++ b/Documentation/scsi/ncr53c8xx.txt
@@ -786,7 +786,6 @@ port address 0x1400.
         irqm:1     same as initial settings (assumed BIOS settings)
         irqm:2     always totem pole
         irqm:0x10  driver will not use IRQF_SHARED flag when requesting irq
-        irqm:0x20  driver will not use IRQF_DISABLED flag when requesting irq
 
     (Bits 0x10 and 0x20 can be combined with hardware irq mode option)
 
@@ -1231,30 +1230,6 @@ they only refer to system buffers that are well aligned. So, a work around
 may only be needed under Linux when a scatter/gather list is not used and 
 when the SCSI DATA IN phase is reentered after a phase mismatch.
 
-14.5 IRQ sharing problems
-
-When an IRQ is shared by devices that are handled by different drivers, it 
-may happen that one driver complains about the request of the IRQ having 
-failed. Inder Linux-2.0, this may be due to one driver having requested the 
-IRQ using the IRQF_DISABLED flag but some other having requested the same IRQ
-without this flag. Under both Linux-2.0 and linux-2.2, this may be caused by 
-one driver not having requested the IRQ with the IRQF_SHARED flag.
-
-By default, the ncr53c8xx and sym53c8xx drivers request IRQs with both the 
-IRQF_DISABLED and the IRQF_SHARED flag under Linux-2.0 and with only the IRQF_SHARED
-flag under Linux-2.2.
-
-Under Linux-2.0, you can disable use of IRQF_DISABLED flag from the boot
-command line by using the following option:
-
-     ncr53c8xx=irqm:0x20   (for the generic ncr53c8xx driver)
-     sym53c8xx=irqm:0x20   (for the sym53c8xx driver)
-
-If this does not fix the problem, then you may want to check how all other 
-drivers are requesting the IRQ and report the problem. Note that if at least 
-a single driver does not request the IRQ with the IRQF_SHARED flag (share IRQ),
-then the request of the IRQ obviously will not succeed for all the drivers.
-
 15. SCSI problem troubleshooting
 
 15.1 Problem tracking
diff --git a/Documentation/scsi/tmscsim.txt b/Documentation/scsi/tmscsim.txt
index 0810132772a8..0e0322bf0020 100644
--- a/Documentation/scsi/tmscsim.txt
+++ b/Documentation/scsi/tmscsim.txt
@@ -107,10 +107,6 @@ produced errors and started to corrupt my disks. So don't do that! A 37.50
 MHz PCI bus works for me, though, but I don't recommend using higher clocks
 than the 33.33 MHz being in the PCI spec.
 
-If you want to share the IRQ with another device and the driver refuses to
-do so, you might succeed with changing the DC390_IRQ type in tmscsim.c to 
-IRQF_SHARED | IRQF_DISABLED.
-
 
 3.Features
 ----------
diff --git a/arch/mips/loongson/loongson-3/hpet.c b/arch/mips/loongson/loongson-3/hpet.c
index e898d68668a9..5c21cd3bd339 100644
--- a/arch/mips/loongson/loongson-3/hpet.c
+++ b/arch/mips/loongson/loongson-3/hpet.c
@@ -162,7 +162,7 @@ static irqreturn_t hpet_irq_handler(int irq, void *data)
 
 static struct irqaction hpet_irq = {
 	.handler = hpet_irq_handler,
-	.flags = IRQF_DISABLED | IRQF_NOBALANCING | IRQF_TIMER,
+	.flags = IRQF_NOBALANCING | IRQF_TIMER,
 	.name = "hpet",
 };
 
diff --git a/drivers/block/cpqarray.c b/drivers/block/cpqarray.c
index 2b9440384536..f749df9e15cd 100644
--- a/drivers/block/cpqarray.c
+++ b/drivers/block/cpqarray.c
@@ -405,8 +405,8 @@ static int cpqarray_register_ctlr(int i, struct pci_dev *pdev)
 		goto Enomem4;
 	}
 	hba[i]->access.set_intr_mask(hba[i], 0);
-	if (request_irq(hba[i]->intr, do_ida_intr,
-		IRQF_DISABLED|IRQF_SHARED, hba[i]->devname, hba[i]))
+	if (request_irq(hba[i]->intr, do_ida_intr, IRQF_SHARED,
+			hba[i]->devname, hba[i]))
 	{
 		printk(KERN_ERR "cpqarray: Unable to get irq %d for %s\n",
 				hba[i]->intr, hba[i]->devname);
diff --git a/drivers/bus/omap_l3_noc.c b/drivers/bus/omap_l3_noc.c
index 029bc73de001..11f7982cbdb3 100644
--- a/drivers/bus/omap_l3_noc.c
+++ b/drivers/bus/omap_l3_noc.c
@@ -284,7 +284,7 @@ static int omap_l3_probe(struct platform_device *pdev)
 	 */
 	l3->debug_irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(l3->dev, l3->debug_irq, l3_interrupt_handler,
-			       IRQF_DISABLED, "l3-dbg-irq", l3);
+			       0x0, "l3-dbg-irq", l3);
 	if (ret) {
 		dev_err(l3->dev, "request_irq failed for %d\n",
 			l3->debug_irq);
@@ -293,7 +293,7 @@ static int omap_l3_probe(struct platform_device *pdev)
 
 	l3->app_irq = platform_get_irq(pdev, 1);
 	ret = devm_request_irq(l3->dev, l3->app_irq, l3_interrupt_handler,
-			       IRQF_DISABLED, "l3-app-irq", l3);
+			       0x0, "l3-app-irq", l3);
 	if (ret)
 		dev_err(l3->dev, "request_irq failed for %d\n", l3->app_irq);
 
diff --git a/drivers/bus/omap_l3_smx.c b/drivers/bus/omap_l3_smx.c
index 597fdaee7315..360a5c0a4ee0 100644
--- a/drivers/bus/omap_l3_smx.c
+++ b/drivers/bus/omap_l3_smx.c
@@ -251,18 +251,16 @@ static int omap3_l3_probe(struct platform_device *pdev)
 	}
 
 	l3->debug_irq = platform_get_irq(pdev, 0);
-	ret = request_irq(l3->debug_irq, omap3_l3_app_irq,
-		IRQF_DISABLED | IRQF_TRIGGER_RISING,
-		"l3-debug-irq", l3);
+	ret = request_irq(l3->debug_irq, omap3_l3_app_irq, IRQF_TRIGGER_RISING,
+			  "l3-debug-irq", l3);
 	if (ret) {
 		dev_err(&pdev->dev, "couldn't request debug irq\n");
 		goto err1;
 	}
 
 	l3->app_irq = platform_get_irq(pdev, 1);
-	ret = request_irq(l3->app_irq, omap3_l3_app_irq,
-		IRQF_DISABLED | IRQF_TRIGGER_RISING,
-		"l3-app-irq", l3);
+	ret = request_irq(l3->app_irq, omap3_l3_app_irq, IRQF_TRIGGER_RISING,
+			  "l3-app-irq", l3);
 	if (ret) {
 		dev_err(&pdev->dev, "couldn't request app irq\n");
 		goto err2;
diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
index 289ad3ac3e80..7f9f9c827c1d 100644
--- a/drivers/mtd/nand/hisi504_nand.c
+++ b/drivers/mtd/nand/hisi504_nand.c
@@ -758,8 +758,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 
 	hisi_nfc_host_init(host);
 
-	ret = devm_request_irq(dev, irq, hinfc_irq_handle, IRQF_DISABLED,
-				"nandc", host);
+	ret = devm_request_irq(dev, irq, hinfc_irq_handle, "nandc", host);
 	if (ret) {
 		dev_err(dev, "failed to request IRQ\n");
 		goto err_res;
diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
index b9827556455f..5c37f40f6122 100644
--- a/drivers/usb/isp1760/isp1760-core.c
+++ b/drivers/usb/isp1760/isp1760-core.c
@@ -151,8 +151,7 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 	}
 
 	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && !udc_disabled) {
-		ret = isp1760_udc_register(isp, irq, irqflags | IRQF_SHARED |
-					   IRQF_DISABLED);
+		ret = isp1760_udc_register(isp, irq, irqflags | IRQF_SHARED);
 		if (ret < 0) {
 			isp1760_hcd_unregister(&isp->hcd);
 			return ret;
diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1760-udc.c
index 9612d7990565..0b46ff01299f 100644
--- a/drivers/usb/isp1760/isp1760-udc.c
+++ b/drivers/usb/isp1760/isp1760-udc.c
@@ -1451,8 +1451,8 @@ int isp1760_udc_register(struct isp1760_device *isp, int irq,
 
 	sprintf(udc->irqname, "%s (udc)", devname);
 
-	ret = request_irq(irq, isp1760_udc_irq, IRQF_SHARED | IRQF_DISABLED |
-			  irqflags, udc->irqname, udc);
+	ret = request_irq(irq, isp1760_udc_irq, IRQF_SHARED | irqflags,
+			  udc->irqname, udc);
 	if (ret < 0)
 		goto error;
 
diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index d9b05b5bf8c7..bb4ecaeb4a14 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -39,8 +39,6 @@
  * These flags used only by the kernel as part of the
  * irq handling routines.
  *
- * IRQF_DISABLED - keep irqs disabled when calling the action handler.
- *                 DEPRECATED. This flag is a NOOP and scheduled to be removed
  * IRQF_SHARED - allow sharing the irq among several devices
  * IRQF_PROBE_SHARED - set by callers when they expect sharing mismatches to occur
  * IRQF_TIMER - Flag to mark this interrupt as timer interrupt
@@ -58,7 +56,6 @@
  * IRQF_EARLY_RESUME - Resume IRQ early during syscore instead of at device
  *                resume time.
  */
-#define IRQF_DISABLED		0x00000020
 #define IRQF_SHARED		0x00000080
 #define IRQF_PROBE_SHARED	0x00000100
 #define __IRQF_TIMER		0x00000200
-- 
1.9.1
