Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1ydz-0001ka-Gv
 for linux-mtd@lists.infradead.org; Fri, 19 Dec 2014 14:35:04 +0000
Received: by mail-pd0-f177.google.com with SMTP id ft15so1298219pdb.8
 for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2014 06:34:41 -0800 (PST)
From: Mohammad Jamal <md.jamalmohiuddin@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: ssfdc: Fix space before ( coding style
Date: Fri, 19 Dec 2014 20:00:13 +0530
Message-Id: <1418999413-29428-1-git-send-email-md.jamalmohiuddin@gmail.com>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mohammad Jamal <md.jamalmohiuddin@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Patch solves the space before ( coding style issue of ssfdc.c

Signed-off-by: Mohammad Jamal <md.jamalmohiuddin@gmail.com>
---
 drivers/mtd/ssfdc.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index daf82ba..d4a922c 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -42,8 +42,8 @@ struct ssfdcr_record {
 #define MAX_LOGIC_BLK_PER_ZONE	1000
 #define MAX_PHYS_BLK_PER_ZONE	1024
 
-#define KiB(x)	( (x) * 1024L )
-#define MiB(x)	( KiB(x) * 1024L )
+#define KiB(x)	((x) * 1024L)
+#define MiB(x)	(KiB(x) * 1024L)
 
 /** CHS Table
 		1MiB	2MiB	4MiB	8MiB	16MiB	32MiB	64MiB	128MiB
@@ -63,13 +63,13 @@ typedef struct {
 
 /* Must be ordered by size */
 static const chs_entry_t chs_table[] = {
-	{ MiB(  1), 125,  4,  4 },
-	{ MiB(  2), 125,  4,  8 },
-	{ MiB(  4), 250,  4,  8 },
-	{ MiB(  8), 250,  4, 16 },
-	{ MiB( 16), 500,  4, 16 },
-	{ MiB( 32), 500,  8, 16 },
-	{ MiB( 64), 500,  8, 32 },
+	{ MiB(1), 125,  4,  4 },
+	{ MiB(2), 125,  4,  8 },
+	{ MiB(4), 250,  4,  8 },
+	{ MiB(8), 250,  4, 16 },
+	{ MiB(16), 500,  4, 16 },
+	{ MiB(32), 500,  8, 16 },
+	{ MiB(64), 500,  8, 32 },
 	{ MiB(128), 500, 16, 32 },
 	{ 0 },
 };
-- 
1.7.9.5
