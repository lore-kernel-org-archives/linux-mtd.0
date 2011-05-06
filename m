Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIM2N-0008Ni-Av
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:29:48 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3113364wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 07:29:47 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 7/9] nand/denali: annotate pci init/exit functions with
	correct section
Date: Fri,  6 May 2011 15:29:01 +0100
Message-Id: <1304692143-22432-8-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org,
	chuanxiao.dong@intel.com
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
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/denali_pci.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index 1096d49..3d9a46a 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -130,13 +130,13 @@ static struct pci_driver denali_pci_driver = {
 	.remove = denali_pci_remove,
 };
 
-static int __devinit denali_init_pci(void)
+static int __init denali_init_pci(void)
 {
 	return pci_register_driver(&denali_pci_driver);
 }
 module_init(denali_init_pci);
 
-static void __devexit denali_exit_pci(void)
+static void __exit denali_exit_pci(void)
 {
 	pci_unregister_driver(&denali_pci_driver);
 }
-- 
1.7.4.4
