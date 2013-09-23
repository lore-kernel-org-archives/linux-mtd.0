Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VNv17-0001e3-AG
 for linux-mtd@lists.infradead.org; Mon, 23 Sep 2013 01:32:49 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MTK00JHK1M4WMG0@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Mon, 23 Sep 2013 10:32:28 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <002d01ceb7fc$6a5bdd50$3f1397f0$%han@samsung.com>
In-reply-to: <002d01ceb7fc$6a5bdd50$3f1397f0$%han@samsung.com>
Subject: [PATCH 4/4] mtd: denali: remove unnecessary pci_set_drvdata()
Date: Mon, 23 Sep 2013 10:32:27 +0900
Message-id: <003001ceb7fc$c38a85c0$4a9f9140$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>,
 'Dinh Nguyen' <dinguyen@altera.com>, linux-mtd@lists.infradead.org
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
 drivers/mtd/nand/denali_pci.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index e3e4662..033f177 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -119,7 +119,6 @@ static void denali_pci_remove(struct pci_dev *dev)
 	iounmap(denali->flash_mem);
 	pci_release_regions(dev);
 	pci_disable_device(dev);
-	pci_set_drvdata(dev, NULL);
 	kfree(denali);
 }
 
-- 
1.7.10.4
