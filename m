Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxTvx-0001TW-Lu
 for linux-mtd@lists.infradead.org; Mon, 10 Apr 2017 07:40:25 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@atmel.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v5 6/6] MAINTAINERS: Add SPI NAND entry
Date: Mon, 10 Apr 2017 15:51:53 +0800
Message-ID: <1491810713-27795-7-git-send-email-peterpandong@micron.com>
In-Reply-To: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
References: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add maintainer information for SPI NAND.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc2139d..5ba6c7e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8610,6 +8610,15 @@ S:	Maintained
 F:	drivers/mtd/nand/
 F:	include/linux/mtd/*nand*.h
 
+SPI NAND FLASH DRIVER
+M:	Peter Pan <peterpandong@micron.com>
+L:	linux-mtd@lists.infradead.org
+W:	http://www.linux-mtd.infradead.org/
+Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
+S:	Maintained
+F:	drivers/mtd/nand/spi/
+F:	include/linux/mtd/spinand.h
+
 NATSEMI ETHERNET DRIVER (DP8381x)
 S:	Orphan
 F:	drivers/net/ethernet/natsemi/natsemi.c
-- 
1.9.1
