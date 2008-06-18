Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K91rU-0001ft-KG
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 17:54:25 +0000
Date: Wed, 18 Jun 2008 19:54:16 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
Message-ID: <20080618175416.GF10271@logfs.org>
References: <20080617152932.GD28448@logfs.org>
	<20080618.005735.51867626.anemo@mba.ocn.ne.jp>
	<20080617164629.GG28448@logfs.org>
	<20080618.111907.60384971.nemoto@toshiba-tops.co.jp>
	<20080618174034.GA10271@logfs.org>
	<20080618175253.GD10271@logfs.org>
	<20080618175342.GE10271@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080618175342.GE10271@logfs.org>
Cc: dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH 3/4] [MTD][MTDPART] Cleanup and document the erase region handling

Mostly simplifying the loops.  Now everything fits into 80 columns,
is easier to read and the finer details have extra comments.

Signed-off-by: Joern Engel <joern@logfs.org>
---
 drivers/mtd/mtdpart.c |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index e759ee6..c1a8916 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -433,18 +433,24 @@ static int add_one_partition(struct mtd_info *master,
 	}
 	if (master->numeraseregions > 1) {
 		/* Deal with variable erase size stuff */
-		int i;
+		int i, max = master->numeraseregions;
+		u32 end = slave->offset + slave->mtd.size;
 		struct mtd_erase_region_info *regions = master->eraseregions;
 
-		/* Find the first erase regions which is part of this partition. */
-		for (i = 0; i < master->numeraseregions && regions[i].offset <= slave->offset; i++)
+		/* Find the first erase regions which is part of this
+		 * partition. */
+		for (i = 0; i < max && regions[i].offset <= slave->offset; i++)
 			;
+		/* The loop searched for the region _behind_ the first one */
+		i--;
 
-		for (i--; i < master->numeraseregions && regions[i].offset < slave->offset + slave->mtd.size; i++) {
+		/* Pick biggest erasesize */
+		for (; i < max && regions[i].offset < end; i++) {
 			if (slave->mtd.erasesize < regions[i].erasesize) {
 				slave->mtd.erasesize = regions[i].erasesize;
 			}
 		}
+		BUG_ON(slave->mtd.erasesize == 0);
 	} else {
 		/* Single erase size */
 		slave->mtd.erasesize = master->erasesize;
-- 
1.5.3.5
