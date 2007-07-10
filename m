Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I8C1d-0005aB-AP
	for linux-mtd@lists.infradead.org; Tue, 10 Jul 2007 05:28:55 -0400
Subject: [PATCH 1/3] jffs2: Add LZO compression support to jffs2
From: Richard Purdie <rpurdie@openedhand.com>
To: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Tue, 10 Jul 2007 10:28:36 +0100
Message-Id: <1184059716.6435.29.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add LZO1X compression/decompression support to jffs2.

LZO's interface doesn't entirely match that required by jffs2 so a 
buffer and memcpy is unavoidable.

Signed-off-by: Richard Purdie <rpurdie@openedhand.com>

---
 fs/Kconfig            |   11 ++++
 fs/jffs2/Makefile     |    1 
 fs/jffs2/compr.c      |    6 ++
 fs/jffs2/compr.h      |    3 -
 fs/jffs2/compr_lzo.c  |  120 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/jffs2.h |    1 
 6 files changed, 141 insertions(+), 1 deletion(-)

Index: linux/fs/Kconfig
===================================================================
--- linux.orig/fs/Kconfig	2007-07-10 10:07:27.000000000 +0100
+++ linux/fs/Kconfig	2007-07-10 10:15:53.000000000 +0100
@@ -1306,6 +1306,17 @@ config JFFS2_ZLIB
 
 	  Say 'Y' if unsure.
 
+config JFFS2_LZO
+	bool "JFFS2 LZO compression support" if JFFS2_COMPRESSION_OPTIONS
+	select LZO_COMPRESS
+	select LZO_DECOMPRESS
+	depends on JFFS2_FS
+	default y
+	help
+	  minilzo-based compression. Generally works better than Zlib.
+
+	  Say 'Y' if unsure.
+
 config JFFS2_RTIME
 	bool "JFFS2 RTIME compression support" if JFFS2_COMPRESSION_OPTIONS
 	depends on JFFS2_FS
Index: linux/fs/jffs2/Makefile
===================================================================
--- linux.orig/fs/jffs2/Makefile	2007-05-29 22:59:00.000000000 +0100
+++ linux/fs/jffs2/Makefile	2007-07-10 10:15:53.000000000 +0100
@@ -17,4 +17,5 @@ jffs2-$(CONFIG_JFFS2_FS_POSIX_ACL)	+= ac
 jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
 jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
 jffs2-$(CONFIG_JFFS2_ZLIB)	+= compr_zlib.o
+jffs2-$(CONFIG_JFFS2_LZO)	+= compr_lzo.o
 jffs2-$(CONFIG_JFFS2_SUMMARY)   += summary.o
Index: linux/fs/jffs2/compr.c
===================================================================
--- linux.orig/fs/jffs2/compr.c	2007-07-10 10:07:27.000000000 +0100
+++ linux/fs/jffs2/compr.c	2007-07-10 10:15:53.000000000 +0100
@@ -286,6 +286,9 @@ int __init jffs2_compressors_init(void)
 	jffs2_rubinmips_init();
 	jffs2_dynrubin_init();
 #endif
+#ifdef CONFIG_JFFS2_LZO
+	jffs2_lzo_init();
+#endif
 /* Setting default compression mode */
 #ifdef CONFIG_JFFS2_CMODE_NONE
 	jffs2_compression_mode = JFFS2_COMPR_MODE_NONE;
@@ -304,6 +307,9 @@ int __init jffs2_compressors_init(void)
 int jffs2_compressors_exit(void)
 {
 /* Unregistering compressors */
+#ifdef CONFIG_JFFS2_LZO
+	jffs2_lzo_exit();
+#endif
 #ifdef CONFIG_JFFS2_RUBIN
 	jffs2_dynrubin_exit();
 	jffs2_rubinmips_exit();
Index: linux/fs/jffs2/compr_lzo.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ linux/fs/jffs2/compr_lzo.c	2007-07-10 10:15:53.000000000 +0100
@@ -0,0 +1,120 @@
+/*
+ * JFFS2 LZO Compression Interface
+ *
+ * Copyright (C) 2007 Nokia Corporation. All rights reserved.
+ *
+ * Author: Richard Purdie <rpurdie@openedhand.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
+ * 02110-1301 USA
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/init.h>
+#include <linux/lzo.h>
+#include "compr.h"
+
+static void *lzo_mem;
+static void *lzo_compress_buf;
+static DEFINE_MUTEX(deflate_mutex);
+
+static void free_workspace(void)
+{
+	vfree(lzo_mem);
+	vfree(lzo_compress_buf);
+}
+
+static int __init alloc_workspace(void)
+{
+	lzo_mem = vmalloc(LZO1X_MEM_COMPRESS);
+	lzo_compress_buf = vmalloc(lzo1x_worst_compress(PAGE_SIZE));
+
+	if (!lzo_mem || !lzo_compress_buf) {
+		printk(KERN_WARNING "Failed to allocate lzo deflate workspace\n");
+		free_workspace();
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int jffs2_lzo_compress(unsigned char *data_in, unsigned char *cpage_out,
+			      uint32_t *sourcelen, uint32_t *dstlen, void *model)
+{
+	size_t compress_size;
+	int ret;
+
+	mutex_lock(&deflate_mutex);
+	ret = lzo1x_1_compress(data_in, *sourcelen, lzo_compress_buf, &compress_size, lzo_mem);
+	mutex_unlock(&deflate_mutex);
+
+	if (ret != LZO_E_OK)
+		return -1;
+
+	if (compress_size > *dstlen)
+		return -1;
+
+	memcpy(cpage_out, lzo_compress_buf, compress_size);
+	*dstlen = compress_size;
+
+	return 0;
+}
+
+static int jffs2_lzo_decompress(unsigned char *data_in, unsigned char *cpage_out,
+				 uint32_t srclen, uint32_t destlen, void *model)
+{
+	size_t dl = destlen;
+	int ret;
+
+	ret = lzo1x_decompress_safe(data_in, srclen, cpage_out, &dl);
+
+	if (ret != LZO_E_OK || dl != destlen)
+		return -1;
+
+	return 0;
+}
+
+static struct jffs2_compressor jffs2_lzo_comp = {
+	.priority = JFFS2_LZO_PRIORITY,
+	.name = "lzo",
+	.compr = JFFS2_COMPR_LZO,
+	.compress = &jffs2_lzo_compress,
+	.decompress = &jffs2_lzo_decompress,
+	.disabled = 0,
+};
+
+int __init jffs2_lzo_init(void)
+{
+	int ret;
+
+	ret = alloc_workspace();
+	if (ret < 0)
+		return ret;
+
+	ret = jffs2_register_compressor(&jffs2_lzo_comp);
+	if (ret)
+		free_workspace();
+
+	return ret;
+}
+
+void jffs2_lzo_exit(void)
+{
+	jffs2_unregister_compressor(&jffs2_lzo_comp);
+	free_workspace();
+}
Index: linux/include/linux/jffs2.h
===================================================================
--- linux.orig/include/linux/jffs2.h	2007-05-10 09:58:03.000000000 +0100
+++ linux/include/linux/jffs2.h	2007-07-10 10:15:53.000000000 +0100
@@ -46,6 +46,7 @@
 #define JFFS2_COMPR_COPY	0x04
 #define JFFS2_COMPR_DYNRUBIN	0x05
 #define JFFS2_COMPR_ZLIB	0x06
+#define JFFS2_COMPR_LZO		0x07
 /* Compatibility flags. */
 #define JFFS2_COMPAT_MASK 0xc000      /* What do to if an unknown nodetype is found */
 #define JFFS2_NODE_ACCURATE 0x2000
Index: linux/fs/jffs2/compr.h
===================================================================
--- linux.orig/fs/jffs2/compr.h	2007-07-10 10:07:27.000000000 +0100
+++ linux/fs/jffs2/compr.h	2007-07-10 10:15:53.000000000 +0100
@@ -27,9 +27,10 @@
 #define JFFS2_RUBINMIPS_PRIORITY 10
 #define JFFS2_DYNRUBIN_PRIORITY  20
 #define JFFS2_LZARI_PRIORITY     30
-#define JFFS2_LZO_PRIORITY       40
 #define JFFS2_RTIME_PRIORITY     50
 #define JFFS2_ZLIB_PRIORITY      60
+#define JFFS2_LZO_PRIORITY       80
+
 
 #define JFFS2_RUBINMIPS_DISABLED /* RUBINs will be used only */
 #define JFFS2_DYNRUBIN_DISABLED  /*	   for decompression */
