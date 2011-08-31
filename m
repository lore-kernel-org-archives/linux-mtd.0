Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qyqzb-0006Xz-DU
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 20:02:36 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 04/10] libmtd: modify `mtd_write' to cover OOB writes
Date: Wed, 31 Aug 2011 13:00:33 -0700
Message-ID: <1314820839-7107-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: b35362@freescale.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To support the MEMWRITE ioctl, we will need a different sort of libmtd
interface for writing to flash. We will expand mtd_write to include more
functionality; for now, we just change the function definition and
description as we begin to add the actual functionality.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/libmtd.h      |   15 +++++++++++----
 lib/libmtd.c          |   10 ++++++----
 nandwrite.c           |    4 ++--
 ubi-utils/ubiformat.c |    6 ++++--
 4 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index 9efccbc..07c304a 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -255,19 +255,26 @@ int mtd_read(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 
 /**
  * mtd_write - write data to an MTD device.
+ * @desc: MTD library descriptor
  * @mtd: MTD device description object
  * @fd: MTD device node file descriptor
  * @eb: eraseblock to write to
  * @offs: offset withing the eraseblock to write to
- * @buf: buffer to write
- * @len: how many bytes to write
+ * @data: data buffer to write
+ * @len: how many data bytes to write
+ * @oob: OOB buffer to write
+ * @ooblen: how many OOB bytes to write
+ * @mode: write mode (e.g., %MTD_OOB_PLACE, %MTD_OOB_RAW)
  *
  * This function writes @len bytes of data to eraseblock @eb and offset @offs
  * of the MTD device defined by @mtd. Returns %0 in case of success and %-1 in
  * case of failure.
+ *
+ * Can only write to a single page at a time if writing to OOB.
  */
-int mtd_write(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
-	      void *buf, int len);
+int mtd_write(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb,
+	      int offs, void *data, int len, void *oob, int ooblen,
+	      uint8_t mode);
 
 /**
  * mtd_read_oob - read out-of-band area.
diff --git a/lib/libmtd.c b/lib/libmtd.c
index c34874e..746ea69 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -970,7 +970,8 @@ int mtd_torture(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb)
 
 		/* Write a pattern and check it */
 		memset(buf, patterns[i], mtd->eb_size);
-		err = mtd_write(mtd, fd, eb, 0, buf, mtd->eb_size);
+		err = mtd_write(desc, mtd, fd, eb, 0, buf, mtd->eb_size, NULL,
+				0, 0);
 		if (err)
 			goto out;
 
@@ -1070,8 +1071,9 @@ int mtd_read(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 	return 0;
 }
 
-int mtd_write(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
-	      void *buf, int len)
+int mtd_write(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb,
+	      int offs, void *data, int len, void *oob, int ooblen,
+	      uint8_t mode)
 {
 	int ret;
 	off_t seek;
@@ -1105,7 +1107,7 @@ int mtd_write(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 		return sys_errmsg("cannot seek mtd%d to offset %llu",
 				  mtd->mtd_num, (unsigned long long)seek);
 
-	ret = write(fd, buf, len);
+	ret = write(fd, data, len);
 	if (ret != len)
 		return sys_errmsg("cannot write %d bytes to mtd%d (eraseblock %d, offset %d)",
 				  len, mtd->mtd_num, eb, offs);
diff --git a/nandwrite.c b/nandwrite.c
index 3eea6e2..33a3b8f 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -543,8 +543,8 @@ int main(int argc, char * const argv[])
 		}
 
 		/* Write out the Page data */
-		if (!onlyoob && mtd_write(&mtd, fd, mtdoffset / mtd.eb_size, mtdoffset % mtd.eb_size,
-					writebuf, mtd.min_io_size)) {
+		if (!onlyoob && mtd_write(mtd_desc, &mtd, fd, mtdoffset / mtd.eb_size, mtdoffset % mtd.eb_size,
+					writebuf, mtd.min_io_size, NULL, 0, 0)) {
 			int i;
 			if (errno != EIO) {
 				sys_errmsg("%s: MTD write failure", mtd_device);
diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index bfa1730..ed2b8d0 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -534,7 +534,8 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 
 		new_len = drop_ffs(mtd, buf, mtd->eb_size);
 
-		err = mtd_write(mtd, args.node_fd, eb, 0, buf, new_len);
+		err = mtd_write(libmtd, mtd, args.node_fd, eb, 0, buf, new_len,
+				NULL, 0, 0);
 		if (err) {
 			sys_errmsg("cannot write eraseblock %d", eb);
 
@@ -637,7 +638,8 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			fflush(stdout);
 		}
 
-		err = mtd_write(mtd, args.node_fd, eb, 0, hdr, write_size);
+		err = mtd_write(libmtd, mtd, args.node_fd, eb, 0, hdr,
+				write_size, NULL, 0, 0);
 		if (err) {
 			if (!args.quiet && !args.verbose)
 				printf("\n");
-- 
1.7.5.4
