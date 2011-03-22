Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q20va-0006Ry-Rf
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2011 12:43:15 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2MChC0b014153
	for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2011 14:43:12 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] UBI: re-name set volume properties ioctl
Date: Tue, 22 Mar 2011 14:45:52 +0200
Message-Id: <1300797953-1976-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Rename the ioctl which sets volume properties from 'UBI_IOCSETPROP' to
'UBI_IOCSETVOLPROP' to reflect the fact that this ioctl is about volume
properties, not device properties. This is also consistent with the
other volume ioctl name - 'UBI_IOCVOLUP'.

The main motivation for the re-name, however, is that we are going
to introduce the per-UBI device "set properties" ioctl, so we need
good and logical naming.

At the same time, re-name the "set volume properties request" data
structure from 'struct ubi_set_prop_req' to
'struct ubi_set_vol_prop_req'.

And re-name 'UBI_PROP_DIRECT_WRITE' to 'UBI_VOL_PROP_DIRECT_WRITE'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/cdev.c |    8 ++++----
 include/mtd/ubi-user.h |   19 ++++++++++---------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index af9fb0f..df5d81a 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -561,18 +561,18 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 	}
 
 	/* Set volume property command */
-	case UBI_IOCSETPROP:
+	case UBI_IOCSETVOLPROP:
 	{
-		struct ubi_set_prop_req req;
+		struct ubi_set_vol_prop_req req;
 
 		err = copy_from_user(&req, argp,
-				sizeof(struct ubi_set_prop_req));
+				     sizeof(struct ubi_set_vol_prop_req));
 		if (err) {
 			err = -EFAULT;
 			break;
 		}
 		switch (req.property) {
-		case UBI_PROP_DIRECT_WRITE:
+		case UBI_VOL_PROP_DIRECT_WRITE:
 			mutex_lock(&ubi->device_mutex);
 			desc->vol->direct_writes = !!req.value;
 			mutex_unlock(&ubi->device_mutex);
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index c0d47ad..8d8484b 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -131,7 +131,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~
  *
  * To set an UBI volume property the %UBI_IOCSETPROP ioctl command should be
- * used. A pointer to a &struct ubi_set_prop_req object is expected to be
+ * used. A pointer to a &struct ubi_set_vol_prop_req object is expected to be
  * passed. The object describes which property should be set, and to which value
  * it should be set.
  */
@@ -186,7 +186,8 @@
 /* Check if LEB is mapped command */
 #define UBI_IOCEBISMAP _IOR(UBI_VOL_IOC_MAGIC, 5, __s32)
 /* Set an UBI volume property */
-#define UBI_IOCSETPROP _IOW(UBI_VOL_IOC_MAGIC, 6, struct ubi_set_prop_req)
+#define UBI_IOCSETVOLPROP _IOW(UBI_VOL_IOC_MAGIC, 6, \
+			       struct ubi_set_vol_prop_req)
 
 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
@@ -225,11 +226,11 @@ enum {
 /*
  * UBI set property ioctl constants
  *
- * @UBI_PROP_DIRECT_WRITE: allow / disallow user to directly write and
- *                         erase individual eraseblocks on dynamic volumes
+ * @UBI_VOL_PROP_DIRECT_WRITE: allow / disallow user to directly write and
+ *                             erase individual eraseblocks on dynamic volumes
  */
 enum {
-       UBI_PROP_DIRECT_WRITE = 1,
+       UBI_VOL_PROP_DIRECT_WRITE = 1,
 };
 
 /**
@@ -397,13 +398,13 @@ struct ubi_map_req {
 
 
 /**
- * struct ubi_set_prop_req - a data structure used to set an ubi volume
- *                           property.
- * @property: property to set (%UBI_PROP_DIRECT_WRITE)
+ * struct ubi_set_vol_prop_req - a data structure used to set an ubi volume
+ *                               property.
+ * @property: property to set (%UBI_VOL_PROP_DIRECT_WRITE)
  * @padding: reserved for future, not used, has to be zeroed
  * @value: value to set
  */
-struct ubi_set_prop_req {
+struct ubi_set_vol_prop_req {
        __u8  property;
        __u8  padding[7];
        __u64 value;
-- 
1.7.2.3
