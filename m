Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4zUF-0002nv-R8
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 14:01:34 +0000
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Date: Wed, 19 Dec 2007 17:41:58 +0200
Message-Id: <20071219154158.23264.95037.sendpatchset@golum>
In-Reply-To: <20071219154137.23264.28116.sendpatchset@golum>
References: <20071219154137.23264.28116.sendpatchset@golum>
Subject: [PATCH 4/5] UBI: introduce attach ioctls
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

>From c76b002b99f7d75fe0201bf80a675873e5b00231 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 18 Dec 2007 18:22:16 +0200
Subject: [PATCH] UBI: introduce attach ioctls

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 include/mtd/ubi-user.h |   40 +++++++++++++++++++++++++++++++++++-----
 1 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index fe06ded..b96d120 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -80,6 +80,15 @@
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
@@ -89,6 +98,9 @@
 /* An eraseblock erasure command, used for debugging, disabled by default */
 #define UBI_IOCEBER _IOW(UBI_VOL_IOC_MAGIC, 1, int32_t)
 
+/* Maximum MTD device name length supported by UBI */
+#define MAX_UBI_MTD_NAME_LEN 127
+
 /*
  * UBI volume type constants.
  *
@@ -97,19 +109,37 @@
  */
 enum {
 	UBI_DYNAMIC_VOLUME = 3,
-	UBI_STATIC_VOLUME = 4
+	UBI_STATIC_VOLUME = 4,
+};
+
+/**
+ * struct ubi_attach_req - attach MTD device request.
+ * @vid_hdr_offset: VID header offset
+ * @data_offset: data offset
+ * @mtd_num: MTD device number to attach
+ * @padding: reserved for future, not used, has to be zeroed
+ *
+ * This data structure is used to specify MTD device UBI has to attach and the
+ * parameters it has to use. The "attach MTD device" ioctl returns the number
+ * of the newly created UBI device as the return value.
+ */
+struct ubi_attach_req {
+	int32_t vid_hdr_offset;
+	int32_t data_offset;
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
@@ -139,7 +169,7 @@ struct ubi_mkvol_req {
 	int8_t padding1;
 	int16_t name_len;
 	int8_t padding2[4];
-	char name[UBI_MAX_VOLUME_NAME+1];
+	char name[UBI_MAX_VOLUME_NAME + 1];
 } __attribute__ ((packed));
 
 /**
-- 
1.5.3.4
