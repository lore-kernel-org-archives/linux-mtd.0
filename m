Received: from nasmtp01.atmel.com ([192.199.1.245]
 helo=DVREDG01.corp.atmel.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UMYD5-0001Nn-LL
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2013 06:27:16 +0000
From: Josh Wu <josh.wu@atmel.com>
To: <egtvedt@samfundet.no>, <akpm@linux-foundation.org>
Subject: [PATCH v2] avr32: fix build error in atstk1006_defconfig
Date: Mon, 1 Apr 2013 14:26:37 +0800
Message-ID: <1364797597-22005-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Josh Wu <josh.wu@atmel.com>, linux-mtd@lists.infradead.org,
 fengguang.wu@intel.com, hskinnemoen@gmail.com
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

which was introduced by commit:
  1c7b874d33b463f7150b1ab4617f000af9b327fd
  mtd: at91: atmel_nand: add Programmable Multibit ECC controller support
The PMECC for nand flash code uses writel_relaxed(). But in avr32, there is no
macro "writel_relaxed" defined.

This patch add writex_relaxed macro definitions.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
Acked-by: Havard Skinnemoen <havard@skinnemoen.net>
Acked-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>
---
change since v1:
 refined the commit message and wrap it into 80 characters.

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
