Received: from conuserg-07.nifty.com ([210.131.2.74])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqgxJ-00063e-Tg
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 14:09:44 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: laurent.monat@idquantique.com, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v2 06/53] mtd: nand: denali: fix comment of
 denali_nand_info::flash_mem
Date: Wed, 22 Mar 2017 23:07:13 +0900
Message-Id: <1490191680-14481-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
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

Changes in v2: None

 drivers/mtd/nand/denali.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 6573ea5..403a7c8 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -351,8 +351,8 @@ struct denali_nand_info {
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
