Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dQAqg-0006ga-5u
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 11:09:37 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id AC98E24E0013
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 13:08:44 +0200 (CEST)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 9/9] Add const modifier to read only strings and string
 constants
Date: Wed, 28 Jun 2017 13:08:19 +0200
Message-Id: <20170628110819.30563-10-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
References: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 tests/fs-tests/lib/tests.c             | 16 ++++++++--------
 tests/fs-tests/lib/tests.h             |  6 +++---
 tests/fs-tests/simple/ftrunc.c         |  2 +-
 tests/fs-tests/stress/atoms/stress_2.c |  2 +-
 tests/fs-tests/utils/free_space.c      |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/fs-tests/lib/tests.c b/tests/fs-tests/lib/tests.c
index 8d4d83a..d1a2e0c 100644
--- a/tests/fs-tests/lib/tests.c
+++ b/tests/fs-tests/lib/tests.c
@@ -40,9 +40,9 @@
 
 #include "tests.h"
 
-char *tests_file_system_mount_dir = TESTS_DEFAULT_FILE_SYSTEM_MOUNT_DIR;
+const char *tests_file_system_mount_dir = TESTS_DEFAULT_FILE_SYSTEM_MOUNT_DIR;
 
-char *tests_file_system_type = TESTS_DEFAULT_FILE_SYSTEM_TYPE;
+const char *tests_file_system_type = TESTS_DEFAULT_FILE_SYSTEM_TYPE;
 
 int tests_ok_to_sync = 0; /* Whether to use fsync */
 
@@ -62,7 +62,7 @@ int64_t tests_repeat_parameter = 0;
 int64_t tests_sleep_parameter = 0;
 
 /* Program name from argv[0] */
-char *program_name = "unknown";
+const char *program_name = "unknown";
 
 /* General purpose test parameter to specify a file should be unlinked.
    May be used by different tests in different ways or not at all. */
@@ -1058,8 +1058,8 @@ void tests_remount(void)
 {
 	int err;
 	struct mntent mount_info;
-	char *source, *target, *filesystemtype, *data;
-	char cwd[4096];
+	const char *source, *target, *filesystemtype;
+	char cwd[4096], *data;
 	unsigned long mountflags, flags;
 	unsigned int rorw1, um, um_ro, um_rorw, rorw2;
 
@@ -1152,9 +1152,9 @@ void tests_remount(void)
 static void tests_mnt(int mnt)
 {
 	static struct mntent mount_info;
-	char *source;
-	char *target;
-	char *filesystemtype;
+	const char *source;
+	const char *target;
+	const char *filesystemtype;
 	unsigned long mountflags;
 	char *data;
 	static char cwd[4096];
diff --git a/tests/fs-tests/lib/tests.h b/tests/fs-tests/lib/tests.h
index 01849bc..6bcfd83 100644
--- a/tests/fs-tests/lib/tests.h
+++ b/tests/fs-tests/lib/tests.h
@@ -164,9 +164,9 @@ int tests_fs_is_currfs(void);
 /* Concatenate a pid to a string in a signal safe way */
 void tests_cat_pid(char *buf, const char *name, pid_t pid);
 
-extern char *tests_file_system_mount_dir;
+extern const char *tests_file_system_mount_dir;
 
-extern char *tests_file_system_type;
+extern const char *tests_file_system_type;
 
 /* General purpose test parameter to specify some aspect of test size.
    May be used by different tests in different ways.
@@ -200,7 +200,7 @@ extern int tests_delete_flag;
 extern int tests_hole_flag;
 
 /* Program name from argv[0] */
-extern char *program_name;
+extern const char *program_name;
 
 /* Maximum file name length of test file system (from statfs) */
 extern long tests_max_fname_len;
diff --git a/tests/fs-tests/simple/ftrunc.c b/tests/fs-tests/simple/ftrunc.c
index 2df404b..52b660b 100644
--- a/tests/fs-tests/simple/ftrunc.c
+++ b/tests/fs-tests/simple/ftrunc.c
@@ -39,7 +39,7 @@ static void ftrunc(void)
 	ssize_t written;
 	int64_t remains;
 	size_t block;
-	char *file_name;
+	const char *file_name;
 	off_t actual;
 	char buf[WRITE_BUFFER_SIZE];
 
diff --git a/tests/fs-tests/stress/atoms/stress_2.c b/tests/fs-tests/stress/atoms/stress_2.c
index 5dea1b7..bd53ad3 100644
--- a/tests/fs-tests/stress/atoms/stress_2.c
+++ b/tests/fs-tests/stress/atoms/stress_2.c
@@ -40,7 +40,7 @@ static void stress_2(void)
 	int64_t remains;
 	int64_t repeat;
 	size_t block;
-	char *file_name;
+	const char *file_name;
 	char buf[WRITE_BUFFER_SIZE];
 
 	file_name = "stress_2_test_file";
diff --git a/tests/fs-tests/utils/free_space.c b/tests/fs-tests/utils/free_space.c
index 88036aa..3421e7d 100644
--- a/tests/fs-tests/utils/free_space.c
+++ b/tests/fs-tests/utils/free_space.c
@@ -25,7 +25,7 @@
 
 int main(int argc, char *argv[])
 {
-	char *dir_name = ".";
+	const char *dir_name = ".";
 	uint64_t free_space;
 	struct statvfs fs_info;
 
-- 
2.12.3
