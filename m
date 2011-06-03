Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSRgc-0002ag-5x
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 10:33:03 +0000
Received: by wwb39 with SMTP id 39so1164220wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 03:33:00 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2 2/6] nand/denali: annotate pci init/exit functions with
	correct section
Date: Fri,  3 Jun 2011 11:32:45 +0100
Message-Id: <1307097169-11744-3-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
References: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The module init exit functions should be annotated with __init and
__exit.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index a4b4a29..491458a 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1686,14 +1686,14 @@ static struct pci_driver denali_pci_driver = {
 	.remove = denali_pci_remove,
 };
 
-static int __devinit denali_init(void)
+static int __init denali_init(void)
 {
 	pr_info(KERN_INFO "Spectra MTD driver\n");
 	return pci_register_driver(&denali_pci_driver);
 }
 
 /* Free memory */
-static void __devexit denali_exit(void)
+static void __exit denali_exit(void)
 {
 	pci_unregister_driver(&denali_pci_driver);
 }
-- 
1.7.4.1
