From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Wan ZongShun <mcuos.com@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nuc900_nand: read correct SMISR register
Date: Wed, 13 Jan 2016 22:38:08 +0100
Message-ID: <9019174.GYajdpGP8V@wuerfel>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nuc900_nand driver has always passed an incorrect register
address in its nuc900_check_rb() function, which cannot possibly
work, and in some configurations gives us a build warning:

drivers/mtd/nand/nuc900_nand.c: In function 'nuc900_check_rb':
drivers/mtd/nand/nuc900_nand.c:27:23: warning: passing argument 1 of '__raw_readl' makes pointer from integer without a cast [-Wint-conversion]
 #define REG_SMISR     0xac
drivers/mtd/nand/nuc900_nand.c:118:20: note: in expansion of macro 'REG_SMISR'
  val = __raw_readl(REG_SMISR);

This makes sure we actually read from the register rather than
from (void *)0x000000ac in user space.

I suspect nobody noticed this before because the nuc900_nand_devready()
function never gets called, or nobody uses this driver on an upstream
kernel. Possibly even both.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index 220ddfcf29f5..dbc5b571c2bb 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -113,7 +113,7 @@ static int nuc900_check_rb(struct nuc900_nand *nand)
 {
 	unsigned int val;
 	spin_lock(&nand->lock);
-	val = __raw_readl(REG_SMISR);
+	val = __raw_readl(nand->reg + REG_SMISR);
 	val &= READYBUSY;
 	spin_unlock(&nand->lock);
 
