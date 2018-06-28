Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYRbY-00028m-Np
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 07:44:38 +0000
From: Quentin Schulz <quentin.schulz@bootlin.com>
To: dedekind1@gmail.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com,
 marek.vasut@gmail.com
Cc: linux-mtd@lists.infradead.org, thomas.petazzoni@bootlin.com,
 david.oberhollenzer@sigma-star.at,
 Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH v2 1/4] UBI: update ubi-user.h and ubi-media.h
Date: Thu, 28 Jun 2018 09:43:41 +0200
Message-Id: <20180628074344.10249-2-quentin.schulz@bootlin.com>
In-Reply-To: <20180628074344.10249-1-quentin.schulz@bootlin.com>
References: <20180628074344.10249-1-quentin.schulz@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update both header files to add support for flag specifying whether to
skip the CRC check for static UBI volumes.

Taken from the kernel headers.

Some users of static UBI volumes implement their own integrity check,
thus making the volume CRC check done at open time useless. For
instance, this is the case when one use the ubiblock + dm-verity +
squashfs combination, where dm-verity already checks integrity of the
block device but this time at the block granularity instead of verifying
the whole volume.

Skipping this test drastically improves the boot-time.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 include/mtd/ubi-media.h |  6 ++++++
 include/mtd/ubi-user.h  | 16 ++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/mtd/ubi-media.h b/include/mtd/ubi-media.h
index 08bec3e..132cc24 100644
--- a/include/mtd/ubi-media.h
+++ b/include/mtd/ubi-media.h
@@ -61,6 +61,11 @@ enum {
  * Volume flags used in the volume table record.
  *
  * @UBI_VTBL_AUTORESIZE_FLG: auto-resize this volume
+ * @UBI_VTBL_SKIP_CRC_CHECK_FLG: skip the CRC check done on a static volume at
+ *				 open time. Should only be set on volumes that
+ *				 are used by upper layers doing this kind of
+ *				 check. Main use-case for this flag is
+ *				 boot-time reduction
  *
  * %UBI_VTBL_AUTORESIZE_FLG flag can be set only for one volume in the volume
  * table. UBI automatically re-sizes the volume which has this flag and makes
@@ -92,6 +97,7 @@ enum {
  */
 enum {
 	UBI_VTBL_AUTORESIZE_FLG = 0x01,
+	UBI_VTBL_SKIP_CRC_CHECK_FLG = 0x02,
 };
 
 /*
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 2b50dad..707c4f2 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -279,6 +279,18 @@ struct ubi_attach_req {
 	int8_t  padding[10];
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
 /**
  * struct ubi_mkvol_req - volume description data structure used in
  *                        volume creation requests.
@@ -286,7 +298,7 @@ struct ubi_attach_req {
  * @alignment: volume alignment
  * @bytes: volume size in bytes
  * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
- * @padding1: reserved for future, not used, has to be zeroed
+ * @flags: volume flags (%UBI_VOL_SKIP_CRC_CHECK_FLG)
  * @name_len: volume name length
  * @padding2: reserved for future, not used, has to be zeroed
  * @name: volume name
@@ -315,7 +327,7 @@ struct ubi_mkvol_req {
 	int32_t alignment;
 	int64_t bytes;
 	int8_t vol_type;
-	int8_t padding1;
+	uint8_t flags;
 	int16_t name_len;
 	int8_t padding2[4];
 	char name[UBI_MAX_VOLUME_NAME + 1];
-- 
2.14.1
