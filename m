Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SmjWy-0001la-2y
 for linux-mtd@lists.infradead.org; Thu, 05 Jul 2012 10:43:29 +0000
Received: by bkcji2 with SMTP id ji2so2785704bkc.36
 for <linux-mtd@lists.infradead.org>; Thu, 05 Jul 2012 03:41:21 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: sh_flctl: Use memcpy() instead of using a loop
Date: Thu,  5 Jul 2012 12:41:01 +0200
Message-Id: <1341484862-24033-1-git-send-email-hechtb@gmail.com>
Cc: Bastian Hecht <hechtb@gmail.com>, Linux-SH <linux-sh@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Elemets have been copied "manually" in a loop. Better use memcpy().

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
 drivers/mtd/nand/sh_flctl.c |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 0d9cce7..e4f31ef 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -29,6 +29,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
@@ -748,10 +749,9 @@ static void flctl_select_chip(struct mtd_info *mtd, int chipnr)
 static void flctl_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {
 	struct sh_flctl *flctl = mtd_to_flctl(mtd);
-	int i, index = flctl->index;
+	int index = flctl->index;
 
-	for (i = 0; i < len; i++)
-		flctl->done_buff[index + i] = buf[i];
+	memcpy(&flctl->done_buff[index], buf, len);
 	flctl->index += len;
 }
 
@@ -780,10 +780,11 @@ static uint16_t flctl_read_word(struct mtd_info *mtd)
 
 static void flctl_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
-	int i;
+	struct sh_flctl *flctl = mtd_to_flctl(mtd);
+	int index = flctl->index;
 
-	for (i = 0; i < len; i++)
-		buf[i] = flctl_read_byte(mtd);
+	memcpy(buf, &flctl->done_buff[index], len);
+	flctl->index += len;
 }
 
 static int flctl_verify_buf(struct mtd_info *mtd, const u_char *buf, int len)
-- 
1.7.9.5
