Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dkaei-0005sf-3h
 for linux-mtd@lists.infradead.org; Wed, 23 Aug 2017 18:45:33 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH] mtd: nand: atmel: Relax tADL_min constraint
Date: Wed, 23 Aug 2017 20:45:01 +0200
Message-Id: <20170823184501.7665-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Version 4 of the ONFI spec mandates that tADL be at least 400 nanoseconds,
but, depending on the master clock rate, 400 ns may not fit in the tADL
field of the SMC reg. We need to relax the check and accept the -ERANGE
return code.

Note that previous versions of the ONFI spec had a lower tADL_min (100 or
200 ns). It's not clear why this timing constraint got increased but it
seems most NANDs are fine with values lower than 400ns, so we should be
safe.

Fixes: f9ce2eddf176 ("mtd: nand: atmel: Add ->setup_data_interface() hooks")
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/atmel/nand-controller.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index 2c8baa0c2c4e..ceec21bd30c4 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -1364,7 +1364,18 @@ static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
 	ret = atmel_smc_cs_conf_set_timing(smcconf,
 					   ATMEL_HSMC_TIMINGS_TADL_SHIFT,
 					   ncycles);
-	if (ret)
+	/*
+	 * Version 4 of the ONFI spec mandates that tADL be at least 400
+	 * nanoseconds, but, depending on the master clock rate, 400 ns may not
+	 * fit in the tADL field of the SMC reg. We need to relax the check and
+	 * accept the -ERANGE return code.
+	 *
+	 * Note that previous versions of the ONFI spec had a lower tADL_min
+	 * (100 or 200 ns). It's not clear why this timing constraint got
+	 * increased but it seems most NANDs are fine with values lower than
+	 * 400ns, so we should be safe.
+	 */
+	if (ret && ret != -ERANGE)
 		return ret;
 
 	ncycles = DIV_ROUND_UP(conf->timings.sdr.tAR_min, mckperiodps);
-- 
2.11.0
