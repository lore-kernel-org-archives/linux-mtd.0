Received: from mail-pa0-f51.google.com ([209.85.220.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNAlP-0000q7-PA
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 02:18:36 +0000
Received: by pacrr5 with SMTP id rr5so15008417pac.3
 for <linux-mtd@lists.infradead.org>; Wed, 05 Aug 2015 19:18:14 -0700 (PDT)
Message-ID: <1438827489.19066.3.camel@ingics.com>
Subject: [PATCH RFT] mtd: brcmnand: Fix misuse of IS_ENABLED
From: Axel Lin <axel.lin@ingics.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Date: Thu, 06 Aug 2015 10:18:09 +0800
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While IS_ENABLED() is perfectly fine for CONFIG_* symbols, it is not
for other symbols such as __BIG_ENDIAN that is provided directly by
the compiler.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi,
I don't have a big endian machine to test this, so I'd appreciate if
someone can review and test this patch.

A similar misuse of IS_ENABLED is reported and fixed in:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/dma/mv_xor.c?id=0ec9ebc706fbd394bc233d87ac7aaad1c4f3ab54

 drivers/mtd/nand/brcmnand/brcmnand.h | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.h b/drivers/mtd/nand/brcmnand/brcmnand.h
index a20c736..c697a4e 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.h
+++ b/drivers/mtd/nand/brcmnand/brcmnand.h
@@ -50,19 +50,21 @@ static inline u32 brcmnand_readl(void __iomem *addr)
 	 * Other architectures (e.g., ARM) either do not support big endian, or
 	 * else leave I/O in little endian mode.
 	 */
-	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(__BIG_ENDIAN))
-		return __raw_readl(addr);
-	else
-		return readl_relaxed(addr);
+#if defined(__BIG_ENDIAN) && IS_ENABLED(CONFIG_MIPS)
+	return __raw_readl(addr);
+#else
+	return readl_relaxed(addr);
+#endif
 }
 
 static inline void brcmnand_writel(u32 val, void __iomem *addr)
 {
 	/* See brcmnand_readl() comments */
-	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(__BIG_ENDIAN))
-		__raw_writel(val, addr);
-	else
-		writel_relaxed(val, addr);
+#if defined(__BIG_ENDIAN) && IS_ENABLED(CONFIG_MIPS)
+	__raw_writel(val, addr);
+#else
+	writel_relaxed(val, addr);
+#endif
 }
 
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc);
-- 
2.1.0
