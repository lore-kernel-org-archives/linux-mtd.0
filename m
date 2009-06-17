Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MGsj8-0007Qq-0s
	for linux-mtd@lists.infradead.org; Wed, 17 Jun 2009 10:50:54 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: joern@lazybastard.org
Subject: [PATCH] [MTD] phram: cleanup error handling and associated messages
Date: Wed, 17 Jun 2009 06:50:18 -0400
Message-Id: <1245235818-22649-1-git-send-email-vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The error handling in the phram driver is pretty bad -- in many places,
errors are silently ignored or logged, but then still ignored in the
return value.  So convert all of the code to pass back the correct return
value and log error messages properly (and using the new pr_fmt() helper).

If everything does go smoothly, rather than exit silently, dump a helpful
info message like pretty much every other MTD driver does.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/devices/phram.c |   25 ++++++++++++-------------
 1 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 088fbb7..1696bbe 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -14,6 +14,9 @@
  * Example:
  *	phram=swap,64Mi,128Mi phram=test,900Mi,1Mi
  */
+
+#define pr_fmt(fmt) "phram: " fmt
+
 #include <asm/io.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -23,8 +26,6 @@
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 
-#define ERROR(fmt, args...) printk(KERN_ERR "phram: " fmt , ## args)
-
 struct phram_mtd_list {
 	struct mtd_info mtd;
 	struct list_head list;
@@ -132,7 +133,7 @@ static int register_device(char *name, unsigned long start, unsigned long len)
 	ret = -EIO;
 	new->mtd.priv = ioremap(start, len);
 	if (!new->mtd.priv) {
-		ERROR("ioremap failed\n");
+		pr_err("ioremap failed\n");
 		goto out1;
 	}
 
@@ -152,7 +153,7 @@ static int register_device(char *name, unsigned long start, unsigned long len)
 
 	ret = -EAGAIN;
 	if (add_mtd_device(&new->mtd)) {
-		ERROR("Failed to register new device\n");
+		pr_err("Failed to register new device\n");
 		goto out2;
 	}
 
@@ -227,8 +228,8 @@ static inline void kill_final_newline(char *str)
 
 
 #define parse_err(fmt, args...) do {	\
-	ERROR(fmt , ## args);	\
-	return 0;		\
+	pr_err(fmt , ## args);	\
+	return 1;		\
 } while (0)
 
 static int phram_setup(const char *val, struct kernel_param *kp)
@@ -256,12 +257,8 @@ static int phram_setup(const char *val, struct kernel_param *kp)
 		parse_err("not enough arguments\n");
 
 	ret = parse_name(&name, token[0]);
-	if (ret == -ENOMEM)
-		parse_err("out of memory\n");
-	if (ret == -ENOSPC)
-		parse_err("name too long\n");
 	if (ret)
-		return 0;
+		return ret;
 
 	ret = parse_num32(&start, token[1]);
 	if (ret) {
@@ -275,9 +272,11 @@ static int phram_setup(const char *val, struct kernel_param *kp)
 		parse_err("illegal device length\n");
 	}
 
-	register_device(name, start, len);
+	ret = register_device(name, start, len);
+	if (!ret)
+		pr_info("%s device: %#x at %#x\n", name, len, start);
 
-	return 0;
+	return ret;
 }
 
 module_param_call(phram, phram_setup, NULL, NULL, 000);
-- 
1.6.3.1
