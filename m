Received: from qw-out-1920.google.com ([74.125.92.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NzqEf-0008Nx-NN
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 11:49:26 +0000
Received: by qw-out-1920.google.com with SMTP id 4so801159qwk.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Apr 2010 04:49:24 -0700 (PDT)
From: Huang Weiyi <weiyi.huang@gmail.com>
To: leochen@broadcom.com
Subject: [PATCH 05/16] mtd: remove unused #include <linux/version.h>
Date: Thu,  8 Apr 2010 19:49:18 +0800
Message-Id: <1270727358-2388-1-git-send-email-weiyi.huang@gmail.com>
Cc: Huang Weiyi <weiyi.huang@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove unused #include <linux/version.h>('s) in
  drivers/mtd/nand/bcm_umi_nand.c

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>
---
 drivers/mtd/nand/bcm_umi_nand.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
index c997f98..2427460 100644
--- a/drivers/mtd/nand/bcm_umi_nand.c
+++ b/drivers/mtd/nand/bcm_umi_nand.c
@@ -13,7 +13,6 @@
 *****************************************************************************/
 
 /* ---- Include Files ---------------------------------------------------- */
-#include <linux/version.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/init.h>
-- 
1.6.1.3
