Received: from mail-ew0-f228.google.com ([209.85.219.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MylKV-0002w2-9i
	for linux-mtd@lists.infradead.org; Fri, 16 Oct 2009 11:50:48 +0000
Received: by ewy28 with SMTP id 28so1901457ewy.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Oct 2009 04:50:41 -0700 (PDT)
Message-ID: <4AD86051.2040302@gmail.com>
Date: Fri, 16 Oct 2009 14:00:17 +0200
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind@infradead.org>,
	linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] UBI: Fix check on unsigned in ytes_str_to_int()
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

result is unsigned, the wrong check was used.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index e1f7d0a..14cec04 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -42,6 +42,7 @@
 #include <linux/log2.h>
 #include <linux/kthread.h>
 #include <linux/reboot.h>
+#include <linux/kernel.h>
 #include "ubi.h"
 
 /* Maximum length of the 'mtd=' parameter */
@@ -1257,7 +1258,7 @@ static int __init bytes_str_to_int(const char *str)
 	unsigned long result;
 
 	result = simple_strtoul(str, &endp, 0);
-	if (str == endp || result < 0) {
+	if (str == endp || result >= INT_MAX) {
 		printk(KERN_ERR "UBI error: incorrect bytes count: \"%s\"\n",
 		       str);
 		return -EINVAL;
