Received: from smtp.mei.co.jp ([133.183.100.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRAlR-0006I4-Tr
 for linux-mtd@lists.infradead.org; Tue, 09 Sep 2014 02:02:38 +0000
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 5/7] mtd: denali: remove a set-but-unused variable
Date: Tue,  9 Sep 2014 11:01:55 +0900
Message-Id: <1410228117-14820-6-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1410228117-14820-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1410228117-14820-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Josh Triplett <josh@joshtriplett.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.m@jp.panasonic.com>,
 Rashika Kheria <rashika.kheria@gmail.com>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The variable "retry" in wait_for_irq() is set, but not used.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
---

Changes in v2: None

 drivers/mtd/nand/denali.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 259ca0ba..d37c2e1 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -697,7 +697,6 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 {
 	unsigned long comp_res;
 	uint32_t intr_status;
-	bool retry = false;
 	unsigned long timeout = msecs_to_jiffies(1000);
 
 	do {
@@ -717,7 +716,6 @@ static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 			 * need to wait again
 			 */
 			spin_unlock_irq(&denali->irq_lock);
-			retry = true;
 		}
 	} while (comp_res != 0);
 
-- 
1.9.1
