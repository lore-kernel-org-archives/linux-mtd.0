Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvF3W-0000Ic-KR
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 21:27:59 +0000
Received: by dakp5 with SMTP id p5so1010268dak.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 13:27:55 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/3] libmtd: perform device checking first
Date: Wed,  8 Feb 2012 13:26:20 -0800
Message-Id: <1328736382-5798-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Foster <brian.foster@maxim-ic.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If we don't check for the MTD before calling `legacy_get_dev_info1', we may
get errors like:

libmtd: MTD subsystem is old and does not support sysfs, so MTD character device nodes have to exist
libmtd: error!: "/dev/mtd2" is not a character device
mtdinfo: error!: libmtd failed get MTD device 2 information
         error 22 (Invalid argument)

So reverse the order of these two checks.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 lib/libmtd.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index ecf182f..2bb4e57 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -733,12 +733,11 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
 	memset(mtd, 0, sizeof(struct mtd_dev_info));
 	mtd->mtd_num = mtd_num;
 
-	if (!lib->sysfs_supported)
-		return legacy_get_dev_info1(mtd_num, mtd);
-	else if (!mtd_dev_present(desc, mtd_num)) {
+	if (!mtd_dev_present(desc, mtd_num)) {
 		errno = ENODEV;
 		return -1;
-	}
+	} else if (!lib->sysfs_supported)
+		return legacy_get_dev_info1(mtd_num, mtd);
 
 	if (dev_get_major(lib, mtd_num, &mtd->major, &mtd->minor))
 		return -1;
-- 
1.7.5.4
