Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXGaa-0007I8-8D
 for linux-mtd@lists.infradead.org; Tue, 18 Jul 2017 00:42:13 +0000
Received: by mail-qk0-x243.google.com with SMTP id d136so710641qkg.3
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2017 17:41:51 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@free-electrons.com
Cc: cyrille.pitchen@wedev4u.fr, matthias.bgg@gmail.com,
 linux-mtd@lists.infradead.org, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH 2/2] mtd: mtk-quadspi: Remove unneeded pinctrl header
Date: Mon, 17 Jul 2017 21:41:39 -0300
Message-Id: <1500338499-17165-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1500338499-17165-1-git-send-email-festevam@gmail.com>
References: <1500338499-17165-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@nxp.com>

There is no need to include <linux/pinctrl/consumer.h> as no pinctrl
function is used in this driver, so just remove it.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/mtd/spi-nor/mtk-quadspi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
index 8a20ec4..c258c7a 100644
--- a/drivers/mtd/spi-nor/mtk-quadspi.c
+++ b/drivers/mtd/spi-nor/mtk-quadspi.c
@@ -24,7 +24,6 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
-- 
2.7.4
