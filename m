Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwsIv-0008QX-MR
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 08:30:06 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH v3 2/7] UBI: provide LEB offset information
Date: Tue,  8 Mar 2011 10:32:43 +0200
Message-Id: <1299573168-27760-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1299573168-27760-1-git-send-email-dedekind1@gmail.com>
References: <1299573168-27760-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Provide the LEB offset information in the UBI device information data
structure. This piece of information is required by UBIFS to find out
what are the LEB offsets which are aligned to the max. write size.

If LEB offset not aligned to max. write size, then UBIFS has to take
this into account to write more optimally.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/kapi.c  |    1 +
 include/linux/mtd/ubi.h |    3 +++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 701df4f..d39716e 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -40,6 +40,7 @@ void ubi_do_get_device_info(struct ubi_device *ubi, struct ubi_device_info *di)
 {
 	di->ubi_num = ubi->ubi_num;
 	di->leb_size = ubi->leb_size;
+	di->leb_start = ubi->leb_start;
 	di->min_io_size = ubi->min_io_size;
 	di->max_write_size = ubi->max_write_size;
 	di->ro_mode = ubi->ro_mode;
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index 36c7059..84854ed 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -116,6 +116,8 @@ struct ubi_volume_info {
  * struct ubi_device_info - UBI device description data structure.
  * @ubi_num: ubi device number
  * @leb_size: logical eraseblock size on this UBI device
+ * @leb_start: starting offset of logical eraseblocks within physical
+ *             eraseblocks
  * @min_io_size: minimal I/O unit size
  * @max_write_size: maximum amount of bytes the underlying flash can write at a
  *                  time (MTD write buffer size)
@@ -145,6 +147,7 @@ struct ubi_volume_info {
 struct ubi_device_info {
 	int ubi_num;
 	int leb_size;
+	int leb_start;
 	int min_io_size;
 	int max_write_size;
 	int ro_mode;
-- 
1.7.2.3
