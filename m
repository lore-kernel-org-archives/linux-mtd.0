Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ShKPM-00058K-2z
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2012 12:53:17 +0000
Received: by bkwj4 with SMTP id j4so6928956bkw.36
 for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2012 05:53:12 -0700 (PDT)
From: Alexey <alexey.knyshev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: mkfs.ubifs: Exclude path arg
Date: Wed, 20 Jun 2012 16:52:54 +0400
Message-ID: <1365970.7M11Fyf9F7@alexey-desktop.localdomain>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart4095461.zUE0RRtU0C"
Content-Transfer-Encoding: 7Bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nextPart4095461.zUE0RRtU0C
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

--exclude PATH (-z PATH) argument for mkfs.ubifs to exclude PATH (relative to 
the root)

Regards,
Alexey
--nextPart4095461.zUE0RRtU0C
Content-Disposition: attachment; filename="0001-mkfs.ubifs-add-an-exclude-z-arg.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-mkfs.ubifs-add-an-exclude-z-arg.patch"

>From a798ae7e1c60be59d1acbfe4528a3349cc0ec0d9 Mon Sep 17 00:00:00 2001
From: Alexey Knyshev <alexey.knyshev@gmail.com>
Date: Fri, 15 Jun 2012 15:31:26 +0400
Subject: [PATCH] mkfs.ubifs: add an --exclude (-z) arg

Add an exclude option to exclude paths relative to the root
Size of exclude_path array is define EXCL_SIZE_MAX

Signed-off-by: Alexey Knyshev <alexey.knyshev@gmail.com>
---
 mkfs.ubifs/mkfs.ubifs.c |  233 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 209 insertions(+), 24 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index bb25dc3..1ea117b 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -111,6 +111,12 @@ static int out_fd;
 static int out_ubi;
 static int squash_owner;
 
+/* Exclude PATHs */
+#define EXCL_SIZE_MAX 1024
+static char *exclude_paths[EXCL_SIZE_MAX];
+static size_t exclude_paths_size = 0;
+static char *exclude_args[EXCL_SIZE_MAX];
+
 /* The 'head' (position) which nodes are written */
 static int head_lnum;
 static int head_offs;
@@ -132,7 +138,7 @@ static struct inum_mapping **hash_table;
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
 
-static const char *optstring = "d:r:m:o:D:h?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQq";
+static const char *optstring = "d:r:m:o:D:h?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQqz:";
 
 static const struct option longopts[] = {
 	{"root",               1, NULL, 'r'},
@@ -154,7 +160,8 @@ static const struct option longopts[] = {
 	{"keyhash",            1, NULL, 'k'},
 	{"log-lebs",           1, NULL, 'l'},
 	{"orph-lebs",          1, NULL, 'p'},
-	{"squash-uids" ,       0, NULL, 'U'},
+	{"squash-uids",        0, NULL, 'U'},
+	{"exclude",            1, NULL, 'z'},
 	{NULL, 0, NULL, 0}
 };
 
@@ -194,6 +201,7 @@ static const char *helptext =
 "-V, --version            display version information\n"
 "-g, --debug=LEVEL        display debug information (0 - none, 1 - statistics,\n"
 "                         2 - files, 3 - more details)\n"
+"-z, --exclude=PATH       exclude PATH from output relative to the root\n"
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in Kilobytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
@@ -216,22 +224,82 @@ static const char *helptext =
 "takes time. This feature is supported by the Linux kernel starting from version 3.0.\n";
 
 /**
- * make_path - make a path name from a directory and a name.
+ * make_path - make a path name from a directory and a name
+ * and validate it with realpath.
  * @dir: directory path name
  * @name: name
  */
 static char *make_path(const char *dir, const char *name)
 {
-	char *s;
+	char *s, *res;
 
 	s = malloc(strlen(dir) + strlen(name) + 2);
-	if (!s)
+	if (!s) {
+		err_msg("out of memory");
 		return NULL;
+	}
 	strcpy(s, dir);
 	if (dir[strlen(dir) - 1] != '/')
 		strcat(s, "/");
 	strcat(s, name);
-	return s;
+
+	res = realpath(s, 0);
+	if (!res) {
+		dbg_msg(2, "Invalid path %s skipped!", name);
+		return NULL;
+	}
+
+	free(s);
+
+	return res;
+}
+
+static char *add_separator(const char *path)
+{
+	const size_t origlen = strlen(path);
+	const size_t copylen = origlen + 2; /* strlen + sep + nullterm */
+	char *copy = (char *)malloc(copylen);
+	if (!copy)
+		return NULL;
+	memcpy(copy, path, origlen);
+	copy[copylen - 2] = '/';
+	copy[copylen - 1] = 0;
+
+	dbg_msg(2, "Adding separator %s", copy);
+
+	return copy;
+}
+
+static void add_exclude_arg(char *arg)
+{
+	if (exclude_paths_size >= EXCL_SIZE_MAX) {
+		err_msg("Warning! Maximum exclude path count reached!");
+		err_msg("All following paths will be ignored!");
+		return;
+	}
+	exclude_args[exclude_paths_size] = arg;
+	++exclude_paths_size;
+}
+
+/**
+ * copy_root - duplicate @path (optarg), returning an identical malloc'd
+ * @path and adds '/' at end if there was no.
+ * @path: path to copy
+ */
+static char *copy_root(const char *path)
+{
+	dbg_msg(2, "coping root %s", path);
+
+	size_t len = strlen(path);
+
+	/*
+	 * The further code expects '/' at the end of the root
+	 * UBIFS directory on the host. So we set flag add_sep
+	 * in copy_path.
+	 */
+	if (path[len - 1] != '/')
+		return add_separator(path);
+	return strdup(path);
 }
 
 /**
@@ -370,6 +438,92 @@ static long long add_space_overhead(long long size)
         return size / divisor;
 }
 
+/**
+ * cstring comparer for qsort function
+ */
+/*
+static int cstring_cmp(const void *a, const void *b)
+{
+	const char **ia = (const char **)a;
+	const char **ib = (const char **)b;
+
+	return strcmp(*ia, *ib);
+}
+*/
+
+/**
+ * sort array of strings using qsort function
+ */
+/*
+static void cstrings_sort(char **strings, size_t size)
+{
+	qsort(strings, size, sizeof(char *), cstring_cmp);
+}
+*/
+
+static void cstrings_print(char **strings, size_t size)
+{
+	size_t i;
+	for (i = 0; i < size; ++i)
+		dbg_msg(2, "%s", strings[i]);
+}
+
+/**
+ * add root prefix to each of exclude_args and write result
+ * to exclude_paths
+ *
+ * if some path from exclude_args not valid it will not
+ * be added to exclude_paths
+ */
+static int add_prefixes(void)
+{
+	size_t path_index, dest_index, size = exclude_paths_size;
+	char *tmp = 0;
+
+	if (size > 0) {
+		dbg_msg(2, "Adding prefixes to %s", "...");
+		cstrings_print(exclude_args, size);
+	}
+
+	for (path_index = 0, dest_index = 0; path_index < size; ++path_index) {
+		tmp = make_path(root, exclude_args[path_index]);
+		if (tmp) {
+			exclude_paths[dest_index] = tmp;
+			++dest_index;
+		} else {
+			--exclude_paths_size;
+		}
+	}
+
+	if (size > 0) {
+		dbg_msg(2, "Prefixes added %s", "...");
+		cstrings_print(exclude_paths, exclude_paths_size);
+	}
+	return 0;
+}
+
+/**
+ * find @str in @strings array
+ */
+static size_t cstring_find(char **strings, size_t size, const char *str)
+{
+	size_t i;
+	for (i = 0; i < size; ++i) {
+		const int cmp = strcmp(str, strings[i]);
+		if (cmp == 0)
+			return i;
+	}
+	return -1;
+}
+
+/**
+ * is_excluded_path - find index of @path in @path_list (@size - size of @path_list)
+ */
+static int is_excluded_path(char **path_list, size_t size, const char *path)
+{
+	return (cstring_find(path_list, size, path) != -1);
+}
+
 static int validate_options(void)
 {
 	int tmp;
@@ -424,6 +578,18 @@ static int validate_options(void)
 		return err_msg("too few log LEBs, expected at least %d", tmp);
 	if (c->rp_size >= ((long long)c->leb_size * c->max_leb_cnt) / 2)
 		return err_msg("too much reserved space %lld", c->rp_size);
+	/*
+	 * Make sure that the root has not excluded
+	 *
+	 * Because of root has always '/' at end and exclude paths do not
+	 * user can't exclude root
+	 */
+
+	/*
+	if (is_excluded_path(exclude_paths, exclude_paths_size, root)) {
+		return err_msg("root directory excluded");
+	}
+	*/
 	return 0;
 }
 
@@ -525,31 +691,21 @@ static int get_options(int argc, char**argv)
 	c->max_bud_bytes = -1;
 	c->log_lebs = -1;
 
-	while (1) {
-		opt = getopt_long(argc, argv, optstring, longopts, &i);
-		if (opt == -1)
-			break;
+	while ( (opt = getopt_long(argc, argv, optstring, longopts, &i)) != -1 ) {
 		switch (opt) {
 		case 'r':
 		case 'd':
-			root_len = strlen(optarg);
-			root = malloc(root_len + 2);
+			dbg_msg(2, "parsing root %s", optarg);
+			root = copy_root(optarg);
 			if (!root)
-				return err_msg("cannot allocate memory");
-
-			/*
-			 * The further code expects '/' at the end of the root
-			 * UBIFS directory on the host.
-			 */
-			memcpy(root, optarg, root_len);
-			if (root[root_len - 1] != '/')
-				root[root_len++] = '/';
-			root[root_len] = 0;
+				return err_msg("out of memory");
+			root_len = strlen(root);
 
 			/* Make sure the root directory exists */
 			if (stat(root, &st))
 				return sys_err_msg("bad root directory '%s'",
 						   root);
+
 			break;
 		case 'm':
 			c->min_io_size = get_bytes(optarg);
@@ -653,6 +809,11 @@ static int get_options(int argc, char**argv)
 		case 'U':
 			squash_owner = 1;
 			break;
+		case 'z':
+			add_exclude_arg(optarg);
+			break;
+		default:
+			break;
 		}
 	}
 
@@ -740,9 +901,15 @@ static int get_options(int argc, char**argv)
 		printf("\torph_lebs:    %d\n", c->orph_lebs);
 		printf("\tspace_fixup:  %d\n", c->space_fixup);
 	}
+	/* Parse saved args and add prefix to each of 'em */
+	if (add_prefixes())
+		return err_msg("out of memory");
+
+	/* Sort @exclude_paths for speed up looking up */
+/*	cstrings_sort(exclude_paths, exclude_paths_size);*/
 
 	if (validate_options())
-		return -1;
+		return err_msg("options validation failed");
 
 	if (tbl_file && parse_devtable(tbl_file))
 		return err_msg("cannot parse device table file '%s'", tbl_file);
@@ -1205,7 +1372,7 @@ static int add_dent_node(ino_t dir_inum, const char *name, ino_t inum,
 
 	kname = strdup(name);
 	if (!kname)
-		return err_msg("cannot allocate memory");
+		return err_msg("out of memory");
 
 	return add_node(&key, kname, dent, len);
 }
@@ -1508,6 +1675,11 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 			goto out_free;
 		}
 
+		if (is_excluded_path(exclude_paths, exclude_paths_size, name)) {
+			dbg_msg(2, "excluding %s", name);
+			continue;
+		}
+
 		if (squash_owner)
 			/*
 			 * Squash UID/GID. But the device table may override
@@ -1658,6 +1830,7 @@ static int write_data(void)
 	}
 
 	head_flags = 0;
+
 	err = add_directory(root, UBIFS_ROOT_INO, &root_st, !root);
 	if (err)
 		return err;
@@ -1667,6 +1840,9 @@ static int write_data(void)
 	return flush_nodes();
 }
 
+/**
+ * name comparer for qsort func
+ */
 static int namecmp(const char *name1, const char *name2)
 {
 	size_t len1 = strlen(name1), len2 = strlen(name2);
@@ -2257,6 +2433,14 @@ static void destroy_hash_table(void)
 	}
 }
 
+static void destroy_exclude_paths(void)
+{
+	size_t i;
+
+	for (i = 0; i < exclude_paths_size; ++i)
+		free(exclude_paths[i]);
+}
+
 /**
  * deinit - deinitialize things.
  */
@@ -2271,6 +2455,7 @@ static void deinit(void)
 	free(hash_table);
 	destroy_compression();
 	free_devtable_info();
+	destroy_exclude_paths();
 }
 
 /**
-- 
1.7.9.7


--nextPart4095461.zUE0RRtU0C--
