Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nzngr-0006L3-J3
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 09:06:22 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] UBI: sync ubi-user.h with the lates kernel verion
Date: Thu,  8 Apr 2010 12:04:10 +0300
Message-Id: <1270717452-8993-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1270717452-8993-1-git-send-email-dedekind1@gmail.com>
References: <1270717452-8993-1-git-send-email-dedekind1@gmail.com>
Cc: Mika Westerberg <ext-mika.1.westerberg@nokia.com>,
	Jon Ringle <jon@ringle.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mika Westerberg <ext-mika.1.westerberg@nokia.com>

Signed-off-by: Mika Westerberg <ext-mika.1.westerberg@nokia.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 include/mtd/ubi-user.h |   28 +++++++++++++++++++++-------
 1 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 296efae..4b139a6 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -25,11 +25,12 @@
  * UBI device creation (the same as MTD device attachment)
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *
- * MTD devices may be attached using %UBI_IOCATT ioctl command of the UBI
- * control device. The caller has to properly fill and pass
- * &struct ubi_attach_req object - UBI will attach the MTD device specified in
- * the request and return the newly created UBI device number as the ioctl
- * return value.
+ * MTD and block devices may be attached using %UBI_IOCATT ioctl command of the
+ * UBI control device. The caller has to properly fill and pass
+ * &struct ubi_attach_req object. If the @bdev_major and @bdev_minor fields
+ * contain zeroes, UBI will attaches MTD device number @mtd_num. Otherwise it
+ * attaches block device with major/minor numbers @bdev_major and @bdev_minor.
+ * The ioctl returns the newly created UBI device number.
  *
  * UBI device deletion (the same as MTD device detachment)
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -235,14 +236,25 @@ enum {
  * @ubi_num: UBI device number to create
  * @mtd_num: MTD device number to attach
  * @vid_hdr_offset: VID header offset (use defaults if %0)
+ * @bdev_major: major number of the block device to attach
+ * @bdev_minor: minor number of the block device to attach
  * @padding: reserved for future, not used, has to be zeroed
  *
- * This data structure is used to specify MTD device UBI has to attach and the
+ * This data structure is used to specify the device UBI has to attach and the
  * parameters it has to use. The number which should be assigned to the new UBI
  * device is passed in @ubi_num. UBI may automatically assign the number if
  * @UBI_DEV_NUM_AUTO is passed. In this case, the device number is returned in
  * @ubi_num.
  *
+ * UBI can attach block and MTD devices. To attach a block device, @bdev_major
+ * and @bdev_minor have to contain block device major an minor numbers. And
+ * @mtd_num and @vid_hdr_offset have to contain zeroes. Note, the major number
+ * cannot be zero. To attach an MTD device, @bdev_major and @bdev_minor have to
+ * contain zeroes, while @mtd_num has to contain the MTD device number to
+ * attach.
+ *
+ * The rest of the documentation is specific to the MTD device case.
+ *
  * Most applications should pass %0 in @vid_hdr_offset to make UBI use default
  * offset of the VID header within physical eraseblocks. The default offset is
  * the next min. I/O unit after the EC header. For example, it will be offset
@@ -263,7 +275,9 @@ struct ubi_attach_req {
 	int32_t ubi_num;
 	int32_t mtd_num;
 	int32_t vid_hdr_offset;
-	int8_t padding[12];
+	int32_t bdev_major;
+	int32_t bdev_minor;
+	int8_t padding[4];
 };
 
 /**
-- 
1.6.6.1
