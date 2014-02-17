Date: Mon, 17 Feb 2014 23:03:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Wan ZongShun <mcuos.com@gmail.com>
Subject: [patch] mtd: nuc900_nand: NULL dereference in nuc900_nand_enable()
Message-ID: <20140217200308.GA9845@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of writing to "nand->reg + REG_FMICSR" we write to "REG_FMICSR"
which is NULL and not a valid register.

Fixes: 8bff82cbc308 ('mtd: add nand support for w90p910 (v2)')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.

diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index 331fccbdde61..e8a5fffd6ab2 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -225,7 +225,7 @@ static void nuc900_nand_enable(struct nuc900_nand *nand)
 	val = __raw_readl(nand->reg + REG_FMICSR);
 
 	if (!(val & NAND_EN))
-		__raw_writel(val | NAND_EN, REG_FMICSR);
+		__raw_writel(val | NAND_EN, nand->reg + REG_FMICSR);
 
 	val = __raw_readl(nand->reg + REG_SMCSR);
 
