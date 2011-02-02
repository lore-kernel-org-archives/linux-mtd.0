Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PkXwI-0004eg-FT
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 08:19:50 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>,
	Holger Brunck <holger.brunck@keymile.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: [PATCH 1/7] UBI: incorporate maximum write size
Date: Wed,  2 Feb 2011 10:21:52 +0200
Message-Id: <1296634917-19335-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1296634917-19335-1-git-send-email-dedekind1@gmail.com>
References: <1296634917-19335-1-git-send-email-dedekind1@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Incorporate MTD write buffer size into UBI device information
because UBIFS needs this field. UBI does not use it ATM, just
provides to upper layers in 'struct ubi_device_info'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |   13 +++++++++++++
 drivers/mtd/ubi/kapi.c  |    1 +
 drivers/mtd/ubi/ubi.h   |    3 +++
 include/linux/mtd/ubi.h |   15 +++++++++++++++
 4 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 5ebe280..d7fa52e 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -690,6 +690,19 @@ static int io_init(struct ubi_device *ubi)
 	ubi_assert(ubi->hdrs_min_io_size <= ubi->min_io_size);
 	ubi_assert(ubi->min_io_size % ubi->hdrs_min_io_size == 0);
 
+	ubi->max_write_size = ubi->mtd->writebufsize;
+	/*
+	 * Maximum write size has to be greater or equivalent to min. I/O
+	 * size, and be multiple of min. I/O size.
+	 */
+	if (ubi->max_write_size < ubi->min_io_size ||
+	    ubi->max_write_size % ubi->min_io_size ||
+	    !is_power_of_2(ubi->max_write_size)) {
+		ubi_err("bad write buffer size %d for %d min. I/O unit",
+			ubi->max_write_size, ubi->min_io_size);
+		return -EINVAL;
+	}
+
 	/* Calculate default aligned sizes of EC and VID headers */
 	ubi->ec_hdr_alsize = ALIGN(UBI_EC_HDR_SIZE, ubi->hdrs_min_io_size);
 	ubi->vid_hdr_alsize = ALIGN(UBI_VID_HDR_SIZE, ubi->hdrs_min_io_size);
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 69fa4ef0..701df4f 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -41,6 +41,7 @@ void ubi_do_get_device_info(struct ubi_device *ubi, struct ubi_device_info *di)
 	di->ubi_num = ubi->ubi_num;
 	di->leb_size = ubi->leb_size;
 	di->min_io_size = ubi->min_io_size;
+	di->max_write_size = ubi->max_write_size;
 	di->ro_mode = ubi->ro_mode;
 	di->cdev = ubi->cdev.dev;
 }
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 0b0149c..b789943 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -381,6 +381,8 @@ struct ubi_wl_entry;
  * @bad_allowed: whether the MTD device admits of bad physical eraseblocks or
  *               not
  * @nor_flash: non-zero if working on top of NOR flash
+ * @max_write_size: maximum amount of bytes the underlying flash can write at a
+ *                  time (MTD write buffer size)
  * @mtd: MTD device descriptor
  *
  * @peb_buf1: a buffer of PEB size used for different purposes
@@ -464,6 +466,7 @@ struct ubi_device {
 	int vid_hdr_shift;
 	unsigned int bad_allowed:1;
 	unsigned int nor_flash:1;
+	int max_write_size;
 	struct mtd_info *mtd;
 
 	void *peb_buf1;
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index b31bd9e..238b32c 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -117,17 +117,32 @@ struct ubi_volume_info {
  * @ubi_num: ubi device number
  * @leb_size: logical eraseblock size on this UBI device
  * @min_io_size: minimal I/O unit size
+ * @max_write_size: maximum amount of bytes the underlying flash can write at a
+ *                  time (MTD write buffer size)
  * @ro_mode: if this device is in read-only mode
  * @cdev: UBI character device major and minor numbers
  *
  * Note, @leb_size is the logical eraseblock size offered by the UBI device.
  * Volumes of this UBI device may have smaller logical eraseblock size if their
  * alignment is not equivalent to %1.
+ *
+ * The @max_write_size field describes flash write maximum write unit. For
+ * example, NOR flash allows for changing individual bytes, so @min_io_size is
+ * %1. However, it does not mean than NOR flash has to write data byte-by-byte.
+ * Instead, CFI NOR flashes have a write-buffer of, e.g., 64 bytes, and when
+ * writing large chunks of data, they write 64-bytes at a time. Obviously, this
+ * improves write throughput.
+ *
+ * The @max_write_size field is always greater or equivalent to @min_io_size.
+ * E.g., some NOR flashes may have (@min_io_size = 1, @max_write_size = 64). In
+ * contrast, NAND flashes usually have @min_io_size = @max_write_size = NAND
+ * page size.
  */
 struct ubi_device_info {
 	int ubi_num;
 	int leb_size;
 	int min_io_size;
+	int max_write_size;
 	int ro_mode;
 	dev_t cdev;
 };
-- 
1.7.2.3
