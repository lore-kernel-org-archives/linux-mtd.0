Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlrPS-00075a-L2
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 02:32:55 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MWY00C09CE6GF80@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 11:32:30 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <001e01ceebe1$f5adf370$e109da50$%han@samsung.com>
In-reply-to: <001e01ceebe1$f5adf370$e109da50$%han@samsung.com>
Subject: [PATCH 2/9] mtd: ck804xrom: use DEFINE_PCI_DEVICE_TABLE macro
Date: Thu, 28 Nov 2013 11:32:30 +0900
Message-id: <001f01ceebe2$15f35d50$41da17f0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This macro is used to create a struct pci_device_id array.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/maps/ck804xrom.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/ck804xrom.c b/drivers/mtd/maps/ck804xrom.c
index 0455166..2acaaa1 100644
--- a/drivers/mtd/maps/ck804xrom.c
+++ b/drivers/mtd/maps/ck804xrom.c
@@ -326,7 +326,7 @@ static void ck804xrom_remove_one(struct pci_dev *pdev)
 	ck804xrom_cleanup(window);
 }
 
-static struct pci_device_id ck804xrom_pci_tbl[] = {
+static DEFINE_PCI_DEVICE_TABLE(ck804xrom_pci_tbl) = {
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
1.7.10.4
