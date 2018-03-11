Received: from mx2.mailbox.org ([80.241.60.215])
 by merlin.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ev3Tc-0001iB-Eh
 for linux-mtd@lists.infradead.org; Sun, 11 Mar 2018 16:05:37 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: richard@nod.at,
	dedekind1@gmail.com,
	adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org,
	Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH] ubifs: Add option to create UBI FS version 4 on empty UBI
 volume
Date: Sun, 11 Mar 2018 17:04:51 +0100
Message-Id: <20180311160451.26833-1-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of creating an ubifs file system with format version 5 by
default on empty UBI volumes add a compile option to create an older ubi
with file system format version 4 instated. This allows it to be mount
as a volume on kernel versions < 4.10, which does not support format
version 5.
We saw that some people can not access their older data when they
downgraded from kernel 4.14 to kernel 4.9 to prevent this this option
would help.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 fs/ubifs/Kconfig | 13 +++++++++++++
 fs/ubifs/sb.c    |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 83a961bf7280..a1426b865726 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -74,3 +74,16 @@ config UBIFS_FS_SECURITY
 	  the extended attribute support in advance.
 
 	  If you are not using a security module, say N.
+
+config UBIFS_FS_FORMAT4
+	bool "Use file system format version 4 for new file systems"
+	depends on UBIFS_FS
+	help
+	  Instead of creating new file systems with the new ubifs file
+	  system version 5, use the old format version 4 for implicitly
+	  by the driver created file systems on an empty UBI volume. This
+	  makes it possible to  mount these file systems also with kernel
+	  versions before 4.10. The driver will still support file system
+	  format version 5 for ubifs file systems created with version 5.
+
+	  If you are unsure, say N.
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 8c25081a5109..6e8b6cccda6b 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -165,7 +165,9 @@ static int create_default_filesystem(struct ubifs_info *c)
 	tmp64 = (long long)max_buds * c->leb_size;
 	if (big_lpt)
 		sup_flags |= UBIFS_FLG_BIGLPT;
+#ifndef CONFIG_UBIFS_FS_FORMAT4
 	sup_flags |= UBIFS_FLG_DOUBLE_HASH;
+#endif
 
 	sup->ch.node_type  = UBIFS_SB_NODE;
 	sup->key_hash      = UBIFS_KEY_HASH_R5;
@@ -181,7 +183,11 @@ static int create_default_filesystem(struct ubifs_info *c)
 	sup->jhead_cnt     = cpu_to_le32(DEFAULT_JHEADS_CNT);
 	sup->fanout        = cpu_to_le32(DEFAULT_FANOUT);
 	sup->lsave_cnt     = cpu_to_le32(c->lsave_cnt);
+#ifdef CONFIG_UBIFS_FS_FORMAT4
+	sup->fmt_version   = cpu_to_le32(4);
+#else
 	sup->fmt_version   = cpu_to_le32(UBIFS_FORMAT_VERSION);
+#endif
 	sup->time_gran     = cpu_to_le32(DEFAULT_TIME_GRAN);
 	if (c->mount_opts.override_compr)
 		sup->default_compr = cpu_to_le16(c->mount_opts.compr_type);
-- 
2.11.0
