Received: from mail-qw0-f49.google.com ([209.85.216.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rfe4B-0007N7-A7
 for linux-mtd@lists.infradead.org; Tue, 27 Dec 2011 20:56:11 +0000
Received: by qadc14 with SMTP id c14so7310049qad.15
 for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2011 12:56:07 -0800 (PST)
From: Xi Wang <xi.wang@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Lucas De Marchi <lucas.demarchi@profusion.mobi>
Subject: [PATCH] pmc551: fix signedness bug in init_pmc551()
Date: Tue, 27 Dec 2011 15:54:16 -0500
Message-Id: <1325019256-5171-1-git-send-email-xi.wang@gmail.com>
Cc: linux-mtd@lists.infradead.org, Xi Wang <xi.wang@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since "length" is a u32, the error handling below didn't work when
fixup_pmc551() returns -ENODEV.

	if ((length = fixup_pmc551(PCI_Device)) <= 0)

This patch changes fixup_pmc551() by separating the error handling
and the size.

Signed-off-by: Xi Wang <xi.wang@gmail.com>
---
 drivers/mtd/devices/pmc551.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index ecff765..17b3536 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -359,7 +359,7 @@ static int pmc551_write(struct mtd_info *mtd, loff_t to, size_t len,
  * mechanism
  * returns the size of the memory region found.
  */
-static u32 fixup_pmc551(struct pci_dev *dev)
+static int fixup_pmc551(struct pci_dev *dev, u32 *lenp)
 {
 #ifdef CONFIG_MTD_PMC551_BUGFIX
 	u32 dram_data;
@@ -638,7 +638,8 @@ static u32 fixup_pmc551(struct pci_dev *dev)
 		(bcmd & 0x1) ? "software" : "hardware",
 		(bcmd & 0x20) ? "" : "un", (bcmd & 0x40) ? "" : "un");
 #endif
-	return size;
+	*lenp = size;
+	return 0;
 }
 
 /*
@@ -713,7 +714,7 @@ static int __init init_pmc551(void)
 		 * with the oldproc.c driver in
 		 * some kernels (2.2.*)
 		 */
-		if ((length = fixup_pmc551(PCI_Device)) <= 0) {
+		if (fixup_pmc551(PCI_Device, &length) < 0 || !length) {
 			printk(KERN_NOTICE "pmc551: Cannot init SDRAM\n");
 			break;
 		}
-- 
1.7.5.4
