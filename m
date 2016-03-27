Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ak5DC-0001VE-Sv
 for linux-mtd@lists.infradead.org; Sun, 27 Mar 2016 07:34:15 +0000
Received: by mail-pa0-x242.google.com with SMTP id hj7so11423847pac.1
 for <linux-mtd@lists.infradead.org>; Sun, 27 Mar 2016 00:33:54 -0700 (PDT)
Subject: [PATCH 24/31] mtd: use parity16 in sm_ftl.c
References: <1458788612-4367-1-git-send-email-zhaoxiu.zeng@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
From: "zhaoxiu.zeng" <zhaoxiu.zeng@gmail.com>
Message-ID: <56F78CC5.9010503@gmail.com>
Date: Sun, 27 Mar 2016 15:33:26 +0800
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
 drivers/mtd/sm_ftl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index b096f8b..2244588 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -136,7 +136,7 @@ static int sm_get_lba(uint8_t *lba)
 		return -2;
 
 	/* check parity - endianness doesn't matter */
-	if (hweight16(*(uint16_t *)lba) & 1)
+	if (parity16(*(uint16_t *)lba))
 		return -2;
 
 	return (lba[1] >> 1) | ((lba[0] & 0x07) << 7);
@@ -183,7 +183,7 @@ static void sm_write_lba(struct sm_oob *oob, uint16_t lba)
 	tmp[0] = 0x10 | ((lba >> 7) & 0x07);
 	tmp[1] = (lba << 1) & 0xFF;
 
-	if (hweight16(*(uint16_t *)tmp) & 0x01)
+	if (parity16(*(uint16_t *)tmp))
 		tmp[1] |= 1;
 
 	oob->lba_copy1[0] = oob->lba_copy2[0] = tmp[0];
-- 
2.5.5
