Received: from mail.perches.com ([173.55.12.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8cdN-0002ff-2P
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 17:39:31 +0000
Subject: [PATCH] drivers/mtd/devices/phram.c: Use KBUILD_MODNAME
From: Joe Perches <joe@perches.com>
To: Joern Engel <joern@lazybastard.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 20 Oct 2010 10:39:22 -0700
Message-ID: <1287596362.1813.205.camel@Joe-Laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the more standard #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
No change in output strings.

Signed-off-by: Joe Perches <joe@perches.com>
---
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 1696bbe..5239328 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -15,7 +15,7 @@
  *	phram=swap,64Mi,128Mi phram=test,900Mi,1Mi
  */
 
-#define pr_fmt(fmt) "phram: " fmt
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <asm/io.h>
 #include <linux/init.h>
