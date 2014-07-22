Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9PVV-0008VB-9u
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:08:45 +0000
Received: by mail-pa0-f54.google.com with SMTP id fa1so10879722pad.41
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:08:24 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: terminate user-provided string
Date: Mon, 21 Jul 2014 19:08:13 -0700
Message-Id: <1405994893-19649-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Noticed by Coverity as a potential security issue.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Untested for now. Maybe I'll scrape together a test before applying, then it'd
be worth sending -stable.

 drivers/mtd/mtdchar.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index a0f54e80670c..53563955931b 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -549,6 +549,9 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
 		if (mtd_is_partition(mtd))
 			return -EINVAL;
 
+		/* Sanitize user input */
+		p.devname[BLKPG_DEVNAMELTH - 1] = '\0';
+
 		return mtd_add_partition(mtd, p.devname, p.start, p.length);
 
 	case BLKPG_DEL_PARTITION:
-- 
1.9.1
