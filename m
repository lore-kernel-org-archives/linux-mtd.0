Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4Ka1-00021e-5h
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 04:33:48 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Alan Cox <alan@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Dinh Nguyen <dinguyen@altera.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 07/11] mtd: nand: denali: use managed devm_irq_request()
Date: Wed,  9 Nov 2016 13:35:26 +0900
Message-Id: <1478666130-13413-8-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the managed variant instead of request_irq() and free_irq().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 548278b..44e075a 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -575,7 +575,6 @@ static void denali_irq_init(struct denali_nand_info *denali)
 static void denali_irq_cleanup(int irqnum, struct denali_nand_info *denali)
 {
 	denali_set_intr_modes(denali, false);
-	free_irq(irqnum, denali);
 }
 
 static void denali_irq_enable(struct denali_nand_info *denali,
@@ -1456,8 +1455,8 @@ int denali_init(struct denali_nand_info *denali)
 	 * denali_isr register is done after all the hardware
 	 * initilization is finished
 	 */
-	if (request_irq(denali->irq, denali_isr, IRQF_SHARED,
-			DENALI_NAND_NAME, denali)) {
+	if (devm_request_irq(denali->dev, denali->irq, denali_isr, IRQF_SHARED,
+			     DENALI_NAND_NAME, denali)) {
 		dev_err(denali->dev, "Unable to request IRQ\n");
 		return -ENODEV;
 	}
-- 
1.9.1
