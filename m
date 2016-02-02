Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm7-0002Yb-MN
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:33:07 +0000
Received: by mail-pa0-x243.google.com with SMTP id ho8so738434pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:45 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 11/17] drivers:mtd:ubi:add disable/enable bakvol while ubi
 write
Date: Tue,  2 Feb 2016 02:30:46 +0000
Message-Id: <1454380252-16170-12-git-send-email-jackyard88@gmail.com>
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

This patch is to modify ubi write action, add disable/enable backup operation according
to data type. For EC header, VID header,master node,super block writing,
bakvol module will not backup these data into bakvol volume.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 drivers/mtd/ubi/eba.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 51bca03..0f1f8a5 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -604,7 +604,7 @@ retry:
 
 	memcpy(ubi->peb_buf + offset, buf, len);
 
-	err = ubi_io_write_data(ubi, ubi->peb_buf, new_pnum, 0, data_size);
+	err = ubi_io_write_data(ubi, ubi->peb_buf, new_pnum, 0, data_size, 0);
 	if (err) {
 		mutex_unlock(&ubi->buf_mutex);
 		up_read(&ubi->fm_eba_sem);
@@ -675,7 +675,7 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
 		dbg_eba("write %d bytes at offset %d of LEB %d:%d, PEB %d",
 			len, offset, vol_id, lnum, pnum);
 
-		err = ubi_io_write_data(ubi, buf, pnum, offset, len);
+		err = ubi_io_write_data(ubi, buf, pnum, offset, len, ((lnum < 3) ? 0 : 1));
 		if (err) {
 			ubi_warn(ubi, "failed to write data to PEB %d", pnum);
 			if (err == -EIO && ubi->bad_allowed)
@@ -726,7 +726,7 @@ retry:
 	}
 
 	if (len) {
-		err = ubi_io_write_data(ubi, buf, pnum, offset, len);
+		err = ubi_io_write_data(ubi, buf, pnum, offset, len, ((lnum < 3) ? 0 : 1));
 		if (err) {
 			ubi_warn(ubi, "failed to write %d bytes at offset %d of LEB %d:%d, PEB %d",
 				 len, offset, vol_id, lnum, pnum);
@@ -848,7 +848,7 @@ retry:
 		goto write_error;
 	}
 
-	err = ubi_io_write_data(ubi, buf, pnum, 0, len);
+	err = ubi_io_write_data(ubi, buf, pnum, 0, len, ((lnum < 3) ? 0:1));
 	if (err) {
 		ubi_warn(ubi, "failed to write %d bytes of data to PEB %d",
 			 len, pnum);
@@ -968,7 +968,7 @@ retry:
 		goto write_error;
 	}
 
-	err = ubi_io_write_data(ubi, buf, pnum, 0, len);
+	err = ubi_io_write_data(ubi, buf, pnum, 0, len, ((lnum < 3) ? 0 : 1));
 	if (err) {
 		ubi_warn(ubi, "failed to write %d bytes of data to PEB %d",
 			 len, pnum);
@@ -1194,7 +1194,8 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	}
 
 	if (data_size > 0) {
-		err = ubi_io_write_data(ubi, ubi->peb_buf, to, 0, aldata_size);
+		err = ubi_io_write_data(ubi, ubi->peb_buf, to, 0, aldata_size,
+			((lnum < 3) ? 0 : 1));
 		if (err) {
 			if (err == -EIO)
 				err = MOVE_TARGET_WR_ERR;
-- 
1.9.1
