Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZvO3-0001xr-6i
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 09:44:51 +0000
From: Quentin Schulz <quentin.schulz@bootlin.com>
To: dedekind1@gmail.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com,
 marek.vasut@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH v5 2/2] ubi: expose the volume CRC check skip flag
Date: Mon,  2 Jul 2018 11:43:51 +0200
Message-Id: <5a524ff8217f180e2baba534c2df90b821e7eebc.1530524405.git-series.quentin.schulz@bootlin.com>
In-Reply-To: <cover.ab725a3c64626915f8184e28937870f36684db61.1530524405.git-series.quentin.schulz@bootlin.com>
References: <cover.ab725a3c64626915f8184e28937870f36684db61.1530524405.git-series.quentin.schulz@bootlin.com>
In-Reply-To: <cover.ab725a3c64626915f8184e28937870f36684db61.1530524405.git-series.quentin.schulz@bootlin.com>
References: <cover.ab725a3c64626915f8184e28937870f36684db61.1530524405.git-series.quentin.schulz@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that we have the logic for skipping CRC check for static UBI volumes
in the core, let's expose it to users.

This makes use of a padding byte in the volume description data
structure as a flag. This flag only tell for now whether we should skip
the CRC check of a volume.

This checks the UBI volume for which we are trying to skip the CRC check
is static.

Let's also make sure that the flags passed to verify_mkvol_req are
valid.

We voluntarily do not take into account the skip_check flag in
vol_cdev_write() as we want to make sure what we wrote was correctly
written.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/ubi/cdev.c      | 11 +++++++++++
 drivers/mtd/ubi/vmt.c       |  3 +++
 include/uapi/mtd/ubi-user.h | 18 ++++++++++++++++--
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 45c3296..22547d7 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -367,6 +367,10 @@ static ssize_t vol_cdev_write(struct file *file, const char __user *buf,
 			return count;
 		}
 
+		/*
+		 * We voluntarily do not take into account the skip_check flag
+		 * as we want to make sure what we wrote was correctly written.
+		 */
 		err = ubi_check_volume(ubi, vol->vol_id);
 		if (err < 0)
 			return err;
@@ -622,6 +626,13 @@ static int verify_mkvol_req(const struct ubi_device *ubi,
 	    req->vol_type != UBI_STATIC_VOLUME)
 		goto bad;
 
+	if (req->flags & ~UBI_VOL_VALID_FLGS)
+		goto bad;
+
+	if (req->flags & UBI_VOL_SKIP_CRC_CHECK_FLG &&
+	    req->vol_type != UBI_STATIC_VOLUME)
+		goto bad;
+
 	if (req->alignment > ubi->leb_size)
 		goto bad;
 
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index e2606a4..729588b 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -174,6 +174,9 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	vol->dev.class = &ubi_class;
 	vol->dev.groups = volume_dev_groups;
 
+	if (req->flags & UBI_VOL_SKIP_CRC_CHECK_FLG)
+		vol->skip_check = 1;
+
 	spin_lock(&ubi->volumes_lock);
 	if (vol_id == UBI_VOL_NUM_AUTO) {
 		/* Find unused volume ID */
diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index 5b04a49..aad3b62 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -285,6 +285,20 @@ struct ubi_attach_req {
 	__s8 padding[10];
 };
 
+/*
+ * UBI volume flags.
+ *
+ * @UBI_VOL_SKIP_CRC_CHECK_FLG: skip the CRC check done on a static volume at
+ *				open time. Only valid for static volumes and
+ *				should only be used if the volume user has a
+ *				way to verify data integrity
+ */
+enum {
+	UBI_VOL_SKIP_CRC_CHECK_FLG = 0x1,
+};
+
+#define UBI_VOL_VALID_FLGS	(UBI_VOL_SKIP_CRC_CHECK_FLG)
+
 /**
  * struct ubi_mkvol_req - volume description data structure used in
  *                        volume creation requests.
@@ -292,7 +306,7 @@ struct ubi_attach_req {
  * @alignment: volume alignment
  * @bytes: volume size in bytes
  * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
- * @padding1: reserved for future, not used, has to be zeroed
+ * @flags: volume flags (%UBI_VOL_SKIP_CRC_CHECK_FLG)
  * @name_len: volume name length
  * @padding2: reserved for future, not used, has to be zeroed
  * @name: volume name
@@ -321,7 +335,7 @@ struct ubi_mkvol_req {
 	__s32 alignment;
 	__s64 bytes;
 	__s8 vol_type;
-	__s8 padding1;
+	__u8 flags;
 	__s16 name_len;
 	__s8 padding2[4];
 	char name[UBI_MAX_VOLUME_NAME + 1];
-- 
git-series 0.9.1
