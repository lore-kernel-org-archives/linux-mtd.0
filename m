Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VNuyn-0001ZR-2U
 for linux-mtd@lists.infradead.org; Mon, 23 Sep 2013 01:30:26 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MTK005CH1H7GDD0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Mon, 23 Sep 2013 10:29:58 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
Subject: [PATCH 1/4] mtd: intel_vr_nor: remove unnecessary pci_set_drvdata()
Date: Mon, 23 Sep 2013 10:29:58 +0900
Message-id: <002d01ceb7fc$6a5bdd50$3f1397f0$%han@samsung.com>
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

The driver core clears the driver data to NULL after device_release
or on probe failure. Thus, it is not needed to manually clear the
device driver data to NULL.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/maps/intel_vr_nor.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/maps/intel_vr_nor.c b/drivers/mtd/maps/intel_vr_nor.c
index f581ac1..46d195f 100644
--- a/drivers/mtd/maps/intel_vr_nor.c
+++ b/drivers/mtd/maps/intel_vr_nor.c
@@ -180,7 +180,6 @@ static void vr_nor_pci_remove(struct pci_dev *dev)
 {
 	struct vr_nor_mtd *p = pci_get_drvdata(dev);
 
-	pci_set_drvdata(dev, NULL);
 	vr_nor_destroy_partitions(p);
 	vr_nor_destroy_mtd_setup(p);
 	vr_nor_destroy_maps(p);
-- 
1.7.10.4
