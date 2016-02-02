Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm9-0002Ye-VI
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:33:08 +0000
Received: by mail-pf0-x243.google.com with SMTP id 65so8259846pfd.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:46 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 13/17] drivers:mtd:ubi:add bakvol init while attach ubi
Date: Tue,  2 Feb 2016 02:30:48 +0000
Message-Id: <1454380252-16170-14-git-send-email-jackyard88@gmail.com>
In-Reply-To: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
References: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bean Huo <beanhuo@micron.com>

This file is to initial bakvol moduel and scan PEB to find
bakvol PEB while attach ubi device.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 drivers/mtd/ubi/attach.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 68eea5b..5c38854 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -919,6 +919,15 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	err = ubi_io_read_vid_hdr(ubi, pnum, vidh, 0);
 	if (err < 0)
 		return err;
+
+#ifdef CONFIG_MTD_UBI_MLC_NAND_BAKVOL
+	/*
+	 * Before analyze VID header, call ubi_bakvol_peb_scan to
+	 * find out backup block and build the backup log volume first.
+	 */
+	ubi_bakvol_peb_scan(ubi, vidh, pnum);
+#endif
+
 	switch (err) {
 	case 0:
 		break;
@@ -995,7 +1004,8 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		*vid = vol_id;
 	if (sqnum)
 		*sqnum = be64_to_cpu(vidh->sqnum);
-	if (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID) {
+	if ((vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID)
+					&& vol_id != UBI_BACKUP_VOLUME_ID) {
 		int lnum = be32_to_cpu(vidh->lnum);
 
 		/* Unsupported internal volume */
@@ -1408,6 +1418,12 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 	if (!ai)
 		return -ENOMEM;
 
+#ifdef CONFIG_MTD_UBI_MLC_NAND_BAKVOL
+	err = ubi_bakvol_module_init(ubi);
+	if (err)
+		goto out_ai;
+#endif
+
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	/* On small flash devices we disable fastmap in any case. */
 	if ((int)mtd_div_by_eb(ubi->mtd->size, ubi->mtd) <= UBI_FM_MAX_START) {
@@ -1449,6 +1465,12 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 	if (err)
 		goto out_ai;
 
+#ifdef CONFIG_MTD_UBI_MLC_NAND_BAKVOL
+	err = ubi_bakvol_module_init_tail(ubi, ai);
+	if (err)
+		goto out_ai;
+#endif
+
 	err = ubi_wl_init(ubi, ai);
 	if (err)
 		goto out_vtbl;
-- 
1.9.1
