Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RxPOu-0002CF-Bu
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2012 20:55:04 +0000
From: Richard Weinberger <rw@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH 1/7] MTD: UBI: Add checkpoint on-chip layout
Date: Tue, 14 Feb 2012 21:06:40 +0100
Message-Id: <1329250006-22944-2-git-send-email-rw@linutronix.de>
In-Reply-To: <1329250006-22944-1-git-send-email-rw@linutronix.de>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
Cc: tglx@linutronix.de, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Richard Weinberger <rw@linutronix.de>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Specify the on-chip checkpoint layout.
The checkpoint consists of two major parts.
A super block (identified via UBI_CP_SB_VOLUME_ID) and
zero or more data blocks (identified via UBI_CP_DATA_VOLUME_ID).
Data blocks are only used if whole checkpoint information does not fit
into the super block.

Currently UBI_CP_MAX_START, UBI_CP_MAX_BLOCKS and UBI_CP_MAX_POOL_SIZE
are hard-coded.
In future this values may be configurable via Kconfig or sysfs.
All three checkpointing pools have the same size for now, this my also change.
An automatic calibration would be also nice to have.

Signed-off-by: Richard Weinberger <rw@linutronix.de>
---
 drivers/mtd/ubi/ubi-media.h |   81 +++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 81 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 6fb8ec2..45f2b7b 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -375,4 +375,85 @@ struct ubi_vtbl_record {
 	__be32  crc;
 } __packed;
 
+#ifdef CONFIG_MTD_UBI_CHECKPOINT
+#define UBI_CP_SB_VOLUME_ID	(UBI_LAYOUT_VOLUME_ID + 1)
+#define UBI_CP_DATA_VOLUME_ID	(UBI_CP_SB_VOLUME_ID + 1)
+
+/* Checkoint format version */
+#define UBI_CP_FMT_VERSION	1
+
+#define UBI_CP_MAX_START	64
+#define UBI_CP_MAX_BLOCKS	32
+#define UBI_CP_MAX_POOL_SIZE	128
+#define UBI_CP_SB_MAGIC		0x7B11D69F
+#define UBI_CP_HDR_MAGIC	0xD4B82EF7
+#define UBI_CP_VHDR_MAGIC	0xFA370ED1
+#define UBI_CP_LPOOL_MAGIC	0x67AF4D08
+#define UBI_CP_SPOOL_MAGIC	0x67AF4D09
+#define UBI_CP_UPOOL_MAGIC	0x67AF4D0A
+
+struct ubi_cp_sb {
+	__be32 magic;
+	__u8 version;
+	__be32 data_crc;
+	__be32 nblocks;
+	__be32 block_loc[UBI_CP_MAX_BLOCKS];
+	__be32 block_ec[UBI_CP_MAX_BLOCKS];
+	__be64 sqnum;
+} __packed;
+
+/* first entry in the checkpoint (cp) data set */
+struct ubi_cp_hdr {
+	__be32 magic;
+	__be32 nfree;
+	__be32 nused;
+	__be32 nvol;
+} __packed;
+
+/* struct ubi_cp_hdr is followed by exactly three struct ub_cp_pool_* records 
+ * long, short and unknown pool */
+
+struct ubi_cp_long_pool {
+	__be32 magic;
+	__be32 size;
+	__be32 pebs[UBI_CP_MAX_POOL_SIZE];
+} __packed;
+
+struct ubi_cp_short_pool {
+	__be32 magic;
+	__be32 size;
+	__be32 pebs[UBI_CP_MAX_POOL_SIZE];
+} __packed;
+
+struct ubi_cp_unk_pool {
+	__be32 magic;
+	__be32 size;
+	__be32 pebs[UBI_CP_MAX_POOL_SIZE];
+} __packed;
+
+/* struct ub_cp_pool is followed by nfree+nused struct ubi_cp_ec records */
+
+/* erase counter per peb */
+struct ubi_cp_ec {
+	__be32 pnum;
+	__be32 ec;
+} __packed;
+
+/* identifies the start of a eba table */
+struct ubi_cp_volhdr {
+	__be32 magic;
+	__be32 vol_id;
+	__u8 vol_type;
+	__be32 data_pad;
+	__be32 used_ebs;
+	__be32 last_eb_bytes;
+} __packed;
+
+/* struct ubi_cp_volhdr is followed by nused struct ubi_cp_eba records */
+
+struct ubi_cp_eba {
+	__be32 lnum;
+	__be32 pnum;
+} __packed;
+#endif /* CONFIG_MTD_UBI_CHECKPOINT */
 #endif /* !__UBI_MEDIA_H__ */
-- 
1.7.7
