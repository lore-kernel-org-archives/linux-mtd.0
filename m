Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UKNkx-0002tv-AK
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2013 06:53:17 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MK900HCG9PXBVG0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 26 Mar 2013 15:53:04 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>
Subject: [PATCH 1/3] mtd: r852: add CONFIG_PM_SLEEP to suspend/resume functions
Date: Tue, 26 Mar 2013 15:53:04 +0900
Message-id: <000f01ce29ee$90692c10$b13b8430$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add CONFIG_PM_SLEEP to suspend/resume functions to fix the following
build warning when CONFIG_PM_SLEEP is not selected. This is because
sleep PM callbacks defined by SIMPLE_DEV_PM_OPS are only used when
the CONFIG_PM_SLEEP is enabled. Also, unnecessary NULL defines are
removed.

drivers/mtd/nand/r852.c:1006:12: warning: 'r852_suspend' defined but not used [-Wunused-function]
drivers/mtd/nand/r852.c:1027:12: warning: 'r852_resume' defined but not used [-Wunused-function]

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/r852.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 4495f85..ef72884 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -1002,7 +1002,7 @@ void r852_shutdown(struct pci_dev *pci_dev)
 	pci_disable_device(pci_dev);
 }
 
-#ifdef CONFIG_PM
+#ifdef CONFIG_PM_SLEEP
 static int r852_suspend(struct device *device)
 {
 	struct r852_device *dev = pci_get_drvdata(to_pci_dev(device));
@@ -1055,9 +1055,6 @@ static int r852_resume(struct device *device)
 	r852_update_card_detect(dev);
 	return 0;
 }
-#else
-#define r852_suspend	NULL
-#define r852_resume	NULL
 #endif
 
 static const struct pci_device_id r852_pci_id_tbl[] = {
-- 
1.7.2.5
