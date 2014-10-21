Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xget4-0004vW-Hc
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 19:14:31 +0000
Received: by mail-wg0-f46.google.com with SMTP id l18so2089637wgh.5
 for <linux-mtd@lists.infradead.org>; Tue, 21 Oct 2014 12:14:08 -0700 (PDT)
From: Rob Ward <robert.ward114@googlemail.com>
Date: Tue, 21 Oct 2014 20:14:00 +0100 (BST)
To: joern@lazybastard.org, dwmw2@infradead.org, computersforpeace@gmail.com
Subject: [PATCH] mtd: phram: fix asm/io.h include usage
Message-ID: <alpine.DEB.2.10.1410212010210.7838@rob-thinkpad>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From ca36c5ca9adbe1d3c107e5ff22e8d0db5dddb1b9 Mon Sep 17 00:00:00 2001
From: Rob Ward <robert.ward114@googlemail.com>
Date: Tue, 21 Oct 2014 20:01:09 +0100
Subject: [PATCH] mtd: phram: fix asm/io.h include usage

Modify phram to include <linux/io.h> rather than <asm/io.h>

Signed-off-by: Rob Ward <robert.ward114@googlemail.com>
---
 drivers/mtd/devices/phram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index effd9a4..8b66e52 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -17,7 +17,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <asm/io.h>
+#include <linux/io.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
-- 
2.0.2
