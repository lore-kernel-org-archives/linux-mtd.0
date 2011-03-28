Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q46zQ-00014P-MG
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 07:35:54 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2S7Zoro029261
	for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2011 10:35:50 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/4] UBIFS: use __packed instead of __attribute__((packed))
Date: Mon, 28 Mar 2011 10:38:32 +0300
Message-Id: <1301297914-14712-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1301297914-14712-1-git-send-email-dedekind1@gmail.com>
References: <1301297914-14712-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

There was an attempt to standartize various "__attribute__" and
other macros in order to have potentially portable and more
consistent code, see commit 82ddcb040570411fc2d421d96b3e69711c670328.

Note, that commit refers Rober Love's blog post, but the URL
is broken, the valid URL is:
http://blog.rlove.org/2005/10/with-little-help-from-your-compiler.html

Moreover, nowadays checkpatch.pl warns about using
__attribute__((packed)):

"WARNING: __packed is preferred over __attribute__((packed))"

It is not a big deal for UBIFS to use __packed, so let's do it.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/ubifs-media.h |   28 ++++++++++++++--------------
 1 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index 191ca78..b922f03 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -434,7 +434,7 @@ struct ubifs_ch {
 	__u8 node_type;
 	__u8 group_type;
 	__u8 padding[2];
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * union ubifs_dev_desc - device node descriptor.
@@ -448,7 +448,7 @@ struct ubifs_ch {
 union ubifs_dev_desc {
 	__le32 new;
 	__le64 huge;
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubifs_ino_node - inode node.
@@ -509,7 +509,7 @@ struct ubifs_ino_node {
 	__le16 compr_type;
 	__u8 padding2[26]; /* Watch 'zero_ino_node_unused()' if changing! */
 	__u8 data[];
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubifs_dent_node - directory entry node.
@@ -534,7 +534,7 @@ struct ubifs_dent_node {
 	__le16 nlen;
 	__u8 padding2[4]; /* Watch 'zero_dent_node_unused()' if changing! */
 	__u8 name[];
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubifs_data_node - data node.
@@ -555,7 +555,7 @@ struct ubifs_data_node {
 	__le16 compr_type;
 	__u8 padding[2]; /* Watch 'zero_data_node_unused()' if changing! */
 	__u8 data[];
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubifs_trun_node - truncation node.
@@ -575,7 +575,7 @@ struct ubifs_trun_node {
 	__u8 padding[12]; /* Watch 'zero_trun_node_unused()' if changing! */
 	__le64 old_size;
 	__le64 new_size;
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubifs_pad_node - padding node.
@@ -586,7 +586,7 @@ struct ubifs_trun_node {
 struct ubifs_pad_node {
 	struct ubifs_ch ch;
 	__le32 pad_len;
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubifs_sb_node - superblock node.
@@ -644,7 +644,7 @@ struct ubifs_sb_node {
 	__u8 uuid[16];
 	__le32 ro_compat_version;
 	__u8 padding2[3968];
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubifs_mst_node - master node.
@@ -711,7 +711,7 @@ struct ubifs_mst_node {
 	__le32 idx_lebs;
 	__le32 leb_cnt;
 	__u8 padding[344];
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubifs_ref_node - logical eraseblock reference node.
@@ -727,7 +727,7 @@ struct ubifs_ref_node {
 	__le32 offs;
 	__le32 jhead;
 	__u8 padding[28];
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubifs_branch - key/reference/length branch
@@ -741,7 +741,7 @@ struct ubifs_branch {
 	__le32 offs;
 	__le32 len;
 	__u8 key[];
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubifs_idx_node - indexing node.
@@ -755,7 +755,7 @@ struct ubifs_idx_node {
 	__le16 child_cnt;
 	__le16 level;
 	__u8 branches[];
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubifs_cs_node - commit start node.
@@ -765,7 +765,7 @@ struct ubifs_idx_node {
 struct ubifs_cs_node {
 	struct ubifs_ch ch;
 	__le64 cmt_no;
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubifs_orph_node - orphan node.
@@ -777,6 +777,6 @@ struct ubifs_orph_node {
 	struct ubifs_ch ch;
 	__le64 cmt_no;
 	__le64 inos[];
-} __attribute__ ((packed));
+} __packed;
 
 #endif /* __UBIFS_MEDIA_H__ */
-- 
1.7.2.3
