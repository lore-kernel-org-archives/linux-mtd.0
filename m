Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9Z-0002r6-5E
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:43:58 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 12/25] ubifs: introduce quota related mount options
Date: Tue, 21 Jul 2015 16:37:43 +0800
Message-ID: <1437467876-22106-13-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit introduce mount options of quota, noquota,
usrquota and grpquota. These options are used to make
ubifs support quota. But with this commit, quota will
not working on ubifs actually. We just introduce options
here and will make ubifs support quota later.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 30 ++++++++++++++++++++++++++++++
 fs/ubifs/ubifs.h |  7 +++++++
 2 files changed, 37 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 161b1a6..2491fff 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -36,6 +36,7 @@
 #include <linux/mount.h>
 #include <linux/math64.h>
 #include <linux/writeback.h>
+#include <linux/quotaops.h>
 #include <linux/cdev.h>
 #include "ubifs.h"
 
@@ -439,6 +440,12 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
 	else if (c->mount_opts.chk_data_crc == 1)
 		seq_puts(s, ",no_chk_data_crc");
 
+	if (c->usrquota)
+		seq_puts(s, ",usrquota");
+
+	if (c->grpquota)
+		seq_puts(s, ",grpquota");
+
 	if (c->mount_opts.override_compr) {
 		seq_printf(s, ",compr=%s",
 			   ubifs_compr_name(c->mount_opts.compr_type));
@@ -930,6 +937,10 @@ enum {
 	Opt_chk_data_crc,
 	Opt_no_chk_data_crc,
 	Opt_override_compr,
+	Opt_ignore,
+	Opt_quota,
+	Opt_usrquota,
+	Opt_grpquota,
 	Opt_err,
 };
 
@@ -941,6 +952,10 @@ static const match_table_t tokens = {
 	{Opt_chk_data_crc, "chk_data_crc"},
 	{Opt_no_chk_data_crc, "no_chk_data_crc"},
 	{Opt_override_compr, "compr=%s"},
+	{Opt_ignore, "noquota"},
+	{Opt_quota, "quota"},
+	{Opt_usrquota, "usrquota"},
+	{Opt_grpquota, "grpquota"},
 	{Opt_err, NULL},
 };
 
@@ -1041,6 +1056,21 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 			c->default_compr = c->mount_opts.compr_type;
 			break;
 		}
+#ifdef CONFIG_QUOTA
+		case Opt_quota:
+		case Opt_usrquota:
+			c->usrquota = 1;
+			break;
+		case Opt_grpquota:
+			c->grpquota = 1;
+			break;
+#else
+		case Opt_quota:
+		case Opt_usrquota:
+		case Opt_grpquota:
+			ubifs_err(c, "quota operations not supported");
+			break;
+#endif
 		default:
 		{
 			unsigned long flag;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index a6ad955..9754bb6 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -418,6 +418,9 @@ struct ubifs_inode {
 	loff_t synced_i_size;
 	loff_t ui_size;
 	int flags;
+#ifdef CONFIG_QUOTA
+	struct dquot *i_dquot[MAXQUOTAS];
+#endif
 	pgoff_t last_page_read;
 	pgoff_t read_in_a_row;
 	int data_len;
@@ -1039,6 +1042,8 @@ struct ubifs_debug_info;
  * @bulk_read: enable bulk-reads
  * @default_compr: default compression algorithm (%UBIFS_COMPR_LZO, etc)
  * @rw_incompat: the media is not R/W compatible
+ * @usrquota: enable usrquota
+ * @grpquota: enable grpquota
  *
  * @tnc_mutex: protects the Tree Node Cache (TNC), @zroot, @cnext, @enext, and
  *             @calc_idx_sz
@@ -1280,6 +1285,8 @@ struct ubifs_info {
 	unsigned int bulk_read:1;
 	unsigned int default_compr:2;
 	unsigned int rw_incompat:1;
+	unsigned int usrquota:1;
+	unsigned int grpquota:1;
 
 	struct mutex tnc_mutex;
 	struct ubifs_zbranch zroot;
-- 
1.8.4.2
