Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e70o9-0003IK-9z
 for linux-mtd@lists.infradead.org; Tue, 24 Oct 2017 15:07:58 +0000
Received: by mail-pg0-x243.google.com with SMTP id y5so6933087pgq.7
 for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2017 08:07:36 -0700 (PDT)
From: Pavel Roskin <plroskin@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH] mkfs.ubifs: ignore EOPNOTSUPP when listing extended attributes
Date: Tue, 24 Oct 2017 08:07:30 -0700
Message-Id: <20171024150730.5787-1-plroskin@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Systems that don't support extended attributes should still be able to
create ubifs images.

Signed-off-by: Pavel Roskin <plroskin@gmail.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index d432dfe..c916f48 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1128,7 +1128,7 @@ static int inode_add_xattr(struct ubifs_ino_node *host_ino,
 
 	len = llistxattr(path_name, NULL, 0);
 	if (len < 0) {
-		if (errno == ENOENT)
+		if (errno == ENOENT || errno == EOPNOTSUPP)
 			return 0;
 
 		sys_err_msg("llistxattr failed on %s", path_name);
-- 
2.14.2
