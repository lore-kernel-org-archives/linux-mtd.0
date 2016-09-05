Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvT7-0008DV-2C
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:06:01 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 11/17] UBI: simplify recover_peb() code
Date: Mon,  5 Sep 2016 17:05:02 +0200
Message-Id: <1473087908-27862-12-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

recover_peb() is using a convoluted retry/exit path. Add try_recover_peb()
to simplify the retry logic and make sure we have a single exit path
instead of manually releasing the resource in each error path.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/eba.c | 123 ++++++++++++++++++++++++++++----------------------
 1 file changed, 69 insertions(+), 54 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index ebf517271d29..0a5fa519b8dd 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -554,39 +554,32 @@ int ubi_eba_read_leb_sg(struct ubi_device *ubi, struct ubi_volume *vol,
 }
 
 /**
- * recover_peb - recover from write failure.
- * @ubi: UBI device description object
+ * try_recover_peb - try to recover from write failure.
+ * @vol: volume description object
  * @pnum: the physical eraseblock to recover
- * @vol_id: volume ID
  * @lnum: logical eraseblock number
  * @buf: data which was not written because of the write failure
  * @offset: offset of the failed write
  * @len: how many bytes should have been written
+ * @vid: VID header
  *
  * This function is called in case of a write failure and moves all good data
  * from the potentially bad physical eraseblock to a good physical eraseblock.
  * This function also writes the data which was not written due to the failure.
- * Returns new physical eraseblock number in case of success, and a negative
- * error code in case of failure.
+ * Returns 0 in case of success, and a negative error code in case of failure.
  */
-static int recover_peb(struct ubi_device *ubi, int pnum, int vol_id, int lnum,
-		       const void *buf, int offset, int len)
+static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
+			   const void *buf, int offset, int len,
+			   struct ubi_vid_hdr *vid_hdr)
 {
-	int err, idx = vol_id2idx(ubi, vol_id), new_pnum, data_size, tries = 0;
-	struct ubi_volume *vol = ubi->volumes[idx];
-	struct ubi_vid_hdr *vid_hdr;
+	struct ubi_device *ubi = vol->ubi;
+	int new_pnum, err, vol_id = vol->vol_id, data_size;
 	uint32_t crc;
 
-	vid_hdr = ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
-	if (!vid_hdr)
-		return -ENOMEM;
-
-retry:
 	new_pnum = ubi_wl_get_peb(ubi);
 	if (new_pnum < 0) {
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		up_read(&ubi->fm_eba_sem);
-		return new_pnum;
+		err = new_pnum;
+		goto out_put;
 	}
 
 	ubi_msg(ubi, "recover PEB %d, move data to PEB %d",
@@ -596,7 +589,6 @@ retry:
 	if (err && err != UBI_IO_BITFLIPS) {
 		if (err > 0)
 			err = -EIO;
-		up_read(&ubi->fm_eba_sem);
 		goto out_put;
 	}
 
@@ -608,10 +600,8 @@ retry:
 	/* Read everything before the area where the write failure happened */
 	if (offset > 0) {
 		err = ubi_io_read_data(ubi, ubi->peb_buf, pnum, 0, offset);
-		if (err && err != UBI_IO_BITFLIPS) {
-			up_read(&ubi->fm_eba_sem);
+		if (err && err != UBI_IO_BITFLIPS)
 			goto out_unlock;
-		}
 	}
 
 	memcpy(ubi->peb_buf + offset, buf, len);
@@ -623,49 +613,74 @@ retry:
 	vid_hdr->data_size = cpu_to_be32(data_size);
 	vid_hdr->data_crc = cpu_to_be32(crc);
 	err = ubi_io_write_vid_hdr(ubi, new_pnum, vid_hdr);
-	if (err) {
-		mutex_unlock(&ubi->buf_mutex);
-		up_read(&ubi->fm_eba_sem);
-		goto write_error;
-	}
+	if (err)
+		goto out_unlock;
 
 	err = ubi_io_write_data(ubi, ubi->peb_buf, new_pnum, 0, data_size);
-	if (err) {
-		mutex_unlock(&ubi->buf_mutex);
-		up_read(&ubi->fm_eba_sem);
-		goto write_error;
-	}
 
+out_unlock:
 	mutex_unlock(&ubi->buf_mutex);
-	ubi_free_vid_hdr(ubi, vid_hdr);
 
-	vol->eba_tbl[lnum] = new_pnum;
+	if (!err)
+		vol->eba_tbl[lnum] = new_pnum;
+
+out_put:
 	up_read(&ubi->fm_eba_sem);
-	ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
 
-	ubi_msg(ubi, "data was successfully recovered");
-	return 0;
+	if (!err) {
+		ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
+		ubi_msg(ubi, "data was successfully recovered");
+	} else if (new_pnum >= 0) {
+		/*
+		 * Bad luck? This physical eraseblock is bad too? Crud. Let's
+		 * try to get another one.
+		 */
+		ubi_wl_put_peb(ubi, vol_id, lnum, new_pnum, 1);
+		ubi_warn(ubi, "failed to write to PEB %d", new_pnum);
+	}
 
-out_unlock:
-	mutex_unlock(&ubi->buf_mutex);
-out_put:
-	ubi_wl_put_peb(ubi, vol_id, lnum, new_pnum, 1);
-	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
+}
 
-write_error:
-	/*
-	 * Bad luck? This physical eraseblock is bad too? Crud. Let's try to
-	 * get another one.
-	 */
-	ubi_warn(ubi, "failed to write to PEB %d", new_pnum);
-	ubi_wl_put_peb(ubi, vol_id, lnum, new_pnum, 1);
-	if (++tries > UBI_IO_RETRIES) {
-		ubi_free_vid_hdr(ubi, vid_hdr);
-		return err;
+/**
+ * recover_peb - recover from write failure.
+ * @ubi: UBI device description object
+ * @pnum: the physical eraseblock to recover
+ * @vol_id: volume ID
+ * @lnum: logical eraseblock number
+ * @buf: data which was not written because of the write failure
+ * @offset: offset of the failed write
+ * @len: how many bytes should have been written
+ *
+ * This function is called in case of a write failure and moves all good data
+ * from the potentially bad physical eraseblock to a good physical eraseblock.
+ * This function also writes the data which was not written due to the failure.
+ * Returns 0 in case of success, and a negative error code in case of failure.
+ * This function tries %UBI_IO_RETRIES before giving up.
+ */
+static int recover_peb(struct ubi_device *ubi, int pnum, int vol_id, int lnum,
+		       const void *buf, int offset, int len)
+{
+	int err, idx = vol_id2idx(ubi, vol_id), tries;
+	struct ubi_volume *vol = ubi->volumes[idx];
+	struct ubi_vid_hdr *vid_hdr;
+
+	vid_hdr = ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
+	if (!vid_hdr)
+		return -ENOMEM;
+
+	for (tries = 0; tries <= UBI_IO_RETRIES; tries++) {
+		err = try_recover_peb(vol, pnum, lnum, buf, offset, len,
+				      vid_hdr);
+		if (!err || err == -ENOSPC)
+			break;
+
+		ubi_msg(ubi, "try again");
 	}
-	ubi_msg(ubi, "try again");
-	goto retry;
+
+	ubi_free_vid_hdr(ubi, vid_hdr);
+
+	return err;
 }
 
 /**
-- 
2.7.4
