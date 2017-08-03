Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddItn-00005w-QH
 for linux-mtd@lists.infradead.org; Thu, 03 Aug 2017 16:23:01 +0000
Received: by mail-pf0-x243.google.com with SMTP id c65so1943022pfl.0
 for <linux-mtd@lists.infradead.org>; Thu, 03 Aug 2017 09:22:39 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] mtd: esb2rom: constify pci_device_id.
Date: Thu,  3 Aug 2017 21:52:07 +0530
Message-Id: <1501777330-21380-4-git-send-email-arvind.yadav.cs@gmail.com>
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
 drivers/mtd/maps/esb2rom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/esb2rom.c b/drivers/mtd/maps/esb2rom.c
index 9646b07..da9f6d7 100644
--- a/drivers/mtd/maps/esb2rom.c
+++ b/drivers/mtd/maps/esb2rom.c
@@ -384,7 +384,7 @@ static void esb2rom_remove_one(struct pci_dev *pdev)
 	esb2rom_cleanup(window);
 }
 
-static struct pci_device_id esb2rom_pci_tbl[] = {
+static const struct pci_device_id esb2rom_pci_tbl[] = {
 	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_0,
 	  PCI_ANY_ID, PCI_ANY_ID, },
 	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801CA_0,
@@ -414,7 +414,7 @@ static struct pci_driver esb2rom_driver = {
 static int __init init_esb2rom(void)
 {
 	struct pci_dev *pdev;
-	struct pci_device_id *id;
+	const struct pci_device_id *id;
 	int retVal;
 
 	pdev = NULL;
-- 
2.7.4
