Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqmZV-0001SN-3i
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 20:09:30 +0000
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
Subject: [RESEND PATCH v2 19/53] mtd: nand: denali: call nand_set_flash_node()
 to set DT node
Date: Thu, 23 Mar 2017 05:07:18 +0900
Message-Id: <1490213273-8571-20-git-send-email-yamada.masahiro@socionext.com>
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

This will allow nand_dt_init() to parse DT properties in the NAND
controller device node.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mtd/nand/denali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 24c35a6..3badb1d 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1496,6 +1496,7 @@ int denali_init(struct denali_nand_info *denali)
 	/* now that our ISR is registered, we can enable interrupts */
 	denali_set_intr_modes(denali, true);
 	mtd->name = "denali-nand";
+	nand_set_flash_node(chip, denali->dev->of_node);
 
 	/* register the driver with the NAND core subsystem */
 	chip->select_chip = denali_select_chip;
-- 
2.7.4
