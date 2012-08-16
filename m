Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T21RC-0003W3-1a
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 14:52:43 +0000
Received: by wgbez12 with SMTP id ez12so1796264wgb.18
 for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2012 07:52:40 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/2] UBI: add ioctl for max_beb_per1024
Date: Thu, 16 Aug 2012 16:52:03 +0200
Message-Id: <1345128723-13582-3-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345042639.3393.150.camel@sauron.fi.intel.com>
References: <1345042639.3393.150.camel@sauron.fi.intel.com>
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
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
	__u8 max_beb_per1024;
	__s8 padding[11];
};

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/ubi/cdev.c |    9 ++++++++-
 include/mtd/ubi-user.h |   19 ++++++++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index e0027e7..d268b42 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -1006,12 +1006,19 @@ static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
 		}
 
 		/*
+		 * For compatibility with older user-space tools,
+		 * a zero value should be treated like a default value
+		 */
+		if (!req.max_beb_per1024)
+			req.max_beb_per1024 = MTD_UBI_DEFAULT_BEB_LIMIT;
+
+		/*
 		 * Note, further request verification is done by
 		 * 'ubi_attach_mtd_dev()'.
 		 */
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, req.ubi_num, req.vid_hdr_offset,
-					 MTD_UBI_DEFAULT_BEB_LIMIT);
+					 req.max_beb_per1024);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0)
 			put_mtd_device(mtd);
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 8787349..77cd0d1 100644
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
+ * The accepted range is 0-255. If 0 is given, the default value
+ * MTD_UBI_DEFAULT_BEB_LIMIT will be used for compatibility.
  */
 struct ubi_attach_req {
 	__s32 ubi_num;
 	__s32 mtd_num;
 	__s32 vid_hdr_offset;
-	__s8 padding[12];
+	__u8 max_beb_per1024;
+	__s8 padding[11];
 };
 
 /**
-- 
1.7.2.5
