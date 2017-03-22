Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqgwz-0005uE-1y
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 14:09:29 +0000
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
Subject: [PATCH v2 01/53] mtd: nand: allow to set only one of ECC size and ECC
 strength from DT
Date: Wed, 22 Mar 2017 23:07:08 +0900
Message-Id: <1490191680-14481-2-git-send-email-yamada.masahiro@socionext.com>
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

Currently, it is valid to specify both "nand-ecc-step-size" and
"nand-ecc-strength", but not allowed to set only one of them.

This requirement has a conflict with "nand-ecc-maximize"; this flag
is used when you want the driver to choose the best ECC strength.
If "nand-ecc-maximize" is set, "nand-ecc-strength" is very likely to
be unset.

It would be possible to make the if-conditional more complex by
adding the check for the NAND_ECC_MAXIMIZE flag, but I chose to drop
the check entirely.  I thought of the situation where the hardware
has a fixed ECC step size (so it can be hard-coded in the driver),
whereas the ECC strength is configurable by software.  In that case,
we may want to only set "nand-ecc-strength" (or "nand-ecc-maximize")
in DT.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

The Denali NAND is the case.

The ecc.size is fixed when the RTL is delivered, while the
driver can choose ecc.strength from some supported values.

 For Intel and Altera, available ecc.strength are 8, 15.
 For Socionext UniPhier, available ecc.strength are 8, 16, 24.


Changes in v2: None

 drivers/mtd/nand/nand_base.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b0524f8..a3c0f47 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4333,12 +4333,6 @@ static int nand_dt_init(struct nand_chip *chip)
 	ecc_strength = of_get_nand_ecc_strength(dn);
 	ecc_step = of_get_nand_ecc_step_size(dn);
 
-	if ((ecc_step >= 0 && !(ecc_strength >= 0)) ||
-	    (!(ecc_step >= 0) && ecc_strength >= 0)) {
-		pr_err("must set both strength and step size in DT\n");
-		return -EINVAL;
-	}
-
 	if (ecc_mode >= 0)
 		chip->ecc.mode = ecc_mode;
 
-- 
2.7.4
