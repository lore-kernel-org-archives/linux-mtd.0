Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctTs2-0007De-Gz
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 06:47:53 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
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
Subject: [PATCH v3 02/37] mtd: nand: denali: allow to override mtd->name from
 label DT property
Date: Thu, 30 Mar 2017 15:45:48 +0900
Message-Id: <1490856383-31560-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 28309572aac4 ("mtd: name the mtd device with an optional
label property") allow us to identify a chip in a user-friendly way.

If nand_set_flash_node() picks up the "label" from DT, let's respect
it.  Otherwise, let it fallback to the current name "denali-nand".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---

Changes in v3:
  - Replaced "mtd: nand: denali: do not set mtd->name" in v2

Changes in v2: None

 drivers/mtd/nand/denali.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 4ca75d3..4e6d03d 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1462,8 +1462,10 @@ int denali_init(struct denali_nand_info *denali)
 
 	/* now that our ISR is registered, we can enable interrupts */
 	denali_set_intr_modes(denali, true);
-	mtd->name = "denali-nand";
 	nand_set_flash_node(chip, denali->dev->of_node);
+	/* Fallback to the default name if DT did not give "label" property */
+	if (!mtd->name)
+		mtd->name = "denali-nand";
 
 	/* register the driver with the NAND core subsystem */
 	chip->select_chip = denali_select_chip;
-- 
2.7.4
