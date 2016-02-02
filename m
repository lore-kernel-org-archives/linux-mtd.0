Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm1-0002YA-0U
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:32:59 +0000
Received: by mail-pf0-x242.google.com with SMTP id 66so7810467pfe.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:40 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 05/17] drivers:mtd:ubi:add bakvol on-flash and RAM data
 structures
Date: Tue,  2 Feb 2016 02:30:40 +0000
Message-Id: <1454380252-16170-6-git-send-email-jackyard88@gmail.com>
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

This file is to add bakvol default configure and on-flash data structures.
Here add three key structures:
        ubi_bkblk_info: for backup block programming info.
        bakvol_oob_info: for user oob area bakvol data structure.
        ubi_bkblk_tbl: for bakvol module info.

Signed-off-by: BeanHuo <beanhuo@micron.com>
---
 drivers/mtd/ubi/ubi-media.h | 64 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index d0d072e..8981a39 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -31,6 +31,7 @@
 #define __UBI_MEDIA_H__
 
 #include <asm/byteorder.h>
+#include <linux/list.h>
 
 /* The version of UBI images supported by this implementation */
 #define UBI_VERSION 1
@@ -295,7 +296,11 @@ struct ubi_vid_hdr {
 } __packed;
 
 /* Internal UBI volumes count */
+#ifdef CONFIG_MTD_UBI_MLC_NAND_BAKVOL
+#define UBI_INT_VOL_COUNT 2
+#else
 #define UBI_INT_VOL_COUNT 1
+#endif
 
 /*
  * Starting ID of internal volumes: 0x7fffefff.
@@ -312,6 +317,15 @@ struct ubi_vid_hdr {
 #define UBI_LAYOUT_VOLUME_NAME   "layout volume"
 #define UBI_LAYOUT_VOLUME_COMPAT UBI_COMPAT_REJECT
 
+/* The backup log volume */
+
+#define UBI_BACKUP_VOLUME_ID     (UBI_INTERNAL_VOL_START + 1)
+#define UBI_BACKUP_VOLUME_TYPE   UBI_VID_DYNAMIC
+#define UBI_BACKUP_VOLUME_ALIGN  1
+#define UBI_BACKUP_VOLUME_EBS    20
+#define UBI_BACKUP_VOLUME_NAME   "bakvol"
+#define UBI_BACKUP_VOLUME_COMPAT UBI_COMPAT_REJECT
+
 /* The maximum number of volumes per one UBI device */
 #define UBI_MAX_VOLUMES 128
 
@@ -325,6 +339,56 @@ struct ubi_vid_hdr {
 #define UBI_VTBL_RECORD_SIZE_CRC (UBI_VTBL_RECORD_SIZE - sizeof(__be32))
 
 /**
+ * struct ubi_bkblk_info - the information for one backup block .
+ * @peb: physical block number
+ * @leb:  logic block number
+ * @plane: this block belongs to which plane
+ * @pgnum: the page number that already be programmed last time.
+ */
+struct ubi_bkblk_info {
+	__be32  peb;
+	__be32  leb;
+	__u8    plane;
+	__be32  pgnum;
+	struct  list_head node;
+}__packed;
+
+/**
+ * struct bakvol_oob_info - user oob area structure.
+ * @addr: address of source/backup page
+ * @crc: CRC-32 checksum of addr
+ *
+ */
+struct bakvol_oob_info {
+	loff_t addr;
+	__le32 crc;
+} __packed;
+
+/* Sizes of bakvol oob area */
+#define UBI_BAKVOL_OOB_SIZE sizeof(struct bakvol_oob_info)
+
+/* Sizes of bakvol oob area without the ending CRC */
+#define UBI_BAKVOL_OOB_SIZE_CRC (UBI_BAKVOL_OOB_SIZE - sizeof(__be32))
+
+/**
+ * struct ubi_bkblk_tbl - a table for backup blocks.
+ * @bakvol_flag: indicate if backup volume be initted
+ * @bcount_of_plane: block count that has bee applied for corresponding plane
+ * @head: the list of backup blocks.
+ */
+struct ubi_bkblk_tbl {
+	__u8    bakvol_flag;
+#define UBI_BAKVOL_INIT_START 0x01 /* init bakvol module start */
+#define UBI_BAKVOL_REJECT 0x02 /* reject bakvol module operations */
+#define UBI_BAKVOL_INIT_DONE 0x04 /* init bakvol module done */
+#define UBI_BAKVOL_ENABLE 0x08 /* enable bakvol module */
+#define UBI_BAKVOL_DISABLE 0x10 /* disable bakvol module */
+#define UBI_BAKVOL_RECOVERY 0x20 /* bakvol recovery already done */
+	__be32  bcount_of_plane[2];
+	struct  list_head head;
+}__packed;;
+
+/**
  * struct ubi_vtbl_record - a record in the volume table.
  * @reserved_pebs: how many physical eraseblocks are reserved for this volume
  * @alignment: volume alignment
-- 
1.9.1
