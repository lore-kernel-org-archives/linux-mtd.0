Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZbWs-0004Nr-U0
 for linux-mtd@lists.infradead.org; Tue, 07 May 2013 06:37:40 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMF00MCZ11KLYJ0@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 07 May 2013 15:37:16 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 15/26] mtd: nand: gpmi-nand: remove unnecessary
 platform_set_drvdata()
Date: Tue, 07 May 2013 15:37:16 +0900
Message-id: <005301ce4aed$50cc3d70$f264b850$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, Jingoo Han <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Huang Shijie' <b32955@freescale.com>,
 Shawn Guo <shawn.guo@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver core clears the driver data to NULL after device_release
or on probe failure, since commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
(device-core: Ensure drvdata = NULL when no driver is bound).
Thus, it is not needed to manually clear the device driver data to NULL.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 25ecfa1..7869210 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1633,7 +1633,6 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 exit_nfc_init:
 	release_resources(this);
 exit_acquire_resources:
-	platform_set_drvdata(pdev, NULL);
 	dev_err(this->dev, "driver registration failed: %d\n", ret);
 	kfree(this);
 
@@ -1646,7 +1645,6 @@ static int gpmi_nand_remove(struct platform_device *pdev)
 
 	gpmi_nfc_exit(this);
 	release_resources(this);
-	platform_set_drvdata(pdev, NULL);
 	kfree(this);
 	return 0;
 }
-- 
1.7.2.5
