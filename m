Received: from mail-bk0-x235.google.com ([2a00:1450:4008:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbOQW-0006PF-Ln
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 05:34:45 +0000
Received: by mail-bk0-f53.google.com with SMTP id w11so277835bkz.12
 for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2013 22:34:22 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 30 Oct 2013 13:34:22 +0800
Message-ID: <CAPgLHd8=fLjqnKEoTB2C+7R=Nz7bdV0D5ttO29em=P8nX-Tvag@mail.gmail.com>
Subject: [PATCH -next] mtd: remove duplicated include from mtdcore.c
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dwmw2@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove duplicated include.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/mtdcore.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 7189089..92311a5 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -37,7 +37,6 @@
 #include <linux/backing-dev.h>
 #include <linux/gfp.h>
 #include <linux/slab.h>
-#include <linux/major.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
