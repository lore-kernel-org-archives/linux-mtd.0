Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddItm-000062-FU
 for linux-mtd@lists.infradead.org; Thu, 03 Aug 2017 16:23:00 +0000
Received: by mail-pg0-x244.google.com with SMTP id y129so1916460pgy.3
 for <linux-mtd@lists.infradead.org>; Thu, 03 Aug 2017 09:22:42 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] mtd: ck804xrom: constify pci_device_id.
Date: Thu,  3 Aug 2017 21:52:08 +0530
Message-Id: <1501777330-21380-5-git-send-email-arvind.yadav.cs@gmail.com>
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
 drivers/mtd/maps/ck804xrom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/ck804xrom.c b/drivers/mtd/maps/ck804xrom.c
index 4f206a9..584962e 100644
--- a/drivers/mtd/maps/ck804xrom.c
+++ b/drivers/mtd/maps/ck804xrom.c
@@ -326,7 +326,7 @@ static void ck804xrom_remove_one(struct pci_dev *pdev)
 	ck804xrom_cleanup(window);
 }
 
-static struct pci_device_id ck804xrom_pci_tbl[] = {
+static const struct pci_device_id ck804xrom_pci_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, 0x0051), .driver_data = DEV_CK804 },
 	{ PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, 0x0360), .driver_data = DEV_MCP55 },
 	{ PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, 0x0361), .driver_data = DEV_MCP55 },
@@ -353,7 +353,7 @@ static struct pci_driver ck804xrom_driver = {
 static int __init init_ck804xrom(void)
 {
 	struct pci_dev *pdev;
-	struct pci_device_id *id;
+	const struct pci_device_id *id;
 	int retVal;
 	pdev = NULL;
 
-- 
2.7.4
