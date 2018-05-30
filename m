Received: from mail1.bemta8.messagelabs.com ([216.82.243.202])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNxTr-0007Mw-Tv
 for linux-mtd@lists.infradead.org; Wed, 30 May 2018 09:33:35 +0000
From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Tokunori Ikegami <ikegami@allied-telesis.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: [PATCH v8 2/5] mtd: cfi_cmdset_0002: Change definition naming to
 retry write operation
Date: Wed, 30 May 2018 18:32:27 +0900
Message-Id: <20180530093230.3240-3-ikegami@allied-telesis.co.jp>
In-Reply-To: <20180530093230.3240-1-ikegami@allied-telesis.co.jp>
References: <20180530093230.3240-1-ikegami@allied-telesis.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The definition can be used for other program and erase operations also.
So change the naming to MAX_RETRIES from MAX_WORD_RETRIES.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
---
Changes since v7:
- None.

Changes since v6:
- Change Cc: Joakim Tjernlund tag as Reviewed-by: tag.
- Add Cc: stable tag.

Changes since v5:
- No change for this patch.

Changes since v4:
- No change for this patch.

Changes since v3:
- The patch series are just rebased since the coding style fix has been applied.

Changes since v2:
- Change the definition naming to MAX_RETRIES from MAX_WRITE_RETRIES.

Changes since v1:
- Just split the change from the v1 patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 1d6be8c63d39..0b67f90415fd 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -42,7 +42,7 @@
 #define AMD_BOOTLOC_BUG
 #define FORCE_WORD_WRITE 0
 
-#define MAX_WORD_RETRIES 3
+#define MAX_RETRIES 3
 
 #define SST49LF004B		0x0060
 #define SST49LF040B		0x0050
@@ -1646,7 +1646,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_WORD_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES)
 			goto retry;
 
 		ret = -EIO;
@@ -2105,7 +2105,7 @@ static int do_panic_write_oneword(struct map_info *map, struct flchip *chip,
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_WORD_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES)
 			goto retry;
 
 		ret = -EIO;
-- 
2.16.1
