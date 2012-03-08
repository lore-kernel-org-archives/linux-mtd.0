Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5e74-0003DY-QJ
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 14:14:40 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] UBI: rename peb_buf1 to peb_buf
Date: Thu,  8 Mar 2012 16:14:51 +0200
Message-Id: <1331216091-6560-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1331216091-6560-1-git-send-email-dedekind1@gmail.com>
References: <1331216091-6560-1-git-send-email-dedekind1@gmail.com>
Cc: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Now we have only one buffer so let's rename it to just 'peb_buf1'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |    8 ++++----
 drivers/mtd/ubi/eba.c   |   24 ++++++++++++------------
 drivers/mtd/ubi/io.c    |   14 +++++++-------
 drivers/mtd/ubi/scan.c  |    8 ++++----
 drivers/mtd/ubi/ubi.h   |    6 +++---
 5 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 6e0806b..0fde9fc 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -945,8 +945,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 		goto out_free;
 
 	err = -ENOMEM;
-	ubi->peb_buf1 = vmalloc(ubi->peb_size);
-	if (!ubi->peb_buf1)
+	ubi->peb_buf = vmalloc(ubi->peb_size);
+	if (!ubi->peb_buf)
 		goto out_free;
 
 	err = ubi_debugging_init_dev(ubi);
@@ -1025,7 +1025,7 @@ out_detach:
 out_debugging:
 	ubi_debugging_exit_dev(ubi);
 out_free:
-	vfree(ubi->peb_buf1);
+	vfree(ubi->peb_buf);
 	if (ref)
 		put_device(&ubi->dev);
 	else
@@ -1096,7 +1096,7 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	vfree(ubi->vtbl);
 	put_mtd_device(ubi->mtd);
 	ubi_debugging_exit_dev(ubi);
-	vfree(ubi->peb_buf1);
+	vfree(ubi->peb_buf);
 	ubi_msg("mtd%d is detached from ubi%d", ubi->mtd->index, ubi->ubi_num);
 	put_device(&ubi->dev);
 	return 0;
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index f548af3..63edee0 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -529,18 +529,18 @@ retry:
 
 	data_size = offset + len;
 	mutex_lock(&ubi->buf_mutex);
-	memset(ubi->peb_buf1 + offset, 0xFF, len);
+	memset(ubi->peb_buf + offset, 0xFF, len);
 
 	/* Read everything before the area where the write failure happened */
 	if (offset > 0) {
-		err = ubi_io_read_data(ubi, ubi->peb_buf1, pnum, 0, offset);
+		err = ubi_io_read_data(ubi, ubi->peb_buf, pnum, 0, offset);
 		if (err && err != UBI_IO_BITFLIPS)
 			goto out_unlock;
 	}
 
-	memcpy(ubi->peb_buf1 + offset, buf, len);
+	memcpy(ubi->peb_buf + offset, buf, len);
 
-	err = ubi_io_write_data(ubi, ubi->peb_buf1, new_pnum, 0, data_size);
+	err = ubi_io_write_data(ubi, ubi->peb_buf, new_pnum, 0, data_size);
 	if (err) {
 		mutex_unlock(&ubi->buf_mutex);
 		goto write_error;
@@ -1053,13 +1053,13 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 
 	/*
 	 * OK, now the LEB is locked and we can safely start moving it. Since
-	 * this function utilizes the @ubi->peb_buf1 buffer which is shared
+	 * this function utilizes the @ubi->peb_buf buffer which is shared
 	 * with some other functions - we lock the buffer by taking the
 	 * @ubi->buf_mutex.
 	 */
 	mutex_lock(&ubi->buf_mutex);
 	dbg_wl("read %d bytes of data", aldata_size);
-	err = ubi_io_read_data(ubi, ubi->peb_buf1, from, 0, aldata_size);
+	err = ubi_io_read_data(ubi, ubi->peb_buf, from, 0, aldata_size);
 	if (err && err != UBI_IO_BITFLIPS) {
 		ubi_warn("error %d while reading data from PEB %d",
 			 err, from);
@@ -1079,10 +1079,10 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	 */
 	if (vid_hdr->vol_type == UBI_VID_DYNAMIC)
 		aldata_size = data_size =
-			ubi_calc_data_len(ubi, ubi->peb_buf1, data_size);
+			ubi_calc_data_len(ubi, ubi->peb_buf, data_size);
 
 	cond_resched();
-	crc = crc32(UBI_CRC32_INIT, ubi->peb_buf1, data_size);
+	crc = crc32(UBI_CRC32_INIT, ubi->peb_buf, data_size);
 	cond_resched();
 
 	/*
@@ -1121,7 +1121,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 	}
 
 	if (data_size > 0) {
-		err = ubi_io_write_data(ubi, ubi->peb_buf1, to, 0, aldata_size);
+		err = ubi_io_write_data(ubi, ubi->peb_buf, to, 0, aldata_size);
 		if (err) {
 			if (err == -EIO)
 				err = MOVE_TARGET_WR_ERR;
@@ -1134,8 +1134,8 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		 * We've written the data and are going to read it back to make
 		 * sure it was written correctly.
 		 */
-		memset(ubi->peb_buf1, 0xFF, aldata_size);
-		err = ubi_io_read_data(ubi, ubi->peb_buf1, to, 0, aldata_size);
+		memset(ubi->peb_buf, 0xFF, aldata_size);
+		err = ubi_io_read_data(ubi, ubi->peb_buf, to, 0, aldata_size);
 		if (err) {
 			if (err != UBI_IO_BITFLIPS) {
 				ubi_warn("error %d while reading data back "
@@ -1149,7 +1149,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 
 		cond_resched();
 
-		if (crc != crc32(UBI_CRC32_INIT, ubi->peb_buf1, data_size)) {
+		if (crc != crc32(UBI_CRC32_INIT, ubi->peb_buf, data_size)) {
 			ubi_warn("read data back from PEB %d and it is "
 				 "different", to);
 			err = -EINVAL;
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 5cde4e5..43f1a00 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -431,11 +431,11 @@ static int torture_peb(struct ubi_device *ubi, int pnum)
 			goto out;
 
 		/* Make sure the PEB contains only 0xFF bytes */
-		err = ubi_io_read(ubi, ubi->peb_buf1, pnum, 0, ubi->peb_size);
+		err = ubi_io_read(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
 		if (err)
 			goto out;
 
-		err = ubi_check_pattern(ubi->peb_buf1, 0xFF, ubi->peb_size);
+		err = ubi_check_pattern(ubi->peb_buf, 0xFF, ubi->peb_size);
 		if (err == 0) {
 			ubi_err("erased PEB %d, but a non-0xFF byte found",
 				pnum);
@@ -444,17 +444,17 @@ static int torture_peb(struct ubi_device *ubi, int pnum)
 		}
 
 		/* Write a pattern and check it */
-		memset(ubi->peb_buf1, patterns[i], ubi->peb_size);
-		err = ubi_io_write(ubi, ubi->peb_buf1, pnum, 0, ubi->peb_size);
+		memset(ubi->peb_buf, patterns[i], ubi->peb_size);
+		err = ubi_io_write(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
 		if (err)
 			goto out;
 
-		memset(ubi->peb_buf1, ~patterns[i], ubi->peb_size);
-		err = ubi_io_read(ubi, ubi->peb_buf1, pnum, 0, ubi->peb_size);
+		memset(ubi->peb_buf, ~patterns[i], ubi->peb_size);
+		err = ubi_io_read(ubi, ubi->peb_buf, pnum, 0, ubi->peb_size);
 		if (err)
 			goto out;
 
-		err = ubi_check_pattern(ubi->peb_buf1, patterns[i],
+		err = ubi_check_pattern(ubi->peb_buf, patterns[i],
 					ubi->peb_size);
 		if (err == 0) {
 			ubi_err("pattern %x checking failed for PEB %d",
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index b99318e..12c43b4 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -789,9 +789,9 @@ static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 	int err;
 
 	mutex_lock(&ubi->buf_mutex);
-	memset(ubi->peb_buf1, 0x00, ubi->leb_size);
+	memset(ubi->peb_buf, 0x00, ubi->leb_size);
 
-	err = ubi_io_read(ubi, ubi->peb_buf1, pnum, ubi->leb_start,
+	err = ubi_io_read(ubi, ubi->peb_buf, pnum, ubi->leb_start,
 			  ubi->leb_size);
 	if (err == UBI_IO_BITFLIPS || mtd_is_eccerr(err)) {
 		/*
@@ -808,7 +808,7 @@ static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 	if (err)
 		goto out_unlock;
 
-	if (ubi_check_pattern(ubi->peb_buf1, 0xFF, ubi->leb_size))
+	if (ubi_check_pattern(ubi->peb_buf, 0xFF, ubi->leb_size))
 		goto out_unlock;
 
 	ubi_err("PEB %d contains corrupted VID header, and the data does not "
@@ -818,7 +818,7 @@ static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 	dbg_msg("hexdump of PEB %d offset %d, length %d",
 		pnum, ubi->leb_start, ubi->leb_size);
 	ubi_dbg_print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
-			       ubi->peb_buf1, ubi->leb_size, 1);
+			       ubi->peb_buf, ubi->leb_size, 1);
 	err = 1;
 
 out_unlock:
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index cb93ad9..bd6120c 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -387,8 +387,8 @@ struct ubi_wl_entry;
  *                  time (MTD write buffer size)
  * @mtd: MTD device descriptor
  *
- * @peb_buf1: a buffer of PEB size used for different purposes
- * @buf_mutex: protects @peb_buf1
+ * @peb_buf: a buffer of PEB size used for different purposes
+ * @buf_mutex: protects @peb_buf
  * @ckvol_mutex: serializes static volume checking when opening
  *
  * @dbg: debugging information for this UBI device
@@ -470,7 +470,7 @@ struct ubi_device {
 	int max_write_size;
 	struct mtd_info *mtd;
 
-	void *peb_buf1;
+	void *peb_buf;
 	struct mutex buf_mutex;
 	struct mutex ckvol_mutex;
 
-- 
1.7.9.1
