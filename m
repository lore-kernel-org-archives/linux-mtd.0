Date: Wed, 12 Dec 2007 17:33:09 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD][OneNAND] Check the initial bad block using
	ONENAND_CTRL_ERROR
Message-ID: <20071212083309.GA32235@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some chips don't set the ONENAND_CTRL_LOAD bit.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index bfc8399..e9aac83 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1121,8 +1121,8 @@ static int onenand_bbt_wait(struct mtd_info *mtd, int state)
 
 	if (ctrl & ONENAND_CTRL_ERROR) {
 		printk(KERN_DEBUG "onenand_bbt_wait: controller error = 0x%04x\n", ctrl);
-		/* Initial bad block case */
-		if (ctrl & ONENAND_CTRL_LOAD)
+		/* Initial bad block case: 0x2400 or 0x0400 */
+		if (ctrl & ONENAND_CTRL_ERROR)
 			return ONENAND_BBT_READ_ERROR;
 		return ONENAND_BBT_READ_FATAL_ERROR;
 	}
-- 
1.5.0.6
