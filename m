Received: from m50-133.163.com ([123.125.50.133])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0QM4-0002bB-OK
 for linux-mtd@lists.infradead.org; Wed, 11 May 2016 09:22:57 +0000
From: zengzhaoxiu@163.com
To: linux-kernel@vger.kernel.org,
	computersforpeace@gmail.com
Cc: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: [patch V4 22/31] mtd: use parity16 in sm_ftl
Date: Wed, 11 May 2016 17:22:03 +0800
Message-Id: <1462958523-25706-1-git-send-email-zengzhaoxiu@163.com>
In-Reply-To: <1462955158-28394-1-git-send-email-zengzhaoxiu@163.com>
References: <1462955158-28394-1-git-send-email-zengzhaoxiu@163.com>
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
2.7.4
