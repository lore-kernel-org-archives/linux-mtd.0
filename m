Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P10hZ-0000gv-1Q
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 17:44:23 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] mtd/nand: use ALIGN where possible
Date: Wed, 29 Sep 2010 19:43:50 +0200
Message-Id: <1285782234-32509-2-git-send-email-bigeasy@linutronix.de>
In-Reply-To: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
Cc: tglx@linutronix.de, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/nand/nand_bbt.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 5fedf4a..a2a4e17 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -737,8 +737,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			/* Calc length */
 			len = (size_t) (numblocks >> sft);
 			/* Make it page aligned ! */
-			len = (len + (mtd->writesize - 1)) &
-				~(mtd->writesize - 1);
+			len = ALIGN(len, mtd->writesize);
 			/* Preset the buffer with 0xff */
 			memset(buf, 0xff, len +
 			       (len >> this->page_shift)* mtd->oobsize);
-- 
1.7.2.3
