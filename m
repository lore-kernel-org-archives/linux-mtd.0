Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlrPm-00076B-J2
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 02:33:15 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MWY00GAWCES0ZD0@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 11:32:52 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <001e01ceebe1$f5adf370$e109da50$%han@samsung.com>
In-reply-to: <001e01ceebe1$f5adf370$e109da50$%han@samsung.com>
Subject: [PATCH 3/9] mtd: esb2rom: use DEFINE_PCI_DEVICE_TABLE macro
Date: Thu, 28 Nov 2013 11:32:52 +0900
Message-id: <002001ceebe2$232756c0$69760440$%han@samsung.com>
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
 drivers/mtd/maps/esb2rom.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/esb2rom.c b/drivers/mtd/maps/esb2rom.c
index f784cf0..d44b92f 100644
--- a/drivers/mtd/maps/esb2rom.c
+++ b/drivers/mtd/maps/esb2rom.c
@@ -384,7 +384,7 @@ static void esb2rom_remove_one(struct pci_dev *pdev)
 	esb2rom_cleanup(window);
 }
 
-static struct pci_device_id esb2rom_pci_tbl[] = {
+static DEFINE_PCI_DEVICE_TABLE(esb2rom_pci_tbl) = {
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
1.7.10.4
