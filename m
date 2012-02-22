Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S0EG7-0001rr-OR
 for linux-mtd@lists.infradead.org; Wed, 22 Feb 2012 15:37:39 +0000
Received: by wico1 with SMTP id o1so133644wic.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Feb 2012 07:37:32 -0800 (PST)
MIME-Version: 1.0
From: josselin.costanzi@mobile-devices.fr
To: linux-mtd@lists.infradead.org
Subject: [PATCH] UBI: allocate verification buffer on demand
Date: Wed, 22 Feb 2012 16:37:05 +0100
Message-Id: <4f450bbc.334cb40a.7321.64ad@mx.google.com>
In-Reply-To: <1329925025-4980-1-git-send-email-y>
References: <1329925025-4980-1-git-send-email-y>
Cc: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>

Instead of using pre-allocated 'ubi->peb_buf2' buffer in
'ubi_eba_copy_leb()', dynamically allocate it when needed. The intent is
to get rid of the pre-allocated 'ubi->peb_buf2' buffer and save up to
2MiB of RAM per attached device (or more if PEB size is larger). If the
allocation fails, we fallback to a degraded mode where data integrity is
still ensured, at the cost of higher CPU usage.
---
 drivers/mtd/ubi/build.c |    6 ------
 drivers/mtd/ubi/eba.c   |   31 +++++++++++++++++++++++++++----
 drivers/mtd/ubi/ubi.h   |    4 +---
 3 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 115749f..6e0806b 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -949,10 +949,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	if (!ubi->peb_buf1)
 		goto out_free;
 
-	ubi->peb_buf2 = vmalloc(ubi->peb_size);
-	if (!ubi->peb_buf2)
-		goto out_free;
-
 	err = ubi_debugging_init_dev(ubi);
 	if (err)
 		goto out_free;
@@ -1030,7 +1026,6 @@ out_debugging:
 	ubi_debugging_exit_dev(ubi);
 out_free:
 	vfree(ubi->peb_buf1);
-	vfree(ubi->peb_buf2);
 	if (ref)
 		put_device(&ubi->dev);
 	else
@@ -1102,7 +1097,6 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	put_mtd_device(ubi->mtd);
 	ubi_debugging_exit_dev(ubi);
 	vfree(ubi->peb_buf1);
-	vfree(ubi->peb_buf2);
 	ubi_msg("mtd%d is detached from ubi%d", ubi->mtd->index, ubi->ubi_num);
 	put_device(&ubi->dev);
 	return 0;
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index cd26da8..b18ca27 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -985,9 +985,10 @@ static int is_error_sane(int err)
 int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		     struct ubi_vid_hdr *vid_hdr)
 {
-	int err, vol_id, lnum, data_size, aldata_size, idx;
+	int err, vol_id, lnum, data_size, aldata_size, idx, res;
 	struct ubi_volume *vol;
-	uint32_t crc;
+	uint32_t crc, crc_read;
+	void *p, *peb_buf2;
 
 	vol_id = be32_to_cpu(vid_hdr->vol_id);
 	lnum = be32_to_cpu(vid_hdr->lnum);
@@ -1121,6 +1122,19 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	}
 
 	if (data_size > 0) {
+		/*
+		 * We want that buffer to check we wrote the data correctly.
+		 * If we can't allocate it, we will check the data we wrote
+		 * using crc32.
+		 */
+		peb_buf2 = vmalloc(ubi->peb_size);
+		if (!peb_buf2) {
+			dbg_wl("Can't allocate verification buffer, will work "
+				"in degraded mode");
+			p = ubi->peb_buf1;
+		} else
+			p = peb_buf2;
+
 		err = ubi_io_write_data(ubi, ubi->peb_buf1, to, 0, aldata_size);
 		if (err) {
 			if (err == -EIO)
@@ -1135,7 +1149,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		 * sure it was written correctly.
 		 */
 
-		err = ubi_io_read_data(ubi, ubi->peb_buf2, to, 0, aldata_size);
+		err = ubi_io_read_data(ubi, p, to, 0, aldata_size);
 		if (err) {
 			if (err != UBI_IO_BITFLIPS) {
 				ubi_warn("error %d while reading data back "
@@ -1149,7 +1163,14 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 
 		cond_resched();
 
-		if (memcmp(ubi->peb_buf1, ubi->peb_buf2, aldata_size)) {
+		if (peb_buf2) {
+			res = memcmp(ubi->peb_buf1, peb_buf2, aldata_size);
+		} else {
+			crc_read = crc32(UBI_CRC32_INIT, p, data_size);
+			res = (crc != crc_read);
+		}
+
+		if (res) {
 			ubi_warn("read data back from PEB %d and it is "
 				 "different", to);
 			err = -EINVAL;
@@ -1164,6 +1185,8 @@ out_unlock_buf:
 	mutex_unlock(&ubi->buf_mutex);
 out_unlock_leb:
 	leb_write_unlock(ubi, vol_id, lnum);
+	if (peb_buf2)
+		vfree(peb_buf2);
 	return err;
 }
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index d51d75d..cb93ad9 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -388,8 +388,7 @@ struct ubi_wl_entry;
  * @mtd: MTD device descriptor
  *
  * @peb_buf1: a buffer of PEB size used for different purposes
- * @peb_buf2: another buffer of PEB size used for different purposes
- * @buf_mutex: protects @peb_buf1 and @peb_buf2
+ * @buf_mutex: protects @peb_buf1
  * @ckvol_mutex: serializes static volume checking when opening
  *
  * @dbg: debugging information for this UBI device
@@ -472,7 +471,6 @@ struct ubi_device {
 	struct mtd_info *mtd;
 
 	void *peb_buf1;
-	void *peb_buf2;
 	struct mutex buf_mutex;
 	struct mutex ckvol_mutex;
 
-- 
1.7.5.4
