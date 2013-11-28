Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlrQc-0007Ar-Mi
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 02:34:07 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MWY004HACFWQGE0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 11:33:32 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <001e01ceebe1$f5adf370$e109da50$%han@samsung.com>
In-reply-to: <001e01ceebe1$f5adf370$e109da50$%han@samsung.com>
Subject: [PATCH 5/9] mtd: intel_vr_nor: use DEFINE_PCI_DEVICE_TABLE macro
Date: Thu, 28 Nov 2013 11:33:31 +0900
Message-id: <002201ceebe2$3a9fa3c0$afdeeb40$%han@samsung.com>
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
 drivers/mtd/maps/intel_vr_nor.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/intel_vr_nor.c b/drivers/mtd/maps/intel_vr_nor.c
index 46d195f..784f0cd 100644
--- a/drivers/mtd/maps/intel_vr_nor.c
+++ b/drivers/mtd/maps/intel_vr_nor.c
@@ -171,7 +171,7 @@ static int vr_nor_init_maps(struct vr_nor_mtd *p)
 	return err;
 }
 
-static struct pci_device_id vr_nor_pci_ids[] = {
+static DEFINE_PCI_DEVICE_TABLE(vr_nor_pci_ids) = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x500D)},
 	{0,}
 };
-- 
1.7.10.4
