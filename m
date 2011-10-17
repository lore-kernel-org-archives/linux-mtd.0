Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RFpJM-0003ks-3A
	for linux-mtd@lists.infradead.org; Mon, 17 Oct 2011 15:41:09 +0000
From: h-fache@ti.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] phram: make kernel boot command line arguments work
Date: Mon, 17 Oct 2011 17:40:38 +0200
Message-Id: <1318866038-11781-1-git-send-email-h-fache@ti.com>
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

Trying to pass kernel command line arguments at boot-time did not work, as
phram_setup() was called so early that kmalloc() was not functional.

This patch only saves the option string at the early boot stage, and parses
it later when init_phram() is called. This is determined by the fact that
init was called, or not.

With this patch, I can boot with a statically-compiled phram, and mount a
ext2 root fs from physical RAM, without the need for a initrd.

Signed-off-by: Hervé Fache <h-fache@ti.com>
---
 drivers/mtd/devices/phram.c |   35 +++++++++++++++++++++++++++++++++--
 1 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 23423bd..6d58bf0 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -233,7 +233,10 @@ static inline void kill_final_newline(char *str)
 	return 1;		\
 } while (0)
 
-static int phram_setup(const char *val, struct kernel_param *kp)
+static int phram_init_called;
+static __initdata char phram_paramline[64+12+12];
+
+static int phram_setup2(const char *val)
 {
 	char buf[64+12+12], *str = buf;
 	char *token[3];
@@ -282,13 +285,41 @@ static int phram_setup(const char *val, struct kernel_param *kp)
 	return ret;
 }
 
+static int phram_setup(const char *val, struct kernel_param *kp)
+{
+	/* If more parameters are later passed in via
+	   /sys/module/phram/parameters/phram
+	   and init_phram() has already been called,
+	   we can parse the argument directly. */
+
+	if (phram_init_called)
+		return phram_setup2(val);
+
+	/* During early boot stage, we only save the parameters
+	   here. We must parse them later: if the param passed
+	   from kernel boot command line, phram_setup() is
+	   called so early that it is not possible to resolve
+	   the device (kmalloc() fails). Defer that work to
+	   phram_setup2(), called by init_phram(). */
+
+	strlcpy(phram_paramline, val, sizeof(phram_paramline));
+
+	return 0;
+}
+
 module_param_call(phram, phram_setup, NULL, NULL, 000);
 MODULE_PARM_DESC(phram, "Memory region to map. \"phram=<name>,<start>,<length>\"");
 
 
 static int __init init_phram(void)
 {
-	return 0;
+	int ret = 0;
+
+	if (strlen(phram_paramline))
+		ret = phram_setup2(phram_paramline);
+	phram_init_called = 1;
+
+	return ret;
 }
 
 static void __exit cleanup_phram(void)
-- 
1.7.5.4
