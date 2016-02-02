Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm9-0002Yf-Tm
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:33:09 +0000
Received: by mail-pf0-x243.google.com with SMTP id 65so8259861pfd.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:47 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 14/17] drivers:mtd:ubi:add backup operation in ubi_io_write
Date: Tue,  2 Feb 2016 02:30:49 +0000
Message-Id: <1454380252-16170-15-git-send-email-jackyard88@gmail.com>
In-Reply-To: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
References: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bean Huo <beanhuo@micron.com>

This patch is to add backup lower page data codes in ubi_io_write.
If programming lower page, bakvol module will duplicate this lower page
data, then program to two different plane pages by multiple plane page program.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 drivers/mtd/ubi/io.c | 73 +++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 61 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 5bbd1f0..6905929 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -222,6 +222,7 @@ retry:
  * @pnum: physical eraseblock number to write to
  * @offset: offset within the physical eraseblock where to write
  * @len: how many bytes to write
+ * @safeguard: if these data has to be duplicated to backup
  *
  * This function writes @len bytes of data from buffer @buf to offset @offset
  * of physical eraseblock @pnum. If all the data were successfully written,
@@ -233,11 +234,12 @@ retry:
  * to the flash media, but may be some garbage.
  */
 int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
-		 int len)
+		 int len, int safeguard)
 {
 	int err;
-	size_t written;
+	size_t retlen;
 	loff_t addr;
+	int skip;
 
 	dbg_io("write %d bytes to PEB %d:%d", len, pnum, offset);
 
@@ -281,14 +283,61 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	}
 
 	addr = (loff_t)pnum * ubi->peb_size + offset;
-	err = mtd_write(ubi->mtd, addr, len, &written, buf);
-	if (err) {
-		ubi_err(ubi, "error %d while writing %d bytes to PEB %d:%d, written %zd bytes",
-			err, len, pnum, offset, written);
-		dump_stack();
-		ubi_dump_flash(ubi, pnum, offset, len);
+#ifdef CONFIG_MTD_UBI_MLC_NAND_BAKVOL
+	skip = 0;
+	if (((offset == 0) && (len == ubi->peb_size)) ||
+		!safeguard)
+		skip = 1;
+
+	if (ubi_check_bakvol_module(ubi) && (!skip)) {
+		loff_t addr_temp;
+		unsigned char *buf_temp = (unsigned char *)buf;
+		int len_temp;
+		int writelen = 0;
+
+		addr_temp = addr;
+
+		for (len_temp = len; len_temp > 0; len_temp -= ubi->min_io_size,
+			addr_temp += ubi->min_io_size,
+			buf_temp += ubi->min_io_size) {
+			/* Split data according to min_io_size */
+
+			if (len_temp/ubi->min_io_size)
+				writelen = ubi->min_io_size;
+			else
+				writelen %= ubi->min_io_size;
+
+			if (is_backup_need(ubi, addr_temp)) {
+				err = ubi_duplicate_data_to_bakvol(ubi,
+					addr_temp, writelen, &retlen, buf_temp);
+				} else
+				err = mtd_write(ubi->mtd, addr_temp, writelen,
+						&retlen, buf_temp);
+
+			if (err) {
+				ubi_err(ubi, "Writing %d byptes to PEB %d:%d",
+					writelen, pnum, offset);
+				ubi_err(ubi, "Error %d", err);
+				ubi_err(ubi, "Written %d bytes", retlen);
+				dump_stack();
+				ubi_dump_flash(ubi, pnum, offset, writelen);
+				} else
+				ubi_assert(retlen == writelen);
+		}
 	} else
-		ubi_assert(written == len);
+#endif
+	{
+		err = mtd_write(ubi->mtd, addr, len, &retlen, buf);
+		if (err) {
+			ubi_err(ubi, "Writing %d byptes to PEB %d:%d",
+				len, pnum, offset);
+			ubi_err(ubi, "Error %d", err);
+			ubi_err(ubi, "Written %zd bytes", retlen);
+			dump_stack();
+			ubi_dump_flash(ubi, pnum, offset, len);
+		} else
+			ubi_assert(retlen == len);
+	}
 
 	if (!err) {
 		err = self_check_write(ubi, buf, pnum, offset, len);
@@ -438,7 +487,7 @@ static int torture_peb(struct ubi_device *ubi, int pnum)
 
 		/* Write a pattern and check it */
 		memset(ubi->peb_buf, patterns[i], ubi->peb_size);
-		err = ubi_io_write(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
+		err = ubi_io_write(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size, 0);
 		if (err)
 			goto out;
 
@@ -862,7 +911,7 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 	if (ubi_dbg_power_cut(ubi, POWER_CUT_EC_WRITE))
 		return -EROFS;
 
-	err = ubi_io_write(ubi, ec_hdr, pnum, 0, ubi->ec_hdr_alsize);
+	err = ubi_io_write(ubi, ec_hdr, pnum, 0, ubi->ec_hdr_alsize, 0);
 	return err;
 }
 
@@ -1114,7 +1163,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 
 	p = (char *)vid_hdr - ubi->vid_hdr_shift;
 	err = ubi_io_write(ubi, p, pnum, ubi->vid_hdr_aloffset,
-			   ubi->vid_hdr_alsize);
+			   ubi->vid_hdr_alsize, 0);
 	return err;
 }
 
-- 
1.9.1
