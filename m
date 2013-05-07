Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZbQY-0004BR-6B
 for linux-mtd@lists.infradead.org; Tue, 07 May 2013 06:31:06 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMF00EG40QVZIE0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 07 May 2013 15:30:45 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>
Subject: [PATCH 07/26] mtd: maps: physmap: remove unnecessary
 platform_set_drvdata()
Date: Tue, 07 May 2013 15:30:44 +0900
Message-id: <004b01ce4aec$67395170$35abf450$@samsung.com>
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
 drivers/mtd/maps/physmap.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index e7a592c..9eb7ead9 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -40,7 +40,6 @@ static int physmap_flash_remove(struct platform_device *dev)
 	info = platform_get_drvdata(dev);
 	if (info == NULL)
 		return 0;
-	platform_set_drvdata(dev, NULL);
 
 	physmap_data = dev->dev.platform_data;
 
-- 
1.7.2.5
