Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZbHB-0003uQ-Qx
 for linux-mtd@lists.infradead.org; Tue, 07 May 2013 06:21:27 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMF00J3B0AZP210@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 07 May 2013 15:20:59 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>
Subject: [PATCH 04/26] mtd: maps: sa1100-flash: remove unnecessary
 platform_set_drvdata()
Date: Tue, 07 May 2013 15:20:58 +0900
Message-id: <004301ce4aeb$0a2770d0$1e765270$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, Jingoo Han <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, Russell King <linux@arm.linux.org.uk>,
 'Paul Parsons' <lost.distance@yahoo.com>
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
 drivers/mtd/maps/sa1100-flash.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index 29e3dca..9e70f8e 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -279,7 +279,6 @@ static int __exit sa1100_mtd_remove(struct platform_device *pdev)
 	struct sa_info *info = platform_get_drvdata(pdev);
 	struct flash_platform_data *plat = pdev->dev.platform_data;
 
-	platform_set_drvdata(pdev, NULL);
 	sa1100_destroy(info, plat);
 
 	return 0;
-- 
1.7.2.5
