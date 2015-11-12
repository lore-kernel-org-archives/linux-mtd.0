Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwg3u-0005Rp-H9
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 00:48:27 +0000
Received: by pasz6 with SMTP id z6so47895781pas.2
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 16:48:05 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: zero out mtd_partion struct before using it
Date: Wed, 11 Nov 2015 16:47:52 -0800
Message-Id: <1447289272-131828-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's easier to guarantee we've cleared out all unused fields with
memset() than by manually initializing each field.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
I hit this while testing out the added 'of_node' field:

  http://patchwork.ozlabs.org/patch/538838/

 drivers/mtd/mtdpart.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c2b6e967a160..3ace53342fd2 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -597,11 +597,10 @@ int mtd_add_partition(struct mtd_info *master, const char *name,
 	if (length <= 0)
 		return -EINVAL;
 
+	memset(&part, 0, sizeof(part));
 	part.name = name;
 	part.size = length;
 	part.offset = offset;
-	part.mask_flags = 0;
-	part.ecclayout = NULL;
 
 	new = allocate_partition(master, &part, -1, offset);
 	if (IS_ERR(new))
-- 
2.6.0.rc2.230.g3dd15c0
