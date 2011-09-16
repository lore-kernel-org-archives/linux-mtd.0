Received: from blu0-omc1-s5.blu0.hotmail.com ([65.55.116.16])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R4fL8-00062U-OX
	for linux-mtd@lists.infradead.org; Fri, 16 Sep 2011 20:48:51 +0000
Message-ID: <BLU0-SMTP394611D4685CA5AE953006B8060@phx.gbl>
From: Bill Pringlemeir <bpringle@sympatico.ca>
To: linux-mtd@lists.infradead.org
Subject: RomFS MTD and NAND Flash with ECC (EUCLEAN).
Date: Fri, 16 Sep 2011 16:46:57 -0400
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-=-=
Content-Type: text/plain


The macro ROMFS_MTD_READ seems to be passing on 'EUCLEAN' to the main
RomFs code which doesn't deal with this error code.  I think that the
'EUCLEAN' means that my 'mxc_nand' flash driver has performed error
correction.  I also see that most of the mtd tests change this error
code to mean zero.  So I think the RomFs MTD code needs something like
attached.  A large file allows md5sum, cp, etc with this patch.
Without, strace shows 'cp' getting an 'EIO' error and giving up.

Signed-off-by: Bill Pringlemeir <bpringle@sympatico.ca>

--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
	filename="0001-Fix-romfs-when-using-an-NAND-flash-MTD.patch"
Content-Description: romfs/storage.c patch

>From 349cf90c20c7eabb6a9b215d68ea9c064e55460e Mon Sep 17 00:00:00 2001
From: Bill Pringlemeir <bpringle@sympatico.ca>
Date: Fri, 16 Sep 2011 16:29:41 -0400
Subject: [PATCH] Fix romfs when using an NAND flash MTD.

The code '-EUCLEAN' is returned when an NAND mtd has used ECC to
correct data.  This is fine for the reader of the RomFs and their
data is correct.
---
 fs/romfs/storage.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/romfs/storage.c b/fs/romfs/storage.c
index 71e2b4d..4105d1c 100644
--- a/fs/romfs/storage.c
+++ b/fs/romfs/storage.c
@@ -19,8 +19,10 @@
 #endif
 
 #ifdef CONFIG_ROMFS_ON_MTD
-#define ROMFS_MTD_READ(sb, ...) ((sb)->s_mtd->read((sb)->s_mtd, ##__VA_ARGS__))
-
+#define ROMFS_MTD_READ(sb, ...)                                        \
+    ({ int res;                                                        \
+        res = ((sb)->s_mtd->read((sb)->s_mtd, ##__VA_ARGS__)) == -EUCLEAN ? \
+            0 : res; })                                                         
 /*
  * read data from an romfs image on an MTD device
  */
-- 
1.7.0.4


--=-=-=--
