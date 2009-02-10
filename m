Date: Tue, 10 Feb 2009 10:56:14 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: [RFC / PATCH] ubiformat: make it work on mtd parts > 2GiB
Message-ID: <20090210095614.GA1995@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have here a mtd part which is 3 GiB with a flash page size of 256KiB.
The 2GiB limit is at erase block 8192. In mtd_is_bad() the computation
for the MEMGETBADBLOCK ioctl() looks like the following:

| seek = eb * mtd->eb_size;

with both eb and mtd->eb_size being a signed int results in seek being a
signed result. Therefore I changed the type from signed to unsigned int.

The _FILE_OFFSET_BITS=64 define is required to switch off_t from 32bit
to 64bit an 32bit systems. This is required in order to keep using
lseek() as lseek64 on 32bit system. Without this change lseek() in
mtd_read() is called with a 32bit value with most significat bit set and
the kernel performs a sign extension for the 64bit value which is used
in the mtd layer.

The last change also changes the size of the parameter which is passed
to the MEMGETBADBLOCK ioctl() from 32 to 64bit. The counter part in
kernel is also defined as loff_t which is of type __kernel_loff_t and
this is "long long". So this must have been broken for a while unless I
missed something.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 common.mk                            |    2 +-
 ubi-utils/new-utils/include/libmtd.h |   10 ++++++----
 ubi-utils/new-utils/src/libmtd.c     |   20 +++++++++++---------
 ubi-utils/new-utils/src/libscan.c    |    5 +++--
 ubi-utils/new-utils/src/ubiformat.c  |    9 ++++++---
 5 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/common.mk b/common.mk
index 77d28bf..65fc1cc 100644
--- a/common.mk
+++ b/common.mk
@@ -2,7 +2,7 @@ CC := $(CROSS)gcc
 AR := $(CROSS)ar
 RANLIB := $(CROSS)ranlib
 CFLAGS ?= -O2 -g
-CFLAGS += -Wall -Wwrite-strings -W
+CFLAGS += -Wall -Wwrite-strings -W -D_FILE_OFFSET_BITS=64
 
 DESTDIR ?= /usr/local
 PREFIX=/usr
diff --git a/ubi-utils/new-utils/include/libmtd.h b/ubi-utils/new-utils/include/libmtd.h
index d3c6a63..94ccd45 100644
--- a/ubi-utils/new-utils/include/libmtd.h
+++ b/ubi-utils/new-utils/include/libmtd.h
@@ -61,10 +61,12 @@ struct mtd_info
 };
 
 int mtd_get_info(const char *node, struct mtd_info *mtd);
-int mtd_erase(const struct mtd_info *mtd, int eb);
-int mtd_is_bad(const struct mtd_info *mtd, int eb);
-int mtd_read(const struct mtd_info *mtd, int eb, int offs, void *buf, int len);
-int mtd_write(const struct mtd_info *mtd, int eb, int offs, void *buf, int len);
+int mtd_erase(const struct mtd_info *mtd, unsigned int eb);
+int mtd_is_bad(const struct mtd_info *mtd, unsigned int eb);
+int mtd_read(const struct mtd_info *mtd, unsigned int eb, unsigned int offs,
+		void *buf, int len);
+int mtd_write(const struct mtd_info *mtd, unsigned int eb, unsigned int offs,
+		void *buf, int len);
 
 #ifdef __cplusplus
 }
diff --git a/ubi-utils/new-utils/src/libmtd.c b/ubi-utils/new-utils/src/libmtd.c
index aab4b0e..b7e2fa0 100644
--- a/ubi-utils/new-utils/src/libmtd.c
+++ b/ubi-utils/new-utils/src/libmtd.c
@@ -157,7 +157,7 @@ out_close:
  * This function erases the eraseblock and returns %0 in case of success and
  * %-1 in case of failure.
  */
-int mtd_erase(const struct mtd_info *mtd, int eb)
+int mtd_erase(const struct mtd_info *mtd, unsigned int eb)
 {
 	struct erase_info_user ei;
 
@@ -174,12 +174,12 @@ int mtd_erase(const struct mtd_info *mtd, int eb)
  * This function checks if eraseblock @eb is bad. Returns %0 if not, %1 if yes,
  * and %-1 in case of failure.
  */
-int mtd_is_bad(const struct mtd_info *mtd, int eb)
+int mtd_is_bad(const struct mtd_info *mtd, unsigned int eb)
 {
 	int ret;
 	loff_t seek;
 
-	if (eb < 0 || eb >= mtd->eb_cnt) {
+	if (eb >= mtd->eb_cnt) {
 		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
 		       eb, mtd->num, mtd->eb_cnt);
 		errno = EINVAL;
@@ -212,18 +212,19 @@ int mtd_is_bad(const struct mtd_info *mtd, int eb)
  * of the MTD device defined by @mtd and stores the read data at buffer @buf.
  * Returns %0 in case of success and %-1 in case of failure.
  */
-int mtd_read(const struct mtd_info *mtd, int eb, int offs, void *buf, int len)
+int mtd_read(const struct mtd_info *mtd, unsigned int eb, unsigned int offs,
+		void *buf, int len)
 {
 	int ret, rd = 0;
 	off_t seek;
 
-	if (eb < 0 || eb >= mtd->eb_cnt) {
+	if (eb >= mtd->eb_cnt) {
 		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
 		       eb, mtd->num, mtd->eb_cnt);
 		errno = EINVAL;
 		return -1;
 	}
-	if (offs < 0 || offs + len > mtd->eb_size) {
+	if (offs + len > mtd->eb_size) {
 		errmsg("bad offset %d or length %d, mtd%d eraseblock size is %d",
 		       offs, len, mtd->num, mtd->eb_size);
 		errno = EINVAL;
@@ -263,18 +264,19 @@ int mtd_read(const struct mtd_info *mtd, int eb, int offs, void *buf, int len)
  * of the MTD device defined by @mtd. Returns %0 in case of success and %-1 in
  * case of failure.
  */
-int mtd_write(const struct mtd_info *mtd, int eb, int offs, void *buf, int len)
+int mtd_write(const struct mtd_info *mtd, unsigned int eb, unsigned int offs,
+		void *buf, int len)
 {
 	int ret;
 	off_t seek;
 
-	if (eb < 0 || eb >= mtd->eb_cnt) {
+	if (eb >= mtd->eb_cnt) {
 		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
 		       eb, mtd->num, mtd->eb_cnt);
 		errno = EINVAL;
 		return -1;
 	}
-	if (offs < 0 || offs + len > mtd->eb_size) {
+	if (offs + len > mtd->eb_size) {
 		errmsg("bad offset %d or length %d, mtd%d eraseblock size is %d",
 		       offs, len, mtd->num, mtd->eb_size);
 		errno = EINVAL;
diff --git a/ubi-utils/new-utils/src/libscan.c b/ubi-utils/new-utils/src/libscan.c
index da13b1b..59322ca 100644
--- a/ubi-utils/new-utils/src/libscan.c
+++ b/ubi-utils/new-utils/src/libscan.c
@@ -50,7 +50,8 @@ static int all_ff(const void *buf, int len)
 
 int ubi_scan(struct mtd_info *mtd, struct ubi_scan_info **info, int verbose)
 {
-	int eb, v = (verbose == 2), pr = (verbose == 1);
+	int v = (verbose == 2), pr = (verbose == 1);
+	unsigned int  eb;
 	struct ubi_scan_info *si;
 	unsigned long long sum = 0;
 
@@ -81,7 +82,7 @@ int ubi_scan(struct mtd_info *mtd, struct ubi_scan_info **info, int verbose)
 		}
 		if (pr) {
 			printf("\r" PROGRAM_NAME ": scanning eraseblock %d -- %2lld %% complete  ",
-			       eb, (long long)(eb + 1) * 100 / mtd->eb_cnt);
+			       eb, (unsigned long long)(eb + 1) * 100 / mtd->eb_cnt);
 			fflush(stdout);
 		}
 
diff --git a/ubi-utils/new-utils/src/ubiformat.c b/ubi-utils/new-utils/src/ubiformat.c
index 0074c7a..bc6fed3 100644
--- a/ubi-utils/new-utils/src/ubiformat.c
+++ b/ubi-utils/new-utils/src/ubiformat.c
@@ -356,7 +356,8 @@ static int read_all(int fd, void *buf, size_t len)
 
 static int flash_image(const struct mtd_info *mtd, struct ubi_scan_info *si)
 {
-	int fd, img_ebs, eb, written_ebs = 0, divisor;
+	int fd, img_ebs, written_ebs = 0, divisor;
+	unsigned int eb;
 	off_t st_size;
 
 	fd = open_file(&st_size);
@@ -462,7 +463,8 @@ out_close:
 static int format(const struct mtd_info *mtd, const struct ubigen_info *ui,
 		  const struct ubi_scan_info *si, int start_eb, int novtbl)
 {
-	int eb, err, write_size;
+	int err, write_size;
+	unsigned int eb;
 	struct ubi_ec_hdr *hdr;
 	struct ubi_vtbl_record *vtbl;
 	int eb1 = -1, eb2 = -1;
@@ -482,7 +484,8 @@ static int format(const struct mtd_info *mtd, const struct ubigen_info *ui,
 
 		if (!args.quiet && !args.verbose) {
 			printf("\r" PROGRAM_NAME ": formatting eraseblock %d -- %2lld %% complete  ",
-			       eb, (long long)(eb + 1 - start_eb) * 100 / (mtd->eb_cnt - start_eb));
+			       eb, (unsigned long long)(eb + 1 - start_eb) *
+			       100 / (mtd->eb_cnt - start_eb));
 			fflush(stdout);
 		}
 
-- 
1.6.0.6
