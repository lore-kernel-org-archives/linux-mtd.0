Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WRFhI-0004Ta-5T
 for linux-mtd@lists.infradead.org; Sat, 22 Mar 2014 06:46:24 +0000
Received: by mail-pd0-f180.google.com with SMTP id v10so3216518pde.25
 for <linux-mtd@lists.infradead.org>; Fri, 21 Mar 2014 23:46:02 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mkfs.ubifs: correct and improve LEB size error prints
Date: Fri, 21 Mar 2014 23:45:44 -0700
Message-Id: <1395470744-7281-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The error message is incorrect for "too small LEB size" -- we were
printing the minimum I/O size instead of the LEB size.

At the same time, let's print the max LEB size along with the message
for "too large LEB size", to be consistent and more helpful.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 mkfs.ubifs/mkfs.ubifs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index f9977bcad73f..200c8a5007e4 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -352,13 +352,14 @@ static int validate_options(void)
 		return err_msg("min. I/O unit cannot be larger than LEB size");
 	if (c->leb_size < UBIFS_MIN_LEB_SZ)
 		return err_msg("too small LEB size %d, minimum is %d",
-			       c->min_io_size, UBIFS_MIN_LEB_SZ);
+			       c->leb_size, UBIFS_MIN_LEB_SZ);
 	if (c->leb_size % c->min_io_size)
 		return err_msg("LEB should be multiple of min. I/O units");
 	if (c->leb_size % 8)
 		return err_msg("LEB size has to be multiple of 8");
 	if (c->leb_size > UBIFS_MAX_LEB_SZ)
-		return err_msg("too large LEB size %d", c->leb_size);
+		return err_msg("too large LEB size %d, maximum is %d",
+				c->leb_size, UBIFS_MAX_LEB_SZ);
 	if (c->max_leb_cnt < UBIFS_MIN_LEB_CNT)
 		return err_msg("too low max. count of LEBs, minimum is %d",
 			       UBIFS_MIN_LEB_CNT);
-- 
1.8.3.2
