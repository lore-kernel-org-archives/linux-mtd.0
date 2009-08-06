Message-Id: <200908062305.n76N5aeS004967@imap1.linux-foundation.org>
Subject: [patch 6/8] slram: fix read buffer overflow
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Thu, 06 Aug 2009 16:05:36 -0700
Cc: roel.kluin@gmail.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roel Kluin <roel.kluin@gmail.com>

map[count] is checked before count < SLRAM_MAX_DEVICES_PARAMS

declared on drivers/mtd/devices/slram.c:66:

static char *map[SLRAM_MAX_DEVICES_PARAMS];

[akpm@linux-foundation.org: cleanups]
Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/devices/slram.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff -puN drivers/mtd/devices/slram.c~slram-read-buffer-overflow drivers/mtd/devices/slram.c
--- a/drivers/mtd/devices/slram.c~slram-read-buffer-overflow
+++ a/drivers/mtd/devices/slram.c
@@ -341,9 +341,8 @@ static int __init init_slram(void)
 #else
 	int count;
 
-	for (count = 0; (map[count]) && (count < SLRAM_MAX_DEVICES_PARAMS);
-			count++) {
-	}
+	for (count = 0; count < SLRAM_MAX_DEVICES_PARAMS && map[count]; count++)
+		;
 
 	if ((count % 3 != 0) || (count == 0)) {
 		E("slram: not enough parameters.\n");
_
