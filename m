Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RZ6OW-0006Ul-6j
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2011 19:46:08 +0000
Received: by iaby26 with SMTP id y26so5563343iab.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Dec 2011 11:46:06 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] libmtd: allow write operations when MEMWRITE is not supported
Date: Fri,  9 Dec 2011 11:45:14 -0800
Message-Id: <1323459914-25294-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MEMWRITE is a recently introduced write interface for MTD; however, it
is, for now, only supported on NAND flash. mtd-utils should fall back to
old write methods when either ENOTTY or EOPNOTSUPP are returned.

This is a showstopper when, for instance, using ubiformat on NOR, which
don't have a mtd->write_oob interface (and thus don't support MEMWRITE):

  ubiformat: formatting eraseblock 2 --  1 % complete  libmtd: error!: MEMWRITE ioctl failed for eraseblock 2 (mtd3)
          error 122 (Operation not supported)

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 lib/libmtd.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 1b16de5..9b247ae 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -1151,7 +1151,7 @@ int mtd_write(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb,
 	ret = ioctl(fd, MEMWRITE, &ops);
 	if (ret == 0)
 		return 0;
-	else if (errno != ENOTTY)
+	else if (errno != ENOTTY && errno != EOPNOTSUPP)
 		return mtd_ioctl_error(mtd, eb, "MEMWRITE");
 
 	/* Fall back to old methods if necessary */
-- 
1.7.5.4
