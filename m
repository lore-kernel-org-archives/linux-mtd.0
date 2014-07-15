Received: from mailrelay007.isp.belgacom.be ([195.238.6.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X78NI-0004FI-MX
 for linux-mtd@lists.infradead.org; Tue, 15 Jul 2014 19:26:53 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] fs/ubifs/super.c: replace seq_printf by seq_puts
Date: Tue, 15 Jul 2014 21:26:35 +0200
Message-Id: <1405452395-9296-1-git-send-email-fabf@skynet.be>
Cc: Fabian Frederick <fabf@skynet.be>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix checkpatch warnings:
"WARNING: Prefer seq_puts to seq_printf"

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/ubifs/super.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 3904c85..e5bd068 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -424,19 +424,19 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
 	struct ubifs_info *c = root->d_sb->s_fs_info;
 
 	if (c->mount_opts.unmount_mode == 2)
-		seq_printf(s, ",fast_unmount");
+		seq_puts(s, ",fast_unmount");
 	else if (c->mount_opts.unmount_mode == 1)
-		seq_printf(s, ",norm_unmount");
+		seq_puts(s, ",norm_unmount");
 
 	if (c->mount_opts.bulk_read == 2)
-		seq_printf(s, ",bulk_read");
+		seq_puts(s, ",bulk_read");
 	else if (c->mount_opts.bulk_read == 1)
-		seq_printf(s, ",no_bulk_read");
+		seq_puts(s, ",no_bulk_read");
 
 	if (c->mount_opts.chk_data_crc == 2)
-		seq_printf(s, ",chk_data_crc");
+		seq_puts(s, ",chk_data_crc");
 	else if (c->mount_opts.chk_data_crc == 1)
-		seq_printf(s, ",no_chk_data_crc");
+		seq_puts(s, ",no_chk_data_crc");
 
 	if (c->mount_opts.override_compr) {
 		seq_printf(s, ",compr=%s",
-- 
1.8.4.5
