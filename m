Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNm-00050s-QF
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:31 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 05/39] mtd: nand: denali: fix comment of
 denali_nand_info::flash_mem
Date: Sun, 27 Nov 2016 03:05:51 +0900
Message-Id: <1480183585-592-6-git-send-email-yamada.masahiro@socionext.com>
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

The same comment "Mapped io reg base address" for flash_reg and
flash_mem probably due to the mistake of copy-paste work.
Of course, the latter is not the register base address.

Reword the comments using the terminology in the Denali User's Guide.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 4fad43b..8bec980 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -408,8 +408,8 @@ struct denali_nand_info {
 	struct device *dev;
 	int total_used_banks;
 	uint16_t page;
-	void __iomem *flash_reg;  /* Mapped io reg base address */
-	void __iomem *flash_mem;  /* Mapped io reg base address */
+	void __iomem *flash_reg;	/* Register Interface */
+	void __iomem *flash_mem;	/* Host Data/Command Interface */
 
 	/* elements used by ISR */
 	struct completion complete;
-- 
2.7.4
