Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmzqQ-0000id-76
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 06:17:42 +0000
Received: by mail-pd0-f172.google.com with SMTP id x10so1077061pdj.3
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 23:17:21 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/6] mtd: maps: sc520cdp: fix warnings
Date: Tue, 20 May 2014 23:17:00 -0700
Message-Id: <1400653023-25757-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
References: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On m86k, and maybe a few other architectures, we get this kind of
warning, due to misuse of volatile:

   drivers/mtd/maps/sc520cdp.c: In function 'sc520cdp_setup_par':
>> drivers/mtd/maps/sc520cdp.c:223:2: warning: passing argument 1 of 'iounmap' discards 'volatile' qualifier from pointer target type [enabled by default]
   arch/m68k/include/asm/raw_io.h:22:13: note: expected 'void *' but argument is of type 'volatile long unsigned int *'

Rather than annotating the variable declaration, let's just use the
proper accessors, which add the 'volatile' qualifier to the operation.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/maps/sc520cdp.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/sc520cdp.c b/drivers/mtd/maps/sc520cdp.c
index 8fead8e46bce..093edd51bdc7 100644
--- a/drivers/mtd/maps/sc520cdp.c
+++ b/drivers/mtd/maps/sc520cdp.c
@@ -183,7 +183,7 @@ static const struct sc520_par_table par_table[NUM_FLASH_BANKS] =
 
 static void sc520cdp_setup_par(void)
 {
-	volatile unsigned long __iomem *mmcr;
+	unsigned long __iomem *mmcr;
 	unsigned long mmcr_val;
 	int i, j;
 
@@ -203,11 +203,11 @@ static void sc520cdp_setup_par(void)
 	*/
 	for(i = 0; i < NUM_FLASH_BANKS; i++) {		/* for each par_table entry  */
 		for(j = 0; j < NUM_SC520_PAR; j++) {	/* for each PAR register     */
-			mmcr_val = mmcr[SC520_PAR(j)];
+			mmcr_val = readl(&mmcr[SC520_PAR(j)]);
 			/* if target device field matches, reprogram the PAR */
 			if((mmcr_val & SC520_PAR_TRGDEV) == par_table[i].trgdev)
 			{
-				mmcr[SC520_PAR(j)] = par_table[i].new_par;
+				writel(par_table[i].new_par, &mmcr[SC520_PAR(j)]);
 				break;
 			}
 		}
-- 
1.7.9.5
