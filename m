Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezyk-0003Je-6p
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:30:35 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 31/46] mtd: nandsim: Remove NS_RAW_OFFSET_OOB
Date: Wed, 31 Aug 2016 09:28:38 +0200
Message-Id: <20160831072853.27822-32-dwalter@sigma-star.at>
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

This helper macro has no users, kill it.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nandsim.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 02fa039..fcc7441 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -198,9 +198,6 @@ MODULE_PARM_DESC(defaults,	 "Register a MTD during module load using default val
 #define NS_RAW_OFFSET(ns) \
 	(((ns)->regs.row * ((ns)->no_oob ? (ns)->geom.pgsz : (ns)->geom.pgszoob)) + (ns)->regs.column)
 
-/* Calculate the OOB offset in flash RAM image by (row, column) address */
-#define NS_RAW_OFFSET_OOB(ns) (NS_RAW_OFFSET(ns) + ns->geom.pgsz)
-
 /* After a command is input, the simulator goes to one of the following states */
 #define STATE_CMD_READ0        0x00000001 /* read data from the beginning of page */
 #define STATE_CMD_READ1        0x00000002 /* read data from the second half of page */
-- 
2.8.3
