Received: from mail-bl2on0140.outbound.protection.outlook.com ([65.55.169.140]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBq9I-0008AD-Gy
 for linux-mtd@lists.infradead.org; Thu, 15 Jan 2015 19:32:09 +0000
From: Han Xu <han.xu@freescale.com>
To: <computersforpeace@gmail.com>
Subject: [PATCH] MAINTAINERS: add maintainer entry for FREESCALE QUAD SPI
 driver
Date: Fri, 16 Jan 2015 03:29:17 +0800
Message-ID: <1421350157-13490-1-git-send-email-han.xu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a maintainer entry for FREESCALE QUAD SPI driver and add myself as a
maintainer.

Signed-off-by: Han Xu <han.xu@freescale.com>
---
 MAINTAINERS |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dbc17b3..f6f6e58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4032,6 +4032,12 @@ S:	Maintained
 F:	include/linux/platform_data/video-imxfb.h
 F:	drivers/video/fbdev/imxfb.c
 
+FREESCALE QUAD SPI DRIVER
+M:	Han Xu <han.xu@freescale.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	drivers/mtd/spi-nor/fsl-quadspi.c
+
 FREESCALE SOC FS_ENET DRIVER
 M:	Pantelis Antoniou <pantelis.antoniou@gmail.com>
 M:	Vitaly Bordug <vbordug@ru.mvista.com>
-- 
1.7.8
