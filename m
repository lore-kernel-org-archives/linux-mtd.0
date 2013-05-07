Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZbfV-0004g6-Lj
 for linux-mtd@lists.infradead.org; Tue, 07 May 2013 06:46:35 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMF00JHY1GM3BD0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 07 May 2013 15:46:11 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 26/26] mtd: nand: txx9ndfmc: remove unnecessary
 platform_set_drvdata()
Date: Tue, 07 May 2013 15:46:11 +0900
Message-id: <005e01ce4aee$8fc223e0$af466ba0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, Jingoo Han <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>
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
 drivers/mtd/nand/txx9ndfmc.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 7ed654c..0488dd5 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -387,7 +387,6 @@ static int __exit txx9ndfmc_remove(struct platform_device *dev)
 	struct txx9ndfmc_drvdata *drvdata = platform_get_drvdata(dev);
 	int i;
 
-	platform_set_drvdata(dev, NULL);
 	if (!drvdata)
 		return 0;
 	for (i = 0; i < MAX_TXX9NDFMC_DEV; i++) {
-- 
1.7.2.5
