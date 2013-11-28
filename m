Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlrQd-0007Ar-BX
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 02:34:07 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MWY00FADCGJER00@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 11:33:55 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <001e01ceebe1$f5adf370$e109da50$%han@samsung.com>
In-reply-to: <001e01ceebe1$f5adf370$e109da50$%han@samsung.com>
Subject: [PATCH 6/9] mtd: pci: use DEFINE_PCI_DEVICE_TABLE macro
Date: Thu, 28 Nov 2013 11:33:54 +0900
Message-id: <002301ceebe2$486c0ca0$d94425e0$%han@samsung.com>
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
 drivers/mtd/maps/pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/pci.c b/drivers/mtd/maps/pci.c
index 36da518..d6ffa04 100644
--- a/drivers/mtd/maps/pci.c
+++ b/drivers/mtd/maps/pci.c
@@ -229,7 +229,7 @@ static struct mtd_pci_info intel_dc21285_info = {
  * PCI device ID table
  */
 
-static struct pci_device_id mtd_pci_ids[] = {
+static DEFINE_PCI_DEVICE_TABLE(mtd_pci_ids) = {
 	{
 		.vendor =	PCI_VENDOR_ID_INTEL,
 		.device =	0x530d,
-- 
1.7.10.4
