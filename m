Received: from smtp23.services.sfr.fr ([93.17.128.22])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M2jBf-0006Cg-Vo
	for linux-mtd@lists.infradead.org; Sat, 09 May 2009 09:49:50 +0000
Received: from smtp23.services.sfr.fr (msfrf2324 [10.18.27.38])
	by msfrf2315.sfr.fr (SMTP Server) with ESMTP id 4361E700054D
	for <linux-mtd@lists.infradead.org>;
	Sat,  9 May 2009 11:43:18 +0200 (CEST)
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mkfs.ubifs: use libubi to format UBI volume
Date: Sat,  9 May 2009 11:41:08 +0200
Message-Id: <1241862068-10596-4-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1241862068-10596-3-git-send-email-corentincj@iksaif.net>
References: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
	<1241862068-10596-2-git-send-email-corentincj@iksaif.net>
	<1241862068-10596-3-git-send-email-corentincj@iksaif.net>
Cc: Corentin Chary <corentincj@iksaif.net>, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

libubi is now used to format directly UBI volume.
Typing mkfs.ubifs /dev/ubi0_0 is now possible.
dtypes should be ok as they are taken from UBIFS code.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 mkfs.ubifs/Makefile     |    5 +-
 mkfs.ubifs/lpt.c        |   10 +-
 mkfs.ubifs/mkfs.ubifs.c |  187 ++++++++++++++++++++++++++++++++++++++--------
 mkfs.ubifs/mkfs.ubifs.h |    4 +-
 mkfs.ubifs/ubifs.h      |    3 +
 5 files changed, 169 insertions(+), 40 deletions(-)

diff --git a/mkfs.ubifs/Makefile b/mkfs.ubifs/Makefile
index e5bf9ce..a678b0a 100644
--- a/mkfs.ubifs/Makefile
+++ b/mkfs.ubifs/Makefile
@@ -1,8 +1,11 @@
+
+CPPFLAGS += -I../include -I../ubi-utils/include
+
 ALL_SOURCES=*.[ch] hashtable/*.[ch]
 
 TARGETS = mkfs.ubifs
 
-LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
+LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid -L../ubi-utils/ -lubi
 
 include ../common.mk
 
diff --git a/mkfs.ubifs/lpt.c b/mkfs.ubifs/lpt.c
index f6d4352..60002ff 100644
--- a/mkfs.ubifs/lpt.c
+++ b/mkfs.ubifs/lpt.c
@@ -410,7 +410,7 @@ int create_lpt(struct ubifs_info *c)
 			alen = ALIGN(len, c->min_io_size);
 			set_ltab(c, lnum, c->leb_size - alen, alen - len);
 			memset(p, 0xff, alen - len);
-			err = write_leb(lnum++, alen, buf);
+			err = write_leb(lnum++, alen, buf, UBI_SHORTTERM);
 			if (err)
 				goto out;
 			p = buf;
@@ -452,7 +452,7 @@ int create_lpt(struct ubifs_info *c)
 				set_ltab(c, lnum, c->leb_size - alen,
 					    alen - len);
 				memset(p, 0xff, alen - len);
-				err = write_leb(lnum++, alen, buf);
+				err = write_leb(lnum++, alen, buf, UBI_SHORTTERM);
 				if (err)
 					goto out;
 				p = buf;
@@ -499,7 +499,7 @@ int create_lpt(struct ubifs_info *c)
 			alen = ALIGN(len, c->min_io_size);
 			set_ltab(c, lnum, c->leb_size - alen, alen - len);
 			memset(p, 0xff, alen - len);
-			err = write_leb(lnum++, alen, buf);
+			err = write_leb(lnum++, alen, buf, UBI_SHORTTERM);
 			if (err)
 				goto out;
 			p = buf;
@@ -522,7 +522,7 @@ int create_lpt(struct ubifs_info *c)
 		alen = ALIGN(len, c->min_io_size);
 		set_ltab(c, lnum, c->leb_size - alen, alen - len);
 		memset(p, 0xff, alen - len);
-		err = write_leb(lnum++, alen, buf);
+		err = write_leb(lnum++, alen, buf, UBI_SHORTTERM);
 		if (err)
 			goto out;
 		p = buf;
@@ -542,7 +542,7 @@ int create_lpt(struct ubifs_info *c)
 
 	/* Write remaining buffer */
 	memset(p, 0xff, alen - len);
-	err = write_leb(lnum, alen, buf);
+	err = write_leb(lnum, alen, buf, UBI_SHORTTERM);
 	if (err)
 		goto out;
 
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index bedf8a7..c4d427c 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -95,6 +95,7 @@ struct inum_mapping {
  */
 struct ubifs_info info_;
 static struct ubifs_info *c = &info_;
+static libubi_t ubi;
 
 /* Debug levels are: 0 (none), 1 (statistics), 2 (files) ,3 (more details) */
 int debug_level;
@@ -105,6 +106,7 @@ static int root_len;
 static struct stat root_st;
 static char *output;
 static int out_fd;
+static int out_ubi;
 static int squash_owner;
 
 /* The 'head' (position) which nodes are written */
@@ -154,7 +156,10 @@ static const struct option longopts[] = {
 };
 
 static const char *helptext =
-"Usage: mkfs.ubifs [OPTIONS]\n"
+"Usage: mkfs.ubifs [OPTIONS] [device]\n"
+"Example: mkfs.ubifs ubi0:test\n"
+"         mkfs.ubifs -r /opt/img ubi0:test\n"
+"         mkfs.ubifs -m 512 -e 128KiB -c 100 -r /opt/img -o ubifs.img\n\n"
 "Make a UBIFS file system image from an existing directory tree\n\n"
 "Options:\n"
 "-r, -d, --root=DIR       build file system from directory DIR\n"
@@ -357,11 +362,9 @@ static int validate_options(void)
 {
 	int tmp;
 
-	if (!root)
-		return err_msg("root directory was not specified");
 	if (!output)
-		return err_msg("no output file specified");
-	if (in_path(root, output))
+		return err_msg("no output file or UBI volume specified");
+	if (root && in_path(root, output))
 		return err_msg("output file cannot be in the UBIFS root "
 			       "directory");
 	if (!is_power_of_2(c->min_io_size))
@@ -468,6 +471,34 @@ static long long get_bytes(const char *str)
 	return bytes;
 }
 
+/**
+ * open_ubi - parse UBI device name string and open the UBI device.
+ * @name: UBI volume name
+ *
+ * There are several ways to specify UBI volumes
+ * o /dev/ubiX_Y - UBI device number X, volume Y;
+ *
+ * ubi:name ubiX_Y, etc.. are not implemented right now
+ *
+ * Returns %0 in case of success and %-1 in case of faillure
+ */
+static int open_ubi(const char *name)
+{
+	struct stat st;
+
+	if (stat(name, &st) || !S_ISCHR(st.st_mode))
+		return -1;
+
+	ubi = libubi_open();
+	if (!ubi)
+		return -1;
+	if (ubi_get_vol_info(ubi, name, &c->vi))
+		return -1;
+	if (ubi_get_dev_info1(ubi, c->vi.dev_num, &c->di))
+		return -1;
+	return 0;
+}
+
 static int get_options(int argc, char**argv)
 {
 	int opt, i;
@@ -616,6 +647,20 @@ static int get_options(int argc, char**argv)
 		}
 	}
 
+	if (optind != argc && !output)
+		output = strdup(argv[optind]);
+	if (output)
+		out_ubi = !open_ubi(output);
+
+	if (out_ubi) {
+		c->min_io_size = c->di.min_io_size;
+		c->leb_size = c->vi.leb_size;
+		c->max_leb_cnt = c->vi.rsvd_lebs;
+	}
+
+	if (!output)
+		return err_msg("not output device or file specified");
+
 	if (c->min_io_size == -1)
 		return err_msg("min. I/O unit was not specified "
 			       "(use -h for help)");
@@ -714,36 +759,43 @@ static void prepare_node(void *node, int len)
 }
 
 /**
- * write_leb - copy the image of a LEB to the output file.
+ * write_leb - copy the image of a LEB to the output target
  * @lnum: LEB number
  * @len: length of data in the buffer
  * @buf: buffer (must be at least c->leb_size bytes)
+ * @dtype: expected data type
  */
-int write_leb(int lnum, int len, void *buf)
+int write_leb(int lnum, int len, void *buf, int dtype)
 {
 	off64_t pos = (off64_t)lnum * c->leb_size;
 
 	dbg_msg(3, "LEB %d len %d", lnum, len);
+	memset(buf + len, 0xff, c->leb_size - len);
+	if (out_ubi)
+		if (ubi_leb_change_start(ubi, out_fd, lnum, c->leb_size, dtype))
+			return sys_err_msg("ubi_leb_change_start failed");
+
 	if (lseek64(out_fd, pos, SEEK_SET) != pos)
 		return sys_err_msg("lseek64 failed seeking %lld",
 				   (long long)pos);
 
-	memset(buf + len, 0xff, c->leb_size - len);
-
 	if (write(out_fd, buf, c->leb_size) != c->leb_size)
 		return sys_err_msg("write failed writing %d bytes at pos %lld",
 				   c->leb_size, (long long)pos);
 
 	return 0;
+
 }
 
+
 /**
  * write_empty_leb - copy the image of an empty LEB to the output file.
  * @lnum: LEB number
+ * @dtype: expected data type
  */
-static int write_empty_leb(int lnum)
+static int write_empty_leb(int lnum, int dtype)
 {
-	return write_leb(lnum, 0, leb_buf);
+	return write_leb(lnum, 0, leb_buf, dtype);
 }
 
 /**
@@ -790,8 +842,9 @@ static int do_pad(void *buf, int len)
  * @node: node
  * @len: node length
  * @lnum: LEB number
+ * @dtype: expected data type
  */
-static int write_node(void *node, int len, int lnum)
+static int write_node(void *node, int len, int lnum, int dtype)
 {
 	prepare_node(node, len);
 
@@ -799,7 +852,7 @@ static int write_node(void *node, int len, int lnum)
 
 	len = do_pad(leb_buf, len);
 
-	return write_leb(lnum, len, leb_buf);
+	return write_leb(lnum, len, leb_buf, dtype);
 }
 
 /**
@@ -909,7 +962,7 @@ static int flush_nodes(void)
 	if (!head_offs)
 		return 0;
 	len = do_pad(leb_buf, head_offs);
-	err = write_leb(head_lnum, len, leb_buf);
+	err = write_leb(head_lnum, len, leb_buf, UBI_UNKNOWN);
 	if (err)
 		return err;
 	set_lprops(head_lnum, head_offs, head_flags);
@@ -1011,8 +1064,6 @@ static int add_inode_with_data(struct stat *st, ino_t inum, void *data,
 	ino->mtime_nsec = 0;
 	ino->uid        = cpu_to_le32(st->st_uid);
 	ino->gid        = cpu_to_le32(st->st_gid);
-	ino->uid        = cpu_to_le32(st->st_uid);
-	ino->gid        = cpu_to_le32(st->st_gid);
 	ino->mode       = cpu_to_le32(st->st_mode);
 	ino->flags      = cpu_to_le32(use_flags);
 	ino->data_len   = cpu_to_le32(data_len);
@@ -1583,14 +1634,20 @@ static int write_data(void)
 {
 	int err;
 
-	err = stat(root, &root_st);
-	if (err)
-		return sys_err_msg("bad root file-system directory '%s'", root);
+	if (root) {
+		err = stat(root, &root_st);
+		if (err)
+			return sys_err_msg("bad root file-system directory '%s'"
+					   , root);
+	} else {
+		root_st.st_mtime = time(NULL);
+		root_st.st_atime = root_st.st_ctime = root_st.st_mtime;
+	}
 	root_st.st_uid = root_st.st_gid = 0;
 	root_st.st_mode = S_IFDIR | S_IRWXU | S_IRWXG | S_IRWXO;
 
 	head_flags = 0;
-	err = add_directory(root, UBIFS_ROOT_INO, &root_st, 0);
+	err = add_directory(root, UBIFS_ROOT_INO, &root_st, !root);
 	if (err)
 		return err;
 	err = add_multi_linked_files();
@@ -1833,7 +1890,7 @@ static int set_gc_lnum(void)
 	int err;
 
 	c->gc_lnum = head_lnum++;
-	err = write_empty_leb(c->gc_lnum);
+	err = write_empty_leb(c->gc_lnum, UBI_LONGTERM);
 	if (err)
 		return err;
 	set_lprops(c->gc_lnum, 0, 0);
@@ -1909,7 +1966,7 @@ static int write_super(void)
 	if (c->big_lpt)
 		sup.flags |= cpu_to_le32(UBIFS_FLG_BIGLPT);
 
-	return write_node(&sup, UBIFS_SB_NODE_SZ, UBIFS_SB_LNUM);
+	return write_node(&sup, UBIFS_SB_NODE_SZ, UBIFS_SB_LNUM, UBI_LONGTERM);
 }
 
 /**
@@ -1952,11 +2009,11 @@ static int write_master(void)
 	mst.total_dark   = cpu_to_le64(c->lst.total_dark);
 	mst.leb_cnt      = cpu_to_le32(c->leb_cnt);
 
-	err = write_node(&mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM);
+	err = write_node(&mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM, UBI_SHORTTERM);
 	if (err)
 		return err;
 
-	err = write_node(&mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM + 1);
+	err = write_node(&mst, UBIFS_MST_NODE_SZ, UBIFS_MST_LNUM + 1, UBI_SHORTTERM);
 	if (err)
 		return err;
 
@@ -1976,14 +2033,14 @@ static int write_log(void)
 	cs.ch.node_type = UBIFS_CS_NODE;
 	cs.cmt_no = cpu_to_le64(0);
 
-	err = write_node(&cs, UBIFS_CS_NODE_SZ, lnum);
+	err = write_node(&cs, UBIFS_CS_NODE_SZ, lnum, UBI_UNKNOWN);
 	if (err)
 		return err;
 
 	lnum += 1;
 
 	for (i = 1; i < c->log_lebs; i++, lnum++) {
-		err = write_empty_leb(lnum);
+		err = write_empty_leb(lnum, UBI_UNKNOWN);
 		if (err)
 			return err;
 	}
@@ -2004,7 +2061,7 @@ static int write_lpt(void)
 
 	lnum = c->nhead_lnum + 1;
 	while (lnum <= c->lpt_last) {
-		err = write_empty_leb(lnum++);
+		err = write_empty_leb(lnum++, UBI_SHORTTERM);
 		if (err)
 			return err;
 	}
@@ -2021,7 +2078,7 @@ static int write_orphan_area(void)
 
 	lnum = UBIFS_LOG_LNUM + c->log_lebs + c->lpt_lebs;
 	for (i = 0; i < c->orph_lebs; i++, lnum++) {
-		err = write_empty_leb(lnum);
+		err = write_empty_leb(lnum, UBI_SHORTTERM);
 		if (err)
 			return err;
 	}
@@ -2029,14 +2086,74 @@ static int write_orphan_area(void)
 }
 
 /**
+ * check_volume_empty - check if the UBI volume is empty.
+ *
+ * This function checks if the UBIFS volume is empty by looking if its LEBs are
+ * mapped or not.
+ * Returns zero in case of success and a negative error code in case of
+ * failure.
+ */
+static int check_volume_empty()
+{
+	int lnum, err;
+
+	for (lnum = 0; lnum < c->vi.rsvd_lebs; lnum++) {
+		err = ubi_is_mapped(out_fd, lnum);
+		if (err < 0)
+			return err;
+		if (err == 1) {
+			return 0;
+		}
+	}
+	return 0;
+}
+
+/**
+ * erase an ubi volume
+ */
+static int erase_volume()
+{
+	int lnum, err;
+
+	// FIXME: Ask if the user really want to erase this volume
+	dbg_msg(1, "volume is not empty, erasing ...");
+	for (lnum = 0; lnum < c->vi.rsvd_lebs; lnum++) {
+		err = ubi_is_mapped(out_fd, lnum);
+		if (err == 1) {
+			dbg_msg(3, "erasing leb %d/%d", lnum, c->vi.rsvd_lebs);
+			err = ubi_leb_unmap(out_fd, lnum);
+		}
+		if (err < 0)
+			return err;
+	}
+	dbg_msg(1, "done.");
+	return 0;
+}
+
+/**
  * open_target - open the output file.
  */
 static int open_target(void)
 {
-	out_fd = open(output, O_CREAT | O_RDWR | O_TRUNC,
-		      S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH);
-	if (out_fd == -1)
-		return sys_err_msg("cannot create output file '%s'", output);
+	if (out_ubi) {
+		out_fd = open(output, O_RDWR | O_EXCL);
+
+		if (out_fd == -1)
+			return sys_err_msg("cannot open the UBI volume '%s'",
+					   output);
+		if (ubi_set_property(out_fd, UBI_PROP_DIRECT_WRITE, 1))
+			return sys_err_msg("ubi_set_property failed");
+
+		if (!check_volume_empty())
+			if (erase_volume() < 0)
+				return sys_err_msg("cannot erase the UBI volume");
+	} else {
+		out_fd = open(output, O_CREAT | O_RDWR | O_TRUNC,
+			      S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH);
+		if (out_fd == -1)
+			return sys_err_msg("cannot create output file '%s'",
+					   output);
+	}
 	return 0;
 }
 
@@ -2045,8 +2162,12 @@ static int open_target(void)
  */
 static int close_target(void)
 {
-	if (close(out_fd) == -1)
+	if (ubi)
+		libubi_close(ubi);
+	if (out_fd >= 0 && close(out_fd) == -1)
 		return sys_err_msg("cannot close output file '%s'", output);
+	if (output)
+		free(output);
 	return 0;
 }
 
diff --git a/mkfs.ubifs/mkfs.ubifs.h b/mkfs.ubifs/mkfs.ubifs.h
index 6460bd5..16b34c7 100644
--- a/mkfs.ubifs/mkfs.ubifs.h
+++ b/mkfs.ubifs/mkfs.ubifs.h
@@ -46,7 +46,9 @@
 #include <libgen.h>
 #include <ctype.h>
 #include <uuid/uuid.h>
+#include <sys/file.h>
 
+#include "libubi.h"
 #include "crc32.h"
 #include "defs.h"
 #include "crc16.h"
@@ -128,7 +130,7 @@ extern struct ubifs_info info_;
 
 struct hashtable_itr;
 
-int write_leb(int lnum, int len, void *buf);
+int write_leb(int lnum, int len, void *buf, int dtype);
 int parse_devtable(const char *tbl_file);
 struct path_htbl_element *devtbl_find_path(const char *path);
 struct name_htbl_element *devtbl_find_name(struct path_htbl_element *ph_elt,
diff --git a/mkfs.ubifs/ubifs.h b/mkfs.ubifs/ubifs.h
index 79c7192..0535b6f 100644
--- a/mkfs.ubifs/ubifs.h
+++ b/mkfs.ubifs/ubifs.h
@@ -366,6 +366,9 @@ struct ubifs_info
 	int dead_wm;
 	int dark_wm;
 
+	struct ubi_dev_info di;
+	struct ubi_vol_info vi;
+
 	int gc_lnum;
 	long long rp_size;
 
-- 
1.6.3
