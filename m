Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VmNuN-0000ct-Ob
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2013 13:15:00 +0000
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mxc_nand: remove duplicated ecc_stats counting
Date: Fri, 29 Nov 2013 14:14:29 +0100
Message-Id: <1385730869-2322-1-git-send-email-m.grzeschik@pengutronix.de>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, kernel@pengutronix.de, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The ecc_stats.corrected count variable will already be incremented in
the above framework-layer just after this callback.

Cc: stable@vger.kernel.org
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 9dfdb06..a4bad11 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -677,7 +677,6 @@ static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
 		ecc_stat >>= 4;
 	} while (--no_subpages);
 
-	mtd->ecc_stats.corrected += ret;
 	pr_debug("%d Symbol Correctable RS-ECC Error\n", ret);
 
 	return ret;
-- 
1.8.4.3
