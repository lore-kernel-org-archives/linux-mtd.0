Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqmZV-0001SR-3c
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
Subject: [RESEND PATCH v2 09/53] mtd: nand: denali: use int where no reason to
 use fixed width variable
Date: Thu, 23 Mar 2017 05:07:08 +0900
Message-Id: <1490213273-8571-10-git-send-email-yamada.masahiro@socionext.com>
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

The page number is generally stored in an integer type variable.
The uint16_t does not have enough width.  I see no reason to use
uint32_t for other members, either.  Just use int.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mtd/nand/denali.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index eed001d..7b2d785 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -325,7 +325,7 @@ struct denali_nand_info {
 	struct nand_buf buf;
 	struct device *dev;
 	int total_used_banks;
-	uint16_t page;
+	int page;
 	void __iomem *flash_reg;	/* Register Interface */
 	void __iomem *flash_mem;	/* Host Data/Command Interface */
 
@@ -335,9 +335,9 @@ struct denali_nand_info {
 	uint32_t irq_status;
 	int irq;
 
-	uint32_t devnum;	/* represent how many nands connected */
-	uint32_t bbtskipbytes;
-	uint32_t max_banks;
+	int devnum;	/* represent how many nands connected */
+	int bbtskipbytes;
+	int max_banks;
 	unsigned int caps;
 };
 
-- 
2.7.4
