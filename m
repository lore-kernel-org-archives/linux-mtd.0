Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNm-00050w-Qa
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:30 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 01/39] mtd: nand: allow to set only one of ECC size and ECC
 strength from DT
Date: Sun, 27 Nov 2016 03:05:47 +0900
Message-Id: <1480183585-592-2-git-send-email-yamada.masahiro@socionext.com>
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


 drivers/mtd/nand/nand_base.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8c74d8c..c1ed91d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4266,12 +4266,6 @@ static int nand_dt_init(struct nand_chip *chip)
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
