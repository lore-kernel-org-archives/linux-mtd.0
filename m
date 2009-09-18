Message-Id: <200909181951.n8IJpoN4023827@imap1.linux-foundation.org>
Subject: [patch 10/13] mtd: prevent a read from eraseregions[-1]
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Fri, 18 Sep 2009 12:51:49 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: roel.kluin@gmail.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roel Kluin <roel.kluin@gmail.com>

If the erase region was found in the first iteration we read from
eraseregions[-1]

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/mtdconcat.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -puN drivers/mtd/mtdconcat.c~mtd-prevent-a-read-from-eraseregions drivers/mtd/mtdconcat.c
--- a/drivers/mtd/mtdconcat.c~mtd-prevent-a-read-from-eraseregions
+++ a/drivers/mtd/mtdconcat.c
@@ -427,7 +427,7 @@ static int concat_erase(struct mtd_info 
 		 * to-be-erased area begins. Verify that the starting
 		 * offset is aligned to this region's erase size:
 		 */
-		if (instr->addr & (erase_regions[i].erasesize - 1))
+		if (i < 0 || instr->addr & (erase_regions[i].erasesize - 1))
 			return -EINVAL;
 
 		/*
@@ -440,8 +440,8 @@ static int concat_erase(struct mtd_info 
 		/*
 		 * check if the ending offset is aligned to this region's erase size
 		 */
-		if ((instr->addr + instr->len) & (erase_regions[i].erasesize -
-						  1))
+		if (i < 0 || ((instr->addr + instr->len) &
+					(erase_regions[i].erasesize - 1)))
 			return -EINVAL;
 	}
 
_
