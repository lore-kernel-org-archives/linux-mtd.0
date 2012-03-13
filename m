Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7OPQ-00049d-KH
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 09:52:55 +0000
From: h-fache@ti.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: phram: dot not crash when built-in and passing boot param
Date: Tue, 13 Mar 2012 10:52:31 +0100
Message-Id: <1331632351-32610-1-git-send-email-h-fache@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: joern@logfs.org, joern@lazybastard.org,
 =?UTF-8?q?Herv=C3=A9=20Fache?= <h-fache@ti.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hervé Fache <h-fache@ti.com>

This patch is based on Ville Herva's similar patch to block2mtd.

Trying to pass a parameter through the kernel command line when built-in would
crash the kernel, as phram_setup() was called so early that kmalloc() was not
functional yet.

This patch only saves the parameter string at the early boot stage, and parses
it later when init_phram() is called. The same happens in both module and
built-in cases.

With this patch, I can boot with a statically-compiled phram, and mount a
ext2 root fs from physical RAM, without the need for a initrd.

This has been tested in built-in and module cases, with and without a
parameter string.

Signed-off-by: Hervé Fache <h-fache@ti.com>
---
 drivers/mtd/devices/phram.c |   28 ++++++++++++++++++++++++++--
 1 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 23423bd..727cb5d 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -1,6 +1,7 @@
 /**
  * Copyright (c) ????		Jochen Schäuble <psionic@psionic.de>
  * Copyright (c) 2003-2004	Joern Engel <joern@wh.fh-wedel.de>
+ * Copyright (c) 2012		Hervé Fache <h-fache@ti.com>
  *
  * Usage:
  *
@@ -233,7 +234,16 @@ static inline void kill_final_newline(char *str)
 	return 1;		\
 } while (0)
 
-static int phram_setup(const char *val, struct kernel_param *kp)
+/* This shall contain the module parameter if any. It is of the form:
+   * phram=<device>,<address>,<size> for module case
+   * phram.phram=<device>,<address>,<size> for built-in case
+   We leave 64 bytes for the device name, 12 for the address and 12 for the
+   size.
+   Example: phram.phram=rootfs,0xa0000000,512Mi
+*/
+static __initdata char phram_paramline[64+12+12];
+
+static int phram_setup(const char *val)
 {
 	char buf[64+12+12], *str = buf;
 	char *token[3];
@@ -282,12 +292,26 @@ static int phram_setup(const char *val, struct kernel_param *kp)
 	return ret;
 }
 
-module_param_call(phram, phram_setup, NULL, NULL, 000);
+static int phram_param_call(const char *val, struct kernel_param *kp)
+{
+	/* This function is always called before 'init_phram()', whether built-in or
+	   module. */
+	if (strlen(val) >= sizeof(phram_paramline))
+		return -ENOSPC;
+	strcpy(phram_paramline, val);
+
+	return 0;
+}
+
+module_param_call(phram, phram_param_call, NULL, NULL, 000);
 MODULE_PARM_DESC(phram, "Memory region to map. \"phram=<name>,<start>,<length>\"");
 
 
 static int __init init_phram(void)
 {
+	if (phram_paramline[0])
+		return phram_setup(phram_paramline);
+
 	return 0;
 }
 
-- 
1.7.9
