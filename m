Received: from mx1.polytechnique.org ([129.104.30.34])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZBZCN-0001kN-LO
 for linux-mtd@lists.infradead.org; Sun, 05 Jul 2015 01:58:28 +0000
From: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
To: Maxim Levitsky <maximlevitsky@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Subject: [PATCH] mtd: r852: make ecc_reg 32-bit in r852_ecc_correct
Date: Sun,  5 Jul 2015 09:57:41 +0800
Message-Id: <1436061461-30560-1-git-send-email-nicolas.iooss_linux@m4x.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

r852_ecc_correct() reads a 32-bit register into a 16-bit variable,
ecc_reg, but this variable is later used as if it was larger.  This is
reported by clang when building the kernel with many warnings:

    drivers/mtd/nand/r852.c:512:11: error: shift count >= width of type
    [-Werror,-Wshift-count-overflow]
                    ecc_reg >>= 16;
                            ^   ~~
Fix this by making ecc_reg 32-bit, like the return type of
r852_read_reg_dword().

Signed-off-by: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
---

As I haven't got the hardware to test this patch, it is only compile-tested.

 drivers/mtd/nand/r852.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 77e96d2df96c..cc6bac537f5a 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -466,7 +466,7 @@ static int r852_ecc_calculate(struct mtd_info *mtd, const uint8_t *dat,
 static int r852_ecc_correct(struct mtd_info *mtd, uint8_t *dat,
 				uint8_t *read_ecc, uint8_t *calc_ecc)
 {
-	uint16_t ecc_reg;
+	uint32_t ecc_reg;
 	uint8_t ecc_status, err_byte;
 	int i, error = 0;
 
-- 
2.4.5
