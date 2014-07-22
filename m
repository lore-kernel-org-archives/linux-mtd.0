Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9PUN-0007CK-U6
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:07:36 +0000
Received: by mail-pd0-f172.google.com with SMTP id ft15so10208440pdb.17
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:07:15 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: sm_ftl: initialize error code
Date: Mon, 21 Jul 2014 19:06:39 -0700
Message-Id: <1405994799-19298-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is one theoretical case that could fall through to using an
uninitialized value as the return code. Let's give it a value of 0.

Untested.

Caught by Coverity.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/sm_ftl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index cf49c22673b9..c23184a47fc4 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -1058,7 +1058,7 @@ static int sm_write(struct mtd_blktrans_dev *dev,
 {
 	struct sm_ftl *ftl = dev->priv;
 	struct ftl_zone *zone;
-	int error, zone_num, block, boffset;
+	int error = 0, zone_num, block, boffset;
 
 	BUG_ON(ftl->readonly);
 	sm_break_offset(ftl, sec_no << 9, &zone_num, &block, &boffset);
-- 
1.9.1
