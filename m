Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQOvB-0003IP-Fy
 for linux-mtd@lists.infradead.org; Wed, 19 Mar 2014 22:25:14 +0000
From: Sasha Levin <sasha.levin@oracle.com>
To: shc_work@mail.ru, computersforpeace@gmail.com
Subject: [PATCH] mtd: diskonchip: mem resource name is not optional
Date: Wed, 19 Mar 2014 18:24:37 -0400
Message-Id: <1395267877-15223-1-git-send-email-sasha.levin@oracle.com>
Cc: Sasha Levin <sasha.levin@oracle.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Passing a name to request_mem_region() isn't optional and can't just
be NULL. Passing NULL causes a NULL ptr deref later in the boot
process.

Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
---
 drivers/mtd/nand/diskonchip.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index b9b4db6..f68a7bc 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1439,7 +1439,7 @@ static int __init doc_probe(unsigned long physadr)
 	int reg, len, numchips;
 	int ret = 0;
 
-	if (!request_mem_region(physadr, DOC_IOREMAP_LEN, NULL))
+	if (!request_mem_region(physadr, DOC_IOREMAP_LEN, "DiskOnChip"))
 		return -EBUSY;
 	virtadr = ioremap(physadr, DOC_IOREMAP_LEN);
 	if (!virtadr) {
-- 
1.7.2.5
