Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddItj-00005r-RR
 for linux-mtd@lists.infradead.org; Thu, 03 Aug 2017 16:22:57 +0000
Received: by mail-pf0-x242.google.com with SMTP id p13so1933701pfd.4
 for <linux-mtd@lists.infradead.org>; Thu, 03 Aug 2017 09:22:36 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] mtd: amd76xrom: constify pci_device_id.
Date: Thu,  3 Aug 2017 21:52:06 +0530
Message-Id: <1501777330-21380-3-git-send-email-arvind.yadav.cs@gmail.com>
In-Reply-To: <1501777330-21380-1-git-send-email-arvind.yadav.cs@gmail.com>
References: <1501777330-21380-1-git-send-email-arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

pci_device_id are not supposed to change at runtime. All functions
working with pci_device_id provided by <linux/pci.h> work with
const pci_device_id. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/mtd/maps/amd76xrom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/amd76xrom.c b/drivers/mtd/maps/amd76xrom.c
index f2b6866..26de0a1 100644
--- a/drivers/mtd/maps/amd76xrom.c
+++ b/drivers/mtd/maps/amd76xrom.c
@@ -296,7 +296,7 @@ static void amd76xrom_remove_one(struct pci_dev *pdev)
 	amd76xrom_cleanup(window);
 }
 
-static struct pci_device_id amd76xrom_pci_tbl[] = {
+static const struct pci_device_id amd76xrom_pci_tbl[] = {
 	{ PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_VIPER_7410,
 		PCI_ANY_ID, PCI_ANY_ID, },
 	{ PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_VIPER_7440,
@@ -319,7 +319,7 @@ static struct pci_driver amd76xrom_driver = {
 static int __init init_amd76xrom(void)
 {
 	struct pci_dev *pdev;
-	struct pci_device_id *id;
+	const struct pci_device_id *id;
 	pdev = NULL;
 	for(id = amd76xrom_pci_tbl; id->vendor; id++) {
 		pdev = pci_get_device(id->vendor, id->device, NULL);
-- 
2.7.4
