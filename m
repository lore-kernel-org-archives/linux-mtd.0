Received: from mail-pa0-f52.google.com ([209.85.220.52])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WwRjg-0000OO-4a
 for linux-mtd@lists.infradead.org; Mon, 16 Jun 2014 07:53:48 +0000
Received: by mail-pa0-f52.google.com with SMTP id eu11so4232392pac.39
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2014 00:53:23 -0700 (PDT)
From: Kevin Hao <haokexin@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd/ftl: drop the useless VirtualPageMap in partition_t
Date: Mon, 16 Jun 2014 15:52:36 +0800
Message-Id: <1402905157-10330-2-git-send-email-haokexin@gmail.com>
In-Reply-To: <1402905157-10330-1-git-send-email-haokexin@gmail.com>
References: <1402905157-10330-1-git-send-email-haokexin@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is not used by any code now. Just drop it.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/mtd/ftl.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 19d637266fcd..71f2782f03fc 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -111,7 +111,6 @@ typedef struct partition_t {
     struct mtd_blktrans_dev mbd;
     uint32_t		state;
     uint32_t		*VirtualBlockMap;
-    uint32_t		*VirtualPageMap;
     uint32_t		FreeTotal;
     struct eun_info_t {
 	uint32_t		Offset;
@@ -1035,8 +1034,6 @@ static void ftl_freepart(partition_t *part)
 {
 	vfree(part->VirtualBlockMap);
 	part->VirtualBlockMap = NULL;
-	kfree(part->VirtualPageMap);
-	part->VirtualPageMap = NULL;
 	kfree(part->EUNInfo);
 	part->EUNInfo = NULL;
 	kfree(part->XferInfo);
-- 
1.9.3
