Received: from ti-out-0910.google.com ([209.85.142.191])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KUVXu-0003i0-BX
	for linux-mtd@lists.infradead.org; Sat, 16 Aug 2008 23:50:58 +0000
Received: by ti-out-0910.google.com with SMTP id a21so658281tia.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Aug 2008 16:50:55 -0700 (PDT)
Date: Sun, 17 Aug 2008 07:50:44 +0800
From: Huang Weiyi <weiyi.huang@gmail.com>
To: dwmw2@infradead.org
Subject: [MTD] removed unused #include <version.h>
Message-Id: <20080817063325.15F9.WEIYI.HUANG@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The drivers below do not use LINUX_VERSION_CODE nor KERNEL_VERSION.
  drivers/mtd/maps/amd76xrom.c
  drivers/mtd/maps/ck804xrom.c
  drivers/mtd/maps/esb2rom.c

This patch removes the said #include <version.h>.

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>

diff --git a/drivers/mtd/maps/amd76xrom.c b/drivers/mtd/maps/amd76xrom.c
index 948b86f..d1eec7d 100644
--- a/drivers/mtd/maps/amd76xrom.c
+++ b/drivers/mtd/maps/amd76xrom.c
@@ -6,7 +6,6 @@
 
 #include <linux/module.h>
 #include <linux/types.h>
-#include <linux/version.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <asm/io.h>
diff --git a/drivers/mtd/maps/ck804xrom.c b/drivers/mtd/maps/ck804xrom.c
index effaf7c..1a6feb4 100644
--- a/drivers/mtd/maps/ck804xrom.c
+++ b/drivers/mtd/maps/ck804xrom.c
@@ -9,7 +9,6 @@
 
 #include <linux/module.h>
 #include <linux/types.h>
-#include <linux/version.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <asm/io.h>
diff --git a/drivers/mtd/maps/esb2rom.c b/drivers/mtd/maps/esb2rom.c
index aa64a47..bbbcdd4 100644
--- a/drivers/mtd/maps/esb2rom.c
+++ b/drivers/mtd/maps/esb2rom.c
@@ -12,7 +12,6 @@
 
 #include <linux/module.h>
 #include <linux/types.h>
-#include <linux/version.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <asm/io.h>
