Received: from mail1.bemta23.messagelabs.com ([67.219.246.5])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDY4E-0007F3-MY
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 16:56:42 +0000
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: boris.brezillon@free-electrons.com
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Fabio Bettoni <fbettoni@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 08/10] mtd: cfi_cmdset_0002: Remove retry goto statement
 from do_write_oneword()
Date: Sat, 20 Oct 2018 01:55:24 +0900
Message-Id: <20181019165526.11159-9-ikegami@allied-telesis.co.jp>
In-Reply-To: <20181019165526.11159-1-ikegami@allied-telesis.co.jp>
References: <20181019165526.11159-1-ikegami@allied-telesis.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is just to refactor the function by removing the goto statement.
Change to use the for loop instead of the goto statement.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index e97b1f390fc8..b8f94f47d07c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1664,21 +1664,17 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
- retry:
-	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
+	for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
+		ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
+
+		/* Did we succeed? */
+		if (!ret)
+			break;
 
-	/* Did we succeed? */
-	if (ret) {
 		/* reset on all failures. */
 		map_write(map, CMD(0xF0), chip->start);
-		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES) {
-			ret = 0;
-			goto retry;
-		}
-
-		ret = -EIO;
+		/* FIXME - should have reset delay before continuing */
 	}
 
 	xip_enable(map, chip, adr);
-- 
2.18.0
