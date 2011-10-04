Received: from lunge.queued.net ([173.255.254.236])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RAuYY-0000eV-3T
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2011 02:16:31 +0000
Date: Mon, 3 Oct 2011 19:16:24 -0700
From: Andres Salomon <dilinger@queued.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] jffs2: allow disabling of compression schemes at runtime
Message-ID: <20111003191624.7efd3dce@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently jffs2 has compile-time constants (and .config options)
regarding whether or not the various compression/decompression
drivers are built in and enabled.  This is fine for embedded
systems, but it clashes with distribution kernels.  Distro kernels
tend to turn on everything; this causes OpenFirmware to fall
over, as it only supports ZLIB decompression.  Booting a kernel
that has LZO compression enabled, writing to the boot partition,
and then rebooting causes OFW to fail to read the kernel from
the filesystem.  This is because LZO compression has priority
when writing new data to jffs2, if LZO is enabled.

To get around that, this patch adds jffs2 module params for each
compressor type that isn't decompression-only.  That means I can run
a kernel that has support for LZO and ZLIB decompression (allowing
me to read LZO data off of the root partition), while  disabling
LZO compression writes (jffs2.disable_lzo=1) so that the boot
partition stays compatible with OFW.

Signed-off-by: Andres Salomon <dilinger@queued.net>
---
 fs/jffs2/compr_lzo.c   |    4 ++++
 fs/jffs2/compr_rtime.c |    7 +++++++
 fs/jffs2/compr_rubin.c |   11 +++++++++++
 fs/jffs2/compr_zlib.c  |    6 ++++++
 4 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/compr_lzo.c b/fs/jffs2/compr_lzo.c
index af186ee..4a1ab10 100644
--- a/fs/jffs2/compr_lzo.c
+++ b/fs/jffs2/compr_lzo.c
@@ -14,6 +14,7 @@
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
 #include <linux/init.h>
+#include <linux/module.h>
 #include <linux/lzo.h>
 #include "compr.h"
 
@@ -89,6 +90,9 @@ static struct jffs2_compressor jffs2_lzo_comp = {
 	.disabled = 0,
 };
 
+module_param_named(disable_lzo, jffs2_lzo_comp.disabled, int, 0);
+MODULE_PARM_DESC(disable_lzo, "Disable lzo compression.  Default: 0.");
+
 int __init jffs2_lzo_init(void)
 {
 	int ret;
diff --git a/fs/jffs2/compr_rtime.c b/fs/jffs2/compr_rtime.c
index 16a5047..0c0725b 100644
--- a/fs/jffs2/compr_rtime.c
+++ b/fs/jffs2/compr_rtime.c
@@ -24,6 +24,7 @@
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/errno.h>
+#include <linux/module.h>
 #include <linux/string.h>
 #include <linux/jffs2.h>
 #include "compr.h"
@@ -119,6 +120,12 @@ static struct jffs2_compressor jffs2_rtime_comp = {
 #endif
 };
 
+#ifndef JFFS2_RTIME_DISABLED
+module_param_named(disable_rtime, jffs2_rtime_comp.disabled, int, 0);
+MODULE_PARM_DESC(disable_rtime, "Disable rtime compression.  Default: 0.");
+#endif
+
+
 int jffs2_rtime_init(void)
 {
     return jffs2_register_compressor(&jffs2_rtime_comp);
diff --git a/fs/jffs2/compr_rubin.c b/fs/jffs2/compr_rubin.c
index 9e7cec8..8fd570a 100644
--- a/fs/jffs2/compr_rubin.c
+++ b/fs/jffs2/compr_rubin.c
@@ -12,6 +12,7 @@
 
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/module.h>
 #include <linux/jffs2.h>
 #include <linux/errno.h>
 #include "compr.h"
@@ -421,6 +422,11 @@ static struct jffs2_compressor jffs2_rubinmips_comp = {
 #endif
 };
 
+#ifndef JFFS2_RUBINMIPS_DISABLED
+module_param_named(disable_rubinmips, jffs2_rubinmips_comp.disabled, int, 0);
+MODULE_PARM_DESC(disable_rubinmips, "Disable rubinmips compression.  Default: 0.");
+#endif
+
 int jffs2_rubinmips_init(void)
 {
 	return jffs2_register_compressor(&jffs2_rubinmips_comp);
@@ -444,6 +450,11 @@ static struct jffs2_compressor jffs2_dynrubin_comp = {
 #endif
 };
 
+#ifndef JFFS2_DYNRUBIN_DISABLED
+module_param_named(disable_dynrubin, jffs2_dynrubin_comp.disabled, int, 0);
+MODULE_PARM_DESC(disable_dynrubin, "Disable dynrubin compression.  Default: 0.");
+#endif
+
 int jffs2_dynrubin_init(void)
 {
 	return jffs2_register_compressor(&jffs2_dynrubin_comp);
diff --git a/fs/jffs2/compr_zlib.c b/fs/jffs2/compr_zlib.c
index 5a00102..9cd1896 100644
--- a/fs/jffs2/compr_zlib.c
+++ b/fs/jffs2/compr_zlib.c
@@ -37,6 +37,7 @@ static z_stream inf_strm, def_strm;
 #include <linux/vmalloc.h>
 #include <linux/init.h>
 #include <linux/mutex.h>
+#include <linux/module.h>
 
 static int __init alloc_workspaces(void)
 {
@@ -196,6 +197,11 @@ static struct jffs2_compressor jffs2_zlib_comp = {
 #endif
 };
 
+#ifndef JFFS2_ZLIB_DISABLED
+module_param_named(disable_zlib, jffs2_zlib_comp.disabled, int, 0);
+MODULE_PARM_DESC(disable_zlib, "Disable zlib compression.  Default: 0.");
+#endif
+
 int __init jffs2_zlib_init(void)
 {
     int ret;
-- 
1.7.2.5
