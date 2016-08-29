Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1beHGB-0000oC-Gx
 for linux-mtd@lists.infradead.org; Mon, 29 Aug 2016 07:45:36 +0000
Received: by mail-wm0-x236.google.com with SMTP id o80so77477449wme.1
 for <linux-mtd@lists.infradead.org>; Mon, 29 Aug 2016 00:45:14 -0700 (PDT)
From: Karl Beldan <kbeldan@baylibre.com>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Karl Beldan <karl.beldan+oss@gmail.com>, Karl Beldan <kbeldan@baylibre.com>
Subject: [PATCH] mtd: nand: davinci: Reinitialize the HW ECC engine in 4bit
 hwctl
Date: Mon, 29 Aug 2016 07:45:49 +0000
Message-Id: <20160829074550.29247-1-kbeldan@baylibre.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes subpage writes when using 4-bit HW ECC.

There has been numerous reports about ECC errors with devices using this
driver for a while.  Also the 4-bit ECC has been reported as broken with
subpages in [1] and with 16 bits NANDs in the driver and in mach* board
files both in mainline and in the vendor BSPs.

What I saw with 4-bit ECC on a 16bits NAND (on an LCDK) which got me to
try reinitializing the ECC engine:
- R/W on whole pages properly generates/checks RS code
- try writing the 1st subpage only of a blank page, the subpage is well
  written and the RS code properly generated, re-reading the same page
  the HW detects some ECC error, reading the same page again no ECC
  error is detected

Note that the ECC engine is already reinitialized in the 1-bit case.

Tested on my LCDK with UBI+UBIFS using subpages.
This could potentially get rid of the issue workarounded in [1].

[1] 28c015a9daab ("mtd: davinci-nand: disable subpage write for keystone-nand")

Signed-off-by: Karl Beldan <kbeldan@baylibre.com>
---
 drivers/mtd/nand/davinci_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index cc07ba0..27fa8b8 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -240,6 +240,9 @@ static void nand_davinci_hwctl_4bit(struct mtd_info *mtd, int mode)
 	unsigned long flags;
 	u32 val;
 
+	/* Reset ECC hardware */
+	davinci_nand_readl(info, NAND_4BIT_ECC1_OFFSET);
+
 	spin_lock_irqsave(&davinci_nand_lock, flags);
 
 	/* Start 4-bit ECC calculation for read/write */
-- 
2.9.2
