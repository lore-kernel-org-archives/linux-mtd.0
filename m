Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwAY-0000ke-G8
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:50:15 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 02/38] ubifs: move the all io related code into io.[h|c]
Date: Mon, 21 Dec 2015 16:41:25 +0800
Message-ID: <1450687321-12381-3-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To cut off the dependence from common lib to mkfs.ubifs,
this patch refactor the io related functions into a new
lib named as io.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 Makefile                            |  2 +-
 ubifs-utils/mkfs.ubifs/io.c         | 33 +++++++++++++++++++++++++++++++++
 ubifs-utils/mkfs.ubifs/io.h         | 15 +++++++++++++++
 ubifs-utils/mkfs.ubifs/lpt.c        | 10 +++++-----
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 34 +++-------------------------------
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h |  2 +-
 6 files changed, 58 insertions(+), 38 deletions(-)
 create mode 100644 ubifs-utils/mkfs.ubifs/io.c
 create mode 100644 ubifs-utils/mkfs.ubifs/io.h

diff --git a/Makefile b/Makefile
index bd9504a..8864675 100644
--- a/Makefile
+++ b/Makefile
@@ -126,7 +126,7 @@ $(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-co
 #
 # Utils in ubifs-utils subdir
 #
-obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
+obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o io.o\
 	hashtable/hashtable.o hashtable/hashtable_itr.o
 LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
 LDLIBS_mkfs.ubifs = -lz $(LZOLDLIBS) -lm -luuid
diff --git a/ubifs-utils/mkfs.ubifs/io.c b/ubifs-utils/mkfs.ubifs/io.c
new file mode 100644
index 0000000..7aba0a6
--- /dev/null
+++ b/ubifs-utils/mkfs.ubifs/io.c
@@ -0,0 +1,33 @@
+#include "io.h"
+#define PROGRAM_NAME "ubifs-io"
+#include <common.h>
+
+int out_fd;
+int out_ubi;
+libubi_t ubi;
+
+/**
+ * write_leb - copy the image of a LEB to the output target.
+ * @lnum: LEB number
+ * @len: length of data in the buffer
+ * @buf: buffer (must be at least c->leb_size bytes)
+ */
+int write_leb(struct ubifs_info *c, int lnum, int len, void *buf)
+{
+	off_t pos = (off_t)lnum * c->leb_size;
+
+	dbg_msg(3, "LEB %d len %d", lnum, len);
+	memset(buf + len, 0xff, c->leb_size - len);
+	if (out_ubi)
+		if (ubi_leb_change_start(ubi, out_fd, lnum, c->leb_size))
+			return sys_err_msg("ubi_leb_change_start failed");
+
+	if (lseek(out_fd, pos, SEEK_SET) != pos)
+		return sys_err_msg("lseek failed seeking %"PRIdoff_t, pos);
+
+	if (write(out_fd, buf, c->leb_size) != c->leb_size)
+		return sys_err_msg("write failed writing %d bytes at pos %"PRIdoff_t,
+				   c->leb_size, pos);
+
+	return 0;
+}
diff --git a/ubifs-utils/mkfs.ubifs/io.h b/ubifs-utils/mkfs.ubifs/io.h
new file mode 100644
index 0000000..e24d0c6
--- /dev/null
+++ b/ubifs-utils/mkfs.ubifs/io.h
@@ -0,0 +1,15 @@
+/**
+ * Header file for the io to ubi volume
+ */
+#ifndef __UBIFS_IO_H__
+#define __UBIFS_IO_H__
+
+#include "ubifs_common.h"
+#include "ubifs.h"
+
+extern int out_fd;
+extern int out_ubi;
+extern libubi_t ubi;
+
+int write_leb(struct ubifs_info *c, int lnum, int len, void *buf);
+#endif
diff --git a/ubifs-utils/mkfs.ubifs/lpt.c b/ubifs-utils/mkfs.ubifs/lpt.c
index 6aa0b88..cee221c 100644
--- a/ubifs-utils/mkfs.ubifs/lpt.c
+++ b/ubifs-utils/mkfs.ubifs/lpt.c
@@ -410,7 +410,7 @@ int create_lpt(struct ubifs_info *c)
 			alen = ALIGN(len, c->min_io_size);
 			set_ltab(c, lnum, c->leb_size - alen, alen - len);
 			memset(p, 0xff, alen - len);
-			err = write_leb(lnum++, alen, buf);
+			err = write_leb(c, lnum++, alen, buf);
 			if (err)
 				goto out;
 			p = buf;
@@ -452,7 +452,7 @@ int create_lpt(struct ubifs_info *c)
 				set_ltab(c, lnum, c->leb_size - alen,
 					    alen - len);
 				memset(p, 0xff, alen - len);
-				err = write_leb(lnum++, alen, buf);
+				err = write_leb(c, lnum++, alen, buf);
 				if (err)
 					goto out;
 				p = buf;
@@ -499,7 +499,7 @@ int create_lpt(struct ubifs_info *c)
 			alen = ALIGN(len, c->min_io_size);
 			set_ltab(c, lnum, c->leb_size - alen, alen - len);
 			memset(p, 0xff, alen - len);
-			err = write_leb(lnum++, alen, buf);
+			err = write_leb(c, lnum++, alen, buf);
 			if (err)
 				goto out;
 			p = buf;
@@ -522,7 +522,7 @@ int create_lpt(struct ubifs_info *c)
 		alen = ALIGN(len, c->min_io_size);
 		set_ltab(c, lnum, c->leb_size - alen, alen - len);
 		memset(p, 0xff, alen - len);
-		err = write_leb(lnum++, alen, buf);
+		err = write_leb(c, lnum++, alen, buf);
 		if (err)
 			goto out;
 		p = buf;
@@ -542,7 +542,7 @@ int create_lpt(struct ubifs_info *c)
 
 	/* Write remaining buffer */
 	memset(p, 0xff, alen - len);
-	err = write_leb(lnum, alen, buf);
+	err = write_leb(c, lnum, alen, buf);
 	if (err)
 		goto out;
 
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 27f8d0a..47f4025 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -101,7 +101,6 @@ struct inum_mapping {
  */
 struct ubifs_info info_;
 static struct ubifs_info *c = &info_;
-static libubi_t ubi;
 
 /* Debug levels are: 0 (none), 1 (statistics), 2 (files) ,3 (more details) */
 int debug_level;
@@ -112,8 +111,6 @@ static char *root;
 static int root_len;
 static struct stat root_st;
 static char *output;
-static int out_fd;
-static int out_ubi;
 static int squash_owner;
 static int do_create_inum_attr;
 
@@ -753,31 +750,6 @@ static void prepare_node(void *node, int len)
 	ch->crc = cpu_to_le32(crc);
 }
 
-/**
- * write_leb - copy the image of a LEB to the output target.
- * @lnum: LEB number
- * @len: length of data in the buffer
- * @buf: buffer (must be at least c->leb_size bytes)
- */
-int write_leb(int lnum, int len, void *buf)
-{
-	off_t pos = (off_t)lnum * c->leb_size;
-
-	dbg_msg(3, "LEB %d len %d", lnum, len);
-	memset(buf + len, 0xff, c->leb_size - len);
-	if (out_ubi)
-		if (ubi_leb_change_start(ubi, out_fd, lnum, c->leb_size))
-			return sys_err_msg("ubi_leb_change_start failed");
-
-	if (lseek(out_fd, pos, SEEK_SET) != pos)
-		return sys_err_msg("lseek failed seeking %"PRIdoff_t, pos);
-
-	if (write(out_fd, buf, c->leb_size) != c->leb_size)
-		return sys_err_msg("write failed writing %d bytes at pos %"PRIdoff_t,
-				   c->leb_size, pos);
-
-	return 0;
-}
 
 /**
  * write_empty_leb - copy the image of an empty LEB to the output target.
@@ -785,7 +757,7 @@ int write_leb(int lnum, int len, void *buf)
  */
 static int write_empty_leb(int lnum)
 {
-	return write_leb(lnum, 0, leb_buf);
+	return write_leb(c, lnum, 0, leb_buf);
 }
 
 /**
@@ -841,7 +813,7 @@ static int write_node(void *node, int len, int lnum)
 
 	len = do_pad(leb_buf, len);
 
-	return write_leb(lnum, len, leb_buf);
+	return write_leb(c, lnum, len, leb_buf);
 }
 
 /**
@@ -951,7 +923,7 @@ static int flush_nodes(void)
 	if (!head_offs)
 		return 0;
 	len = do_pad(leb_buf, head_offs);
-	err = write_leb(head_lnum, len, leb_buf);
+	err = write_leb(c, head_lnum, len, leb_buf);
 	if (err)
 		return err;
 	set_lprops(head_lnum, head_offs, head_flags);
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
index d6d46a2..ba646a6 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
@@ -34,6 +34,7 @@
 #include "key.h"
 #include "lpt.h"
 #include "compr.h"
+#include "io.h"
 
 /*
  * Compression flags are duplicated so that compr.c can compile without ubifs.h.
@@ -88,7 +89,6 @@ extern struct ubifs_info info_;
 
 struct hashtable_itr;
 
-int write_leb(int lnum, int len, void *buf);
 int parse_devtable(const char *tbl_file);
 struct path_htbl_element *devtbl_find_path(const char *path);
 struct name_htbl_element *devtbl_find_name(struct path_htbl_element *ph_elt,
-- 
1.8.4.2
