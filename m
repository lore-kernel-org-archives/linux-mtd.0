Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3Gdu-0006of-48
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2013 02:23:31 +0000
Received: by mail-pb0-f46.google.com with SMTP id rq8so3408527pbb.33
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2013 19:23:08 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/6] mtd: nandsim: use kasprintf()
Date: Sun, 28 Jul 2013 11:21:54 +0900
Message-Id: <1374978118-11418-2-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1374978118-11418-1-git-send-email-akinobu.mita@gmail.com>
References: <1374978118-11418-1-git-send-email-akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use kasprintf() which combines kmalloc and sprintf.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/nandsim.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index a73dce0..ac1b46c 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -654,9 +654,7 @@ static void free_device(struct nandsim *ns)
 
 static char *get_partition_name(int i)
 {
-	char buf[64];
-	sprintf(buf, "NAND simulator partition %d", i);
-	return kstrdup(buf, GFP_KERNEL);
+	return kasprintf(GFP_KERNEL, "NAND simulator partition %d", i);
 }
 
 /*
-- 
1.8.3.1
