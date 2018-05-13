Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHraB-0000hg-QK
 for linux-mtd@lists.infradead.org; Sun, 13 May 2018 14:02:41 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: Implement ndelay() as an inline function to force type
 checking/casting
Date: Sun, 13 May 2018 16:02:12 +0200
Message-Id: <20180513140212.3961-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ndelay() is supposed to take an unsigned long, but if you define
ndelay() as a macro and the caller pass an unsigned long long instead
of an unsigned long, the unsigned long long to unsigned long cast is
not done and we end up with an "undefined reference to `__udivdi3'"
error at link time.

Fix that by making ndelay() an inline function and then defining dummy
ndelay() macro that redirects to the ndelay() function (it's how most
archs do to implement ndelay()).

Fixes: c8ee038bd148 ("m68k: Implement ndelay() based on the existing udelay() logic")
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Hello Geert,

This patch is fixing the bug reported by kbuild test robot here [1].
I could have patched the PSEC_TO_NSEC() macro to cast the result of
the division on a u32, but I thought making m68k consistent with what
other archs do would be preferable.

Let me know if don't like the solution, and I'll patch the ndelay()
caller instead.

Regards,

Boris

[1]https://lkml.org/lkml/2018/5/13/72
---
 arch/m68k/include/asm/delay.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/delay.h
index 7f474121e4ca..66ba159002a3 100644
--- a/arch/m68k/include/asm/delay.h
+++ b/arch/m68k/include/asm/delay.h
@@ -115,6 +115,13 @@ static inline void __udelay(unsigned long usecs)
  */
 #define	HZSCALE		(268435456 / (1000000 / HZ))
 
-#define ndelay(n) __delay(DIV_ROUND_UP((n) * ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6), 1000))
+static inline void ndelay(unsigned long nsec)
+{
+	__delay(DIV_ROUND_UP(nsec *
+			     ((((HZSCALE) >> 11) *
+			       (loops_per_jiffy >> 11)) >> 6),
+			     1000));
+}
+#define ndelay(n) ndelay(n)
 
 #endif /* defined(_M68K_DELAY_H) */
-- 
2.14.1
