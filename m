Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNm-00050p-Qc
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:33 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 04/39] mtd: nand: denali: remove more unused struct members
Date: Sun, 27 Nov 2016 03:05:50 +0900
Message-Id: <1480183585-592-5-git-send-email-yamada.masahiro@socionext.com>
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

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index fd1ae08..4fad43b 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -407,7 +407,6 @@ struct denali_nand_info {
 	struct nand_buf buf;
 	struct device *dev;
 	int total_used_banks;
-	uint32_t block;  /* stored for future use */
 	uint16_t page;
 	void __iomem *flash_reg;  /* Mapped io reg base address */
 	void __iomem *flash_mem;  /* Mapped io reg base address */
@@ -416,7 +415,6 @@ struct denali_nand_info {
 	struct completion complete;
 	spinlock_t irq_lock;
 	uint32_t irq_status;
-	int irq_debug_array[32];
 	int irq;
 
 	uint32_t devnum;	/* represent how many nands connected */
-- 
2.7.4
