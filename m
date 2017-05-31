Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dG07g-0005LN-KI
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 09:41:02 +0000
From: Rabin Vincent <rabin.vincent@axis.com>
To: dedekind1@gmail.com,
	richard@nod.at,
	adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rabin Vincent <rabinv@axis.com>
Subject: [PATCH v4] ubifs: allow userspace to map mounts to volumes
Date: Wed, 31 May 2017 11:40:27 +0200
Message-Id: <1496223628-23127-1-git-send-email-rabin.vincent@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rabin Vincent <rabinv@axis.com>

There currently appears to be no way for userspace to find out the
underlying volume number for a mounted ubifs file system, since ubifs
uses anonymous block devices.  The volume name is present in
/proc/mounts but UBI volumes can be renamed after the volume has been
mounted.

To remedy this, show the UBI number and UBI volume number as part of the
options visible under /proc/mounts.

Also, accept and ignore the ubi= vol= options if they are used mounting
(patch from Richard Weinberger).

 # mount -t ubifs ubi:baz x
 # mount
 ubi:baz on /root/x type ubifs (rw,relatime,ubi=0,vol=2)
 # ubirename /dev/ubi0 baz bazz
 # mount
 ubi:baz on /root/x type ubifs (rw,relatime,ubi=0,vol=2)
 # ubinfo -d 0 -n 2
 Volume ID:   2 (on ubi0)
 Type:        dynamic
 Alignment:   1
 Size:        67 LEBs (1063424 bytes, 1.0 MiB)
 State:       OK
 Name:        bazz
 Character device major/minor: 254:3

Signed-off-by: Rabin Vincent <rabinv@axis.com>
---
v4 - ignore options in mount

 fs/ubifs/super.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index cf4cc99..50cebbe 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -446,6 +446,8 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
 			   ubifs_compr_name(c->mount_opts.compr_type));
 	}
 
+	seq_printf(s, ",ubi=%d,vol=%d", c->vi.ubi_num, c->vi.vol_id);
+
 	return 0;
 }
 
@@ -931,6 +933,7 @@ enum {
 	Opt_chk_data_crc,
 	Opt_no_chk_data_crc,
 	Opt_override_compr,
+	Opt_ignore,
 	Opt_err,
 };
 
@@ -942,6 +945,8 @@ static const match_table_t tokens = {
 	{Opt_chk_data_crc, "chk_data_crc"},
 	{Opt_no_chk_data_crc, "no_chk_data_crc"},
 	{Opt_override_compr, "compr=%s"},
+	{Opt_ignore, "ubi=%s"},
+	{Opt_ignore, "vol=%s"},
 	{Opt_err, NULL},
 };
 
@@ -1042,6 +1047,8 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 			c->default_compr = c->mount_opts.compr_type;
 			break;
 		}
+		case Opt_ignore:
+			break;
 		default:
 		{
 			unsigned long flag;
-- 
2.1.4
