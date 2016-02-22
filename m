Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXquh-0001PD-3J
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2016 13:52:45 +0000
From: David Gstir <david@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	David Gstir <david@sigma-star.at>
Subject: [PATCH 1/3] ubi: tests: Replace variable-length array with malloc()
Date: Mon, 22 Feb 2016 14:52:03 +0100
Message-Id: <1456149125-24067-1-git-send-email-david@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

io_read and io_update of mtd-utils use variable-length arrays for test data.
Since this could result in allocating many megabytes using alloca(), switch
to malloc().

Signed-off-by: David Gstir <david@sigma-star.at>
---
 tests/ubi-tests/io_read.c   | 26 ++++++++++++++++++++------
 tests/ubi-tests/io_update.c | 28 +++++++++++++++++++++-------
 tests/ubi-tests/rsvol.c     | 33 ++++++++++++++++++++-------------
 3 files changed, 61 insertions(+), 26 deletions(-)

diff --git a/tests/ubi-tests/io_read.c b/tests/ubi-tests/io_read.c
index 673624f..386291e 100644
--- a/tests/ubi-tests/io_read.c
+++ b/tests/ubi-tests/io_read.c
@@ -161,8 +161,18 @@ remove:
 static int test_read3(const struct ubi_vol_info *vol_info, int len, off_t off)
 {
 	int i, len1;
-	unsigned char ck_buf[len], buf[len];
+	unsigned char *ck_buf = NULL;
+	unsigned char *buf = NULL;
 	off_t new_off;
+	int ret = -1;
+
+	ck_buf = malloc(len);
+	buf = malloc(len);
+
+	if (!ck_buf || !buf) {
+		failed("malloc");
+		goto out;
+	}
 
 	if (off + len > vol_info->data_bytes)
 		len1 = vol_info->data_bytes - off;
@@ -172,12 +182,12 @@ static int test_read3(const struct ubi_vol_info *vol_info, int len, off_t off)
 	if (lseek(fd, off, SEEK_SET) != off) {
 		failed("seek");
 		errorm("len = %d", len);
-		return -1;
+		goto out;
 	}
 	if (read(fd, buf, len) != len1) {
 		failed("read");
 		errorm("len = %d", len);
-		return -1;
+		goto out;
 	}
 
 	new_off = lseek(fd, 0, SEEK_CUR);
@@ -187,7 +197,7 @@ static int test_read3(const struct ubi_vol_info *vol_info, int len, off_t off)
 		else
 			errorm("read %d bytes from %lld, but resulting "
 			       "offset is %lld", len1, (long long) off, (long long) new_off);
-		return -1;
+		goto out;
 	}
 
 	for (i = 0; i < len1; i++)
@@ -197,10 +207,14 @@ static int test_read3(const struct ubi_vol_info *vol_info, int len, off_t off)
 		errorm("incorrect data read from offset %lld",
 		       (long long)off);
 		errorm("len = %d", len);
-		return -1;
+		goto out;
 	}
 
-	return 0;
+	ret = 0;
+out:
+	free(buf);
+	free(ck_buf);
+	return ret;
 }
 
 /*
diff --git a/tests/ubi-tests/io_update.c b/tests/ubi-tests/io_update.c
index 28b5570..2e9969e 100644
--- a/tests/ubi-tests/io_update.c
+++ b/tests/ubi-tests/io_update.c
@@ -76,8 +76,22 @@ static int test_update1(struct ubi_vol_info *vol_info, int leb_change)
 					     leb_change ? dev_info.min_io_size * 2
 					     		: vol_info->leb_size);
 	char vol_node[strlen(UBI_VOLUME_PATTERN) + 100];
-	unsigned char buf[total_len];
+	unsigned char *buf = NULL;
+	unsigned char *buf1 = NULL;
 	int fd, i, j;
+	int ret1 = -1;
+
+	buf = malloc(total_len);
+	if (!buf) {
+		failed("malloc");
+		goto out;
+	}
+
+	buf1 = malloc(total_len);
+	if (!buf1) {
+		failed("malloc");
+		goto out;
+	}
 
 	sprintf(vol_node, UBI_VOLUME_PATTERN, dev_info.dev_num,
 		vol_info->vol_id);
@@ -86,14 +100,13 @@ static int test_update1(struct ubi_vol_info *vol_info, int leb_change)
 	if (fd == -1) {
 		failed("open");
 		errorm("cannot open \"%s\"\n", node);
-		return -1;
+		goto out;
 	}
 
 	for (i = 0; i < SEQ_SZ; i++) {
 		int ret, stop = 0, len = 0;
 		off_t off = 0;
 		long long test_len;
-		unsigned char buf1[total_len];
 
 		/*
 		 * test_len is LEB size (if we test atomic LEB change) or
@@ -189,12 +202,13 @@ static int test_update1(struct ubi_vol_info *vol_info, int leb_change)
 		}
 	}
 
-	close(fd);
-	return 0;
-
+	ret1 = 0;
 close:
 	close(fd);
-	return -1;
+out:
+	free(buf);
+	free(buf1);
+	return ret1;
 }
 
 /**
diff --git a/tests/ubi-tests/rsvol.c b/tests/ubi-tests/rsvol.c
index 732bcaa..6bfade9 100644
--- a/tests/ubi-tests/rsvol.c
+++ b/tests/ubi-tests/rsvol.c
@@ -107,32 +107,39 @@ static int test_rsvol1(struct ubi_vol_info *vol_info)
 	long long bytes;
 	struct ubi_vol_info vol_info1;
 	char vol_node[strlen(UBI_VOLUME_PATTERN) + 100];
-	unsigned char buf[vol_info->rsvd_bytes];
+	unsigned char *buf;
 	int fd, i, ret;
+	int ret1 = -1;
+
+	buf = malloc(vol_info->rsvd_bytes);
+	if (!buf) {
+		failed("malloc");
+		goto out;
+	}
 
 	/* Make the volume smaller and check basic volume I/O */
 	bytes = vol_info->rsvd_bytes - vol_info->leb_size;
 	if (ubi_rsvol(libubi, node, vol_info->vol_id, bytes - 1)) {
 		failed("ubi_rsvol");
-		return -1;
+		goto out;
 	}
 
 	if (ubi_get_vol_info1(libubi, vol_info->dev_num, vol_info->vol_id,
 			     &vol_info1)) {
 		failed("ubi_get_vol_info");
-		return -1;
+		goto out;
 	}
 
 	if (vol_info1.rsvd_bytes != bytes) {
 		errorm("rsvd_bytes %lld, must be %lld",
 		       vol_info1.rsvd_bytes, bytes);
-		return -1;
+		goto out;
 	}
 
 	if (vol_info1.rsvd_lebs != vol_info->rsvd_lebs - 1) {
 		errorm("rsvd_lebs %d, must be %d",
 		       vol_info1.rsvd_lebs, vol_info->rsvd_lebs - 1);
-		return -1;
+		goto out;
 	}
 
 	/* Write data to the volume */
@@ -143,7 +150,7 @@ static int test_rsvol1(struct ubi_vol_info *vol_info)
 	if (fd == -1) {
 		failed("open");
 		errorm("cannot open \"%s\"\n", vol_node);
-		return -1;
+		goto out;
 	}
 
 	bytes = vol_info->rsvd_bytes - vol_info->leb_size - 1;
@@ -165,20 +172,20 @@ static int test_rsvol1(struct ubi_vol_info *vol_info)
 
 	if (ubi_rsvol(libubi, node, vol_info->vol_id, bytes)) {
 		failed("ubi_rsvol");
-		return -1;
+		goto out;
 	}
 
 	if (ubi_rsvol(libubi, node, vol_info->vol_id,
 		      (long long)vol_info->leb_size * dev_info.avail_lebs)) {
 		failed("ubi_rsvol");
-		return -1;
+		goto out;
 	}
 
 	fd = open(vol_node, O_RDWR);
 	if (fd == -1) {
 		failed("open");
 		errorm("cannot open \"%s\"\n", vol_node);
-		return -1;
+		goto out;
 	}
 
 	/* Read data back */
@@ -200,12 +207,12 @@ static int test_rsvol1(struct ubi_vol_info *vol_info)
 		}
 	}
 
-	close(fd);
-	return 0;
-
+	ret1 = 0;
 close:
 	close(fd);
-	return -1;
+out:
+	free(buf);
+	return ret1;
 }
 
 /**
-- 
2.1.4
