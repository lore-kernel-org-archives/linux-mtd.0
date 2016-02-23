Received: from smtprelay0041.hostedemail.com ([216.40.44.41]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYBr9-0007yu-Pm
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2016 12:14:20 +0000
From: Joe Perches <joe@perches.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: Add logging functions for ubifs_msg,
 ubifs_err and ubifs_warn
Date: Tue, 23 Feb 2016 04:13:49 -0800
Message-Id: <7719f1b6c21ee5ad7a9ab033dcc4f5d1ca33384e.1456229475.git.joe@perches.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The existing logging macros are fairly large and converting the
macros to functions make the object code smaller.

Use %pV and __builtin_return_address(0) as appropriate.

$ size fs/ubifs/built-in.o*
   text	   data	    bss	    dec	    hex	filename
 575831	 309688	 161312	1046831	  ff92f	fs/ubifs/built-in.o.allyesconfig.new
 622457	 312872	 161120	1096449	 10bb01	fs/ubifs/built-in.o.allyesconfig.old
 223785	    640	    644	 225069	  36f2d	fs/ubifs/built-in.o.defconfig.new
 251873	    640	    644	 253157	  3dce5	fs/ubifs/built-in.o.defconfig.old

Signed-off-by: Joe Perches <joe@perches.com>
---
 fs/ubifs/Makefile |  1 +
 fs/ubifs/misc.c   | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h  | 41 +++++++++++++++++----------------------
 3 files changed, 75 insertions(+), 24 deletions(-)
 create mode 100644 fs/ubifs/misc.c

diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
index 2c6f0cb..c54a243 100644
--- a/fs/ubifs/Makefile
+++ b/fs/ubifs/Makefile
@@ -4,3 +4,4 @@ ubifs-y += shrinker.o journal.o file.o dir.o super.o sb.o io.o
 ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
 ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
 ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o xattr.o debug.o
+ubifs-y += misc.o
diff --git a/fs/ubifs/misc.c b/fs/ubifs/misc.c
new file mode 100644
index 0000000..486a284
--- /dev/null
+++ b/fs/ubifs/misc.c
@@ -0,0 +1,57 @@
+#include <linux/kernel.h>
+#include "ubifs.h"
+
+/* Normal UBIFS messages */
+void ubifs_msg(const struct ubifs_info *c, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	pr_notice("UBIFS (ubi%d:%d): %pV\n",
+		  c->vi.ubi_num, c->vi.vol_id, &vaf);
+
+	va_end(args);
+}								    \
+
+/* UBIFS error messages */
+void ubifs_err(const struct ubifs_info *c, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	pr_err("UBIFS error (ubi%d:%d pid %d): %ps: %pV\n",
+	       c->vi.ubi_num, c->vi.vol_id, current->pid,
+	       __builtin_return_address(0),
+	       &vaf);
+
+	va_end(args);
+}								    \
+
+/* UBIFS warning messages */
+void ubifs_warn(const struct ubifs_info *c, const char *fmt, ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	pr_warn("UBIFS warning (ubi%d:%d pid %d): %ps: %pV\n",
+		c->vi.ubi_num, c->vi.vol_id, current->pid,
+		__builtin_return_address(0),
+		&vaf);
+
+	va_end(args);
+}
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index a5697de..c2a57e1 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -42,30 +42,6 @@
 /* Version of this UBIFS implementation */
 #define UBIFS_VERSION 1
 
-/* Normal UBIFS messages */
-#define ubifs_msg(c, fmt, ...)                                      \
-	pr_notice("UBIFS (ubi%d:%d): " fmt "\n",                    \
-		  (c)->vi.ubi_num, (c)->vi.vol_id, ##__VA_ARGS__)
-/* UBIFS error messages */
-#define ubifs_err(c, fmt, ...)                                      \
-	pr_err("UBIFS error (ubi%d:%d pid %d): %s: " fmt "\n",      \
-	       (c)->vi.ubi_num, (c)->vi.vol_id, current->pid,       \
-	       __func__, ##__VA_ARGS__)
-/* UBIFS warning messages */
-#define ubifs_warn(c, fmt, ...)                                     \
-	pr_warn("UBIFS warning (ubi%d:%d pid %d): %s: " fmt "\n",   \
-		(c)->vi.ubi_num, (c)->vi.vol_id, current->pid,      \
-		__func__, ##__VA_ARGS__)
-/*
- * A variant of 'ubifs_err()' which takes the UBIFS file-sytem description
- * object as an argument.
- */
-#define ubifs_errc(c, fmt, ...)                                     \
-	do {                                                        \
-		if (!(c)->probing)                                  \
-			ubifs_err(c, fmt, ##__VA_ARGS__);           \
-	} while (0)
-
 /* UBIFS file system VFS magic number */
 #define UBIFS_SUPER_MAGIC 0x24051905
 
@@ -1802,4 +1778,21 @@ int ubifs_decompress(const struct ubifs_info *c, const void *buf, int len,
 #include "misc.h"
 #include "key.h"
 
+/* Normal UBIFS messages */
+__printf(2, 3)
+void ubifs_msg(const struct ubifs_info *c, const char *fmt, ...);
+__printf(2, 3)
+void ubifs_err(const struct ubifs_info *c, const char *fmt, ...);
+__printf(2, 3)
+void ubifs_warn(const struct ubifs_info *c, const char *fmt, ...);
+/*
+ * A variant of 'ubifs_err()' which takes the UBIFS file-sytem description
+ * object as an argument.
+ */
+#define ubifs_errc(c, fmt, ...)						\
+do {									\
+	if (!(c)->probing)						\
+		ubifs_err(c, fmt, ##__VA_ARGS__);			\
+} while (0)
+
 #endif /* !__UBIFS_H__ */
-- 
2.6.3.368.gf34be46
