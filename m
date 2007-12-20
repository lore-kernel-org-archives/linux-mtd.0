Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J5KZK-0003Tt-TS
	for linux-mtd@lists.infradead.org; Thu, 20 Dec 2007 12:32:13 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Date: Thu, 20 Dec 2007 16:23:17 +0200
Message-Id: <20071220142317.30834.67218.sendpatchset@golum>
In-Reply-To: <20071220142251.30834.86791.sendpatchset@golum>
References: <20071220142251.30834.86791.sendpatchset@golum>
Subject: [PATCH v2 5/6] UBI: introduce attach ioctls
Cc: Frank Haverkamp <haver@vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 9143611137b01d56137c3b21b2b360e7e38cee9a Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 18 Dec 2007 18:22:16 +0200
Subject: [PATCH] UBI: introduce attach ioctls

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 include/mtd/ubi-user.h |   69 ++++++++++++++++++++++++++++++++++++++++++++---
 1 files changed, 64 insertions(+), 5 deletions(-)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index fe06ded..c3a1331 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -22,6 +22,21 @@
 #define __UBI_USER_H__
 
 /*
+ * UBI device creation (the same as MTD device attachment)
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ *
+ * MTD devices may be attached using %UBI_IOCATT ioctl command of the UBI
+ * control device. The caller has to properly fill and pass
+ * &struct ubi_attach_req object - UBI will attach the MTD device specified in
+ * the request and return the newly created UBI device number as the ioctl
+ * return value.
+ *
+ * UBI device deletion (the same as MTD device detachment)
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ *
+ * An UBI device maybe deleted with %UBI_IOCDET ioctl command of the UBI
+ * control device.
+ *
  * UBI volume creation
  * ~~~~~~~~~~~~~~~~~~~
  *
@@ -80,6 +95,15 @@
 /* Re-size an UBI volume */
 #define UBI_IOCRSVOL _IOW(UBI_IOC_MAGIC, 2, struct ubi_rsvol_req)
 
+/* IOCTL commands of the UBI control character device */
+
+#define UBI_CTRL_IOC_MAGIC 'o'
+
+/* Attach an MTD device */
+#define UBI_IOCATT _IOW(UBI_CTRL_IOC_MAGIC, 64, struct ubi_attach_req)
+/* Detach an MTD device */
+#define UBI_IOCDET _IOW(UBI_CTRL_IOC_MAGIC, 65, int32_t)
+
 /* IOCTL commands of UBI volume character devices */
 
 #define UBI_VOL_IOC_MAGIC 'O'
@@ -89,6 +113,9 @@
 /* An eraseblock erasure command, used for debugging, disabled by default */
 #define UBI_IOCEBER _IOW(UBI_VOL_IOC_MAGIC, 1, int32_t)
 
+/* Maximum MTD device name length supported by UBI */
+#define MAX_UBI_MTD_NAME_LEN 127
+
 /*
  * UBI volume type constants.
  *
@@ -97,19 +124,51 @@
  */
 enum {
 	UBI_DYNAMIC_VOLUME = 3,
-	UBI_STATIC_VOLUME = 4
+	UBI_STATIC_VOLUME = 4,
+};
+
+/**
+ * struct ubi_attach_req - attach MTD device request.
+ * @vid_hdr_offset: VID header offset (use defaults if %0)
+ * @mtd_num: MTD device number to attach
+ * @padding: reserved for future, not used, has to be zeroed
+ *
+ * This data structure is used to specify MTD device UBI has to attach and the
+ * parameters it has to use. The "attach MTD device" ioctl returns the number
+ * of the newly created UBI device as the return value.
+ *
+ * Most applications should pass %0 in @vid_hdr_offset to make UBI use default
+ * offset of the VID header within physical eraseblocks. The default offset is
+ * the next min. I/O unit after the EC header. For example, it will be offset
+ * 512 in case of a 512 bytes page NAND flash with no sub-page support. Or
+ * it will be 512 in case of a 2KiB page NAND flash with 4 512-byte sub-pages.
+ *
+ * But in rare cases, if this optimizes things, the VID header may be placed to
+ * a different offset. For example, the boot-loader might do things faster if the
+ * VID header sits at the end of the first 2KiB NAND page with 4 sub-pages. As
+ * the boot-loader would not normally need to read EC headers (unless it needs
+ * UBI in RW mode), it might be faster to calculate ECC. This is weird example,
+ * but it real-life example. So, in this example, @vid_hdr_offer would be
+ * 2KiB-64 bytes = 1984. Note, that this position is not even 512-bytes
+ * aligned, which is OK, as UBI is clever enough to realize this is 4th sub-page
+ * of the first page and add needed padding.
+ */
+struct ubi_attach_req {
+	int32_t vid_hdr_offset;
+	int32_t mtd_num;
+	uint8_t padding[12];
 };
 
 /**
  * struct ubi_mkvol_req - volume description data structure used in
- * volume creation requests.
+ *                        volume creation requests.
  * @vol_id: volume number
  * @alignment: volume alignment
  * @bytes: volume size in bytes
  * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
- * @padding1: reserved for future, not used
+ * @padding1: reserved for future, not used, has to be zeroed
  * @name_len: volume name length
- * @padding2: reserved for future, not used
+ * @padding2: reserved for future, not used, has to be zeroed
  * @name: volume name
  *
  * This structure is used by userspace programs when creating new volumes. The
@@ -139,7 +198,7 @@ struct ubi_mkvol_req {
 	int8_t padding1;
 	int16_t name_len;
 	int8_t padding2[4];
-	char name[UBI_MAX_VOLUME_NAME+1];
+	char name[UBI_MAX_VOLUME_NAME + 1];
 } __attribute__ ((packed));
 
 /**
-- 
1.5.3.4
