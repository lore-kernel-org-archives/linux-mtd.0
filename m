Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5e72-0003DY-US
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 14:14:37 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] UBI: allocate verification buffer on demand
Date: Thu,  8 Mar 2012 16:14:50 +0200
Message-Id: <1331216091-6560-1-git-send-email-dedekind1@gmail.com>
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

Remove the pre-allocated 'peb_buf2' buffer because we do not really need it.
The only reason UBI has it is to check that the data were written correctly.
But we do not have to have 2 buffers for this and waste RAM - we can just
compare CRC checksums instead.

Artem bityutskiy: massaged the patch and commit message

Signed-off-by: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |    6 ------
 drivers/mtd/ubi/eba.c   |    6 +++---
 drivers/mtd/ubi/ubi.h   |    4 +---
 3 files changed, 4 insertions(+), 12 deletions(-)

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
index cd26da8..f548af3 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1134,8 +1134,8 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		 * We've written the data and are going to read it back to make
 		 * sure it was written correctly.
 		 */
-
-		err = ubi_io_read_data(ubi, ubi->peb_buf2, to, 0, aldata_size);
+		memset(ubi->peb_buf1, 0xFF, aldata_size);
+		err = ubi_io_read_data(ubi, ubi->peb_buf1, to, 0, aldata_size);
 		if (err) {
 			if (err != UBI_IO_BITFLIPS) {
 				ubi_warn("error %d while reading data back "
@@ -1149,7 +1149,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 
 		cond_resched();
 
-		if (memcmp(ubi->peb_buf1, ubi->peb_buf2, aldata_size)) {
+		if (crc != crc32(UBI_CRC32_INIT, ubi->peb_buf1, data_size)) {
 			ubi_warn("read data back from PEB %d and it is "
 				 "different", to);
 			err = -EINVAL;
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
1.7.9.1
