Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm1-0002YC-0R
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:32:59 +0000
Received: by mail-pf0-x242.google.com with SMTP id n128so8234153pfn.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:40 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 06/17] drivers:mtd:ubi:add bakvol function define in ubi
 layer
Date: Tue,  2 Feb 2016 02:30:41 +0000
Message-Id: <1454380252-16170-7-git-send-email-jackyard88@gmail.com>
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

This file patch is to add bakvol function define in ubi layer and
add bakvol point in ubi_device structure. Add one new parameter for ubi layer write
function, in order to indicate if this time programming data should be protected.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 drivers/mtd/ubi/ubi.h | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 2974b67..4a80359 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -438,6 +438,7 @@ struct ubi_debug_info {
  * @vtbl_slots: how many slots are available in the volume table
  * @vtbl_size: size of the volume table in bytes
  * @vtbl: in-RAM volume table copy
+ * @bkblk_tbl: backup block table
  * @device_mutex: protects on-flash volume table and serializes volume
  *                creation, deletion, update, re-size, re-name and set
  *                property
@@ -547,6 +548,7 @@ struct ubi_device {
 	int vtbl_slots;
 	int vtbl_size;
 	struct ubi_vtbl_record *vtbl;
+	struct ubi_bkblk_tbl *bkblk_tbl;
 	struct mutex device_mutex;
 
 	int max_ec;
@@ -797,6 +799,20 @@ int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
 			    struct list_head *rename_list);
 int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *ai);
 
+/* bakvol.c*/
+int ubi_check_bakvol_module(struct ubi_device *ubi);
+int ubi_duplicate_data_to_bakvol(struct ubi_device *ubi, loff_t addr,
+		size_t len, size_t *retlen, const void *buf);
+int ubi_bakvol_module_init(struct ubi_device *ubi);
+int ubi_bakvol_peb_scan(struct ubi_device *ubi,
+			struct ubi_vid_hdr *vidh, int pnum);
+int ubi_bakvol_module_init_tail(struct ubi_device *ubi,
+				struct ubi_attach_info *si);
+int ubi_corrupted_data_recovery(struct ubi_volume_desc *desc);
+int is_backup_need(struct ubi_device *ubi, loff_t addr);
+void init_bakvol(struct ubi_volume_desc *desc, uint8_t choice);
+void clear_bakvol(struct ubi_device *ubi);
+
 /* vmt.c */
 int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req);
 int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl);
@@ -846,6 +862,7 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 
 /* wl.c */
 int ubi_wl_get_peb(struct ubi_device *ubi);
+int ubi_wl_get_plane_peb(struct ubi_device *ubi, int plane);
 int ubi_wl_put_peb(struct ubi_device *ubi, int vol_id, int lnum,
 		   int pnum, int torture);
 int ubi_wl_flush(struct ubi_device *ubi, int vol_id, int lnum);
@@ -864,7 +881,7 @@ int ubi_ensure_anchor_pebs(struct ubi_device *ubi);
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 		int len);
 int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
-		 int len);
+		 int len, int safeguard);
 int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture);
 int ubi_io_is_bad(const struct ubi_device *ubi, int pnum);
 int ubi_io_mark_bad(const struct ubi_device *ubi, int pnum);
@@ -1054,10 +1071,10 @@ static inline int ubi_io_read_data(const struct ubi_device *ubi, void *buf,
  * physical eraseblock.
  */
 static inline int ubi_io_write_data(struct ubi_device *ubi, const void *buf,
-				    int pnum, int offset, int len)
+				    int pnum, int offset, int len, int safeguard)
 {
 	ubi_assert(offset >= 0);
-	return ubi_io_write(ubi, buf, pnum, offset + ubi->leb_start, len);
+	return ubi_io_write(ubi, buf, pnum, offset + ubi->leb_start, len, safeguard);
 }
 
 /**
-- 
1.9.1
