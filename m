Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqgx3-0005xA-N7
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 14:09:30 +0000
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
Subject: [PATCH v2 05/53] mtd: nand: denali: remove more unused struct members
Date: Wed, 22 Mar 2017 23:07:12 +0900
Message-Id: <1490191680-14481-6-git-send-email-yamada.masahiro@socionext.com>
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

These members are not used at all.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Add git description

 drivers/mtd/nand/denali.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index c4f3a68..6573ea5 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -350,7 +350,6 @@ struct denali_nand_info {
 	struct nand_buf buf;
 	struct device *dev;
 	int total_used_banks;
-	uint32_t block;  /* stored for future use */
 	uint16_t page;
 	void __iomem *flash_reg;  /* Mapped io reg base address */
 	void __iomem *flash_mem;  /* Mapped io reg base address */
@@ -359,7 +358,6 @@ struct denali_nand_info {
 	struct completion complete;
 	spinlock_t irq_lock;
 	uint32_t irq_status;
-	int irq_debug_array[32];
 	int irq;
 
 	uint32_t devnum;	/* represent how many nands connected */
-- 
2.7.4
