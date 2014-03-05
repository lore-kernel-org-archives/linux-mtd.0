Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLCco-0002kz-S9
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 14:16:47 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: Make UBI_IOCVOLCRBLK take a parameter for future usage
Date: Wed,  5 Mar 2014 11:16:14 -0300
Message-Id: <1394028974-27570-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to allow a future ioctl parameter, such as a creation flag,
we change the UBI_IOCVOLCRBLK so it accepts a struct ubi_blkcreate_req.
For the time being the structure is not in use, but fully reserved.

This ABI change is still possible and harmless, because the ioctl has just
been introduced and there's no userspace program which uses it.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 include/uapi/mtd/ubi-user.h | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index 9c885e2..1927b0d 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -138,9 +138,12 @@
  * Block devices on UBI volumes
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *
- * To create or remove a R/O block device on top of an UBI volume the
- * %UBI_IOCVOLCRBLK and %UBI_IOCVOLRMBLK ioctl commands should be used,
- * respectively. These commands take no arguments.
+ * To create a R/O block device on top of an UBI volume the %UBI_IOCVOLCRBLK
+ * should be used. A pointer to a &struct ubi_blkcreate_req object is expected
+ * to be passed, which is not used and reserved for future usage.
+ *
+ * Conversely, to remove a block device the %UBI_IOCVOLRMBLK should be used,
+ * which takes no arguments.
  */
 
 /*
@@ -199,7 +202,7 @@
 #define UBI_IOCSETVOLPROP _IOW(UBI_VOL_IOC_MAGIC, 6, \
 			       struct ubi_set_vol_prop_req)
 /* Create a R/O block device on top of an UBI volume */
-#define UBI_IOCVOLCRBLK _IO(UBI_VOL_IOC_MAGIC, 7)
+#define UBI_IOCVOLCRBLK _IOW(UBI_VOL_IOC_MAGIC, 7, struct ubi_blkcreate_req)
 /* Remove the R/O block device */
 #define UBI_IOCVOLRMBLK _IO(UBI_VOL_IOC_MAGIC, 8)
 
@@ -431,4 +434,12 @@ struct ubi_set_vol_prop_req {
 	__u64 value;
 }  __packed;
 
+/**
+ * struct ubi_blkcreate_req - a data structure used in block creation requests.
+ * @padding: reserved for future, not used, has to be zeroed
+ */
+struct ubi_blkcreate_req {
+	__s8  padding[128];
+}  __packed;
+
 #endif /* __UBI_USER_H__ */
-- 
1.8.1.5
