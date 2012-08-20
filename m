Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3UP7-00070B-MK
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 16:00:40 +0000
Received: by wibhm2 with SMTP id hm2so3213747wib.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 09:00:36 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v3 5/6] UBI: add ioctl for max_beb_per1024
Date: Mon, 20 Aug 2012 18:00:15 +0200
Message-Id: <1345478416-23900-6-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch provides the possibility to adjust the "maximum expected number of
bad blocks per 1024 blocks" (max_beb_per1024) for each mtd device from
UBI_IOCATT ioctl.

The majority of NAND devices have their max_beb_per1024 equal to 20, but
sometimes it's more.
We already could adjust that via a kernel parameter, now we can also use
UBI_IOCATT ioctl:
struct ubi_attach_req {
	__s32 ubi_num;
	__s32 mtd_num;
	__s32 vid_hdr_offset;
	__u16 max_beb_per1024;
	__s8 padding[10];
};

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/ubi/Kconfig |    3 ++-
 drivers/mtd/ubi/build.c |    2 ++
 drivers/mtd/ubi/cdev.c  |    2 +-
 include/mtd/ubi-user.h  |   19 ++++++++++++++++++-
 4 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 37e070c..9406d26 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -51,7 +51,8 @@ config MTD_UBI_BEB_LIMIT
 	  MTD partitions of the same size, UBI will reserve 40 eraseblocks when
 	  attaching a partition.
 
-	  This option can be overridden by the kernel parameter ubi.mtd.
+	  This option can be overridden by the kernel parameter ubi.mtd and the
+	  ioctl UBI_IOCATT.
 
 	  Leave the default value if unsure.
 
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 5b987cb..a690d86 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -865,6 +865,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 
 	/*
 	 * Use the default value if max_beb_per1024 isn't provided.
+	 * This way, we are keeping the same behaviour between the UBI_IOCATT
+	 * ioctl and the module parameter.
 	 */
 	if (!max_beb_per1024)
 		max_beb_per1024 = CONFIG_MTD_UBI_BEB_LIMIT;
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 619f914..7885dc0 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -1011,7 +1011,7 @@ static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
 		 */
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, req.ubi_num, req.vid_hdr_offset,
-					 CONFIG_MTD_UBI_BEB_LIMIT);
+					 req.max_beb_per1024);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0)
 			put_mtd_device(mtd);
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 8787349..2a763ae 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -222,6 +222,7 @@ enum {
  * @ubi_num: UBI device number to create
  * @mtd_num: MTD device number to attach
  * @vid_hdr_offset: VID header offset (use defaults if %0)
+ * @max_beb_per1024: Maximum expected bad eraseblocks per 1024 eraseblocks
  * @padding: reserved for future, not used, has to be zeroed
  *
  * This data structure is used to specify MTD device UBI has to attach and the
@@ -245,12 +246,28 @@ enum {
  * be 2KiB-64 bytes = 1984. Note, that this position is not even 512-bytes
  * aligned, which is OK, as UBI is clever enough to realize this is 4th
  * sub-page of the first page and add needed padding.
+ *
+ * The @max_beb_per1024 is the maximum bad eraseblocks UBI expects on the ubi
+ * device per 1024 eraseblocks.
+ * This value is often given in an other form in the NAND datasheet (min NVB
+ * i.e. minimal number of valid blocks). The maximum expected bad eraseblocks
+ * per 1024 is then:
+ *   1024 * (1 - MinNVB / MaxNVB)
+ * Which gives 20 for most NAND devices.
+ * This limit is used in order to derive amount of eraseblock UBI reserves for
+ * handling new bad blocks.
+ * If the device has more bad eraseblocks than this limit, UBI does not reserve
+ * any physical eraseblocks for new bad eraseblocks, but attempts to use
+ * available eraseblocks (if any).
+ * The accepted range is 0-768. If 0 is given, the default kernel value will be
+ * used for compatibility.
  */
 struct ubi_attach_req {
 	__s32 ubi_num;
 	__s32 mtd_num;
 	__s32 vid_hdr_offset;
-	__s8 padding[12];
+	__u16 max_beb_per1024;
+	__s8 padding[10];
 };
 
 /**
-- 
1.7.2.5
