Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvEwJ-0004Fa-3K
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 03:47:45 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 09/12] mtd: nand: denali: use upper/lower_32_bits() macro
 for clean-up
Date: Fri, 22 Sep 2017 12:46:46 +0900
Message-Id: <1506052009-8285-10-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506052009-8285-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506052009-8285-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I used (uint64_t) cast to avoid "right shift count >= width of type"
warning.  <linux/kernel.h> provides nice helpers to cater to it.
The code will be cleaner, and easier to understand.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 02ce310..e567ad9 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -469,10 +469,10 @@ static void denali_setup_dma64(struct denali_nand_info *denali,
 			  0x01002000 | (64 << 16) | (write << 8) | page_count);
 
 	/* 2. set memory low address */
-	denali_host_write(denali, mode, dma_addr);
+	denali_host_write(denali, mode, lower_32_bits(dma_addr));
 
 	/* 3. set memory high address */
-	denali_host_write(denali, mode, (uint64_t)dma_addr >> 32);
+	denali_host_write(denali, mode, upper_32_bits(dma_addr));
 }
 
 static void denali_setup_dma32(struct denali_nand_info *denali,
-- 
2.7.4
