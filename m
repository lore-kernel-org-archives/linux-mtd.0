Message-Id: <200909181951.n8IJpoOq023834@imap1.linux-foundation.org>
Subject: [patch 11/13] mtd: prevent a read from regions[-1]
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Fri, 18 Sep 2009 12:51:50 -0700
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
regions[-1]

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/mtdpart.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -puN drivers/mtd/mtdpart.c~mtd-prevent-a-read-from-regions drivers/mtd/mtdpart.c
--- a/drivers/mtd/mtdpart.c~mtd-prevent-a-read-from-regions
+++ a/drivers/mtd/mtdpart.c
@@ -453,7 +453,8 @@ static struct mtd_part *add_one_partitio
 		for (i = 0; i < max && regions[i].offset <= slave->offset; i++)
 			;
 		/* The loop searched for the region _behind_ the first one */
-		i--;
+		if (i > 0)
+			i--;
 
 		/* Pick biggest erasesize */
 		for (; i < max && regions[i].offset < end; i++) {
_
