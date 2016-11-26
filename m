Received: from conuserg-11.nifty.com ([210.131.2.78])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhOC-00025g-43
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:54 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 30/39] mtd: nand: denali: set DEVICES_CONNECTED 1 if not set
Date: Sun, 27 Nov 2016 03:06:16 +0900
Message-Id: <1480183585-592-31-git-send-email-yamada.masahiro@socionext.com>
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

Currently, the driver expects DEVICE_CONNECTED is automatically set
by the hardware, but this feature is disabled in some cases.
In such cases, it is the software's responsibility to set up the
DEVICES_CONNECTED register.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 71bdf2a..4b2bbcb 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1485,6 +1485,13 @@ static void denali_multidev_fixup(struct denali_nand_info *denali)
 	 */
 	denali->devnum = ioread32(denali->flash_reg + DEVICES_CONNECTED);
 
+	/*
+	 * On some SoCs, DEVICES_CONNECTED is not auto-detected. For those SoCs
+	 * DEVICES_CONNECT is left to 0.  Set 1 if it is the case.
+	 */
+	if (denali->devnum == 0)
+		denali->devnum = 1;
+
 	devnum_shift = fls(denali->devnum) - 1;
 
 	if (denali->devnum != BIT(devnum_shift)) {
@@ -1492,9 +1499,10 @@ static void denali_multidev_fixup(struct denali_nand_info *denali)
 			 "DEVICE_CONNECTED=%d is not power of 2. Some devices will not be used.\n",
 			 denali->devnum);
 		denali->devnum = BIT(devnum_shift);
-		iowrite32(denali->devnum, denali->flash_reg + DEVICES_CONNECTED);
 	}
 
+	iowrite32(denali->devnum, denali->flash_reg + DEVICES_CONNECTED);
+
 	mtd->size <<= devnum_shift;
 	mtd->erasesize <<= devnum_shift;
 	mtd->writesize <<= devnum_shift;
-- 
2.7.4
