Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEf6r-0001ZA-AB
 for linux-mtd@lists.infradead.org; Thu, 31 Dec 2015 15:25:50 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH] mtd: tests: consolidate kmalloc/memset 0 call to kzalloc
Date: Thu, 31 Dec 2015 16:21:22 +0100
Message-Id: <1451575282-27169-1-git-send-email-hofrat@osadl.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an API consolidation only. The use of kmalloc + memset to 0
is equivalent to kzalloc.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

Found by coccinelle script (relaxed version of
scripts/coccinelle/api/alloc/kzalloc-simple.cocci)

Patch was compile tested with: nhk8815_defconfig
(implies CONFIG_MTD_TESTS=m)

Patch is against linux-next (localversion-next is -next-20151231)

 drivers/mtd/tests/pagetest.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index ba1890d..ff1e056 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -127,13 +127,12 @@ static int crosstest(void)
 	unsigned char *pp1, *pp2, *pp3, *pp4;
 
 	pr_info("crosstest\n");
-	pp1 = kmalloc(pgsize * 4, GFP_KERNEL);
+	pp1 = kzalloc(pgsize * 4, GFP_KERNEL);
 	if (!pp1)
 		return -ENOMEM;
 	pp2 = pp1 + pgsize;
 	pp3 = pp2 + pgsize;
 	pp4 = pp3 + pgsize;
-	memset(pp1, 0, pgsize * 4);
 
 	addr0 = 0;
 	for (i = 0; i < ebcnt && bbt[i]; ++i)
-- 
2.1.4
