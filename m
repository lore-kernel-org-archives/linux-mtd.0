Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxsSQ-0006Vi-Qp
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 09:51:32 +0000
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v2 1/3] fs: ubifs: parse iversion mount option
Date: Tue, 11 Apr 2017 11:50:53 +0200
Message-Id: <20170411095055.26328-2-o.rempel@pengutronix.de>
In-Reply-To: <20170411095055.26328-1-o.rempel@pengutronix.de>
References: <20170411095055.26328-1-o.rempel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Steffen Trumtrar <s.trumtrar@pengutronix.de>

this option is needed to make UBIFS work with IMA.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 fs/ubifs/super.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b73811bd7676..bff1e8d6f7bd 100644
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
+	{Opt_i_version, "i_version"},
 	{Opt_err, NULL},
 };
 
@@ -986,6 +988,7 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 		return 0;
 
 	while ((p = strsep(&options, ","))) {
+		struct super_block *sb = c->vfs_sb;
 		int token;
 
 		if (!*p)
@@ -1042,10 +1045,12 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 			c->default_compr = c->mount_opts.compr_type;
 			break;
 		}
+		case Opt_i_version:
+			sb->s_flags |= MS_I_VERSION;
+			break;
 		default:
 		{
 			unsigned long flag;
-			struct super_block *sb = c->vfs_sb;
 
 			flag = parse_standard_option(p);
 			if (!flag) {
-- 
2.11.0
