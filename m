Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxTDS-000647-Qd
 for linux-mtd@lists.infradead.org; Mon, 10 Apr 2017 06:54:25 +0000
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v1 1/3] UBIFS: parse iversion mount option
Date: Mon, 10 Apr 2017 08:53:44 +0200
Message-Id: <20170410065346.1992-1-o.rempel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Steffen Trumtrar <s.trumtrar@pengutronix.de>

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 fs/ubifs/super.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b73811bd7676..61180bee38b4 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -931,6 +931,7 @@ enum {
 	Opt_chk_data_crc,
 	Opt_no_chk_data_crc,
 	Opt_override_compr,
+	Opt_i_version,
 	Opt_err,
 };
 
@@ -942,6 +943,7 @@ static const match_table_t tokens = {
 	{Opt_chk_data_crc, "chk_data_crc"},
 	{Opt_no_chk_data_crc, "no_chk_data_crc"},
 	{Opt_override_compr, "compr=%s"},
+	{Opt_i_version, "iversion"},
 	{Opt_err, NULL},
 };
 
@@ -986,6 +988,8 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 		return 0;
 
 	while ((p = strsep(&options, ","))) {
+		struct super_block *sb = c->vfs_sb;
+		unsigned long flag;
 		int token;
 
 		if (!*p)
@@ -1042,11 +1046,11 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 			c->default_compr = c->mount_opts.compr_type;
 			break;
 		}
+		case Opt_i_version:
+			sb->s_flags |= MS_I_VERSION;
+			break;
 		default:
 		{
-			unsigned long flag;
-			struct super_block *sb = c->vfs_sb;
-
 			flag = parse_standard_option(p);
 			if (!flag) {
 				ubifs_err(c, "unrecognized mount option \"%s\" or missing value",
-- 
2.11.0
