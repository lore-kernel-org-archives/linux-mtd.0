From: Han Xu <han.xu@nxp.com>
To: <matthias.bgg@gmail.com>, <rubini@gnudd.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <linux-mtd@lists.infradead.org>, <shijie.huang@arm.com>, <han.xu@nxp.com>
Subject: [PATCH] MAINTAINERS: add maintainer entry for FREESCALE GPMI NAND
 driver
Date: Thu, 18 Feb 2016 03:55:15 +0000
Message-ID: <1455767715-621-1-git-send-email-han.xu@nxp.com>
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

Add a maintainer entry for FREESCALE GPMI NAND driver and add myself as a
maintainer.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7bd927e..49baa5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4543,6 +4543,12 @@ L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	drivers/dma/fsldma.*
 
+FREESCALE GPMI NAND DRIVER
+M:	Han Xu <han.xu@nxp.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	drivers/mtd/nand/gpmi-nand/*
+
 FREESCALE I2C CPM DRIVER
 M:	Jochen Friedrich <jochen@scram.de>
 L:	linuxppc-dev@lists.ozlabs.org
-- 
2.7.1
