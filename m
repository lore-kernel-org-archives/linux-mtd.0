Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNTxl-0006K7-Cr
 for linux-mtd@lists.infradead.org; Fri, 29 Aug 2014 21:44:06 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/3] UBI: block: Fix block device size setting
Date: Fri, 29 Aug 2014 18:42:28 -0300
Message-Id: <1409348550-27768-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are currently taking the block device size from the ubi_volume_info.size
field. However, this is not the amount of data in the volume, but the
number of reserved physical eraseblocks, and hence leads to an incorrect
representation of the volume.

In particular, this produces I/O errors on static volumes as the block
interface may attempt to read unmapped PEBs:

$ cat /dev/ubiblock0_0 > /dev/null
UBI error: ubiblock_read_to_buf: ubiblock0_0 ubi_read error -22
end_request: I/O error, dev ubiblock0_0, sector 9536
Buffer I/O error on device ubiblock0_0, logical block 2384
[snip]

Fix this by using the ubi_volume_info.used_bytes field which is set to the
actual number of data bytes for both static and dynamic volumes.

While here, improve the error message to be less stupid and more useful:
UBI error: ubiblock_read_to_buf: ubiblock0_1 ubi_read error -9 on LEB=0, off=15872, len=512

It's worth noticing that the 512-byte sector representation of the volume
is only correct if the volume size is multiple of 512-bytes. This is true for
virtually any NAND device, given eraseblocks and pages are 512-byte multiple
and hence so is the LEB size.

Fixes: 9d54c8a33eec ("UBI: R/O block driver on top of UBI volumes")
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/block.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 33c6495..a29d41c 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -188,8 +188,8 @@ static int ubiblock_read_to_buf(struct ubiblock *dev, char *buffer,
 
 	ret = ubi_read(dev->desc, leb, buffer, offset, len);
 	if (ret) {
-		ubi_err("%s ubi_read error %d",
-			dev->gd->disk_name, ret);
+		ubi_err("%s ubi_read error %d on LEB=%d, off=%d, len=%d",
+			dev->gd->disk_name, ret, leb, offset, len);
 		return ret;
 	}
 	return 0;
@@ -378,7 +378,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 {
 	struct ubiblock *dev;
 	struct gendisk *gd;
-	u64 disk_capacity = ((u64)vi->size * vi->usable_leb_size) >> 9;
+	u64 disk_capacity = vi->used_bytes >> 9;
 	int ret;
 
 	if ((sector_t)disk_capacity != disk_capacity)
@@ -502,7 +502,7 @@ int ubiblock_remove(struct ubi_volume_info *vi)
 static int ubiblock_resize(struct ubi_volume_info *vi)
 {
 	struct ubiblock *dev;
-	u64 disk_capacity = ((u64)vi->size * vi->usable_leb_size) >> 9;
+	u64 disk_capacity = vi->used_bytes >> 9;
 
 	if ((sector_t)disk_capacity != disk_capacity) {
 		ubi_warn("%s: the volume is too big, cannot resize (%d LEBs)",
@@ -523,7 +523,7 @@ static int ubiblock_resize(struct ubi_volume_info *vi)
 
 	mutex_lock(&dev->dev_mutex);
 	set_capacity(dev->gd, disk_capacity);
-	ubi_msg("%s resized to %d LEBs", dev->gd->disk_name, vi->size);
+	ubi_msg("%s resized to %lld bytes", dev->gd->disk_name, vi->used_bytes);
 	mutex_unlock(&dev->dev_mutex);
 	mutex_unlock(&devices_mutex);
 	return 0;
-- 
2.0.1
