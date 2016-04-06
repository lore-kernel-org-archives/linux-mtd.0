Received: from m50-134.163.com ([123.125.50.134])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ankMJ-0004kb-NH
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2016 10:06:49 +0000
From: zengzhaoxiu@163.com
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>
Subject: [PATCH v2 23/30] mtd: use parity16 in sm_ftl
Date: Wed,  6 Apr 2016 18:05:47 +0800
Message-Id: <1459937147-8173-1-git-send-email-zengzhaoxiu@163.com>
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
 drivers/mtd/sm_ftl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index b096f8b..345ff1a 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -136,7 +136,7 @@ static int sm_get_lba(uint8_t *lba)
 		return -2;
 
 	/* check parity - endianness doesn't matter */
-	if (hweight16(*(uint16_t *)lba) & 1)
+	if (parity16(*(uint16_t *)lba))
 		return -2;
 
 	return (lba[1] >> 1) | ((lba[0] & 0x07) << 7);
@@ -183,8 +183,7 @@ static void sm_write_lba(struct sm_oob *oob, uint16_t lba)
 	tmp[0] = 0x10 | ((lba >> 7) & 0x07);
 	tmp[1] = (lba << 1) & 0xFF;
 
-	if (hweight16(*(uint16_t *)tmp) & 0x01)
-		tmp[1] |= 1;
+	tmp[1] |= parity16(*(uint16_t *)tmp);
 
 	oob->lba_copy1[0] = oob->lba_copy2[0] = tmp[0];
 	oob->lba_copy1[1] = oob->lba_copy2[1] = tmp[1];
-- 
2.5.0
