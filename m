Received: from mail.sigma-star.at ([95.130.255.111])
 by casper.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyb-0008WJ-9r
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:26 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 32/46] mtd: nandsim: Remove NS_IS_INITIALIZED
Date: Wed, 31 Aug 2016 09:28:39 +0200
Message-Id: <20160831072853.27822-33-dwalter@sigma-star.at>
In-Reply-To: <20160831072853.27822-1-dwalter@sigma-star.at>
References: <20160831072853.27822-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

init_nandsim() has exactly one caller, the construction
function. So, checking for this condition makes no sense.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index fcc7441..f0b6c1f 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -185,9 +185,6 @@ MODULE_PARM_DESC(defaults,	 "Register a MTD during module load using default val
 #define NS_MDELAY(ns, us) \
 	do { if (ns->do_delays) mdelay(us); } while (0)
 
-/* Is the nandsim structure initialized ? */
-#define NS_IS_INITIALIZED(ns) ((ns)->geom.totsz != 0)
-
 /* Good operation completion status */
 #define NS_STATUS_OK(ns) (NAND_STATUS_READY | (NAND_STATUS_WP * ((ns)->lines.wp == 0)))
 
@@ -839,11 +836,6 @@ static int init_nandsim(struct mtd_info *mtd, struct nandsim_params *nsparam)
 	uint64_t remains;
 	uint64_t next_offset;
 
-	if (NS_IS_INITIALIZED(ns)) {
-		pr_err("init_nandsim: nandsim is already initialized\n");
-		return -EIO;
-	}
-
 	/* Force mtd to not do delays */
 	chip->chip_delay = 0;
 
-- 
2.8.3
