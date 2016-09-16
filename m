Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkuce-0006xO-2x
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 15:00:15 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 14/18] UBI: add an helper to check lnum validity
Date: Fri, 16 Sep 2016 16:59:22 +0200
Message-Id: <1474037966-5524-15-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1474037966-5524-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1474037966-5524-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubi_leb_valid() is here to replace the
lnum < 0 || lnum >= vol->reserved_pebs checks.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/cdev.c |  4 ++--
 drivers/mtd/ubi/kapi.c | 12 ++++++------
 drivers/mtd/ubi/ubi.h  |  5 +++++
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 3490dcd99ad1..45c329694a5e 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -454,7 +454,7 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 
 		/* Validate the request */
 		err = -EINVAL;
-		if (req.lnum < 0 || req.lnum >= vol->reserved_pebs ||
+		if (!ubi_leb_valid(vol, req.lnum) ||
 		    req.bytes < 0 || req.bytes > vol->usable_leb_size)
 			break;
 
@@ -485,7 +485,7 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 			break;
 		}
 
-		if (lnum < 0 || lnum >= vol->reserved_pebs) {
+		if (!ubi_leb_valid(vol, lnum)) {
 			err = -EINVAL;
 			break;
 		}
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index a9e2cef7c95c..cec7f65beb9e 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -538,7 +538,7 @@ int ubi_leb_write(struct ubi_volume_desc *desc, int lnum, const void *buf,
 	if (desc->mode == UBI_READONLY || vol->vol_type == UBI_STATIC_VOLUME)
 		return -EROFS;
 
-	if (lnum < 0 || lnum >= vol->reserved_pebs || offset < 0 || len < 0 ||
+	if (!ubi_leb_valid(vol, lnum) || offset < 0 || len < 0 ||
 	    offset + len > vol->usable_leb_size ||
 	    offset & (ubi->min_io_size - 1) || len & (ubi->min_io_size - 1))
 		return -EINVAL;
@@ -583,7 +583,7 @@ int ubi_leb_change(struct ubi_volume_desc *desc, int lnum, const void *buf,
 	if (desc->mode == UBI_READONLY || vol->vol_type == UBI_STATIC_VOLUME)
 		return -EROFS;
 
-	if (lnum < 0 || lnum >= vol->reserved_pebs || len < 0 ||
+	if (!ubi_leb_valid(vol, lnum) || len < 0 ||
 	    len > vol->usable_leb_size || len & (ubi->min_io_size - 1))
 		return -EINVAL;
 
@@ -620,7 +620,7 @@ int ubi_leb_erase(struct ubi_volume_desc *desc, int lnum)
 	if (desc->mode == UBI_READONLY || vol->vol_type == UBI_STATIC_VOLUME)
 		return -EROFS;
 
-	if (lnum < 0 || lnum >= vol->reserved_pebs)
+	if (!ubi_leb_valid(vol, lnum))
 		return -EINVAL;
 
 	if (vol->upd_marker)
@@ -680,7 +680,7 @@ int ubi_leb_unmap(struct ubi_volume_desc *desc, int lnum)
 	if (desc->mode == UBI_READONLY || vol->vol_type == UBI_STATIC_VOLUME)
 		return -EROFS;
 
-	if (lnum < 0 || lnum >= vol->reserved_pebs)
+	if (!ubi_leb_valid(vol, lnum))
 		return -EINVAL;
 
 	if (vol->upd_marker)
@@ -716,7 +716,7 @@ int ubi_leb_map(struct ubi_volume_desc *desc, int lnum)
 	if (desc->mode == UBI_READONLY || vol->vol_type == UBI_STATIC_VOLUME)
 		return -EROFS;
 
-	if (lnum < 0 || lnum >= vol->reserved_pebs)
+	if (!ubi_leb_valid(vol, lnum))
 		return -EINVAL;
 
 	if (vol->upd_marker)
@@ -751,7 +751,7 @@ int ubi_is_mapped(struct ubi_volume_desc *desc, int lnum)
 
 	dbg_gen("test LEB %d:%d", vol->vol_id, lnum);
 
-	if (lnum < 0 || lnum >= vol->reserved_pebs)
+	if (!ubi_leb_valid(vol, lnum))
 		return -EINVAL;
 
 	if (vol->upd_marker)
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index b51d398f2356..23c902e204aa 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -843,6 +843,11 @@ void ubi_update_reserved(struct ubi_device *ubi);
 void ubi_calculate_reserved(struct ubi_device *ubi);
 int ubi_check_pattern(const void *buf, uint8_t patt, int size);
 
+static inline bool ubi_leb_valid(struct ubi_volume *vol, int lnum)
+{
+	return lnum >= 0 && lnum < vol->reserved_pebs;
+}
+
 /* eba.c */
 int ubi_eba_unmap_leb(struct ubi_device *ubi, struct ubi_volume *vol,
 		      int lnum);
-- 
2.7.4
