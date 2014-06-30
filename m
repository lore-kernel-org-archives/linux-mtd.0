From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: s3c2410: Move to clk_prepare_enable/clk_disable_unprepare
Date: Mon, 30 Jun 2014 22:12:16 +0300
Message-Id: <1404155536-3032-1-git-send-email-anarsoul@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use clk_prepare_enable/clk_disable_unprepare to make the driver
work properly with common clock framework.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/mtd/nand/s3c2410.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 79acbb8..6b97bf1 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -208,10 +208,10 @@ static void s3c2410_nand_clk_set_state(struct s3c2410_nand_info *info,
 
 	if (info->clk_state == CLOCK_ENABLE) {
 		if (new_state != CLOCK_ENABLE)
-			clk_disable(info->clk);
+			clk_disable_unprepare(info->clk);
 	} else {
 		if (new_state == CLOCK_ENABLE)
-			clk_enable(info->clk);
+			clk_prepare_enable(info->clk);
 	}
 
 	info->clk_state = new_state;
-- 
2.0.0
