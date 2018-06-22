Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWOak-0005q3-TV
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2018 16:07:23 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "linux-stable #4 . 14+" <stable@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v4 1/5] mtd: rawnand: denali_dt: set clk_x_rate to 200 MHz
 unconditionally
Date: Sat, 23 Jun 2018 01:06:34 +0900
Message-Id: <1529683598-25783-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1529683598-25783-1-git-send-email-yamada.masahiro@socionext.com>
References: <1529683598-25783-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since commit 1bb88666775e ("mtd: nand: denali: handle timing parameters
by setup_data_interface()"), denali_dt.c gets the clock rate from the
clock driver.  The driver expects the frequency of the bus interface
clock, whereas the clock driver of SOCFPGA provides the core clock.
Thus, the setup_data_interface() hook calculates timing parameters
based on a wrong frequency.

To make it work without relying on the clock driver, hard-code the clock
frequency, 200MHz.  This is fine for existing DT of UniPhier, and also
fixes the issue of SOCFPGA because both platforms use 200 MHz for the
bus interface clock.

Fixes: 1bb88666775e ("mtd: nand: denali: handle timing parameters by setup_data_interface()")
Cc: linux-stable <stable@vger.kernel.org> #4.14+
Reported-by: Philipp Rosenberger <p.rosenberger@linutronix.de>
Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Tested-by: Richard Weinberger <richard@nod.at>
---

Changes in v4:
  - split into a very simple patch for backport candiate

 drivers/mtd/nand/raw/denali_dt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index cfd33e6..5869e90 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -123,7 +123,11 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	denali->clk_x_rate = clk_get_rate(dt->clk);
+	/*
+	 * Hardcode the clock rate for the backward compatibility.
+	 * This works for both SOCFPGA and UniPhier.
+	 */
+	denali->clk_x_rate = 200000000;
 
 	ret = denali_init(denali);
 	if (ret)
-- 
2.7.4
