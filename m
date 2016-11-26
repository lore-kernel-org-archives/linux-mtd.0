Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNu-000563-TQ
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:36 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 26/39] mtd: nand: denali: call nand_set_flash_node() to set DT
 node
Date: Sun, 27 Nov 2016 03:06:12 +0900
Message-Id: <1480183585-592-27-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
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

 drivers/mtd/nand/denali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 07de879..0f94381b 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1510,6 +1510,7 @@ int denali_init(struct denali_nand_info *denali)
 	/* now that our ISR is registered, we can enable interrupts */
 	denali_set_intr_modes(denali, true);
 	mtd->name = "denali-nand";
+	nand_set_flash_node(chip, denali->dev->of_node);
 
 	/* register the driver with the NAND core subsystem */
 	chip->select_chip = denali_select_chip;
-- 
2.7.4
