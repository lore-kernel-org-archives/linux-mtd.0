Received: from m50-135.163.com ([123.125.50.135])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ankAk-0004j9-PW
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2016 09:54:51 +0000
From: zengzhaoxiu@163.com
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>
Subject: [PATCH v2 21/30] mtd: use parity functions in inftlcore
Date: Wed,  6 Apr 2016 17:53:54 +0800
Message-Id: <1459936434-8006-1-git-send-email-zengzhaoxiu@163.com>
In-Reply-To: <57031D9D.801@gmail.com>
References: <57031D9D.801@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>

Signed-off-by: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>
---
 drivers/mtd/inftlcore.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index b66b541..8c9457b 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -457,15 +457,6 @@ static u16 INFTL_makefreeblock(struct INFTLrecord *inftl, unsigned pendingblock)
 	return INFTL_foldchain(inftl, LongestChain, pendingblock);
 }
 
-static int nrbits(unsigned int val, int bitcount)
-{
-	int i, total = 0;
-
-	for (i = 0; (i < bitcount); i++)
-		total += (((0x1 << i) & val) ? 1 : 0);
-	return total;
-}
-
 /*
  * INFTL_findwriteunit: Return the unit number into which we can write
  *                      for this block. Make it available if it isn't already.
@@ -593,10 +584,10 @@ hitused:
 		if (prev_block < inftl->nb_blocks)
 			prev_block -= inftl->firstEUN;
 
-		parity = (nrbits(thisVUC, 16) & 0x1) ? 0x1 : 0;
-		parity |= (nrbits(prev_block, 16) & 0x1) ? 0x2 : 0;
-		parity |= (nrbits(anac, 8) & 0x1) ? 0x4 : 0;
-		parity |= (nrbits(nacs, 8) & 0x1) ? 0x8 : 0;
+		parity  = parity16(thisVUC);
+		parity |= parity16(prev_block) << 1;
+		parity |= parity8(anac) << 2;
+		parity |= parity8(nacs) << 3;
 
 		oob.u.a.virtualUnitNo = cpu_to_le16(thisVUC);
 		oob.u.a.prevUnitNo = cpu_to_le16(prev_block);
-- 
2.5.0
