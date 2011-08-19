Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSZ0-0003dD-Bb
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:08:59 +0000
Received: by mail-yi0-f49.google.com with SMTP id 13so2669541yic.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:08:58 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 03/10] mtd-utils: use __func__ instead of __FUNCTION__
Date: Fri, 19 Aug 2011 10:07:49 -0700
Message-Id: <1313773676-12879-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
References: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

__func__ is more portable

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 mtd_debug.c              |   16 ++++++++--------
 tests/ubi-tests/common.c |   10 +++++-----
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/mtd_debug.c b/mtd_debug.c
index b98de50..2d307a9 100644
--- a/mtd_debug.c
+++ b/mtd_debug.c
@@ -123,10 +123,10 @@ int flash_to_file(int fd, u_int32_t offset, size_t len, const char *filename)
 retry:
 	if ((buf = (u_int8_t *) malloc(size)) == NULL) {
 #define BUF_SIZE	(64 * 1024 * sizeof(u_int8_t))
-		fprintf(stderr, "%s: malloc(%#x)\n", __FUNCTION__, size);
+		fprintf(stderr, "%s: malloc(%#x)\n", __func__, size);
 		if (size != BUF_SIZE) {
 			size = BUF_SIZE;
-			fprintf(stderr, "%s: trying buffer size %#x\n", __FUNCTION__, size);
+			fprintf(stderr, "%s: trying buffer size %#x\n", __func__, size);
 			goto retry;
 		}
 		perror("malloc()");
@@ -137,13 +137,13 @@ retry:
 			size = n;
 		err = read(fd, buf, size);
 		if (err < 0) {
-			fprintf(stderr, "%s: read, size %#x, n %#x\n", __FUNCTION__, size, n);
+			fprintf(stderr, "%s: read, size %#x, n %#x\n", __func__, size, n);
 			perror("read()");
 			goto err2;
 		}
 		err = write(outfd, buf, size);
 		if (err < 0) {
-			fprintf(stderr, "%s: write, size %#x, n %#x\n", __FUNCTION__, size, n);
+			fprintf(stderr, "%s: write, size %#x, n %#x\n", __func__, size, n);
 			perror("write()");
 			goto err2;
 		}
@@ -187,10 +187,10 @@ int file_to_flash(int fd, u_int32_t offset, u_int32_t len, const char *filename)
 	}
 retry:
 	if ((buf = (u_int8_t *) malloc(size)) == NULL) {
-		fprintf(stderr, "%s: malloc(%#x) failed\n", __FUNCTION__, size);
+		fprintf(stderr, "%s: malloc(%#x) failed\n", __func__, size);
 		if (size != BUF_SIZE) {
 			size = BUF_SIZE;
-			fprintf(stderr, "%s: trying buffer size %#x\n", __FUNCTION__, size);
+			fprintf(stderr, "%s: trying buffer size %#x\n", __func__, size);
 			goto retry;
 		}
 		perror("malloc()");
@@ -201,7 +201,7 @@ retry:
 		if (n <= size)
 			size = n;
 		if (fread(buf, size, 1, fp) != 1 || ferror(fp)) {
-			fprintf(stderr, "%s: fread, size %#x, n %#x\n", __FUNCTION__, size, n);
+			fprintf(stderr, "%s: fread, size %#x, n %#x\n", __func__, size, n);
 			perror("fread()");
 			free(buf);
 			fclose(fp);
@@ -209,7 +209,7 @@ retry:
 		}
 		err = write(fd, buf, size);
 		if (err < 0) {
-			fprintf(stderr, "%s: write, size %#x, n %#x\n", __FUNCTION__, size, n);
+			fprintf(stderr, "%s: write, size %#x, n %#x\n", __func__, size, n);
 			perror("write()");
 			free(buf);
 			fclose(fp);
diff --git a/tests/ubi-tests/common.c b/tests/ubi-tests/common.c
index 05cbecc..a64ea75 100644
--- a/tests/ubi-tests/common.c
+++ b/tests/ubi-tests/common.c
@@ -54,24 +54,24 @@ int __initial_check(const char *test, int argc, char * const argv[])
 	 * check this.
 	 */
 	if (argc < 2) {
-		__errmsg(test, __FUNCTION__, __LINE__,
+		__errmsg(test, __func__, __LINE__,
 			 "UBI character device node is not specified");
 		return -1;
 	}
 
 	libubi = libubi_open();
 	if (libubi == NULL) {
-		__failed(test, __FUNCTION__, __LINE__, "libubi_open");
+		__failed(test, __func__, __LINE__, "libubi_open");
 		return -1;
 	}
 
 	if (ubi_get_dev_info(libubi, argv[1], &dev_info)) {
-		__failed(test, __FUNCTION__, __LINE__, "ubi_get_dev_info");
+		__failed(test, __func__, __LINE__, "ubi_get_dev_info");
 		goto close;
 	}
 
 	if (dev_info.avail_lebs < MIN_AVAIL_EBS) {
-		__errmsg(test, __FUNCTION__, __LINE__,
+		__errmsg(test, __func__, __LINE__,
 			 "insufficient available eraseblocks %d on UBI "
 			 "device, required %d",
 			 dev_info.avail_lebs, MIN_AVAIL_EBS);
@@ -79,7 +79,7 @@ int __initial_check(const char *test, int argc, char * const argv[])
 	}
 
 	if (dev_info.vol_count != 0) {
-		__errmsg(test, __FUNCTION__, __LINE__,
+		__errmsg(test, __func__, __LINE__,
 			 "device %s is not empty", argv[1]);
 		goto close;
 	}
-- 
1.7.6
