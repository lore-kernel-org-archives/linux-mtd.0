Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1buEXQ-0000PI-2S
 for linux-mtd@lists.infradead.org; Wed, 12 Oct 2016 08:05:21 +0000
Received: by mail-wm0-x241.google.com with SMTP id c78so1146686wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 12 Oct 2016 01:04:59 -0700 (PDT)
From: yegorslists@googlemail.com
To: linux-mtd@lists.infradead.org
Cc: dedekind1@gmail.com, richard@nod.at,
 Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH] ubi: improve spelling
Date: Wed, 12 Oct 2016 10:04:35 +0200
Message-Id: <1476259475-10312-1-git-send-email-yegorslists@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---

Patch was made against for-linus-20161008.

 drivers/mtd/ubi/build.c     | 6 +++---
 drivers/mtd/ubi/gluebi.c    | 2 +-
 drivers/mtd/ubi/kapi.c      | 2 +-
 drivers/mtd/ubi/ubi-media.h | 4 ++--
 drivers/mtd/ubi/upd.c       | 2 +-
 drivers/mtd/ubi/vmt.c       | 4 ++--
 drivers/mtd/ubi/vtbl.c      | 2 +-
 drivers/mtd/ubi/wl.c        | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 0680516..7716db3 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -844,13 +844,13 @@ static int autoresize(struct ubi_device *ubi, int vol_id)
  * @vid_hdr_offset: VID header offset
  * @max_beb_per1024: maximum expected number of bad PEB per 1024 PEBs
  *
- * This function attaches MTD device @mtd_dev to UBI and assign @ubi_num number
+ * This function attaches MTD device @mtd_dev to UBI and assigns @ubi_num number
  * to the newly created UBI device, unless @ubi_num is %UBI_DEV_NUM_AUTO, in
  * which case this function finds a vacant device number and assigns it
  * automatically. Returns the new UBI device number in case of success and a
  * negative error code in case of failure.
  *
- * Note, the invocations of this function has to be serialized by the
+ * Note, the invocation of this function has to be serialized by the
  * @ubi_devices_mutex.
  */
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
@@ -1073,7 +1073,7 @@ out_free:
  * UBI device is busy and cannot be destroyed, and %-EINVAL if it does not
  * exist.
  *
- * Note, the invocations of this function has to be serialized by the
+ * Note, the invocation of this function has to be serialized by the
  * @ubi_devices_mutex.
  */
 int ubi_detach_mtd_dev(int ubi_num, int anyway)
diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 1cb287e..acd2e1c 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -402,7 +402,7 @@ static int gluebi_remove(struct ubi_volume_info *vi)
  * @vi: volume info structure
  *
  * This function is called every time an UBI volume is updated. It does nothing
- * if te volume @vol is dynamic, and changes MTD device size if the
+ * if the volume @vol is dynamic, and changes MTD device size if the
  * volume is static. This is needed because static volumes cannot be read past
  * data they contain. This function returns zero in case of success and a
  * negative error code in case of error.
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index a9e2cef..5be0675 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -819,7 +819,7 @@ BLOCKING_NOTIFIER_HEAD(ubi_notifiers);
  *                   already existing volumes
  *
  * This function registers a volume notifier, which means that
- * 'nb->notifier_call()' will be invoked when an UBI  volume is created,
+ * 'nb->notifier_call()' will be invoked when an UBI volume is created,
  * removed, re-sized, re-named, or updated. The first argument of the function
  * is the notification type. The second argument is pointer to a
  * &struct ubi_notification object which describes the notification event.
diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 22ed3f6..319d259 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -81,7 +81,7 @@ enum {
  * exceed certain percent, e.g. 2%. When one creates an UBI image which will be
  * flashed to the end devices in production, he does not know the exact amount
  * of good physical eraseblocks the NAND chip on the device will have, but this
- * number is required to calculate the volume sized and put them to the volume
+ * number is required to calculate the volume size and put them to the volume
  * table of the UBI image. In this case, one of the volumes (e.g., the one
  * which will store the root file system) is marked as "auto-resizable", and
  * UBI will adjust its size on the first boot if needed.
@@ -141,7 +141,7 @@ enum {
  * is changed radically. This field is duplicated in the volume identifier
  * header.
  *
- * The @vid_hdr_offset and @data_offset fields contain the offset of the the
+ * The @vid_hdr_offset and @data_offset fields contain the offset of the
  * volume identifier header and user data, relative to the beginning of the
  * physical eraseblock. These values have to be the same for all physical
  * eraseblocks.
diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
index 0134ba3..717b905 100644
--- a/drivers/mtd/ubi/upd.c
+++ b/drivers/mtd/ubi/upd.c
@@ -270,7 +270,7 @@ static int write_leb(struct ubi_device *ubi, struct ubi_volume *vol, int lnum,
  * @count: how much bytes to write
  *
  * This function writes more data to the volume which is being updated. It may
- * be called arbitrary number of times until all the update data arriveis. This
+ * be called arbitrary number of times until all the update data arrives. This
  * function returns %0 in case of success, number of bytes written during the
  * last call if the whole volume update has been successfully finished, and a
  * negative error code in case of failure.
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 0138f52..dd63c8f 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -653,7 +653,7 @@ void ubi_free_volume(struct ubi_device *ubi, struct ubi_volume *vol)
  * @ubi: UBI device description object
  * @vol_id: volume ID
  *
- * Returns zero if volume is all right and a a negative error code if not.
+ * Returns zero if volume is all right and a negative error code if not.
  */
 static int self_check_volume(struct ubi_device *ubi, int vol_id)
 {
@@ -801,7 +801,7 @@ fail:
  * self_check_volumes - check information about all volumes.
  * @ubi: UBI device description object
  *
- * Returns zero if volumes are all right and a a negative error code if not.
+ * Returns zero if volumes are all right and a negative error code if not.
  */
 static int self_check_volumes(struct ubi_device *ubi)
 {
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index d85c197..17164b8 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -70,7 +70,7 @@ static void self_vtbl_check(const struct ubi_device *ubi);
 static struct ubi_vtbl_record empty_vtbl_record;
 
 /**
- * ubi_update_layout_vol - helper for updatting layout volumes on flash
+ * ubi_update_layout_vol - helper for updating layout volumes on flash
  * @ubi: UBI device description object
  */
 static int ubi_update_layout_vol(struct ubi_device *ubi)
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index f453326..e4da7a8 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -977,7 +977,7 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
 		goto out_unlock;
 
 	/*
-	 * If the ubi->scrub tree is not empty, scrubbing is needed, and the
+	 * If the ubi->scrub tree is not empty, scrubbing is needed, and
 	 * the WL worker has to be scheduled anyway.
 	 */
 	if (!ubi->scrub.rb_node) {
-- 
2.1.4
