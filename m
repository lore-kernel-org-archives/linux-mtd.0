Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eippm-0000fx-3m
 for linux-mtd@lists.infradead.org; Mon, 05 Feb 2018 23:05:59 +0000
Received: by mail-pg0-x241.google.com with SMTP id s73so22470pgc.1
 for <linux-mtd@lists.infradead.org>; Mon, 05 Feb 2018 15:05:47 -0800 (PST)
Received: from localhost ([223.27.245.122])
 by smtp.gmail.com with ESMTPSA id m22sm18918040pfg.188.2018.02.05.15.05.44
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Feb 2018 15:05:45 -0800 (PST)
Message-ID: <5a78e349.16c6620a.3eb02.9d3c@mx.google.com>
Sender: =?UTF-8?B?UsOpY3pleSBCw6FsaW50?= <rbalint@gmail.com>
From: Balint Reczey <balint@balintreczey.hu>
Date: Tue, 6 Feb 2018 05:31:32 +0700
Subject: [PATCH] mtd: unittests: Stop testing stat() calls
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sometimes __xstat is called instead that makes tests fragile.
---
 tests/unittests/Makemodule.am |  2 +-
 tests/unittests/libmtd_test.c |  2 --
 tests/unittests/libubi_test.c |  1 -
 tests/unittests/test_lib.h    | 12 ------------
 4 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/tests/unittests/Makemodule.am b/tests/unittests/Makemodule.am
index 0ecdaa9..569866e 100644
--- a/tests/unittests/Makemodule.am
+++ b/tests/unittests/Makemodule.am
@@ -1,6 +1,6 @@
 ubilib_test_SOURCES = tests/unittests/libubi_test.c lib/libubi.c
 ubilib_test_LDADD = $(CMOCKA_LIBS)
-ubilib_test_LDFLAGS = -Wl,--wrap=open -Wl,--wrap=close -Wl,--wrap=stat -Wl,--wrap=ioctl -Wl,--wrap=read -Wl,--wrap=lseek
+ubilib_test_LDFLAGS = -Wl,--wrap=open -Wl,--wrap=close -Wl,--wrap=ioctl -Wl,--wrap=read -Wl,--wrap=lseek
 ubilib_test_CPPFLAGS = -O0 --std=gnu99 $(CMOCKA_CFLAGS) -I include -DSYSFS_ROOT='"tests/unittests/sysfs_mock"'
 
 mtdlib_test_SOURCES = tests/unittests/libmtd_test.c lib/libmtd.c lib/libmtd_legacy.c
diff --git a/tests/unittests/libmtd_test.c b/tests/unittests/libmtd_test.c
index fc28dc0..d25b70a 100644
--- a/tests/unittests/libmtd_test.c
+++ b/tests/unittests/libmtd_test.c
@@ -53,7 +53,6 @@ static void test_mtd_dev_present(void **state)
 {
 	int ret;
 	libmtd_t lib = mock_libmtd_open();
-	expect_stat(SYSFS_ROOT "/class/mtd/mtd0", 0);
 	ret = mtd_dev_present(lib, 0);
 	assert_int_equal(ret, 1);
 	libmtd_close(lib);
@@ -423,7 +422,6 @@ static void test_mtd_get_dev_info1(void **state)
 	struct mtd_dev_info info;
 	int dev_num = 0;
 	memset(&info, 0, sizeof(info));
-	expect_stat(SYSFS_ROOT "/class/mtd/mtd0", 0);
 	expect_open(SYSFS_ROOT "/class/mtd/mtd0/dev", O_RDONLY, 0);
 	expect_read_real(50,0);
 	expect_read(1,0);
diff --git a/tests/unittests/libubi_test.c b/tests/unittests/libubi_test.c
index 3e08e42..da06061 100644
--- a/tests/unittests/libubi_test.c
+++ b/tests/unittests/libubi_test.c
@@ -98,7 +98,6 @@ static libubi_t mock_libubi_open()
 static void test_ubi_dev_present(void **state)
 {
 	libubi_t lib = mock_libubi_open();
-	expect_stat(SYSFS_ROOT "/class/ubi/ubi0", 0);
 	int r = ubi_dev_present(lib, 0);
 	assert_int_equal(r, 1);
 
diff --git a/tests/unittests/test_lib.h b/tests/unittests/test_lib.h
index 122672b..8010843 100644
--- a/tests/unittests/test_lib.h
+++ b/tests/unittests/test_lib.h
@@ -58,13 +58,6 @@ int __wrap_ioctl(int fd, int req, ...)
 	return retval;
 }
 
-int __wrap_stat(const char *path, struct stat *buf)
-{
-	check_expected(path);
-	assert_non_null(buf);
-	return mock_type(int);
-}
-
 int __wrap_read(int fd, char *buf, size_t len)
 {
 	assert_true(fd > 0);
@@ -121,11 +114,6 @@ off_t __wrap_lseek(int fd, off_t seek, int whence)
 		will_return(__wrap_ioctl, 0);\
 	} while(0);
 
-#define expect_stat(X,Y) do { \
-		expect_string(__wrap_stat, path, X);\
-		will_return(__wrap_stat, Y);\
-	} while(0);
-
 #define expect_write(X,Y,Z) do { \
 		will_return(__wrap_write, X);\
 		will_return(__wrap_write, Y);\
-- 
2.14.1
