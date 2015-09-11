Received: from szxga03-in.huawei.com ([119.145.14.66])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZaD34-0005a5-Qo
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 01:22:44 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>,
 <andreas.gruenbacher@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <yangds.fnst@cn.fujitsu.com>,
 <linux-fsdevel@vger.kernel.org>
Subject: [RFC PATCH v3 4/5] UBIFS: ACL: introduce ACL mount options
Date: Fri, 11 Sep 2015 09:09:56 +0000
Message-ID: <1441962597-13543-5-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1441962597-13543-1-git-send-email-shengyong1@huawei.com>
References: <1441962597-13543-1-git-send-email-shengyong1@huawei.com>
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

This patch introduces `acl' and `noacl' mount options for ACL.

Signed-off-by: Sheng Yong <shengyong1@huawei.com>
---
 fs/ubifs/super.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 9547a278..52baad1 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -441,6 +441,9 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
 			   ubifs_compr_name(c->mount_opts.compr_type));
 	}
 
+	if (c->vfs_sb->s_flags & MS_POSIXACL)
+		seq_printf(s, ",acl");
+
 	return 0;
 }
 
@@ -926,6 +929,8 @@ enum {
 	Opt_chk_data_crc,
 	Opt_no_chk_data_crc,
 	Opt_override_compr,
+	Opt_acl,
+	Opt_noacl,
 	Opt_err,
 };
 
@@ -937,6 +942,8 @@ static const match_table_t tokens = {
 	{Opt_chk_data_crc, "chk_data_crc"},
 	{Opt_no_chk_data_crc, "no_chk_data_crc"},
 	{Opt_override_compr, "compr=%s"},
+	{Opt_acl, "acl"},
+	{Opt_noacl, "noacl"},
 	{Opt_err, NULL},
 };
 
@@ -1037,6 +1044,14 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 			c->default_compr = c->mount_opts.compr_type;
 			break;
 		}
+#ifdef CONFIG_UBIFS_FS_POSIX_ACL
+		case Opt_acl:
+			c->vfs_sb->s_flags |= MS_POSIXACL;
+			break;
+		case Opt_noacl:
+			c->vfs_sb->s_flags &= ~MS_POSIXACL;
+			break;
+#endif
 		default:
 		{
 			unsigned long flag;
-- 
1.9.1
