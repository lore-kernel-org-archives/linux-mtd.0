Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDQII-0000kW-Fx
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 07:01:56 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v6 15/15] MAINTAINERS: Add SPI NAND entry
Date: Wed, 24 May 2017 15:07:11 +0800
Message-ID: <1495609631-18880-16-git-send-email-peterpandong@micron.com>
In-Reply-To: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
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
index fe4b69e..e4edb75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8762,6 +8762,15 @@ S:	Maintained
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
