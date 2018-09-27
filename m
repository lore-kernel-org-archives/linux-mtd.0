Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5SjX-0006Um-0X
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 09:37:20 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH mtd-utils] mkfs.ubifs: Fix xattr nlink value
Date: Thu, 27 Sep 2018 11:36:43 +0200
Message-Id: <20180927093643.18097-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nlink value of a xattr node must always be one, it has nothing to do
with the nlink value of the inode the attribute belongs to.

The bug can be observed when mounting a mkfs.ubifs generated image which
contains xattrs on directories or files with hardlinks to them. When
mounting such an image with chk_fs = 1 it fails with:

UBIFS error (ubi0:0 pid 1833): dbg_check_filesystem: inode 3308 nlink is 3, but calculated nlink is 1

Another bug that can be triggered is an assertion in
ubifs_xattr_remove() which assures that the xattr i_nlink count should
be one when the xattr is removed.

Fixes: 50044ef ("mkfs.ubifs: Add extended attribute support")

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index f0518b9..845c9f5 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1070,7 +1070,7 @@ static int add_xattr(struct stat *st, ino_t inum, const void *data,
 		goto out;
 
 	ino->creat_sqnum = cpu_to_le64(creat_sqnum);
-	ino->nlink      = cpu_to_le32(st->st_nlink);
+	ino->nlink      = cpu_to_le32(1);
 	/*
 	 * The time fields are updated assuming the default time granularity
 	 * of 1 second. To support finer granularities, utime() would be needed.
-- 
2.19.0
