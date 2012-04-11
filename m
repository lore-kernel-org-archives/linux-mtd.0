Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SI2Du-0002a1-0Z
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2012 18:24:54 +0000
Received: by dadn15 with SMTP id n15so1852472dad.16
 for <linux-mtd@lists.infradead.org>; Wed, 11 Apr 2012 11:24:52 -0700 (PDT)
From: subodh.nijsure@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Modify mtd-utils intgck utility to test extended attribute
 set/get for UBIFS
Date: Wed, 11 Apr 2012 11:24:28 -0700
Message-Id: <1334168668-26218-1-git-send-email-snijsure@grid-net.com>
Cc: Subodh Nijsure <snijsure@grid-net.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Subodh Nijsure <snijsure@grid-net.com>

[ Assuming that linux-mtd is right place to send patches for mtd-utils]

Need to compile the test target with option UBIFS_XATTR_TEST=1
run make as "UBIFS_XATTR_TEST=1 make tests"

Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
---
 tests/fs-tests/integrity/Makefile  |   11 +++++++++++
 tests/fs-tests/integrity/integck.c |   31 +++++++++++++++++++++++++++++++
 tests/ubi-tests/Makefile           |    3 ++-
 3 files changed, 44 insertions(+), 1 deletions(-)

diff --git a/tests/fs-tests/integrity/Makefile b/tests/fs-tests/integrity/Makefile
index 4d6fc7d..2b1280f 100644
--- a/tests/fs-tests/integrity/Makefile
+++ b/tests/fs-tests/integrity/Makefile
@@ -3,6 +3,12 @@ ifeq ($(origin CC),default)
 CC = gcc
 endif
 
+#To compile  integck with XATTR test support
+#invoke as UBIFS_XATTR_TEST=1 make tests from toplevel directory
+ifeq ($(UBIFS_XATTR_TEST), 1)
+  CPPFLAGS += -DUBIFS_XATTR_TEST
+endif
+
 COMMON_HEADERS_DIR := ../../../include
 LIBUBI_PATH = ../../../ubi-utils/
 LIBUBI_HEADER_PATH = $(LIBUBI_PATH)/include
@@ -25,7 +31,12 @@ $(TARGETS): libubi.a
 # Disable optimizations to make it possible to use gdb comfortably
 # Use -rdynamic to have stack backtraces
 debug: libubi.a
+ifeq ($(UBIFS_XATTR_TEST), 1)
+	@echo "Linking with -lattr...."
+	gcc $(CFLAGS) -O0 -D INTEGCK_DEBUG -rdynamic integck.c libubi.a -o integck -lattr
+else
 	gcc $(CFLAGS) -O0 -D INTEGCK_DEBUG -rdynamic integck.c libubi.a -o integck
+endif
 
 clean:
 	rm -f *.o $(TARGETS) libubi.a
diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 30322cd..12f9ee9 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -38,6 +38,7 @@
 #include <sys/statvfs.h>
 #include <linux/fs.h>
 
+
 #define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME "integck"
 #include "common.h"
@@ -543,6 +544,28 @@ static void remove_dir_entry(struct dir_entry_info *entry, int free_target)
 	free(entry);
 }
 
+/* Assign given path extended attribute security.selinx value
+ * root:object_t:bin_t then read it back and verify it correct
+ */
+#ifdef UBIFS_XATTR_TEST
+void test_xattr(char *path)
+{
+	int ret;
+	char buf[255];
+	char value[255];
+	int attrLen;
+	strcpy(value,"root:object_r:bin_t");
+	attrLen = strlen(value) + 1;
+	ret = setxattr (path, "security.selinux", value, attrLen, 0x0);
+	v("assign extended attribute to %s", path);
+	CHECK(ret == 0);
+	if ( ret == 0 ) {
+		v("retrieve extended attribute for  %s", path);
+		ret = getxattr(path,"security.selinux",buf,attrLen);
+		CHECK(strncmp(buf,"root:object_r:bin_t", attrLen) == 0 );
+	}
+}
+#endif
 /*
  * Create a new directory "name" in the parent directory described by "parent"
  * and add it to the in-memory list of directories. Returns zero in case of
@@ -573,6 +596,9 @@ static int dir_new(struct dir_info *parent, const char *name)
 		CHECK(lstat(path, &st) == 0);
 		CHECK(S_ISDIR(st.st_mode));
 	}
+#ifdef UBIFS_XATTR_TEST
+	test_xattr(path);
+#endif
 	free(path);
 
 	add_dir_entry(parent, 'd', name, NULL);
@@ -627,6 +653,8 @@ static int dir_remove(struct dir_info *dir)
 	return 0;
 }
 
+
+
 static int file_new(struct dir_info *parent, const char *name)
 {
 	char *path;
@@ -660,6 +688,9 @@ static int file_new(struct dir_info *parent, const char *name)
 	add_dir_entry(parent, 'f', name, NULL);
 
 	close(fd);
+#ifdef UBIFS_XATTR_TEST
+	test_xattr(path);
+#endif
 	free(path);
 	return 0;
 }
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
