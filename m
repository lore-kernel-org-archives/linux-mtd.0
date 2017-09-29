Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dxshj-00074L-At
 for linux-mtd@lists.infradead.org; Fri, 29 Sep 2017 10:39:38 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 2/2] mtd: nand: denali: fix setup_data_interface to meet
 tCCS delay
Date: Fri, 29 Sep 2017 19:38:40 +0900
Message-Id: <1506681520-13897-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The WE_2_RE register specifies the number of clock cycles inserted
between the rising edge of #WE and the falling edge of #RE.

The current setup_data_interface implementation takes care of tWHR,
but tCCS is missing.  Wait max(tCSS, tWHR) to meet the spec.

With setup_data_interface() is properly programmed, the Denali NAND
controller can observe the timing, so NAND_WAIT_{TCCS,TWHR} flag is
unneeded.  Say this in the comment block.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - newly added

 drivers/mtd/nand/denali.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 0b268ec..332c022 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1004,8 +1004,14 @@ static int denali_setup_data_interface(struct mtd_info *mtd, int chipnr,
 	tmp |= FIELD_PREP(RE_2_RE__VALUE, re_2_re);
 	iowrite32(tmp, denali->reg + RE_2_RE);
 
-	/* tWHR -> WE_2_RE */
-	we_2_re = DIV_ROUND_UP(timings->tWHR_min, t_clk);
+	/*
+	 * tCCS, tWHR -> WE_2_RE
+	 *
+	 * With WE_2_RE properly set, the Denali controller automatically takes
+	 * care of tCCS, tWHR; the driver need not set NAND_WAIT_{TCCS,TWHR}.
+	 */
+	we_2_re = DIV_ROUND_UP(max(timings->tCCS_min, timings->tWHR_min),
+			       t_clk);
 	we_2_re = min_t(int, we_2_re, TWHR2_AND_WE_2_RE__WE_2_RE);
 
 	tmp = ioread32(denali->reg + TWHR2_AND_WE_2_RE);
-- 
2.7.4
