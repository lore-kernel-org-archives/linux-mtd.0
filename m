Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z62cb-0002EI-01
 for linux-mtd@lists.infradead.org; Fri, 19 Jun 2015 20:10:42 +0000
Received: by pdjn11 with SMTP id n11so97333393pdj.0
 for <linux-mtd@lists.infradead.org>; Fri, 19 Jun 2015 13:10:15 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: cmdlinepart: allow small partitions
Date: Fri, 19 Jun 2015 13:10:06 -0700
Message-Id: <1434744607-26621-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm not sure why we have a PAGE_SIZE restriction on this partition
parser.

If we really wanted the restriction, I would expect it to be a
restriction for *all* parsers, so we'd move it to the MTD core

At any rate, while small partitions may not be useful (they'll often be
smaller than the eraseblock size and therefore can only be used
read-only), they still have use as a read-only partition.

This restriction is especially annoying because it aborts the entire
MTD's cmdline parsing, leaving it unpartitioned.

So, let's kill the restriction and only check for zero-sized partitions,
which I expect we don't want to allow.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Anyone know a good reason why this restriction should be here?

 drivers/mtd/cmdlinepart.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index c8503006f17a..477923a8b86f 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -115,9 +115,8 @@ static struct mtd_partition * newpart(char *s,
 		s++;
 	} else {
 		size = memparse(s, &s);
-		if (size < PAGE_SIZE) {
-			printk(KERN_ERR ERRP "partition size too small (%llx)\n",
-			       size);
+		if (!size) {
+			printk(KERN_ERR ERRP "partition has size 0\n");
 			return ERR_PTR(-EINVAL);
 		}
 	}
-- 
1.9.1
