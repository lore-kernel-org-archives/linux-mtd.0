Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gW2dE-0003Di-CG
 for linux-mtd@lists.infradead.org; Sun, 09 Dec 2018 17:12:41 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: richard@nod.at,
	dedekind1@gmail.com,
	adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, hauke@hauke-m.de,
 Gabor Juhos <juhosg@openwrt.org>
Subject: [PATCH] ubifs: fix default compression selection in ubifs
Date: Sun,  9 Dec 2018 18:12:13 +0100
Message-Id: <20181209171213.26264-1-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Gabor Juhos <juhosg@openwrt.org>

When ubifs is build without the LZO compressor and no compressor is
given the creation of the default file system will fail. before
selection the LZO compressor check if it is present and if not fall back
to the zlib or none.

Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 fs/ubifs/sb.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 75a69dd26d6e..3da90c951c23 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -63,6 +63,17 @@
 /* Default time granularity in nanoseconds */
 #define DEFAULT_TIME_GRAN 1000000000
 
+static int get_default_compressor(struct ubifs_info *c)
+{
+	if (ubifs_compr_present(c, UBIFS_COMPR_LZO))
+		return UBIFS_COMPR_LZO;
+
+	if (ubifs_compr_present(c, UBIFS_COMPR_ZLIB))
+		return UBIFS_COMPR_ZLIB;
+
+	return UBIFS_COMPR_NONE;
+}
+
 /**
  * create_default_filesystem - format empty UBI volume.
  * @c: UBIFS file-system description object
@@ -207,7 +218,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 	if (c->mount_opts.override_compr)
 		sup->default_compr = cpu_to_le16(c->mount_opts.compr_type);
 	else
-		sup->default_compr = cpu_to_le16(UBIFS_COMPR_LZO);
+		sup->default_compr = cpu_to_le16(get_default_compressor(c));
 
 	generate_random_uuid(sup->uuid);
 
-- 
2.11.0
