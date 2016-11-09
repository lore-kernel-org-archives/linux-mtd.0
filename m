Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4Ka1-00021w-5d
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 04:33:47 +0000
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
Subject: [PATCH 08/11] mtd: nand: denali: return error code from
 devm_request_irq() on error
Date: Wed,  9 Nov 2016 13:35:27 +0900
Message-Id: <1478666130-13413-9-git-send-email-yamada.masahiro@socionext.com>
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

The devm_request_irq() returns an appropriate error value when it
fails.  Use it instead of the fixed -ENODEV.

While we are here, reword the comment to make it fit in a single
line, fixing the misspelling of "initialization".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 44e075a..f188a48 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1451,14 +1451,12 @@ int denali_init(struct denali_nand_info *denali)
 	denali_hw_init(denali);
 	denali_drv_init(denali);
 
-	/*
-	 * denali_isr register is done after all the hardware
-	 * initilization is finished
-	 */
-	if (devm_request_irq(denali->dev, denali->irq, denali_isr, IRQF_SHARED,
-			     DENALI_NAND_NAME, denali)) {
+	/* request IRQ after all the hardware initialization is finished */
+	ret = devm_request_irq(denali->dev, denali->irq, denali_isr,
+			       IRQF_SHARED, DENALI_NAND_NAME, denali);
+	if (ret) {
 		dev_err(denali->dev, "Unable to request IRQ\n");
-		return -ENODEV;
+		return ret;
 	}
 
 	/* now that our ISR is registered, we can enable interrupts */
-- 
1.9.1
