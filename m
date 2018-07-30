Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fk3nI-0004yk-VP
 for linux-mtd@lists.infradead.org; Mon, 30 Jul 2018 08:44:46 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [RFC PATCH] alpha: io: add reads{b,w,l,q}/writes{b,w,l,q}
Date: Mon, 30 Jul 2018 10:44:30 +0200
Message-Id: <20180730084430.23861-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some drivers need these for compile-testing. On most architectures
they come from asm-generic/io.h, but not on sparc64, which has its
own definitions.

Copy the generic implementation here.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Note that I tried to instead include asm-generic/io.h + a bunch a
#define xxx xxx to prevent asm-generic/io.h from redefining things
already implemented by the driver, but I faced prototypes mismatch
between asm-generic/io.h and asm-generic/iomap.h ('void __iomem *' vs
'const volatile void __iomem *') which I didn't expect because
asm-generic/io.h includes asm-generic/iomap.h when CONFIG_GENERIC_IOMAP
is defined.

Making prototypes consistent that should be doable, but it involves
checking that the prototype modification is not breaking other users.
Since that's not the problem I was initially trying to fix (my goal is
to make 2 NAND drivers using readsl to compile correctly on all archs
when enabled through COMPILE_TEST=y), I just ended copying the
reads{b,w,l,q}/writes{b,w,l,q} definitions in
arch/alpha/include/asm/io.h.

Let me know if that's a problem.
---
 arch/alpha/include/asm/io.h | 98 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index 4c533fc94d62..0b9cf320f39f 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -267,6 +267,104 @@ extern void		__raw_writew(u16 b, volatile void __iomem *addr);
 extern void		__raw_writel(u32 b, volatile void __iomem *addr);
 extern void		__raw_writeq(u64 b, volatile void __iomem *addr);
 
+static inline void readsb(const volatile void __iomem *addr, void *buffer,
+			  unsigned int count)
+{
+	if (count) {
+		u8 *buf = buffer;
+
+		do {
+			u8 x = __raw_readb(addr);
+			*buf++ = x;
+		} while (--count);
+	}
+}
+
+static inline void readsw(const volatile void __iomem *addr, void *buffer,
+			  unsigned int count)
+{
+	if (count) {
+		u16 *buf = buffer;
+
+		do {
+			u16 x = __raw_readw(addr);
+			*buf++ = x;
+		} while (--count);
+	}
+}
+
+static inline void readsl(const volatile void __iomem *addr, void *buffer,
+			  unsigned int count)
+{
+	if (count) {
+		u32 *buf = buffer;
+
+		do {
+			u32 x = __raw_readl(addr);
+			*buf++ = x;
+		} while (--count);
+	}
+}
+
+static inline void readsq(const volatile void __iomem *addr, void *buffer,
+			  unsigned int count)
+{
+	if (count) {
+		u64 *buf = buffer;
+
+		do {
+			u64 x = __raw_readq(addr);
+			*buf++ = x;
+		} while (--count);
+	}
+}
+static inline void writesb(volatile void __iomem *addr, const void *buffer,
+			   unsigned int count)
+{
+	if (count) {
+		const u8 *buf = buffer;
+
+		do {
+			__raw_writeb(*buf++, addr);
+		} while (--count);
+	}
+}
+
+static inline void writesw(volatile void __iomem *addr, const void *buffer,
+			   unsigned int count)
+{
+	if (count) {
+		const u16 *buf = buffer;
+
+		do {
+			__raw_writew(*buf++, addr);
+		} while (--count);
+	}
+}
+static inline void writesl(volatile void __iomem *addr, const void *buffer,
+			   unsigned int count)
+{
+	if (count) {
+		const u32 *buf = buffer;
+
+		do {
+			__raw_writel(*buf++, addr);
+		} while (--count);
+	}
+}
+
+static inline void writesq(volatile void __iomem *addr, const void *buffer,
+			   unsigned int count)
+{
+	if (count) {
+		const u64 *buf = buffer;
+
+		do {
+			__raw_writeq(*buf++, addr);
+		} while (--count);
+	}
+}
+
 /*
  * Mapping from port numbers to __iomem space is pretty easy.
  */
-- 
2.14.1
