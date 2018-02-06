Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejVUC-0003iy-LA
 for linux-mtd@lists.infradead.org; Wed, 07 Feb 2018 19:34:30 +0000
Received: by mail-pf0-x243.google.com with SMTP id p1so760939pfh.4
 for <linux-mtd@lists.infradead.org>; Wed, 07 Feb 2018 11:34:18 -0800 (PST)
Received: from localhost ([223.27.245.122])
 by smtp.gmail.com with ESMTPSA id b69sm5405682pfk.128.2018.02.07.11.34.15
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 07 Feb 2018 11:34:16 -0800 (PST)
Message-ID: <5a7b54b8.c83c620a.2d3df.7f47@mx.google.com>
Sender: =?UTF-8?B?UsOpY3pleSBCw6FsaW50?= <rbalint@gmail.com>
From: Balint Reczey <balint@balintreczey.hu>
Date: Wed, 7 Feb 2018 05:58:21 +0700
Subject: [PATCH 2/2] mtd: unittests: Decode arg size from ioctl request
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Balint Reczey <balint.reczey@canonical.com>
---
 tests/unittests/libmtd_test.c | 30 +++++++++++++++---------------
 tests/unittests/libubi_test.c | 22 +++++++++++-----------
 tests/unittests/test_lib.h    | 11 ++++-------
 3 files changed, 30 insertions(+), 33 deletions(-)

diff --git a/tests/unittests/libmtd_test.c b/tests/unittests/libmtd_test.c
index fc28dc0..f36fb56 100644
--- a/tests/unittests/libmtd_test.c
+++ b/tests/unittests/libmtd_test.c
@@ -70,7 +70,7 @@ static void test_mtd_mark_bad(void **state)
 	mtd.eb_cnt = 1024;
 	mtd.eb_size = 128;
 	seek = (loff_t)eb * mtd.eb_size;
-	expect_ioctl(MEMSETBADBLOCK, 0, &seek, sizeof(seek));
+	expect_ioctl(MEMSETBADBLOCK, 0, &seek);
 	int r = mtd_mark_bad(&mtd, 4, eb);
 	assert_int_equal(r, 0);
 
@@ -87,7 +87,7 @@ static void test_mtd_is_bad(void **state)
 	mtd.eb_cnt = 1024;
 	mtd.eb_size = 128;
 	seek = (loff_t)eb * mtd.eb_size;
-	expect_ioctl(MEMGETBADBLOCK, 0, &seek, sizeof(seek));
+	expect_ioctl(MEMGETBADBLOCK, 0, &seek);
 	int r = mtd_is_bad(&mtd, 4, eb);
 	assert_int_equal(r, 0);
 
@@ -106,7 +106,7 @@ static void test_mtd_lock(void **state)
 	memset(&ei, 0, sizeof(ei));
 	ei.start = eb * mtd.eb_size;
 	ei.length = mtd.eb_size;
-	expect_ioctl(MEMLOCK, 0, &ei, sizeof(ei));
+	expect_ioctl(MEMLOCK, 0, &ei);
 	int r = mtd_lock(&mtd, 4, eb);
 	assert_int_equal(r, 0);
 
@@ -125,7 +125,7 @@ static void test_mtd_unlock(void **state)
 	memset(&ei, 0, sizeof(ei));
 	ei.start = eb * mtd.eb_size;
 	ei.length = mtd.eb_size;
-	expect_ioctl(MEMUNLOCK, 0, &ei, sizeof(ei));
+	expect_ioctl(MEMUNLOCK, 0, &ei);
 	int r = mtd_unlock(&mtd, 4, eb);
 	assert_int_equal(r, 0);
 
@@ -144,7 +144,7 @@ static void test_mtd_is_locked(void **state)
 	memset(&ei, 0, sizeof(ei));
 	ei.start = eb * mtd.eb_size;
 	ei.length = mtd.eb_size;
-	expect_ioctl(MEMISLOCKED, 0, &ei, sizeof(ei));
+	expect_ioctl(MEMISLOCKED, 0, &ei);
 	int r = mtd_is_locked(&mtd, 4, eb);
 	assert_int_equal(r, 0);
 
@@ -160,7 +160,7 @@ static void test_mtd_regioninfo(void **state)
 	int mock_fd = 4;
 	int regidx = 0xAA;
 	rr.regionindex = regidx;
-	expect_ioctl(MEMGETREGIONINFO, 0, &rr, sizeof(rr));
+	expect_ioctl(MEMGETREGIONINFO, 0, &rr);
 	int r = mtd_regioninfo(mock_fd, regidx, &req);
 	assert_int_equal(r, 0);
 
@@ -187,12 +187,12 @@ static void test_mtd_erase_multi(void **state)
 	ei.length = ei64.length;
 	/* non offs64 first */
 	lib->offs64_ioctls = OFFS64_IOCTLS_NOT_SUPPORTED;
-	expect_ioctl(MEMERASE, 0, &ei, sizeof(ei));
+	expect_ioctl(MEMERASE, 0, &ei);
 	int r = mtd_erase_multi(lib, &mtd, 4, eb, blocks);
 	assert_int_equal(r, 0);
 
 	lib->offs64_ioctls = OFFS64_IOCTLS_SUPPORTED;
-	expect_ioctl(MEMERASE64, 0, &ei64, sizeof(ei64));
+	expect_ioctl(MEMERASE64, 0, &ei64);
 	r = mtd_erase_multi(lib, &mtd, 4, eb, blocks);
 	assert_int_equal(r, 0);
 
@@ -224,12 +224,12 @@ static void test_mtd_erase(void **state)
 	ei.length = ei64.length;
 	/* non offs64 first */
 	lib->offs64_ioctls = OFFS64_IOCTLS_NOT_SUPPORTED;
-	expect_ioctl(MEMERASE, 0, &ei, sizeof(ei));
+	expect_ioctl(MEMERASE, 0, &ei);
 	int r = mtd_erase(lib, &mtd, 4, eb);
 	assert_int_equal(r, 0);
 
 	lib->offs64_ioctls = OFFS64_IOCTLS_SUPPORTED;
-	expect_ioctl(MEMERASE64, 0, &ei64, sizeof(ei64));
+	expect_ioctl(MEMERASE64, 0, &ei64);
 	r = mtd_erase(lib, &mtd, 4, eb);
 	assert_int_equal(r, 0);
 
@@ -314,7 +314,7 @@ static void test_mtd_write_withoob(void **state)
 	req.usr_data = (uint64_t)(unsigned long)buf;
 	req.usr_oob = (uint64_t)(unsigned long)oob_data;
 	req.mode = mode;
-	expect_ioctl(MEMWRITE, 0, &req, sizeof(req));
+	expect_ioctl(MEMWRITE, 0, &req);
 	int r = mtd_write(lib, &mtd, mock_fd, eb, offs, buf, len, oob_data, oob_len, mode);
 	assert_int_equal(r, 0);
 
@@ -348,12 +348,12 @@ static void test_mtd_read_oob(void **state)
 	oob.ptr = buf;
 
 	lib->offs64_ioctls = OFFS64_IOCTLS_NOT_SUPPORTED;
-	expect_ioctl(MEMREADOOB, 0, &oob, sizeof(oob));
+	expect_ioctl(MEMREADOOB, 0, &oob);
 	int r = mtd_read_oob(lib, &mtd, mock_fd, start, length, buf);
 	assert_int_equal(r, 0);
 
 	lib->offs64_ioctls = OFFS64_IOCTLS_SUPPORTED;
-	expect_ioctl(MEMREADOOB64, 0, &oob64, sizeof(oob64));
+	expect_ioctl(MEMREADOOB64, 0, &oob64);
 	r = mtd_read_oob(lib, &mtd, mock_fd, start, length, buf);
 	assert_int_equal(r, 0);
 
@@ -388,12 +388,12 @@ static void test_mtd_write_oob(void **state)
 	oob.ptr = buf;
 
 	lib->offs64_ioctls = OFFS64_IOCTLS_NOT_SUPPORTED;
-	expect_ioctl(MEMWRITEOOB, 0, &oob, sizeof(oob));
+	expect_ioctl(MEMWRITEOOB, 0, &oob);
 	int r = mtd_write_oob(lib, &mtd, mock_fd, start, length, buf);
 	assert_int_equal(r, 0);
 
 	lib->offs64_ioctls = OFFS64_IOCTLS_SUPPORTED;
-	expect_ioctl(MEMWRITEOOB64, 0, &oob64, sizeof(oob64));
+	expect_ioctl(MEMWRITEOOB64, 0, &oob64);
 	r = mtd_write_oob(lib, &mtd, mock_fd, start, length, buf);
 	assert_int_equal(r, 0);
 
diff --git a/tests/unittests/libubi_test.c b/tests/unittests/libubi_test.c
index 3e08e42..8deae91 100644
--- a/tests/unittests/libubi_test.c
+++ b/tests/unittests/libubi_test.c
@@ -54,7 +54,7 @@ static void test_ubi_leb_unmap(void **state)
 {
 	int mock_fd = 1;
 	int lnum = 12;
-	expect_ioctl(UBI_IOCEBUNMAP, 0, &lnum, sizeof(lnum));
+	expect_ioctl(UBI_IOCEBUNMAP, 0, &lnum);
 	int r = ubi_leb_unmap(mock_fd, lnum);
 	assert_int_equal(r, 0);
 
@@ -65,7 +65,7 @@ static void test_ubi_is_mapped(void **state)
 {
 	int mock_fd = 1;
 	int lnum = 1;
-	expect_ioctl(UBI_IOCEBISMAP, 0, &lnum, sizeof(lnum));
+	expect_ioctl(UBI_IOCEBISMAP, 0, &lnum);
 	int r = ubi_is_mapped(mock_fd, lnum);
 	assert_int_equal(r, 0);
 
@@ -77,7 +77,7 @@ static void test_ubi_update_start(void **state)
 	int mock_fd = 1;
 	long long bytes = 0x1234;
 
-	expect_ioctl(UBI_IOCVOLUP, 0, &bytes, sizeof(bytes));
+	expect_ioctl(UBI_IOCVOLUP, 0, &bytes);
 	int r = ubi_update_start(NULL, mock_fd, bytes);
 	assert_int_equal(r, 0);
 	(void) state;
@@ -116,7 +116,7 @@ static void test_ubi_rsvol(void **state)
 	req.bytes = bytes;
 	req.vol_id = vol_id;
 	expect_open(node, O_RDONLY, 4);
-	expect_ioctl(UBI_IOCRSVOL, 0, &req, sizeof(req));
+	expect_ioctl(UBI_IOCRSVOL, 0, &req);
 	expect_close(4, 0);
 	int r = ubi_rsvol(NULL, node, vol_id, bytes);
 	assert_int_equal(r, 0);
@@ -131,7 +131,7 @@ static void test_ubi_rnvols(void **state)
 	struct ubi_rnvol_req req;
 	memset(&req, 0xaf, sizeof(req));
 	expect_open(node, O_RDONLY, 4);
-	expect_ioctl(UBI_IOCRNVOL, 0, &req, sizeof(req));
+	expect_ioctl(UBI_IOCRNVOL, 0, &req);
 	expect_close(4, 0);
 	int r = ubi_rnvols(lib, node, &req);
 	assert_int_equal(r, 0);
@@ -146,7 +146,7 @@ static void test_ubi_rmvol(void **state)
 	const char *node = "/foo";
 	int vol_id = 12;
 	expect_open(node, O_RDONLY, 4);
-	expect_ioctl(UBI_IOCRMVOL, 0, &vol_id, sizeof(vol_id));
+	expect_ioctl(UBI_IOCRMVOL, 0, &vol_id);
 	expect_close(4, 0);
 	int r = ubi_rmvol(lib, node, vol_id);
 	assert_int_equal(r, 0);
@@ -166,7 +166,7 @@ static void test_ubi_leb_change_start(void **state)
 	req.lnum = lnum;
 	req.bytes = bytes;
 	req.dtype = 3;
-	expect_ioctl(UBI_IOCEBCH, 0, &req, sizeof(req));
+	expect_ioctl(UBI_IOCEBCH, 0, &req);
 	int r = ubi_leb_change_start(lib, mock_fd, lnum, bytes);
 	assert_int_equal(r, 0);
 
@@ -209,7 +209,7 @@ static void test_ubi_mkvol(void **state)
 	rr.name_len = strlen(vol_name);
 	strncpy(rr.name, vol_name, UBI_MAX_VOLUME_NAME + 1);
 	expect_open(node, O_RDONLY, 3);
-	expect_ioctl(UBI_IOCMKVOL, 0, &rr, sizeof(rr));
+	expect_ioctl(UBI_IOCMKVOL, 0, &rr);
 	expect_close(3,0);
 	int r = ubi_mkvol(lib, node, &req);
 	assert_int_equal(r, 0);
@@ -225,7 +225,7 @@ void test_ubi_remove_dev(void **state)
 	libubi_t lib = mock_libubi_open();
 	int ubi_dev = 0xAA;
 	expect_open(node, O_RDONLY, 4);
-	expect_ioctl(UBI_IOCDET, 0, &ubi_dev, sizeof(ubi_dev));
+	expect_ioctl(UBI_IOCDET, 0, &ubi_dev);
 	expect_close(4,0);
 	int r = ubi_remove_dev(lib, node, ubi_dev);
 	assert_int_equal(r, 0);
@@ -247,7 +247,7 @@ void test_ubi_attach(void **state)
 	rr.ubi_num = 1;
 	rr.mtd_num = 1;
 	expect_open(node, O_RDONLY, 4);
-	expect_ioctl(UBI_IOCATT, 0, &rr, sizeof(rr));
+	expect_ioctl(UBI_IOCATT, 0, &rr);
 	expect_close(4,0);
 
 	int r = ubi_attach(lib, node, &req);
@@ -266,7 +266,7 @@ void test_ubi_set_property(void **state)
 	memset(&req, 0, sizeof(req));
 	req.property = prop;
 	req.value = val;
-	expect_ioctl(UBI_IOCSETVOLPROP, 0, &req, sizeof(req));
+	expect_ioctl(UBI_IOCSETVOLPROP, 0, &req);
 	int r = ubi_set_property(mock_fd, prop, val);
 	assert_int_equal(r,0);
 
diff --git a/tests/unittests/test_lib.h b/tests/unittests/test_lib.h
index f5f0f34..806a4bc 100644
--- a/tests/unittests/test_lib.h
+++ b/tests/unittests/test_lib.h
@@ -45,16 +45,15 @@ int __wrap_ioctl(int fd, unsigned long req, ...)
 	assert_true(fd > 0);
 	check_expected(req);
 	int retval = mock_type(int);
-	void *expected_arg = mock_type(void*);
-	size_t expected_len = mock_type(size_t);
+	char *expected_arg = mock_type(char*);
 	if (expected_arg == NULL)
 		return retval;
 	va_list ap;
 	va_start(ap, req);
-	void *arg = va_arg(ap, void *);
+	char *arg = va_arg(ap, char *);
 	va_end(ap);
 	assert_non_null(arg);
-	assert_memory_equal(expected_arg, arg, expected_len);
+	assert_memory_equal(expected_arg, arg, _IOC_SIZE(req));
 	return retval;
 }
 
@@ -107,18 +106,16 @@ off_t __wrap_lseek(int fd, off_t seek, int whence)
 		will_return(__wrap_close, Y);\
 	} while(0);
 
-#define expect_ioctl(W,X,Y,Z) do { \
+#define expect_ioctl(W,X,Y) do { \
 		expect_value(__wrap_ioctl, req, W);\
 		will_return(__wrap_ioctl, X);\
 		will_return(__wrap_ioctl, Y);\
-		will_return(__wrap_ioctl, Z);\
 	} while(0);
 
 #define expect_ioctl_short(X,Y) do { \
 		expect_value(__wrap_ioctl, req, X);\
 		will_return(__wrap_ioctl, Y);\
 		will_return(__wrap_ioctl, NULL);\
-		will_return(__wrap_ioctl, 0);\
 	} while(0);
 
 #define expect_stat(X,Y) do { \
-- 
2.14.1
