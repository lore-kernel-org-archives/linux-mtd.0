Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1excTk-0007nM-PC
 for linux-mtd@lists.infradead.org; Sun, 18 Mar 2018 17:52:22 +0000
Received: by mail-pl0-x244.google.com with SMTP id c11-v6so8861056plo.0
 for <linux-mtd@lists.infradead.org>; Sun, 18 Mar 2018 10:52:10 -0700 (PDT)
Date: Sun, 18 Mar 2018 23:21:23 +0530
From: Arushi Singhal <arushisinghal19971997@gmail.com>
To: dwmw2@infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: Replace typedef with struct
Message-ID: <20180318175122.GA15004@seema-Inspiron-15-3567>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using typedef for a structure type is not suggested in Linux kernel
coding style guidelines. Hence, occurrence of typedefs has been
removed.

Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
---
 drivers/mtd/ssfdc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 95f0bf9..8bae672 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -54,15 +54,15 @@ SumSector	2,000	4,000	8,000	16,000	32,000	64,000	128,000	256,000
 SectorSize	512	512	512	512	512	512	512	512
 **/
 
-typedef struct {
+struct chs_entry {
 	unsigned long size;
 	unsigned short cyl;
 	unsigned char head;
 	unsigned char sec;
-} chs_entry_t;
+};
 
 /* Must be ordered by size */
-static const chs_entry_t chs_table[] = {
+static const struct chs_entry chs_table[] = {
 	{ MiB(  1), 125,  4,  4 },
 	{ MiB(  2), 125,  4,  8 },
 	{ MiB(  4), 250,  4,  8 },
-- 
2.7.4
