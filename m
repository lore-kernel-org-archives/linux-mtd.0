Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwAu-0001xO-Ok
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:50:43 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 07/38] ubifs: move more functions into io lib
Date: Mon, 21 Dec 2015 16:41:30 +0800
Message-ID: <1450687321-12381-8-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Move some common functions in mkfs.ubifs.c to io.c
to let others can use them.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/include/io.h            |   4 ++
 ubifs-utils/lib/io.c                | 101 +++++++++++++++++++++++++++++++++++
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 102 +-----------------------------------
 3 files changed, 107 insertions(+), 100 deletions(-)

diff --git a/ubifs-utils/include/io.h b/ubifs-utils/include/io.h
index e24d0c6..920645d 100644
--- a/ubifs-utils/include/io.h
+++ b/ubifs-utils/include/io.h
@@ -10,6 +10,10 @@
 extern int out_fd;
 extern int out_ubi;
 extern libubi_t ubi;
+extern char *output;
 
 int write_leb(struct ubifs_info *c, int lnum, int len, void *buf);
+int close_target(void);
+int open_target(struct ubifs_info *c, int yes);
+int open_ubi(struct ubifs_info *c, const char *node);
 #endif
diff --git a/ubifs-utils/lib/io.c b/ubifs-utils/lib/io.c
index 7aba0a6..9817d2a 100644
--- a/ubifs-utils/lib/io.c
+++ b/ubifs-utils/lib/io.c
@@ -5,6 +5,107 @@
 int out_fd;
 int out_ubi;
 libubi_t ubi;
+char *output;
+
+/**
+ * check_volume_empty - check if the UBI volume is empty.
+ *
+ * This function checks if the UBI volume is empty by looking if its LEBs are
+ * mapped or not.
+ *
+ * Returns %0 in case of success, %1 is the volume is not empty,
+ * and a negative error code in case of failure.
+ */
+static int check_volume_empty(struct ubifs_info *c)
+{
+	int lnum, err;
+
+	for (lnum = 0; lnum < c->vi.rsvd_lebs; lnum++) {
+		err = ubi_is_mapped(out_fd, lnum);
+		if (err < 0)
+			return err;
+		if (err == 1)
+			return 1;
+	}
+	return 0;
+}
+
+/**
+ * open_ubi - open the UBI volume.
+ * @node: name of the UBI volume character device to fetch information about
+ *
+ * Returns %0 in case of success and %-1 in case of failure
+ */
+int open_ubi(struct ubifs_info *c, const char *node)
+{
+	struct stat st;
+
+	if (stat(node, &st) || !S_ISCHR(st.st_mode))
+		return -1;
+
+	ubi = libubi_open();
+	if (!ubi)
+		return -1;
+	if (ubi_get_vol_info(ubi, node, &c->vi))
+		return -1;
+	if (ubi_get_dev_info1(ubi, c->vi.dev_num, &c->di))
+		return -1;
+	return 0;
+}
+
+/**
+ * open_target - open the output target.
+ * @yes: always ansure yes
+ *
+ * Open the output target. The target can be an UBI volume
+ * or a file.
+ *
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+int open_target(struct ubifs_info *c, int yes)
+{
+	if (out_ubi) {
+		out_fd = open(output, O_RDWR | O_EXCL);
+
+		if (out_fd == -1)
+			return sys_err_msg("cannot open the UBI volume '%s'",
+					   output);
+		if (ubi_set_property(out_fd, UBI_VOL_PROP_DIRECT_WRITE, 1))
+			return sys_err_msg("ubi_set_property failed");
+
+		if (!yes && check_volume_empty(c)) {
+			if (!prompt("UBI volume is not empty.  Format anyways?", false))
+				return err_msg("UBI volume is not empty");
+		}
+	} else {
+		out_fd = open(output, O_CREAT | O_RDWR | O_TRUNC,
+			      S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH);
+		if (out_fd == -1)
+			return sys_err_msg("cannot create output file '%s'",
+					   output);
+	}
+	return 0;
+}
+
+/**
+ * close_target - close the output target.
+ *
+ * Close the output target. If the target was an UBI
+ * volume, also close libubi.
+ *
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+int close_target(void)
+{
+	if (ubi)
+		libubi_close(ubi);
+	if (out_fd >= 0 && close(out_fd) == -1)
+		return sys_err_msg("cannot close the target '%s'", output);
+	if (output)
+		free(output);
+	return 0;
+}
+
 
 /**
  * write_leb - copy the image of a LEB to the output target.
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index b2df5b1..8ac09f2 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -110,7 +110,6 @@ int yes;
 static char *root;
 static int root_len;
 static struct stat root_st;
-static char *output;
 static int squash_owner;
 static int do_create_inum_attr;
 
@@ -446,28 +445,6 @@ static long long get_bytes(const char *str)
 
 	return bytes;
 }
-/**
- * open_ubi - open the UBI volume.
- * @node: name of the UBI volume character device to fetch information about
- *
- * Returns %0 in case of success and %-1 in case of failure
- */
-static int open_ubi(const char *node)
-{
-	struct stat st;
-
-	if (stat(node, &st) || !S_ISCHR(st.st_mode))
-		return -1;
-
-	ubi = libubi_open();
-	if (!ubi)
-		return -1;
-	if (ubi_get_vol_info(ubi, node, &c->vi))
-		return -1;
-	if (ubi_get_dev_info1(ubi, c->vi.dev_num, &c->di))
-		return -1;
-	return 0;
-}
 
 static int get_options(int argc, char**argv)
 {
@@ -643,7 +620,7 @@ static int get_options(int argc, char**argv)
 	if (!output)
 		return err_msg("not output device or file specified");
 
-	out_ubi = !open_ubi(output);
+	out_ubi = !open_ubi(c, output);
 
 	if (out_ubi) {
 		c->min_io_size = c->di.min_io_size;
@@ -2248,81 +2225,6 @@ static int write_orphan_area(void)
 	return 0;
 }
 
-/**
- * check_volume_empty - check if the UBI volume is empty.
- *
- * This function checks if the UBI volume is empty by looking if its LEBs are
- * mapped or not.
- *
- * Returns %0 in case of success, %1 is the volume is not empty,
- * and a negative error code in case of failure.
- */
-static int check_volume_empty(void)
-{
-	int lnum, err;
-
-	for (lnum = 0; lnum < c->vi.rsvd_lebs; lnum++) {
-		err = ubi_is_mapped(out_fd, lnum);
-		if (err < 0)
-			return err;
-		if (err == 1)
-			return 1;
-	}
-	return 0;
-}
-
-/**
- * open_target - open the output target.
- *
- * Open the output target. The target can be an UBI volume
- * or a file.
- *
- * Returns %0 in case of success and %-1 in case of failure.
- */
-static int open_target(void)
-{
-	if (out_ubi) {
-		out_fd = open(output, O_RDWR | O_EXCL);
-
-		if (out_fd == -1)
-			return sys_err_msg("cannot open the UBI volume '%s'",
-					   output);
-		if (ubi_set_property(out_fd, UBI_VOL_PROP_DIRECT_WRITE, 1))
-			return sys_err_msg("ubi_set_property failed");
-
-		if (!yes && check_volume_empty()) {
-			if (!prompt("UBI volume is not empty.  Format anyways?", false))
-				return err_msg("UBI volume is not empty");
-		}
-	} else {
-		out_fd = open(output, O_CREAT | O_RDWR | O_TRUNC,
-			      S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH);
-		if (out_fd == -1)
-			return sys_err_msg("cannot create output file '%s'",
-					   output);
-	}
-	return 0;
-}
-
-
-/**
- * close_target - close the output target.
- *
- * Close the output target. If the target was an UBI
- * volume, also close libubi.
- *
- * Returns %0 in case of success and %-1 in case of failure.
- */
-static int close_target(void)
-{
-	if (ubi)
-		libubi_close(ubi);
-	if (out_fd >= 0 && close(out_fd) == -1)
-		return sys_err_msg("cannot close the target '%s'", output);
-	if (output)
-		free(output);
-	return 0;
-}
 
 /**
  * init - initialize things.
@@ -2473,7 +2375,7 @@ int main(int argc, char *argv[])
 	if (err)
 		return err;
 
-	err = open_target();
+	err = open_target(c, yes);
 	if (err)
 		return err;
 
-- 
1.8.4.2
