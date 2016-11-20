Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8Tkq-0004W3-CI
 for linux-mtd@lists.infradead.org; Sun, 20 Nov 2016 15:10:05 +0000
Received: by mail-wm0-x243.google.com with SMTP id m203so19743108wma.3
 for <linux-mtd@lists.infradead.org>; Sun, 20 Nov 2016 07:09:44 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: bcm47xxpart: fix parsing first block after aligned TRX
Date: Sun, 20 Nov 2016 16:09:30 +0100
Message-Id: <20161120150930.25401-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

After parsing TRX we should skip to the first block placed behind it.
Our code was working only with TRX with length not aligned to the
blocksize. In other cases (length aligned) it was missing the block
places right after TRX.

This fixes calculation and simplifies the comment.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/bcm47xxpart.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 3779475..283ff7e 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -229,12 +229,10 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 
 			last_trx_part = curr_part - 1;
 
-			/*
-			 * We have whole TRX scanned, skip to the next part. Use
-			 * roundown (not roundup), as the loop will increase
-			 * offset in next step.
-			 */
-			offset = rounddown(offset + trx->length, blocksize);
+			/* Jump to the end of TRX */
+			offset = roundup(offset + trx->length, blocksize);
+			/* Next loop iteration will increase the offset */
+			offset -= blocksize;
 			continue;
 		}
 
-- 
2.10.1
