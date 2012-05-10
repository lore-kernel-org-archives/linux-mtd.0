Received: from mail.grid-net.com ([97.65.115.2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SScR3-0003eC-2Z
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 23:06:13 +0000
From: Subodh Nijsure <snijsure@grid-net.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] Modify mtd-utils intgck utility to test extended attribute
 set/get for UBIFS
Date: Thu, 10 May 2012 16:05:59 -0700
Message-ID: <1336691159-31764-1-git-send-email-snijsure@grid-net.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: snijsure@grid-net.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes since v1:
        Randomize value of extended attribute.
        Update dir_entry structure to keep track of extended attribute and
        check it during verification phase, as suggested during v1 review.
	Now compiling and running integck requires libattr.

Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
---
 tests/fs-tests/integrity/Makefile  |    2 +-
 tests/fs-tests/integrity/integck.c |   92 +++++++++++++++++++++++++++++++++---
 tests/ubi-tests/Makefile           |    3 +-
 3 files changed, 88 insertions(+), 9 deletions(-)

diff --git a/tests/fs-tests/integrity/Makefile b/tests/fs-tests/integrity/Makefile
index 4d6fc7d..b814f77 100644
--- a/tests/fs-tests/integrity/Makefile
+++ b/tests/fs-tests/integrity/Makefile
@@ -25,7 +25,7 @@ $(TARGETS): libubi.a
 # Disable optimizations to make it possible to use gdb comfortably
 # Use -rdynamic to have stack backtraces
 debug: libubi.a
-	gcc $(CFLAGS) -O0 -D INTEGCK_DEBUG -rdynamic integck.c libubi.a -o integck
+	gcc $(CFLAGS) -O0 -D INTEGCK_DEBUG -rdynamic integck.c libubi.a -o integck -lattr
 
 clean:
 	rm -f *.o $(TARGETS) libubi.a
diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 30322cd..7bd73bf 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -91,6 +91,7 @@
 		normsg(fmt " (line %d)", ##__VA_ARGS__, __LINE__);           \
 } while(0)
 
+static int xattr_count;
 /* The variables below are set by command line arguments */
 static struct {
 	long repeat_cnt;
@@ -198,6 +199,7 @@ struct dir_entry_info /* Each entry in a directory has one of these */
 	struct dir_entry_info *next_link; /* List of hard links for same file */
 	struct dir_entry_info *prev_link; /* List of hard links for same file */
 	char *name;
+	char *xattr_value; /* Extended attribute on this directory */
 	struct dir_info *parent; /* Parent directory */
 	union {
 		struct file_info *file;
@@ -360,6 +362,60 @@ static char *cat_paths(const char *a, const char *b)
 }
 
 /*
+ * Verify security.selinux extendend attribute for given path
+ */
+void xattr_check(char *path, char *xattr_value)
+{
+	int ret;
+	char buf[255];
+	int attrLen;
+	/* Check if path actually exists */
+	if (access(path, F_OK) != 0)
+		return;
+	if (xattr_value == NULL)
+		return;
+	attrLen = strlen(xattr_value) + 1;
+	v("retrieve extended attribute for  %s", path);
+	getxattr(path, "security.selinux", buf, attrLen);
+	CHECK(ret == 0);
+	ret = strncmp(buf, xattr_value, attrLen);
+	if (ret != 0) {
+		printf("ret != 0 PATH %s\n", path);
+		printf("Expected value %s and retrived val %s\n",
+			xattr_value, buf);
+		CHECK(ret == 0);
+	} else {
+		CHECK(ret == 0);
+	}
+}
+
+/*
+ * Assign security.selinux extendend attribute for this path
+ */
+char *assign_xattr(const char *path)
+{
+	int ret;
+	char value[255], *xattr_value;
+	int attrLen;
+
+	sprintf(value, "root:object_r:bin_t%d", xattr_count);
+	xattr_count++;
+	xattr_value = (char *)malloc(strlen(value)+1);
+	if (xattr_value == NULL)
+		return NULL;
+	strcpy(xattr_value, value);
+	attrLen = strlen(xattr_value) + 1;
+	v("assign extended attribute to %s", path);
+	/* printf("%s assigned %s\n", path, xattr_value); */
+	ret = setxattr(path, "security.selinux", xattr_value, attrLen, 0x0);
+	if (ret == 0)
+		return xattr_value;
+	else {
+		free(xattr_value);
+		return NULL;
+	}
+}
+/*
  * Get the free space for the tested file system.
  */
 static void get_fs_space(uint64_t *total, uint64_t *free)
@@ -450,13 +506,17 @@ static void free_writes_info(struct file_info *file)
 }
 
 static void *add_dir_entry(struct dir_info *parent, char type, const char *name,
-			   void *target)
+			   const char *xattr_value, void *target)
 {
 	struct dir_entry_info *entry;
 
 	entry = zalloc(sizeof(struct dir_entry_info));
 	entry->type = type;
 	entry->name = dup_string(name);
+	if (xattr_value != NULL)
+		entry->xattr_value = dup_string(xattr_value);
+	else
+		entry->xattr_value = NULL;
 	entry->parent = parent;
 
 	entry->next = parent->first;
@@ -540,6 +600,7 @@ static void remove_dir_entry(struct dir_entry_info *entry, int free_target)
 	}
 
 	free(entry->name);
+	free(entry->xattr_value);
 	free(entry);
 }
 
@@ -551,6 +612,7 @@ static void remove_dir_entry(struct dir_entry_info *entry, int free_target)
 static int dir_new(struct dir_info *parent, const char *name)
 {
 	char *path;
+	char *xattr_value;
 
 	assert(parent);
 
@@ -573,9 +635,11 @@ static int dir_new(struct dir_info *parent, const char *name)
 		CHECK(lstat(path, &st) == 0);
 		CHECK(S_ISDIR(st.st_mode));
 	}
+	xattr_value = assign_xattr(path);
+	CHECK(xattr_value != NULL);
+	add_dir_entry(parent, 'd', name, xattr_value, NULL);
+	free(xattr_value);
 	free(path);
-
-	add_dir_entry(parent, 'd', name, NULL);
 	return 0;
 }
 
@@ -630,6 +694,7 @@ static int dir_remove(struct dir_info *dir)
 static int file_new(struct dir_info *parent, const char *name)
 {
 	char *path;
+	char *xattr_value;
 	mode_t mode;
 	int fd;
 
@@ -657,7 +722,10 @@ static int file_new(struct dir_info *parent, const char *name)
 		CHECK(S_ISREG(st.st_mode));
 	}
 
-	add_dir_entry(parent, 'f', name, NULL);
+	xattr_value = assign_xattr(path);
+	CHECK(xattr_value != NULL);
+	add_dir_entry(parent, 'f', name, xattr_value, NULL);
+	free(xattr_value);
 
 	close(fd);
 	free(path);
@@ -669,6 +737,7 @@ static int link_new(struct dir_info *parent, const char *name,
 {
 	struct dir_entry_info *entry;
 	char *path, *target;
+	char *xattr_value = NULL;
 	int ret;
 	struct stat st1, st2;
 
@@ -704,7 +773,10 @@ static int link_new(struct dir_info *parent, const char *name,
 		CHECK(st2.st_nlink == st1.st_nlink + 1);
 	}
 
-	add_dir_entry(parent, 'f', name, file);
+	xattr_value = assign_xattr(path);
+	CHECK(xattr_value != NULL);
+	add_dir_entry(parent, 'f', name, xattr_value, file);
+	free(xattr_value);
 
 	free(target);
 	free(path);
@@ -1753,6 +1825,10 @@ static void dir_check(struct dir_info *dir)
 	/* Now check each entry */
 	entry = dir->first;
 	while (entry) {
+		char buf[2048];
+		sprintf(buf, "%s/%s", path, entry->name);
+		if (entry->type == 'd' || entry->type == 'f')
+			xattr_check(buf, entry->xattr_value);
 		if (entry->type == 'd') {
 			dir_check(entry->dir);
 			link_count += 1; /* <subdir>/.. */
@@ -1927,6 +2003,7 @@ static int rename_entry(struct dir_entry_info *entry)
 	struct dir_entry_info *rename_entry = NULL;
 	struct dir_info *parent;
 	char *path, *to, *name;
+	char *xattr_value = NULL;
 	int ret, isdir, retry;
 	struct stat st1, st2;
 
@@ -2000,7 +2077,8 @@ static int rename_entry(struct dir_entry_info *entry)
 		return 0;
 	}
 
-	add_dir_entry(parent, entry->type, name, entry->target);
+	add_dir_entry(parent, entry->type, name, xattr_value, entry->target);
+	free(xattr_value);
 	if (rename_entry)
 		remove_dir_entry(rename_entry, 1);
 	remove_dir_entry(entry, 0);
@@ -2132,7 +2210,7 @@ static int symlink_new(struct dir_info *dir, const char *nm)
 	if (args.verify_ops)
 		verify_symlink(target, path);
 
-	s = add_dir_entry(dir, 's', name, NULL);
+	s = add_dir_entry(dir, 's', name, NULL, NULL);
 	s->target_pathname = target;
 
 	free(path);
diff --git a/tests/ubi-tests/Makefile b/tests/ubi-tests/Makefile
index 2c47a9f..ba8e7e0 100644
--- a/tests/ubi-tests/Makefile
+++ b/tests/ubi-tests/Makefile
@@ -8,7 +8,8 @@ LIBS = libubi
 TARGETS=io_update volrefcnt integ io_paral io_read io_basic \
           mkvol_basic mkvol_bad mkvol_paral rsvol
 
-CFLAGS += -I$(LIBUBI_HEADER_PATH) -I $(KERNELHDR) -lpthread
+CFLAGS += -I$(LIBUBI_HEADER_PATH) -I$(KERNELHDR) -lpthread
+LDFLAGS += -lpthread
 
 include ../../common.mk
 
-- 
1.7.5.4
