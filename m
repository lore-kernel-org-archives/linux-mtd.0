Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZShKq-0002rF-4o
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 08:06:01 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH] ubi: do not re-read the data already read out in retry
Date: Fri, 21 Aug 2015 15:59:41 +0800
Message-ID: <1440143981-20826-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In ubi_io_read(), we will retry if current reading failed
to read all data we wanted. But we are doing a full re-do
in the re-try path. Actually, we can skip the data which
we have already read out in the last reading.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 drivers/mtd/ubi/io.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 5bbd1f0..a3ac643 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -127,7 +127,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 		int len)
 {
 	int err, retries = 0;
-	size_t read;
+	size_t read, already_read = 0;
 	loff_t addr;
 
 	dbg_io("read %d bytes from PEB %d:%d", len, pnum, offset);
@@ -165,6 +165,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 	addr = (loff_t)pnum * ubi->peb_size + offset;
 retry:
 	err = mtd_read(ubi->mtd, addr, len, &read, buf);
+	already_read += read;
 	if (err) {
 		const char *errstr = mtd_is_eccerr(err) ? " (ECC error)" : "";
 
@@ -179,19 +180,25 @@ retry:
 			 */
 			ubi_msg(ubi, "fixable bit-flip detected at PEB %d",
 				pnum);
-			ubi_assert(len == read);
+			ubi_assert(len == already_read);
 			return UBI_IO_BITFLIPS;
 		}
 
 		if (retries++ < UBI_IO_RETRIES) {
-			ubi_warn(ubi, "error %d%s while reading %d bytes from PEB %d:%d, read only %zd bytes, retry",
-				 err, errstr, len, pnum, offset, read);
+			ubi_warn(ubi, "error %d%s while reading %d bytes from PEB %d:%lu, read only %zd bytes, retry",
+				 err, errstr, len, pnum, offset + already_read, read);
 			yield();
+			/*
+			 * Skip to do retry for data which was already read out;
+			 */
+			addr += read;
+			len -= read;
+			buf += read;
 			goto retry;
 		}
 
 		ubi_err(ubi, "error %d%s while reading %d bytes from PEB %d:%d, read %zd bytes",
-			err, errstr, len, pnum, offset, read);
+			err, errstr, len, pnum, offset, already_read);
 		dump_stack();
 
 		/*
@@ -204,7 +211,7 @@ retry:
 			err = -EIO;
 		}
 	} else {
-		ubi_assert(len == read);
+		ubi_assert(len == already_read);
 
 		if (ubi_dbg_is_bitflip(ubi)) {
 			dbg_gen("bit-flip (emulated)");
-- 
1.8.4.2
