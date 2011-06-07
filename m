Received: from dakia2.marvell.com ([65.219.4.35])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTt62-0005s4-Ia
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 10:01:16 +0000
From: Lei Wen <leiwen@marvell.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-arm-kernel@lists.infradead.org,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org, adrian.wenl@gmail.com
Subject: [PATCH 2/2] MTD: pxa3xx_nand: Fix blank page ECC mismatch
Date: Tue,  7 Jun 2011 03:01:07 -0700
Message-Id: <1307440867-18993-2-git-send-email-leiwen@marvell.com>
In-Reply-To: <1307440867-18993-1-git-send-email-leiwen@marvell.com>
References: <1307440867-18993-1-git-send-email-leiwen@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Daniel Mack <zonque@gmail.com>

This bug was introduced in f8155a40 ("mtd: pxa3xx_nand: rework irq
logic") and causes the PXA3xx NAND controller fail to operate with NAND
flash that has empty pages. According to the comment in this block, the
hardware controller will report a double-bit error for empty pages,
which can and must be ignored.

This patch restores the original behaviour of the driver.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Acked-by: Lei Wen <leiwen@marvell.com>
Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: stable@kernel.org
---
 drivers/mtd/nand/pxa3xx_nand.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index faa0edd..30689cc 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -685,6 +685,8 @@ static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
 		 * OOB, ignore such double bit errors
 		 */
 		if (is_buf_blank(buf, mtd->writesize))
+			info->retcode = ERR_NONE;
+		else
 			mtd->ecc_stats.failed++;
 	}
 
-- 
1.7.0.4
