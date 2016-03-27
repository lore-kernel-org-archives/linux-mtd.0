Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ak57T-0007Dr-99
 for linux-mtd@lists.infradead.org; Sun, 27 Mar 2016 07:28:19 +0000
Received: by mail-pf0-x241.google.com with SMTP id u190so16664412pfb.2
 for <linux-mtd@lists.infradead.org>; Sun, 27 Mar 2016 00:27:58 -0700 (PDT)
Subject: [PATCH 22/31] mtd: use parity functions in inftlcore.c
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <1458788612-4367-1-git-send-email-zhaoxiu.zeng@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
From: "zhaoxiu.zeng" <zhaoxiu.zeng@gmail.com>
Message-ID: <56F78B63.3050805@gmail.com>
Date: Sun, 27 Mar 2016 15:27:31 +0800
MIME-Version: 1.0
In-Reply-To: <1458788612-4367-1-git-send-email-zhaoxiu.zeng@gmail.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>

Signed-off-by: Zeng Zhaoxiu <zhaoxiu.zeng@gmail.com>
---
 drivers/mtd/inftlcore.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index b66b541..29567bb 100644
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
+		parity = parity16(thisVUC);
+		parity |= parity16(prev_block) << 1;
+		parity |= parity8(anac) << 2;
+		parity |= parity8(nacs) << 3;
 
 		oob.u.a.virtualUnitNo = cpu_to_le16(thisVUC);
 		oob.u.a.prevUnitNo = cpu_to_le16(prev_block);
-- 
2.5.5
