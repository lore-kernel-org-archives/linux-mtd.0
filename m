Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1zFC-0004K7-6G
 for linux-mtd@lists.infradead.org; Wed, 02 Nov 2016 17:22:35 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 Sachin Kamat <sachin.kamat@linaro.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Stephen Boyd <stephen.boyd@linaro.org>, Dinh Nguyen <dinguyen@altera.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: nand: denali_dt: replace clk_disable() with
 clk_disable_unprepare()
Date: Thu,  3 Nov 2016 02:21:04 +0900
Message-Id: <1478107264-21139-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The denali_dt_probe() calls clk_disable_unprepare() in the bailout
path, whereas denali_dt_remove calls clk_disable(), inconsistently.
Replace the latter with clk_disable_unprepare() to make sure to
unprepare the clock.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali_dt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 0cb1e8d..f821dc1 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -110,7 +110,7 @@ static int denali_dt_remove(struct platform_device *ofdev)
 	struct denali_dt *dt = platform_get_drvdata(ofdev);
 
 	denali_remove(&dt->denali);
-	clk_disable(dt->clk);
+	clk_disable_unprepare(dt->clk);
 
 	return 0;
 }
-- 
1.9.1
