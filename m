Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VNv0D-0001c7-Jt
 for linux-mtd@lists.infradead.org; Mon, 23 Sep 2013 01:31:55 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MTK00JEO1KFWMG0@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Mon, 23 Sep 2013 10:31:31 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <002d01ceb7fc$6a5bdd50$3f1397f0$%han@samsung.com>
In-reply-to: <002d01ceb7fc$6a5bdd50$3f1397f0$%han@samsung.com>
Subject: [PATCH 3/4] mtd: scb2_flash: remove unnecessary pci_set_drvdata()
Date: Mon, 23 Sep 2013 10:31:30 +0900
Message-id: <002f01ceb7fc$a18e1d10$e4aa5730$%han@samsung.com>
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
 drivers/mtd/maps/scb2_flash.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/maps/scb2_flash.c b/drivers/mtd/maps/scb2_flash.c
index c77b68c..3051c4c 100644
--- a/drivers/mtd/maps/scb2_flash.c
+++ b/drivers/mtd/maps/scb2_flash.c
@@ -212,7 +212,6 @@ static void scb2_flash_remove(struct pci_dev *dev)
 
 	if (!region_fail)
 		release_mem_region(SCB2_ADDR, SCB2_WINDOW);
-	pci_set_drvdata(dev, NULL);
 }
 
 static struct pci_device_id scb2_flash_pci_ids[] = {
-- 
1.7.10.4
