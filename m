Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqmZN-0001Rd-EX
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 20:09:25 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: laurent.monat@idquantique.com, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [RESEND PATCH v2 04/53] mtd: nand: denali: remove redundant define of
 BANK(x)
Date: Thu, 23 Mar 2017 05:07:03 +0900
Message-Id: <1490213273-8571-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This macro is defined twice in denali.c (around line 98 and
line 651), so remove the second one.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mtd/nand/denali.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index f993e13..c9806e6 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -648,7 +648,6 @@ static irqreturn_t denali_isr(int irq, void *dev_id)
 	spin_unlock(&denali->irq_lock);
 	return result;
 }
-#define BANK(x) ((x) << 24)
 
 static uint32_t wait_for_irq(struct denali_nand_info *denali, uint32_t irq_mask)
 {
-- 
2.7.4
