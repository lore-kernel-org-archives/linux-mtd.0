Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TO1Ss-0004Dm-2n
 for linux-mtd@lists.infradead.org; Tue, 16 Oct 2012 07:21:22 +0000
From: Josh Wu <josh.wu@atmel.com>
To: linux-kernel@vger.kernel.org, hskinnemoen@gmail.com, egtvedt@samfundet.no
Subject: [PATCH] avr32: fix build error in atstk1006_defconfig
Date: Tue, 16 Oct 2012 15:19:27 +0800
Message-Id: <1350371967-8914-1-git-send-email-josh.wu@atmel.com>
Cc: Josh Wu <josh.wu@atmel.com>, fengguang.wu@intel.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fixed the following compile error when use avr32 atstk1006_defconfig:
  drivers/mtd/nand/atmel_nand.c: In function 'pmecc_err_location':
  drivers/mtd/nand/atmel_nand.c:639: error: implicit declaration of function 'writel_relaxed'

which was introduced by commit 1c7b874d33b463 ("mtd: at91: atmel_nand: add Programmable Multibit ECC controller support").
The PMECC for nand flash code uses writel_relaxed(). But in avr32, there is no macro "writel_relaxed" defined. This patch add writex_relaxed macro definitions.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 arch/avr32/include/asm/io.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/avr32/include/asm/io.h b/arch/avr32/include/asm/io.h
index cf60d0a..fc6483f 100644
--- a/arch/avr32/include/asm/io.h
+++ b/arch/avr32/include/asm/io.h
@@ -165,6 +165,10 @@ BUILDIO_IOPORT(l, u32)
 #define readw_be			__raw_readw
 #define readl_be			__raw_readl
 
+#define writeb_relaxed			writeb
+#define writew_relaxed			writew
+#define writel_relaxed			writel
+
 #define writeb_be			__raw_writeb
 #define writew_be			__raw_writew
 #define writel_be			__raw_writel
-- 
1.7.9.5
