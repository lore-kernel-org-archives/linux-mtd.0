Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NHyl4-0002P0-50
	for linux-mtd@lists.infradead.org; Tue, 08 Dec 2009 12:01:38 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 8 Dec 2009 13:01:25 +0100
References: <200912081056.40210.jbe@pengutronix.de>
	<200912081123.06630.jbe@pengutronix.de>
In-Reply-To: <200912081123.06630.jbe@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200912081301.25597.jbe@pengutronix.de>
Subject: Re: [PATCH] [NAND] S3C2410: Fix NFC clock enable/disable imbalance
	(2nd try)
Cc: linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When unmounting an mtd filesystem the s3c2410_nand_select_chip() function
gets called again with "chip == -1". In this case the current code disables
the NFC clock at least a second time, so it does not work anymore.
Clock disabling should only happen if it was really enabled.

Due to a lack of a query function if a clock is already enabled (and how often),
we must count enable/disable calls by our own here.

Note: Other enable/disable sequences can be found in the power management
functions. I'm not sure if they interfere with this local enable/disable count.

Signed-off-by: Juergen Beisert <jbe@pengutronix.de>
Acked-by: Wolfram Sang <wsa@pengutronix.de>

---
 drivers/mtd/nand/s3c2410.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

Index: linux-2.6.32/drivers/mtd/nand/s3c2410.c
===================================================================
--- linux-2.6.32.orig/drivers/mtd/nand/s3c2410.c
+++ linux-2.6.32/drivers/mtd/nand/s3c2410.c
@@ -329,12 +329,15 @@ static void s3c2410_nand_select_chip(str
 	struct s3c2410_nand_mtd *nmtd;
 	struct nand_chip *this = mtd->priv;
 	unsigned long cur;
+	static int clock_enable_cnt = 0;
 
 	nmtd = this->priv;
 	info = nmtd->info;
 
-	if (chip != -1 && allow_clk_stop(info))
+	if (chip != -1 && allow_clk_stop(info)) {
 		clk_enable(info->clk);
+		clock_enable_cnt++;
+	}
 
 	cur = readl(info->sel_reg);
 
@@ -356,8 +359,10 @@ static void s3c2410_nand_select_chip(str
 
 	writel(cur, info->sel_reg);
 
-	if (chip == -1 && allow_clk_stop(info))
+	if (chip == -1 && allow_clk_stop(info) && clock_enable_cnt > 0) {
 		clk_disable(info->clk);
+		clock_enable_cnt--;
+	}
 }
 
 /* s3c2410_nand_hwcontrol

-- 
Pengutronix e.K.                              | Juergen Beisert             |
Linux Solutions for Science and Industry      | Phone: +49-8766-939 228     |
Vertretung Sued/Muenchen, Germany             | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686              | http://www.pengutronix.de/  |
