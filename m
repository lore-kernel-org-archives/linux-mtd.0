Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaAsS-0001uC-Ny
	for linux-mtd@lists.infradead.org; Sat, 17 Jul 2010 17:08:42 +0000
Received: by fxm3 with SMTP id 3so1781964fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 17 Jul 2010 10:08:39 -0700 (PDT)
Subject: Re: [PATCHv2 4/5] libmtd: add support for 64-bit offsets, OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <c65631c48fb5d2de8d25f65bffa5e22d@localhost>
References: <eb53f5a0215250d7e523de47d15b0d12@localhost>
	<c65631c48fb5d2de8d25f65bffa5e22d@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 17 Jul 2010 20:08:33 +0300
Message-Id: <1279386513.7515.33.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com,
	vapier.adi@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-07-07 at 17:30 -0700, Kevin Cernekee wrote:
> Change mtd_erase() so that it attempts to use MEMERASE64 first, then falls
> back to the old <2.6.31 MEMERASE if MEMERASE64 is unsupported.
> 
> Add mtd_read_oob(), mtd_write_oob() functions to wrap the OOB ioctls.
> Similar ioctl fallback logic is used in these functions as well.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  include/libmtd.h |   36 ++++++++++++++++++++++-
>  lib/libmtd.c     |   82 ++++++++++++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 111 insertions(+), 7 deletions(-)

Kevin, here is a patch which adds MEMERASE64 support. I did not want to
add the flag to 'struct mtd_dev_info', because I do not think it should
be visible to users. So I put it to libmtd descriptor, but this means
that now we have to pass it to 'mtd_erase()'.

I also added error messages to 'mtd_erase()', to be consistent with
other functions. I did not add OOB functions. If this patch is OK, I can
push it.



>From 02dc72bbc78c79f34b92fccc0fdce43f6af0af49 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sat, 17 Jul 2010 19:48:13 +0300
Subject: [PATCH] libmtd: support MEMERASE64

This patch is base on Kevin Cernekee's patch posted to the MTD mailing
list. It adds MEMERASE64 support to the 'mtd_erase()' call. Now it
first tries to use MEMERASE64, and if that is not supported, falls
back to the old MEMERASE ioctl.

This patch also introduces an 'offs64_ioctl' flag to the libmtd
descriptor. However, we cannot initialize it in 'libmtd_open()',
because we need an MTD device node, which we do not have in
'libmtd_open()'. Thus, we firs mark this flag as "uninitialized",
and at the first invocation of 'mtd_erase()' we initialize it.

This also means that we have to pass the limbtd descriptor to
'mtd_erase()', to save the flag value. This, in turn, requires
tweaking 'mtd_erase()' users.

This is not very nice, but good enough so far.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 include/libmtd.h          |    6 +++-
 lib/libmtd.c              |   58 ++++++++++++++++++++++++++++++++++++++++----
 lib/libmtd_int.h          |   18 ++++++++++++++
 ubi-utils/src/ubiformat.c |   23 +++++++++--------
 4 files changed, 86 insertions(+), 19 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index 0aea966..2bf9859 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -139,6 +139,7 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd);
 
 /**
  * mtd_erase - erase an eraseblock.
+ * @desc: MTD library descriptor
  * @mtd: MTD device description object
  * @fd: MTD device node file descriptor
  * @eb: eraseblock to erase
@@ -146,10 +147,11 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd);
  * This function erases eraseblock @eb of MTD device described by @fd. Returns
  * %0 in case of success and %-1 in case of failure.
  */
-int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb);
+int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb);
 
 /**
  * mtd_torture - torture an eraseblock.
+ * @desc: MTD library descriptor
  * @mtd: MTD device description object
  * @fd: MTD device node file descriptor
  * @eb: eraseblock to torture
@@ -157,7 +159,7 @@ int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb);
  * This function tortures eraseblock @eb. Returns %0 in case of success and %-1
  * in case of failure.
  */
-int mtd_torture(const struct mtd_dev_info *mtd, int fd, int eb);
+int mtd_torture(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb);
 
 /**
  * mtd_is_bad - check if eraseblock is bad.
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 3ff031c..4fe19db 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -560,6 +560,8 @@ libmtd_t libmtd_open(void)
 	if (!lib)
 		return NULL;
 
+	lib->offs64_ioctls = OFFS64_IOCTLS_UNKNOWN;
+
 	lib->sysfs_mtd = mkpath("/sys", SYSFS_MTD);
 	if (!lib->sysfs_mtd)
 		goto out_error;
@@ -789,13 +791,57 @@ int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd)
 	return mtd_get_dev_info1(desc, mtd_num, mtd);
 }
 
-int mtd_erase(const struct mtd_dev_info *mtd, int fd, int eb)
+int mtd_erase(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 {
+	int ret;
+	struct libmtd *lib = (struct libmtd *)desc;
+	struct erase_info_user64 ei64;
 	struct erase_info_user ei;
 
-	ei.start = eb * mtd->eb_size;;
-	ei.length = mtd->eb_size;
-	return ioctl(fd, MEMERASE, &ei);
+	if (eb < 0 || eb >= mtd->eb_cnt) {
+		errmsg("bad eraseblock number %d, mtd%d has %d eraseblocks",
+		       eb, mtd->mtd_num, mtd->eb_cnt);
+		errno = EINVAL;
+		return -1;
+	}
+
+	ei64.start = (__u64)eb * mtd->eb_size;
+	ei64.length = mtd->eb_size;
+
+	if (lib->offs64_ioctls == OFFS64_IOCTLS_SUPPORTED ||
+	    lib->offs64_ioctls == OFFS64_IOCTLS_UNKNOWN) {
+		ret = ioctl(fd, MEMERASE64, &ei64);
+		if (ret == 0)
+			return ret;
+
+		if (errno != ENOTTY ||
+		    lib->offs64_ioctls != OFFS64_IOCTLS_UNKNOWN)
+			return sys_errmsg("MEMERASE64 ioctl failed for "
+					  "eraseblock %d (mtd%d)",
+					  eb, mtd->mtd_num);
+
+		/*
+		 * MEMERASE64 support was added in kernel version 2.6.30, so
+		 * probably we are working with older kernel and this ioctl is
+		 * not supported.
+		 */
+		lib->offs64_ioctls = OFFS64_IOCTLS_NOT_SUPPORTED;
+	}
+
+	if (ei64.start + ei64.length > 0xFFFFFFFF) {
+		errmsg("this system can address only %u eraseblocks",
+		       0xFFFFFFFFU / mtd->eb_size);
+		errno = EINVAL;
+		return -1;
+	}
+
+	ei.start = ei64.start;
+	ei.length = ei64.length;
+	ret = ioctl(fd, MEMERASE, &ei);
+	if (ret < 0)
+		return sys_errmsg("MEMERASE ioctl failed for eraseblock %d "
+				  "(mtd%d)", eb, mtd->mtd_num);
+	return 0;
 }
 
 /* Patterns to write to a physical eraseblock when torturing it */
@@ -820,7 +866,7 @@ static int check_pattern(const void *buf, uint8_t patt, int size)
 	return 1;
 }
 
-int mtd_torture(const struct mtd_dev_info *mtd, int fd, int eb)
+int mtd_torture(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 {
 	int err, i, patt_count;
 	void *buf;
@@ -835,7 +881,7 @@ int mtd_torture(const struct mtd_dev_info *mtd, int fd, int eb)
 	}
 
 	for (i = 0; i < patt_count; i++) {
-		err = mtd_erase(mtd, fd, eb);
+		err = mtd_erase(desc, mtd, fd, eb);
 		if (err)
 			goto out;
 
diff --git a/lib/libmtd_int.h b/lib/libmtd_int.h
index 7de4b42..bb48d35 100644
--- a/lib/libmtd_int.h
+++ b/lib/libmtd_int.h
@@ -43,6 +43,10 @@ extern "C" {
 #define MTD_REGION_CNT   "numeraseregions"
 #define MTD_FLAGS        "flags"
 
+#define OFFS64_IOCTLS_UNKNOWN       0
+#define OFFS64_IOCTLS_NOT_SUPPORTED 1
+#define OFFS64_IOCTLS_SUPPORTED     2
+
 /**
  * libmtd - MTD library description data structure.
  * @sysfs_mtd: MTD directory in sysfs
@@ -58,6 +62,19 @@ extern "C" {
  * @mtd_region_cnt: count of additional erase regions file pattern
  * @mtd_flags: MTD device flags file pattern
  * @sysfs_supported: non-zero if sysfs is supported by MTD
+ * @offs64_ioctls: %OFFS64_IOCTLS_SUPPORTED if 64-bit %MEMERASE64,
+ *                 %MEMREADOOB64, %MEMWRITEOOB64 MTD device ioctls are
+ *                 supported, %OFFS64_IOCTLS_NOT_SUPPORTED if not, and
+ *                 %OFFS64_IOCTLS_UNKNOWN if it is not known yet;
+ *
+ *  Note, we cannot find out whether 64-bit ioctls are supported by MTD when we
+ *  are initializing the library, because this requires an MTD device node.
+ *  Indeed, we have to actually call the ioctl and check for %ENOTTY to find
+ *  out whether it is supported or not.
+ *
+ *  Thus, we leave %offs64_ioctls uninitialized in 'libmtd_open()', and
+ *  initialize it later, when corresponding libmtd function is used, and when
+ *  we actually have a device node and can invoke an ioctl command on it.
  */
 struct libmtd
 {
@@ -74,6 +91,7 @@ struct libmtd
 	char *mtd_region_cnt;
 	char *mtd_flags;
 	unsigned int sysfs_supported:1;
+	unsigned int offs64_ioctls:2;
 };
 
 int legacy_libmtd_open(void);
diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 6052a35..4e27e4f 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -441,8 +441,8 @@ static int mark_bad(const struct mtd_dev_info *mtd, struct ubi_scan_info *si, in
 	return consecutive_bad_check(eb);
 }
 
-static int flash_image(const struct mtd_dev_info *mtd, const struct ubigen_info *ui,
-		       struct ubi_scan_info *si)
+static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
+		       const struct ubigen_info *ui, struct ubi_scan_info *si)
 {
 	int fd, img_ebs, eb, written_ebs = 0, divisor;
 	off_t st_size;
@@ -488,7 +488,7 @@ static int flash_image(const struct mtd_dev_info *mtd, const struct ubigen_info
 			fflush(stdout);
 		}
 
-		err = mtd_erase(mtd, args.node_fd, eb);
+		err = mtd_erase(libmtd, mtd, args.node_fd, eb);
 		if (err) {
 			if (!args.quiet)
 				printf("\n");
@@ -543,7 +543,7 @@ static int flash_image(const struct mtd_dev_info *mtd, const struct ubigen_info
 			if (errno != EIO)
 				goto out_close;
 
-			err = mtd_torture(mtd, args.node_fd, eb);
+			err = mtd_torture(libmtd, mtd, args.node_fd, eb);
 			if (err) {
 				if (mark_bad(mtd, si, eb))
 					goto out_close;
@@ -564,8 +564,9 @@ out_close:
 	return -1;
 }
 
-static int format(const struct mtd_dev_info *mtd, const struct ubigen_info *ui,
-		  struct ubi_scan_info *si, int start_eb, int novtbl)
+static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
+		  const struct ubigen_info *ui, struct ubi_scan_info *si,
+		  int start_eb, int novtbl)
 {
 	int eb, err, write_size;
 	struct ubi_ec_hdr *hdr;
@@ -606,7 +607,7 @@ static int format(const struct mtd_dev_info *mtd, const struct ubigen_info *ui,
 			fflush(stdout);
 		}
 
-		err = mtd_erase(mtd, args.node_fd, eb);
+		err = mtd_erase(libmtd, mtd, args.node_fd, eb);
 		if (err) {
 			if (!args.quiet)
 				printf("\n");
@@ -652,7 +653,7 @@ static int format(const struct mtd_dev_info *mtd, const struct ubigen_info *ui,
 				goto out_free;
 			}
 
-			err = mtd_torture(mtd, args.node_fd, eb);
+			err = mtd_torture(libmtd, mtd, args.node_fd, eb);
 			if (err) {
 				if (mark_bad(mtd, si, eb))
 					goto out_free;
@@ -922,15 +923,15 @@ int main(int argc, char * const argv[])
 	}
 
 	if (args.image) {
-		err = flash_image(&mtd, &ui, si);
+		err = flash_image(libmtd, &mtd, &ui, si);
 		if (err < 0)
 			goto out_free;
 
-		err = format(&mtd, &ui, si, err, 1);
+		err = format(libmtd, &mtd, &ui, si, err, 1);
 		if (err)
 			goto out_free;
 	} else {
-		err = format(&mtd, &ui, si, 0, args.novtbl);
+		err = format(libmtd, &mtd, &ui, si, 0, args.novtbl);
 		if (err)
 			goto out_free;
 	}
-- 
1.6.2.5

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
