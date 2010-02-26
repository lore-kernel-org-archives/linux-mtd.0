Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nl7SJ-0003OQ-VG
	for linux-mtd@lists.infradead.org; Fri, 26 Feb 2010 21:10:44 +0000
Received: by fxm6 with SMTP id 6so559443fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Feb 2010 13:10:38 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: r852 fix pci ID
Date: Fri, 26 Feb 2010 23:10:32 +0200
Message-Id: <1267218632-5723-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The PCI_DEVICE_ID_RICOH_R5C852 was forgotten, and on second thought
I just open code it.

This fixes compile error.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/r852.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 7a616a9..218a42d 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -1083,7 +1083,7 @@ int r852_resume(struct device *device)
 
 static const struct pci_device_id r852_pci_id_tbl[] = {
 
-	{ PCI_VDEVICE(RICOH, PCI_DEVICE_ID_RICOH_R5C852), },
+	{ PCI_VDEVICE(RICOH, 0x0852), },
 	{ },
 };
 
-- 
1.6.3.3
